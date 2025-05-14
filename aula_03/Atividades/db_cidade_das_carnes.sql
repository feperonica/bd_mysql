-- Criação do banco de dados
CREATE DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;

-- Criação da tabela de categorias
CREATE TABLE tb_categorias (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR(100) NOT NULL,
    procedencia VARCHAR(100) NOT NULL
);

-- Inserção de registros na tabela de categorias
INSERT INTO tb_categorias (tipo, procedencia) VALUES
("Bovina", "Nacional"),
("Suína", "Nacional"),
("Aves", "Granja Local"),
("Peixes", "Importado"),
("Frutos do Mar", "Litoral Norte");

-- Visualização das categorias
SELECT * FROM tb_categorias;

-- Criação da tabela de produtos
CREATE TABLE tb_produtos (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    peso_kg DECIMAL(5,2),
    preco DECIMAL(10,2),
    validade DATE,
    categoria_id BIGINT,
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserção de produtos com vínculo à categoria
INSERT INTO tb_produtos (nome, peso_kg, preco, validade, categoria_id) VALUES
("Picanha", 1.2, 89.90, "2025-06-10", 1),
("Costela Suína", 1.5, 49.90, "2025-05-20", 2),
("Frango Inteiro", 2.0, 32.00, "2025-05-18", 3),
("Tilápia", 1.0, 52.00, "2025-06-01", 4),
("Camarão Cinza", 0.8, 149.90, "2025-05-30", 5),
("Alcatra", 1.0, 74.50, "2025-06-12", 1),
("Linguiça Toscana", 1.2, 25.00, "2025-05-28", 2),
("Coxa e Sobrecoxa", 1.8, 34.50, "2025-05-22", 3);

-- Visualização dos produtos
SELECT * FROM tb_produtos;

-- SELECT: produtos com valor acima de R$ 50,00
SELECT * FROM tb_produtos WHERE preco > 50.00;

-- SELECT: produtos com valor entre R$ 50,00 e R$ 150,00
SELECT * FROM tb_produtos WHERE preco BETWEEN 50.00 AND 150.00;

-- SELECT: produtos que possuem a letra "C" no nome
SELECT * FROM tb_produtos WHERE nome LIKE '%C%';

-- INNER JOIN: produtos com suas respectivas categorias
SELECT p.nome AS produto, p.preco, c.tipo AS categoria, c.procedencia 
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id;

-- INNER JOIN: apenas produtos da categoria "Aves"
SELECT p.nome AS produto, p.preco, c.tipo AS categoria 
FROM tb_produtos p
INNER JOIN tb_categorias c ON p.categoria_id = c.id
WHERE c.tipo = "Aves";