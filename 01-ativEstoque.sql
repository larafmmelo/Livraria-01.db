-- 1. CRIAÇÃO DO BANCO DE DADOS

DROP DATABASE IF EXISTS controle_estoque;
CREATE DATABASE controle_estoque;
USE controle_estoque;


-- 2. CRIAÇÃO DAS TABELAS

-- Tabela de Produtos
CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao VARCHAR(255),
    preco DECIMAL(10, 2) NOT NULL
);


-- Tabela de Filiais
CREATE TABLE filial (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cidade VARCHAR(100) NOT NULL,
    endereco VARCHAR(150) NOT NULL
);


-- Tabela de Estoque
CREATE TABLE estoque (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    id_filial INT,
    quantidade INT NOT NULL,

    UNIQUE (id_produto, id_filial),

    FOREIGN KEY (id_produto)
        REFERENCES produto(id)
        ON DELETE CASCADE,

    FOREIGN KEY (id_filial)
        REFERENCES filial(id)
        ON DELETE CASCADE
);


-- 3. INSERÇÃO DE DADOS DE TESTE

-- Inserindo Produtos
INSERT INTO produto (nome, descricao, preco) VALUES
('Notebook', 'Notebook para uso profissional', 3500.00),
('Mouse', 'Mouse óptico USB', 80.00),
('Monitor', 'Monitor LED 24 polegadas', 950.00);


-- Inserindo Filiais
INSERT INTO filial (nome, cidade, endereco) VALUES
('Filial Centro', 'Belo Horizonte', 'Rua A, 100'),
('Filial Savassi', 'Belo Horizonte', 'Rua B, 200'),
('Filial Contagem', 'Contagem', 'Avenida C, 300');


-- Inserindo Estoque por Filial
INSERT INTO estoque (id_produto, id_filial, quantidade) VALUES
(1, 1, 10),
(2, 1, 30),
(3, 1, 15),
(1, 2, 5),
(2, 2, 20),
(3, 2, 8),
(1, 3, 7),
(2, 3, 25),
(3, 3, 12);


-- 4. CONSULTANDO OS DADOS

SELECT * FROM produto;
SELECT * FROM filial;
SELECT * FROM estoque;
