/*CREATE DATABASE viagens;
USE viagens;*/
CREATE TABLE usuarios (
  id INT,
  nome VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  data_nascimento DATE NOT NULL,
  endereco VARCHAR(50) NOT NULL
);

CREATE TABLE destinos (
  id INT,
  nome VARCHAR(255) NOT NULL UNIQUE,
  descricao VARCHAR(255) NOT NULL
);

CREATE TABLE reservas (
  id INT ,
  id_usuario INT,
  id_destino INT,
  data DATE,
  status VARCHAR(255) DEFAULT 'pendente'
);

-- Inserts --
INSERT INTO usuarios (id, nome, email, data_nascimento, endereco) VALUES 
(1, 'João Silva', 'joao@example.com', '1990-05-15', 'Rua A, 123, Cidade X, Estado Y'),
(2, 'Maria Santos', 'maria@example.com', '1985-08-22', 'Rua B, 456, Cidade Y, Estado Z'),
(3, 'Pedro Souza', 'pedro@example.com', '1998-02-10', 'Avenida C, 789, Cidade X, Estado Y');

INSERT INTO destinos (id, nome, descricao) VALUES 
(1, 'Praia das Tartarugas', 'Uma bela praia com areias brancas e mar cristalino'),
(2, 'Cachoeira do Vale Verde', 'Uma cachoeira exuberante cercada por natureza'),
(3, 'Cidade Histórica de Pedra Alta', 'Uma cidade rica em história e arquitetura');

INSERT INTO reservas (id, id_usuario, id_destino, data, status) VALUES 
(1, 1, 2, '2023-07-10', 'confirmada'),
(2, 2, 1, '2023-08-05', 'pendente'),
(3, 3, 3, '2023-09-20', 'cancelada');

-- Selects --

-- Selecionar todos os registros da tabela "usuarios"
SELECT * FROM usuarios;

-- Selecionar apenas o nome e o email dos usuários
SELECT nome, email FROM usuarios;

-- Selecionar os usuários que possuem o nome "João Silva"
SELECT * FROM usuarios WHERE nome = 'João Silva';

-- Selecionar os usuários que nasceram antes de uma determinada data
SELECT * FROM usuarios WHERE data_nascimento < '1990-01-01';

-- Like
SELECT * FROM usuarios WHERE nome LIKE '%Silva%';
SELECT * FROM usuarios WHERE nome LIKE 'Jo_o%';

-- Update --
UPDATE usuarios SET endereco = 'Nova Rua, 123' WHERE email = 'joao@example.com';

-- delete --
DELETE FROM reservas WHERE status = 'cancelada';




-- Tabela "usuarios"
ALTER TABLE usuarios
ADD id INT IDENTITY(1,1) PRIMARY KEY;

-- Tabela "destinos"
ALTER TABLE destinos
ADD id INT IDENTITY(1,1) PRIMARY KEY;

-- Tabela "reservas"
ALTER TABLE reservas
ADD id INT IDENTITY(1,1) PRIMARY KEY;

-- Adicionando chave estrangeira na tabela "reservas" referenciando a tabela "usuarios"
ALTER TABLE reservas
ADD CONSTRAINT fk_reservas_usuarios
FOREIGN KEY (id_usuario) REFERENCES usuarios(id);

-- Adicionando chave estrangeira na tabela "reservas" referenciando a tabela "destinos"
ALTER TABLE reservas
ADD CONSTRAINT fk_reservas_destinos
FOREIGN KEY (id_destino) REFERENCES destinos(id);

-- Alterando a restrição da chave estrangeira "fk_reservas_usuarios" na tabela "reservas" para ON DELETE CASCADE
ALTER TABLE reservas
DROP CONSTRAINT fk_reservas_usuarios;

ALTER TABLE reservas
ADD CONSTRAINT fk_reservas_usuarios
FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
ON DELETE CASCADE;
