CREATE DATABASE escolaIdioma;
USE escolaIdioma;

CREATE TABLE aluno (
idAluno int primary key auto_increment,
nome varchar(45),
bairro varchar(45));

INSERT INTO aluno VALUES
	(null, 'Quatro Braços', 'Cerqueira Cesar'),
    (null, 'Mass Cinzenta', 'Cerqueira Cesar'),
    (null, 'XLR8', 'Paraíso'),
    (null, 'WalkaTruta', 'Paraíso');

CREATE TABLE curso (
idCurso int primary key auto_increment,
nome varchar(45))auto_increment = 1000;

INSERT INTO curso VALUES
	(null, 'Inglês'),
	(null, 'Espanhol'),
    (null, 'Mandarim');
    
select * from curso;

CREATE TABLE alunoCurso (
idAlunoCurso int,
fkAluno int,
fkCurso int,
dtMatricula date,
nivel char(2),
nota float,
constraint fkAluno foreign key (fkAluno)
	references aluno(idAluno),
constraint fkCurso foreign key (fkCurso)
	references curso(idCurso),
constraint pkTripla primary key (idAlunoCurso, fkAluno, fkCurso));


select * from aluno;
INSERT INTO alunoCurso VALUES 
	(1, 1, 1000, '2023-01-01', 'B1', null),
    (2, 1, 1001, '2023-01-01', 'B3', 9.25),
    (1, 2, 1001, '2023-01-01', 'B2', 7.5),
    (1, 3, 1002, '2023-01-01', 'A1', 6),
    (1, 4, 1002, '2023-01-01', 'A1', 8.75);
    
SELECT * FROM aluno JOIN alunoCurso
	ON idAluno = fkAluno
    JOIN curso ON idCurso = fkCurso;
    
INSERT INTO aluno VALUES 
	(null, 'Ultra T', 'Consolação');
    
INSERT INTO curso VALUES 
	(null, 'Alemão');
    
SELECT * FROM aluno RIGHT JOIN alunoCurso 
	 ON idAluno = fkAluno
     RIGHT JOIN curso ON idCurso = fkCurso;
     
SELECT * FROM aluno LEFT JOIN alunoCurso 
	 ON idAluno = fkAluno
     LEFT JOIN curso ON idCurso = fkCurso;
     
SELECT * FROM aluno RIGHT JOIN alunoCurso 
	 ON idAluno = fkAluno
     RIGHT JOIN curso ON idCurso = fkCurso
     WHERE fkCurso is null;
     
SELECT * FROM aluno LEFT JOIN alunoCurso 
	 ON idAluno = fkAluno
     LEFT JOIN curso ON idCurso = fkCurso
UNION
SELECT * FROM aluno RIGHT JOIN alunoCurso 
	 ON idAluno = fkAluno
     RIGHT JOIN curso ON idCurso = fkCurso
     WHERE fkCurso is null;
     
SELECT COUNT(*) FROM alunoCurso;
SELECT COUNT(nota) FROM alunoCurso;
SELECT COUNT(nota) FROM alunoCurso WHERE nota = null;

SELECT SUM(nota) FROM alunoCurso;
SELECT SUM(nota)/COUNT(nota) FROM alunoCurso;

SELECT AVG(nota) FROM alunoCurso;

SELECT ROUND(AVG(nota),2) FROM alunoCurso;

SELECT TRUNCATE(AVG(nota),2) FROM alunoCurso;
SELECT TRUNCATE(AVG(nota),3) FROM alunoCurso;

SELECT MAX(nota) FROM alunoCurso;
SELECT MIN(nota) FROM alunoCurso;


SELECT MAX(nota), MIN(nota) FROM alunoCurso;

SELECT * FROM alunoCurso;

SELECT AVG(NOTA), nivel from alunoCurso
	GROUP BY nivel;
    
SELECT bairro, avg(nota) FROM aluno
	JOIN alunoCurso ON idAluno = fkAluno
    GROUP BY bairro;
    
SELECT 