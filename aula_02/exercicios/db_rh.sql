-- Criação o banco de dados
CREATE DATABASE db_rh;
USE db_rh;

-- Criação da tabela de departamentos
CREATE TABLE tb_departamento(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(255) NOT NULL
);

-- Inserção de dados na tabela de departamentos
INSERT INTO tb_departamento (descricao) 
VALUES  ("Recursos Humanos"),
        ("Administrativo"),
        ("Psicologia"),
        ("T.I");

-- Visualiza os dados da tabela de departamentos
SELECT * FROM tb_departamento;

-- Criação da tabela de colaboradores (funcionários)
CREATE TABLE tb_colaboradores(
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(255),
    salario DECIMAL(10, 2),
    data_admissao DATE,
    departamento_id BIGINT,
    FOREIGN KEY (departamento_id) REFERENCES tb_departamento(id)
);

-- Inserção de dados na tabela de colaboradores
INSERT INTO tb_colaboradores (nome, cargo, salario, data_admissao, departamento_id)
VALUES ("João Silva", "Analista de RH", 2500.00, "2022-01-10", 1),
       ("Roberto Carlos", "Coordenador de RH", 3200.00, "2020-06-01", 1),
       ("Ana Maria", "Assistente Administrativo", 1800.00, "2021-09-15", 2),
       ("Fatima Bernardes", "Suporte T.I N2", 2700.00, "2023-03-20", 4),
       ("William Bonner", "Psicólogo Organizacional", 2500.00, "2020-04-19", 3);

-- SELECT de colaboradores com salário maior que 2000
SELECT * FROM tb_colaboradores WHERE salario > 2000;

-- SELECT de colaboradores com salário menor que 2000
SELECT * FROM tb_colaboradores WHERE salario < 2000;

-- Atualiza o salário de João Silva
UPDATE tb_colaboradores SET salario = 2700.00 WHERE id = "1";

-- INNER JOIN: apenas calaboradores com departamento
SELECT * FROM tb_colaboradores
INNER JOIN tb_departamento 
ON tb_colaboradores.departamento_id = tb_departamento.id;

-- Consultar colaborador com Maior e Menor Salario
SELECT nome, salario AS maior_salario FROM tb_colaboradores ORDER BY salario DESC LIMIT 1;
SELECT nome, salario AS menor_salario FROM tb_colaboradores ORDER BY salario ASC LIMIT 1;