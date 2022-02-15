/*
Exercício 1:

CREATE TABLE filiais ( id int GENERATED ALWAYS AS IDENTITY,
cnpj VARCHAR(14),
nome VARCHAR(50),
cidade VARCHAR(30), e
stado VARCHAR(20),
PRIMARY KEY(id) );

Exercício 2:

INSERT INTO filiais (cnpj,nome,cidade,estado) VALUES
(82110818000121,'ALFA TRANSPORTES EIRELI','Caçador','SC');

INSERT INTO filiais (cnpj,nome,cidade,estado) VALUES
(82110818000202,'ALFA TRANSPORTES EIRELI','Curitiba','PR'),
(82110818000393,'ALFA TRANSPORTES EIRELI','Guarulhos','SP');

INSERT INTO filiais (cnpj,nome,cidade,estado) VALUES
(82110818001608,'ALFA TRANSPORTES EIRELI','Betim','MG'),
(82110818000806,'ALFA TRANSPORTES EIRELI','Cachoeirinha','RS'),
(82110818002760,'ALFA TRANSPORTES EIRELI','Tres Lagoas ','MS'),
(82110818002094,'ALFA TRANSPORTES EIRELI','Goiania','GO'),
(82110818002507,'ALFA TRANSPORTES EIRELI','Serra','ES'),
(82110818002841,'ALFA TRANSPORTES EIRELI','Rio de Janeiro','RJ');

Exercício 3:

CREATE TABLE departamentos ( codigo int GENERATED ALWAYS AS IDENTITY,
nome_departamento VARCHAR(30),
codigo_filial int NOT NULL,
PRIMARY KEY(codigo),
FOREIGN KEY (codigo_filial) REFERENCES filiais (id));

Exercício 4:

INSERT INTO departamentos (nome_departamento,codigo_filial) VALUES 
('Expedição',1),('SAC',1),('Operacional',1),('Administrativo',1);

INSERT INTO departamentos (nome_departamento,codigo_filial) VALUES 
('Gerência',1);

INSERT INTO departamentos (nome_departamento,codigo_filial) VALUES
('Expedição',2),
('SAC',2),
('Operacional',2),
('Administrativo',2),
('Gerência',2);

INSERT INTO departamentos (nome_departamento,codigo_filial) VALUES
('Expedição',3),
('SAC',3),
('Operacional',3),
('Administrativo',3),
('Gerência',3);

INSERT INTO departamentos (nome_departamento,codigo_filial) VALUES
('Expedição',4),
('SAC',4),
('Operacional',4),
('Administrativo',4),
('Gerência',4);


INSERT INTO departamentos (nome_departamento,codigo_filial) VALUES
('Expedição',5),
('SAC',5),
('Operacional',5),
('Administrativo',5),
('Gerência',5);

INSERT INTO departamentos (nome_departamento,codigo_filial) VALUES
('Expedição',6),
('SAC',6),
('Operacional',6),
('Administrativo',6),
('Gerência',6);

INSERT INTO departamentos (nome_departamento,codigo_filial) VALUES
('Expedição',7),
('SAC',7),
('Operacional',7),
('Administrativo',7),
('Gerência',7);

INSERT INTO departamentos (nome_departamento,codigo_filial) VALUES
('Expedição',8),
('SAC',8),
('Operacional',8),
('Administrativo',8),
('Gerência',8);

INSERT INTO departamentos (nome_departamento,codigo_filial) VALUES
('Expedição',9),
('SAC',9),
('Operacional',9),
('Administrativo',9),
('Gerência',9);

Exercício 5:

CREATE TABLE colaboradores (cpf VARCHAR(11) NOT NULL,
nome VARCHAR(50),
genero VARCHAR(1),
dataAdmissao DATE, 
salario FLOAT, 
cod_dep INT, 
PRIMARY KEY (cpf), 
FOREIGN KEY (cod_dep) REFERENCES departamentos (codigo));

Exercício 6:


INSERT INTO colaboradores(cpf,nome,genero,dataAdmissao,salario,cod_dep) VALUES
('33333333333','joao','M','14/01/2022',1500,3),
('22222222222','Matheus','M','14/02/2022',2500,5),
('11111111111','jonathan','M','14/02/2022',2500,1);

INSERT INTO colaboradores(cpf,nome,genero,dataAdmissao,salario,cod_dep) VALUES
('44444444444','joao','M','14/01/2022',1500,6),
('55555555555','Matheus','M','14/02/2022',2500,8),
('66666666666','jonathan','M','14/02/2022',2500,10),

('77777777777','joao','M','14/01/2022',1500,11),
('88888888888','Matheus','M','14/02/2022',2500,13),
('99999999999','jonathan','M','14/02/2022',2500,15),

('10101010101','joao','M','14/01/2022',1500,16),
('12121212121','Matheus','M','14/02/2022',2500,18),
('13131313131','jonathan','M','14/02/2022',2500,20),

('14141414141','joao','M','14/01/2022',1500,21),
('15151515151','Matheus','M','14/02/2022',2500,23),
('16161616161','jonathan','M','14/02/2022',2500,25),

('17171717171','joao','M','14/01/2022',1500,26),
('18181818181','Matheus','M','14/02/2022',2500,28),
('19191919191','jonathan','M','14/02/2022',2500,30),

('20202020202','joao','M','14/01/2022',1500,31),
('21212121212','Matheus','M','14/02/2022',2500,33),
('23232323232','jonathan','M','14/02/2022',2500,35),

('24242424242','joao','M','14/01/2022',1500,36),
('25252525252','Matheus','M','14/02/2022',2500,38),
('26262626262','jonathan','M','14/02/2022',2500,40),

('27272722727','joao','M','14/01/2022',1500,41),
('28282828228','Matheus','M','14/02/2022',2500,43),
('29292929292','jonathan','M','14/02/2022',2500,45);

SELECT * from colaboradores;

SELECT * FROM departamentos;

Exercício 7:

SELECT c.cpf, c.nome, f.cidade, d.nome_departamento from colaboradores c
INNER JOIN departamentos d on d.codigo = c.cod_dep
INNER JOIN filiais f on f.id = d.codigo_filial
ORDER BY f.id, c.nome;

Exercício 8:

SELECT c.cpf, c.nome, c.dataAdmissao, f.cidade from colaboradores c
INNER JOIN departamentos d on d.codigo = c.cod_dep
INNER JOIN filiais f on f.id = d.codigo_filial
ORDER BY dataAdmissao DESC
LIMIT 5;

Exercício 9:

SELECT d.codigo_filial, f.cidade, COUNT(c.cod_dep) AS Contagem FROM colaboradores c
INNER JOIN departamentos d on d.codigo = c.cod_dep
INNER JOIN filiais f on f.id=d.codigo_filial
GROUP BY d.codigo_filial, f.cidade
ORDER BY d.codigo_filial;

Exercício 10:

SELECT d.nome_departamento, AVG(c.salario) AS Contagem FROM colaboradores c
INNER JOIN departamentos d on d.codigo = c.cod_dep
GROUP BY  d.nome_departamento
ORDER BY d.nome_departamento;

*/
SELECT *FROM colaboradores;


SELECT *FROM departamentos;


SELECT *FROM filiais;

