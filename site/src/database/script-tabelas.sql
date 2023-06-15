CREATE DATABASE ojagarra;
USE ojagarra;

CREATE TABLE usuario (
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45),
	email VARCHAR(45),
	senha VARCHAR(45)
);

CREATE TABLE votoGenero (
	idGenero INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45)
);

CREATE TABLE votoFoto (
    idFoto INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45)
);

CREATE TABLE perfil (
    idPerfil INT,
    fkUsuario INT UNIQUE,
	fkGenero INT,
    fkFoto INT,
	nome VARCHAR(45),
    ftPerfil VARCHAR(500),
    bio VARCHAR(200),
    CONSTRAINT favGenero
    FOREIGN KEY (fkGenero) REFERENCES votoGenero(idGenero),
    CONSTRAINT favFoto
    FOREIGN KEY (fkFoto) REFERENCES votoFoto(idFoto),
    CONSTRAINT userPerfil
    FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario),
    PRIMARY KEY (idPerfil, fkUsuario)
);

CREATE TABLE post (
	idPost INT PRIMARY KEY AUTO_INCREMENT,
	fkPerfil INT,
    fkUsuario INT,
    titulo VARCHAR(45),
    descricao VARCHAR(500),
    ftPost VARCHAR(500),
    dtPost DATE,
    CONSTRAINT postPerfil
    FOREIGN KEY (fkPerfil) REFERENCES perfil(idPerfil),
    CONSTRAINT postUsuario
    FOREIGN KEY (fkUsuario) REFERENCES usuario(idUsuario)
);


INSERT INTO usuario VALUES
	(null, 'Luka', 'luka@sptech.school', '12345');
    
INSERT INTO perfil (idPerfil, fkUsuario, nome, bio, ftPerfil) VALUES
	(1, 1, 'luka', 'oi', 'd84517b902307538118ef1a840fddf967bc4b6581795a1458ff64296cbb05c5d247f2b3609e85a8347480c89183275d99e9b2f951732b2f8c189a17f45a1508a.png');
    
INSERT INTO votoGenero VALUES 
	(1, "Terror Psicológico"),
    (2, "Existencialismo"),
    (3, "Crime");

INSERT INTO votoFoto VALUES 
	(1, "Julius Shulman"),
    (2, "Françoise Nuñez"),
    (3, "Ansel Adams");
    
    
SELECT * FROM usuario;
SELECT * FROM perfil;

SELECT fkGenero FROM perfil
	WHERE fkGenero = 2 ;
    
SELECT COUNT(fkUsuario) as Contagem, 
votoGenero.nome as Genero
FROM perfil 
	JOIN votoGenero 
	ON fkGenero = idGenero 
	GROUP BY fkGenero;

SELECT 
	post.idPost,
	post.titulo,
	post.descricao,
	post.ftPost,
	post.fkUsuario,
	post.fkPerfil,
	usuario.idUsuario,
	perfil.idPerfil,
	perfil.ftPerfil
		FROM post
			JOIN usuario ON idUsuario = post.fkUsuario
			JOIN perfil ON idPerfil = post.fkPerfil;
