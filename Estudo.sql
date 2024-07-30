--CREATE DATABASE BaseEstudos
-- Creating table usuarios

CREATE TABLE usuarios (
    id_usuarios INT IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    endereco VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL
);

-- Creating table destino
CREATE TABLE reserva (
    id_destino INT IDENTITY(1,1) PRIMARY KEY,
    id_usuarios INT NOT NULL,  
    data DATE NOT NULL,
    status VARCHAR(10),
    CONSTRAINT fk_id_usuarios 
        FOREIGN KEY(id_usuarios) 
        REFERENCES usuarios(id_usuarios)  
);

INSERT INTO usuarios(nome, email, data_nascimento, endereco) 
VALUES ('Vinicius Diaz', 'vinissdiaz15@gmail.com', '17/05/2004', 'Avenida do Coqueiros'),
		('David Santana', 'vinissdiaz@hotmail.com', '18/12/1981', 'Avenida Tonico Lenci')

INSERT INTO reserva (id_usuarios, data, status) VALUES (1, '2023-11-11', 'Pendente')
SELECT * FROM usuarios
SELECT * FROM reserva

/*UPDATE usuarios
SET id_usuarios = 3
WHERE email = 'vinissdiaz15@gmail.com';

DELETE FROM usuarios
WHERE nome LIKE '%David%'

--Migrando dados de uma tabela para outra
CREATE TABLE usuarios_nova (
		id_usuarios INT IDENTITY(1,1) PRIMARY KEY,
		nome VARCHAR(255) NOT NULL,
		email VARCHAR(100) NOT NULL UNIQUE,
		endereco VARCHAR (50) NOT NULL,
		data_nascimento DATE NOT NULL
);
INSERT INTO usuarios_nova(nome, email, data_nascimento, endereco) 
SELECT nome, email, data_nascimento, endereco 
FROM usuarios

DROP TABLE usuarios

--Renomeia Tabela
EXEC sp_rename 'usuarios_nova', 'usuarios';

--Alterar coluna da tabela
ALTER TABLE usuarios
ALTER COLUMN endereco VARCHAR(150);
*/