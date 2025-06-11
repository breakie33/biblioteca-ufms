-- Criação do banco de dados
CREATE DATABASE biblioteca_ufms;

-- Conectando ao banco
\c biblioteca_ufms

-- Tabela Autor
CREATE TABLE autor (
    id_autor SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    nacionalidade VARCHAR(50),
    data_nascimento DATE
);

-- Tabela Livro
CREATE TABLE livro (
    isbn VARCHAR(13) PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    editora VARCHAR(100),
    ano_publicacao INTEGER,
    quantidade_copias INTEGER DEFAULT 1 CHECK (quantidade_copias >= 0)
);

-- Tabela de relacionamento Livro-Autor
CREATE TABLE livro_autor (
    isbn VARCHAR(13) REFERENCES livro(isbn),
    id_autor INTEGER REFERENCES autor(id_autor),
    PRIMARY KEY (isbn, id_autor)
);

-- Tabela Usuário
CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_cadastro DATE DEFAULT CURRENT_DATE,
    status VARCHAR(20) DEFAULT 'ativo' CHECK (status IN ('ativo', 'inativo', 'suspenso'))
);

-- Tabela Empréstimo
CREATE TABLE emprestimo (
    id_emprestimo SERIAL PRIMARY KEY,
    id_usuario INTEGER REFERENCES usuario(id_usuario),
    isbn VARCHAR(13) REFERENCES livro(isbn),
    data_emprestimo DATE DEFAULT CURRENT_DATE,
    data_devolucao_prevista DATE GENERATED ALWAYS AS (CURRENT_DATE + INTERVAL '15 days') STORED,
    data_devolucao DATE,
    status VARCHAR(20) DEFAULT 'ativo' CHECK (status IN ('ativo', 'finalizado', 'atrasado')),
    CONSTRAINT chk_datas CHECK (data_devolucao IS NULL OR data_devolucao >= data_emprestimo)
);