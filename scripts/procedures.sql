-- Procedure para registrar empréstimo
CREATE OR REPLACE FUNCTION registrar_emprestimo(
    p_id_usuario INTEGER,
    p_isbn VARCHAR(13)
) RETURNS VOID AS $$
BEGIN
    -- Verifica se há cópias disponíveis
    IF (SELECT quantidade_copias FROM livro WHERE isbn = p_isbn) < 1 THEN
        RAISE EXCEPTION 'Não há cópias disponíveis deste livro';
    END IF;
    
    -- Cria o empréstimo
    INSERT INTO emprestimo (id_usuario, isbn) VALUES (p_id_usuario, p_isbn);
    
    -- Atualiza estoque
    UPDATE livro SET quantidade_copias = quantidade_copias - 1 WHERE isbn = p_isbn;
END;
$$ LANGUAGE plpgsql;

-- Procedure para registrar devolução
CREATE OR REPLACE FUNCTION registrar_devolucao(
    p_id_emprestimo INTEGER
) RETURNS VOID AS $$
BEGIN
    -- Atualiza data de devolução
    UPDATE emprestimo 
    SET data_devolucao = CURRENT_DATE, status = 'finalizado'
    WHERE id_emprestimo = p_id_emprestimo;
    
    -- Atualiza estoque
    UPDATE livro l
    SET quantidade_copias = quantidade_copias + 1
    FROM emprestimo e
    WHERE e.id_emprestimo = p_id_emprestimo AND l.isbn = e.isbn;
END;
$$ LANGUAGE plpgsql;