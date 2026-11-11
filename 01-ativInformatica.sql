-- 1. CRIAÇÃO DO BANCO DE DADOS

DROP DATABASE IF EXISTS loja_informatica;
CREATE DATABASE loja_informatica;
USE loja_informatica;


-- 2. CRIAÇÃO DAS TABELAS

-- Tabela de Clientes
CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_cadastro DATE NOT NULL
);


-- Tabela de Produtos
CREATE TABLE produto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL
);


-- Tabela de Pedidos
CREATE TABLE pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_produto INT,
    data_pedido DATE NOT NULL,
    quantidade INT NOT NULL,

    FOREIGN KEY (id_cliente)
        REFERENCES cliente(id)
        ON DELETE CASCADE,

    FOREIGN KEY (id_produto)
        REFERENCES produto(id)
        ON DELETE CASCADE
);


-- 3. INSERÇÃO DE DADOS DE TESTE

-- Inserindo Clientes
INSERT INTO cliente (nome, email, telefone, data_cadastro) VALUES
('Mariana Oliveira', 'mariana@email.com', '31999990001', '2026-01-10'),
('Pedro Santos', 'pedro@email.com', '31999990002', '2026-02-15'),
('Juliana Costa', 'juliana@email.com', '31999990003', '2026-03-05');


-- Inserindo Produtos
INSERT INTO produto (nome, marca, preco, estoque) VALUES
('Notebook', 'Dell', 3500.00, 10),
('Mouse Gamer', 'Logitech', 150.00, 25),
('Teclado Mecânico', 'Redragon', 280.00, 15);


-- Inserindo Pedidos
INSERT INTO pedido (id_cliente, id_produto, data_pedido, quantidade) VALUES
(1, 1, '2026-03-10', 1),
(2, 2, '2026-03-11', 2),
(3, 3, '2026-03-12', 1);


-- 4. CONSULTANDO OS DADOS

SELECT * FROM cliente;
SELECT * FROM produto;
SELECT * FROM pedido;
