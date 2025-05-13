-- Recriar o Banco de dados db_quitanda
CREATE DATABASE db_quitanda;

-- Selecionar o Banco de Dados db_quitanda
USE db_quitanda;

-- Criar a tabela tb_categorias
CREATE TABLE tb_categorias(
id bigint AUTO_INCREMENT,
descricao varchar(255) NOT NULL,
PRIMARY KEY (id)
);

-- Insere categorias na tabela tb_categorias
INSERT INTO tb_categorias (descricao) VALUES ("Verduras");

INSERT INTO tb_categorias (descricao) VALUES ("Legumes");

INSERT INTO tb_categorias (descricao) VALUES ("Temperos");

INSERT INTO tb_categorias (descricao) VALUES ("Ovos");

INSERT INTO tb_categorias (descricao) VALUES ("Outros");

-- Exibe todas as categorias cadastradas
SELECT * FROM tb_categorias;

-- Criação da tabela tb_produtos com chave estrangeira referenciando tb_categorias
CREATE TABLE tb_produtos(
    id bigint AUTO_INCREMENT,
    nome varchar(255) NOT NULL,
    quantidade int, 
    dtvalidade date NULL,
    preco decimal(6, 2),
    categoria_id bigint, 
    PRIMARY KEY (id),
    FOREIGN KEY (categoria_id) REFERENCES tb_categorias(id)
);

-- Inserção de produtos com todas as informações preenchidas
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Maçã", 1000, "2022-03-07", 1.99, 1);
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Banana", 1300, "2022-03-08", 5.00, 1);
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Batata doce", 2000, "2022-03-09", 10.00, 3);
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alface", 300, "2022-03-10", 7.00, 2);
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Cebola", 1020, "2022-03-08", 5.00, 3);
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Ovo Branco", 1000, "2022-03-07", 15.00, 5);
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Agrião", 1500, "2022-03-06", 3.00, 2);
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Cenoura", 1800, "2022-03-09", 3.50, 3);
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Pimenta", 1100, "2022-03-15", 10.00, 4);
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Alecrim", 130, "2022-03-10", 5.00, 4);
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Manga", 200, "2022-03-07", 5.49, 1);
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Laranja", 3000, "2022-03-13", 10.00, 1);
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Couve", 100, "2022-03-12", 1.50, 2);
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Tomate", 1105, "2022-03-15", 3.00, 3);
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Rabanete", 1200, "2022-03-15", 13.00, 3);

-- Inserção de produtos sem categoria (categoria_id NULL)
INSERT INTO tb_produtos (nome, quantidade, preco)
VALUES ("Sacola Cinza", 1118, 0.50);
INSERT INTO tb_produtos (nome, quantidade, preco)
VALUES ("Sacola Verde", 1118, 0.50);

-- Consultas gerais na tabela tb_produtos
SELECT * FROM tb_produtos;
SELECT * FROM tb_produtos ORDER BY nome;
SELECT * FROM tb_produtos ORDER BY nome DESC;

-- Consulta de produtos sem categoria definida
SELECT * FROM tb_produtos WHERE categoria_id IS NULL;

-- Filtros por valores de preço
SELECT * FROM tb_produtos WHERE preco IN (5, 10, 15);
SELECT * FROM tb_produtos WHERE preco BETWEEN 5 AND 15;

-- Filtra por datas de validade em um intervalo
SELECT * FROM tb_produtos 
WHERE dtvalidade BETWEEN '2022-03-10' AND '2022-03-15' 
ORDER BY dtvalidade, nome;

-- Pesquisas usando LIKE (sensível ao collation)
SELECT * FROM tb_produtos WHERE nome LIKE "%RA%";
SELECT * FROM tb_produtos WHERE nome LIKE "%ra";
SELECT * FROM tb_produtos WHERE nome LIKE "ra%";

-- Verifica o padrão de collation atual do banco
SELECT @@collation_database;

-- Funções de agregação
SELECT COUNT(*) FROM tb_produtos;
SELECT COUNT(categoria_id) FROM tb_produtos;
SELECT SUM(preco) AS soma_preco FROM tb_produtos;
SELECT AVG(preco) AS media_preco FROM tb_produtos;

-- Média de preços por categoria com formatação monetária
SELECT categoria_id, CONCAT('R$ ', FORMAT(AVG(preco), 2, 'pt_BR')) AS media_preco 
FROM tb_produtos 
GROUP BY categoria_id;

-- Exibe nome e data formatada
SELECT nome, DATE_FORMAT(dtvalidade, '%d/%m/%Y') AS data_validade 
FROM tb_produtos;

-- Preço máximo e mínimo
SELECT MAX(preco) AS preco_maximo FROM tb_produtos;
SELECT MIN(preco) AS preco_minimo FROM tb_produtos;

-- Novos produtos adicionados posteriormente
INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco, categoria_id)
VALUES ("Abobrinha", 2005, "2025-03-15", 4.00, 3);

INSERT INTO tb_produtos (nome, quantidade, dtvalidade, preco)
VALUES ("Chuchu", 2005, "2025-03-15", 4.00);

-- JOINs entre produtos e categorias
-- INNER JOIN: apenas produtos que têm categoria
SELECT * FROM tb_produtos 
INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id 
ORDER BY tb_categorias.id, tb_produtos.nome ASC;

-- RIGHT JOIN: todas as categorias, mesmo que sem produtos
SELECT * FROM tb_produtos 
RIGHT JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id 
ORDER BY tb_categorias.id, tb_produtos.nome ASC;

-- Média de preços por categoria com INNER JOIN
SELECT categoria_id, CONCAT('R$ ', FORMAT(AVG(preco), 2, 'pt_BR')) AS media_preco
FROM tb_produtos 
INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id
GROUP BY tb_categorias.id;

-- Média de preços por descrição de categoria (com filtro)
SELECT tb_categorias.descricao, AVG(preco) AS media_preco
FROM tb_produtos 
INNER JOIN tb_categorias 
ON tb_produtos.categoria_id = tb_categorias.id
GROUP BY tb_categorias.id
HAVING media_preco > 5;






