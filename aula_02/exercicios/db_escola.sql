-- Criação do banco de dados
CREATE DATABASE db_escola;
USE db_escola;

-- Criação da tabela de turmas
CREATE TABLE tb_turmas (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome_turma VARCHAR(20) NOT NULL
);

-- Inserção de turmas
INSERT INTO tb_turmas (nome_turma) VALUES
("1A"),
("1B"),
("2A"),
("2B"),
("3A");

-- Consulta para verificar as turmas
SELECT * FROM tb_turmas;

-- Criação da tabela de estudantes com chave estrangeira
CREATE TABLE tb_estudantes (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade INT,
    nota DECIMAL(4,2),
    data_matricula DATE,
    turma_id BIGINT,
    FOREIGN KEY (turma_id) REFERENCES tb_turmas(id)
);

-- Inserção de estudantes vinculados às turmas
INSERT INTO tb_estudantes (nome, idade, nota, data_matricula, turma_id) VALUES
("Lucas Martins", 16, 8.5, "2022-02-01", 1),
("Mariana Souza", 15, 6.9, "2022-02-01", 1),
("Gabriel Lima", 17, 7.2, "2021-02-10", 4),
("Rafaela Gomes", 16, 9.1, "2021-02-10", 4),
("Vinícius Rocha", 15, 5.8, "2023-01-20", 2),
("Beatriz Nunes", 16, 7.9, "2022-03-15", 3),
("João Pedro", 17, 6.5, "2020-02-05", 5),
("Aline Ferreira", 15, 9.5, "2023-01-25", 1);

-- SELECT para estudantes com nota maior que 7.0
SELECT * FROM tb_estudantes WHERE nota > 7.0 ORDER BY nota DESC;

-- SELECT para estudantes com nota menor que 7.0
SELECT * FROM tb_estudantes WHERE nota < 7.0 ORDER BY nota ASC;

-- Atualiza a nota de um estudante (exemplo: João Pedro)
UPDATE tb_estudantes SET nota = 7.5 WHERE id = "7";

-- INNER JOIN para exibir estudantes junto com o nome da turma
SELECT estudantes.nome, estudantes.nota, turma.nome_turma AS turma
FROM tb_estudantes AS estudantes
INNER JOIN tb_turmas AS turma
ON estudantes.turma_id = turma.id;