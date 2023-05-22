CREATE DATABASE ojagarra;
USE ojagarra;

CREATE TABLE usuario (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45),
	email VARCHAR(45),
	senha VARCHAR(45)
);

CREATE TABLE wiki (
	idWiki INT PRIMARY KEY AUTO_INCREMENT,
	genero VARCHAR(45)
);

CREATE TABLE perfil (
    idPerfil INT,
    fkUsuario INT UNIQUE,
	fkWiki INT,
	nome VARCHAR(45),
    ftPerfil VARCHAR(500),
    bio VARCHAR(200),
    CONSTRAINT favWiki
    FOREIGN KEY (fkWiki) REFERENCES wiki(idWiki),
    CONSTRAINT userPerfil
    FOREIGN KEY (fkUsuario) REFERENCES usuario(id),
    PRIMARY KEY (idPerfil, fkUsuario)
);

CREATE TABLE post (
	idPost INT PRIMARY KEY AUTO_INCREMENT,
	fkPerfil INT,
    titulo VARCHAR(45),
    descricao VARCHAR(500),
    ftPost VARCHAR(500),
    dtPost DATE,
    CONSTRAINT postPerfil
    FOREIGN KEY (fkPerfil) REFERENCES perfil(idPerfil)
);

INSERT INTO usuario VALUES
	(null, 'Luka', 'luka@sptech.school', '12345');
    
SELECT * FROM usuario;

