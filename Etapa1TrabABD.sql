CREATE TABLE paciente(
	id_paciente integer,
	codigo varchar(10),
	nome varchar(30),
	idade integer,
	CONSTRAINT PK_paciente PRIMARY KEY (id_paciente)
);

CREATE TABLE medico(
	id_medico integer,
	crm varchar(12),
	nome varchar(30),
	especialidade varchar(20),
	CONSTRAINT PK_medico PRIMARY KEY (id_medico)
);

CREATE TABLE atende(
	id_atende integer,
	id_paciente integer,
	id_medico integer,
	data date,
	CONSTRAINT PK_atende PRIMARY KEY (id_atende),
	CONSTRAINT FK_atende_paciente FOREIGN KEY (id_paciente) REFERENCES paciente,
	CONSTRAINT FK_atende_medico FOREIGN KEY (id_medico) REFERENCES medico
);

CREATE TABLE cirurgia(
	id_cirurgia integer,
	codigo varchar(10),
	data date,
	descricao varchar(50),
	id_paciente integer,
	CONSTRAINT PK_cirurgia PRIMARY KEY (id_cirurgia),
	CONSTRAINT FK_cirurgia_paciente FOREIGN KEY (id_paciente) REFERENCES paciente
);

SELECT * FROM paciente;
SELECT * FROM medico;
SELECT * FROM atende;
SELECT * FROM cirurgia;

CREATE SEQUENCE sid_paciente;
CREATE SEQUENCE sid_medico;
CREATE SEQUENCE sid_atende;
CREATE SEQUENCE sid_cirurgia;

--Inserindo dados na tabela paciente
INSERT INTO paciente VALUES (nextval('sid_paciente'), 'p1', 'João', 12)
RETURNING id_paciente;

INSERT INTO paciente VALUES (nextval('sid_paciente'), 'p2', 'Maria', 38)
RETURNING id_paciente;

INSERT INTO paciente VALUES (nextval('sid_paciente'), 'p3', 'Pedro', 21)
RETURNING id_paciente;

INSERT INTO paciente VALUES (nextval('sid_paciente'), 'p4', 'Antônio', 29)
RETURNING id_paciente;

--Inserindo dados na tabela medico
INSERT INTO medico VALUES (nextval('sid_medico'), 'm1', 'Marcos', 'Oftalmologista')
RETURNING id_medico;

INSERT INTO medico VALUES (nextval('sid_medico'), 'm2', 'Tereza', 'Clínico Geral')
RETURNING id_medico;

INSERT INTO medico VALUES (nextval('sid_medico'), 'm3', 'Paulo', 'Pediatra')
RETURNING id_medico;

INSERT INTO medico VALUES (nextval('sid_medico'), 'm4', 'João', 'Clínico Geral')
RETURNING id_medico;

--Inserindo dados na tabela atende
INSERT INTO atende VALUES (nextval('sid_atende'), 1, 2, '09/02/2008')
RETURNING id_atende;

INSERT INTO atende VALUES (nextval('sid_atende'), 2, 1, '26/03/2006')
RETURNING id_atende;

INSERT INTO atende VALUES (nextval('sid_atende'), 3, 3, '11/09/2003')
RETURNING id_atende;

INSERT INTO atende VALUES (nextval('sid_atende'), 1, 4, '13/10/2007')
RETURNING id_atende;

INSERT INTO atende VALUES (nextval('sid_atende'), 2, 2, '08/05/2008')
RETURNING id_atende;

--Inserindo dados na tabela cirurgia
INSERT INTO cirurgia VALUES (nextval('sid_cirurgia'), 'c1', '25/07/2008', 'Apendicite', 1)
RETURNING id_cirurgia;

INSERT INTO cirurgia VALUES (nextval('sid_cirurgia'), 'c2', '07/02/2001', 'Retirada de cálculo renal', 2)
RETURNING id_cirurgia;

INSERT INTO cirurgia VALUES (nextval('sid_cirurgia'), 'c3', '14/11/2007', 'Unha encravada', 3)
RETURNING id_cirurgia;

INSERT INTO cirurgia VALUES (nextval('sid_cirurgia'), 'c4', '23/01/2008', 'Implante de silicone', 2)
RETURNING id_cirurgia;