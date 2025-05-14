-- Criação do banco de dados
CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

-- Criação da tabela de classes
CREATE TABLE tb_classes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo_ataque VARCHAR(50) NOT NULL,
    dificuldade VARCHAR(50) NOT NULL
);

-- Inserção de registros na tabela de classes
INSERT INTO tb_classes (nome, tipo_ataque, dificuldade) VALUES 
("Guerreiro", "Físico", "Alta"),
("Arqueiro", "À distância", "Fácil"),
("Mago", "Mágico", "Alta"),
("Sacerdote", "Suporte", "Média"),
("Bárbaro", "Tanque", "Média"),
("Mercenário", "Físico", "Muito Fácil");

-- Visualização das classes
SELECT * FROM tb_classes;

-- Criação da tabela de guildas
CREATE TABLE tb_guildas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    servidor VARCHAR(50) NOT NULL
);

-- Inserção de registros na tabela de guildas
INSERT INTO tb_guildas (nome, servidor) VALUES 
("Atomics", "Sky"),
("New Age", "Lynx"),
("WarLords", "Arcadia");

-- Visualização das guildas
SELECT * FROM tb_guildas;

-- Criação da tabela de personagens
CREATE TABLE tb_personagens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    poder_ataque INT,
    poder_defesa INT,
    nivel INT,
    classe_id BIGINT,
    guilda_id BIGINT,
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id),
    FOREIGN KEY (guilda_id) REFERENCES tb_guildas(id)
);

-- Inserção de registros na tabela de personagens
INSERT INTO tb_personagens (nome, poder_ataque, poder_defesa, nivel, classe_id, guilda_id) VALUES 
("DarckEA", 3200, 1500, 150, 2, 1),
("ZT4", 9999, 1800, 105, 3, 1),
("TankerWB", 2100, 1100, 99, 5, 2),
("Invejado", 1500, 2200, 92, 3, 3),
("ZDark", 1950, 1300, 70, 4, 2),
("Cassino", 3300, 900, 88, 2, 3),
("Peixinho", 2500, 1700, 91, 1, 1),
("Aio", 1, 1, 150, 4, 1);

-- Visualização dos personagens
SELECT * FROM tb_personagens;

-- Personagens com poder de ataque maior que 2000
SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

-- Personagens com poder de defesa entre 1000 e 2000
SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

-- Personagens com a letra "C" no nome
SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

-- INNER JOIN: personagens + classes
SELECT p.nome AS personagem, p.nivel, c.nome AS classe, c.tipo_ataque 
FROM tb_personagens p 
INNER JOIN tb_classes c ON p.classe_id = c.id;

-- INNER JOIN: versão sem alias (comentada)
-- SELECT tb_personagens.nome AS personagem, tb_personagens.nivel, tb_classes.nome AS classe, tb_classes.tipo_ataque 
-- FROM tb_personagens 
-- INNER JOIN tb_classes ON tb_personagens.classe_id = tb_classes.id;

-- INNER JOIN com filtro por classe específica
SELECT p.nome AS personagem, p.nivel, c.nome AS classe 
FROM tb_personagens p 
INNER JOIN tb_classes c ON p.classe_id = c.id 
WHERE c.nome = "Arqueiro";

-- INNER JOIN com classes + guildas
SELECT p.nome AS personagem, p.nivel, c.nome AS classe, g.nome AS guilda, g.servidor 
FROM tb_personagens p 
INNER JOIN tb_classes c ON p.classe_id = c.id 
INNER JOIN tb_guildas g ON p.guilda_id = g.id;