DROP DATABASE db_ecommerce;

-- Criação do banco de dados
CREATE DATABASE db_ecommerce;
USE db_ecommerce;

-- Criação da tabela de categorias
CREATE TABLE tb_categoria (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100) NOT NULL
);

-- Inserção de categorias
INSERT INTO tb_categoria (descricao) VALUES
("Informática"),
("Acessórios"),
("Celulares"),
("Áudio"),
("Móveis");

-- Consulta para verificar as categorias
SELECT * FROM tb_categoria;

-- Criação da tabela de produtos com chave estrangeira para categoria
CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2),
    estoque INT,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categoria(id)
);

-- Inserção de produtos relacionados à categoria
INSERT INTO tb_produtos (nome, descricao, preco, estoque, categoria_id) VALUES
("Notebook Dell", "Notebook i5, 8GB RAM, SSD 256GB", 3500.00, 10, 1),
("Mouse sem fio", "Mouse óptico sem fio USB", 85.00, 150, 2),
("Teclado mecânico", "Teclado com iluminação RGB", 299.90, 50, 2),
("Monitor LG 24", "Monitor Full HD HDMI", 899.00, 20, 1),
("Smartphone Galaxy", "Samsung Galaxy A14", 1200.00, 30, 3),
("Capa de celular", "Capa em silicone para Galaxy A14", 29.90, 300, 2),
("Fone Bluetooth", "Fone de ouvido Bluetooth com case", 149.90, 75, 4),
("Cadeira Gamer", "Cadeira ergonômica reclinável", 1050.00, 5, 5);

-- SELECT de produtos com valor maior que 500
SELECT * FROM tb_produtos WHERE preco > 500;

-- SELECT de produtos com valor menor que 500
SELECT * FROM tb_produtos WHERE preco < 500;

-- Atualização de produto: altera o preço do teclado mecânico
UPDATE tb_produtos SET preco = 279.90 WHERE id = "3";

-- INNER JOIN: mostra os produtos com sua categoria
SELECT p.nome, p.preco, c.descricao AS categoria
FROM tb_produtos AS p
INNER JOIN tb_categoria AS c
ON p.categoria_id = c.id;