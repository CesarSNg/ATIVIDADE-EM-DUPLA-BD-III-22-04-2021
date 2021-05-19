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