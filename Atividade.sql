CREATE DATABASE UNIVERSIDADE;

create table Professores (
matricula int,
nome varchar(40) not null,
RG numeric(10) unique,
sexo char(1) check(sexo in ('M','F')),
idade tinyint check(idade between 21 and 80),
titulacao varchar(15) check(titulacao in ('graduado','especialista', 'mestre', 'doutor')),categoria varchar(15) check(categoria in ('auxiliar','assistente', 'adjunto', 'titular')),nroTurmas tinyint check(nroTurmas >= 0),
constraint pkProf primary key (matricula))

CREATE TABLE Cursos (
codigo PRIMARY KEY,
nome varchar(40) not null,
duracao tinyint check(idade between 4 and 12),
coordenador constraint fkProf foreign key (coordenador) references Professores on update cascade)

CREATE TABLE Disciplinas (
codigo PRIMARY KEY,
nome varchar(40) NOT NULL,
creditos tinyint check(idade between 2 and 8))

CREATE TABLE Curriculos (
curso CONSTRAINT fkCod FOREIGN KEY (codigo) REFERENCES Cursos ON UPDATE CASCADE,
--Teste
)