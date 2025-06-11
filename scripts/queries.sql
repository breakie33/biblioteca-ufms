-- CONSULTAS (READ)
-- Lista todos os livros disponíveis
SELECT * FROM livro WHERE quantidade_copias > 0;

-- Lista empréstimos ativos com detalhes
SELECT u.nome AS usuario, l.titulo AS livro, e.data_emprestimo, e.data_devolucao_prevista
FROM emprestimo e
JOIN usuario u ON e.id_usuario = u.id_usuario
JOIN livro l ON e.isbn = l.isbn
WHERE e.status = 'ativo';

-- ATUALIZAÇÕES (UPDATE)
-- Atualizar quantidade de cópias
UPDATE livro SET quantidade_copias = 6 WHERE isbn = '9788535914849';

-- Atualizar status de usuário
UPDATE usuario SET status = 'suspenso' WHERE id_usuario = 1;

-- REMOÇÕES (DELETE)
-- Remover livro (se não tiver empréstimos)
DELETE FROM livro WHERE isbn = '9788535914863';

-- CONSULTAS COMPLEXAS
-- Top 3 autores com mais livros
SELECT a.nome, COUNT(la.isbn) AS total_livros
FROM autor a
LEFT JOIN livro_autor la ON a.id_autor = la.id_autor
GROUP BY a.nome
ORDER BY total_livros DESC
LIMIT 3;