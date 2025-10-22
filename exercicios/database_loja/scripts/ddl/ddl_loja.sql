CREATE DATABASE IF NOT EXISTS loja 
DEFAULT CHARACTER SET utf8mb4 
DEFAULT COLLATE utf8mb4_unicode_ci;

-- Entramos em nosso database criado
USE loja;

CREATE TABLE Cliente(
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60),
    cpf CHAR(11),
    altura DECIMAL(3,2),
    idade INT,
    credito FLOAT,
    ativo BIT(1),
    data_criacao DATETIME, 
    data_atualizacao DATETIME,
    cidade VARCHAR(20),
    rua VARCHAR(20),
    numero INT,
    cep CHAR(8),
    nacionalidade VARCHAR(20) DEFAULT 'Brasil'
);