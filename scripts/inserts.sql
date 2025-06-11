-- Inserindo autores
INSERT INTO autor (nome, nacionalidade, data_nascimento) VALUES
('Machado de Assis', 'Brasileira', '1839-06-21'),
('Clarice Lispector', 'Brasileira', '1920-12-10'),
('George Orwell', 'Britânica', '1903-06-25');

-- Inserindo livros
INSERT INTO livro (isbn, titulo, editora, ano_publicacao, quantidade_copias) VALUES
('9788535914849', 'Dom Casmurro', 'Companhia das Letras', 1899, 5),
('9788532502909', 'A Hora da Estrela', 'Rocco', 1977, 3),
('9788535914863', '1984', 'Companhia das Letras', 1949, 4);

-- Relacionando livros e autores
INSERT INTO livro_autor VALUES
('9788535914849', 1),  -- Dom Casmurro - Machado de Assis
('9788532502909', 2),  -- A Hora da Estrela - Clarice Lispector
('9788535914863', 3);  -- 1984 - George Orwell

-- Inserindo usuários
INSERT INTO usuario (nome, email, telefone) VALUES
('João Silva', 'joao@email.com', '(67) 9999-1111'),
('Maria Souza', 'maria@email.com', '(67) 9999-2222');