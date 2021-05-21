 CREATE DATABASE UNIVERSIDADE;
USE UNIVERSIDADE;

CREATE TABLE Curriculos (
  codigo_curso INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  codigo_disciplina INTEGER UNSIGNED NOT NULL,
  Disciplina_codigo_disciplina INTEGER UNSIGNED NOT NULL,
  Cursos_codigo_curso INTEGER UNSIGNED NOT NULL,
  vagas INT NULL,
  matricula INT NULL,
  PRIMARY KEY(codigo_curso, codigo_disciplina),
  INDEX Curriculos_FKIndex1(Cursos_codigo_curso),
  INDEX Curriculos_FKIndex2(Disciplina_codigo_disciplina)
);

CREATE TABLE Cursos (
  codigo_curso INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Professores_matricula INT NOT NULL,
  nome VARCHAR(15) NULL,
  duracao TINYINT UNSIGNED NULL,
  matricula INT NULL,
  PRIMARY KEY(codigo_curso),
  INDEX Cursos_FKIndex1(Professores_matricula)
);

CREATE TABLE Disciplina (
  codigo_disciplina INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  nome VARCHAR(15) NULL,
  creditos CHAR(1) NULL,
  PRIMARY KEY(codigo_disciplina)
);

CREATE TABLE Professores (
  matricula INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(40) NULL,
  RG NUMERIC(10) NULL,
  sexo CHAR(1) NULL,
  idade TINYINT UNSIGNED NULL,
  titulacao VARCHAR(15) NULL,
  categoria VARCHAR(15) NULL,
  nroTurmas TINYINT UNSIGNED NULL,
  PRIMARY KEY(matricula)
);

CREATE TABLE Turmas (
  codigo_turma INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  codigo_disciplina INTEGER UNSIGNED NOT NULL,
  Disciplina_codigo_disciplina INTEGER UNSIGNED NOT NULL,
  Professores_matricula INT NOT NULL,
  vagas INT NULL,
  matricula INT NULL,
  PRIMARY KEY(codigo_turma, codigo_disciplina),
  INDEX Turmas_FKIndex1(Professores_matricula),
  INDEX Turmas_FKIndex2(Disciplina_codigo_disciplina)
);

INSERT INTO Curriculos(codigo_disciplina, vagas, matricula)
VALUES 
(1, 73, 14052004),
(2, 105, 11011966);

INSERT INTO Cursos(nome, duracao, matricula)
VALUES 
('Matematica', 18, 987654321),
('Português', 8, 123456789);

INSERT INTO Disciplina(nome, creditos)
VALUES
('Banco de dados', 6), 
('Sistemas Embarcados', 8);

INSERT INTO Professores(nome, RG, sexo, idade, titulacao, categoria, nroTurmas)
VALUES
('César', 45139879875, 'M', 17, 'mestre', 'Professor de exatas', 3), 
('Thigaas', 03540327045, 'M', 22, 'mestre', 'Professor de humanas', 5);

INSERT INTO Turmas(vagas, matricula)
VALUES 
(60, 11223344),
(60, 99887766);



create trigger IncTurmasProfonTurmas after insert as update Professores 
set nroTurmas = nroTurmas + 1 where exists(
select professor from inserted where Professores.matricula = professor);