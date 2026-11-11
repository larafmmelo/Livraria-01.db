-- 1. CRIAÇÃO DO BANCO DE DADOS

DROP DATABASE IF EXISTS site_viagens;
CREATE DATABASE site_viagens;
USE site_viagens;


-- 2. CRIAÇÃO DAS TABELAS

-- Tabela de Clientes
CREATE TABLE cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    data_cadastro DATE NOT NULL
);


-- Tabela de Destinos Turísticos
CREATE TABLE destino_turistico (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    descricao VARCHAR(255)
);


-- Tabela de Pacotes de Viagem
CREATE TABLE pacote_viagem (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_destino INT,
    data_viagem DATE NOT NULL,
    quantidade_dias INT NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,

    FOREIGN KEY (id_cliente)
        REFERENCES cliente(id)
        ON DELETE CASCADE,

    FOREIGN KEY (id_destino)
        REFERENCES destino_turistico(id)
        ON DELETE CASCADE
);


-- 3. INSERÇÃO DE DADOS DE TESTE

-- Inserindo Clientes
INSERT INTO cliente (nome, email, telefone, data_cadastro) VALUES
('Camila Souza', 'camila@email.com', '31988880001', '2026-01-12'),
('Rafael Lima', 'rafael@email.com', '31988880002', '2026-02-20'),
('Beatriz Alves', 'beatriz@email.com', '31988880003', '2026-03-08');


-- Inserindo Destinos Turísticos
INSERT INTO destino_turistico (nome, pais, descricao) VALUES
('Paris', 'França', 'Cidade conhecida pela Torre Eiffel'),
('Orlando', 'Estados Unidos', 'Cidade conhecida pelos parques temáticos'),
('Rio de Janeiro', 'Brasil', 'Cidade conhecida pelas praias e paisagens');


-- Inserindo Pacotes de Viagem
INSERT INTO pacote_viagem (id_cliente, id_destino, data_viagem, quantidade_dias, preco) VALUES
(1, 1, '2026-07-10', 7, 5500.00),
(2, 2, '2026-08-15', 10, 7800.00),
(3, 3, '2026-09-05', 5, 2200.00);


-- 4. CONSULTANDO OS DADOS

SELECT * FROM cliente;
SELECT * FROM destino_turistico;
SELECT * FROM pacote_viagem;
