CREATE DATABASE trocas_digitais;
USE trocas_digitais;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL
);

INSERT INTO usuarios (nome, email, senha) VALUES ('Mariana', 'mari@gmail.com', '1234');
select * from usuarios;

CREATE TABLE perguntas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    area ENUM('Programação', 'Design', 'Meteriais de estudo', 'Projetos') NOT NULL,
    duvida TEXT NOT NULL,
    data_criacao DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id)
);

INSERT INTO perguntas (usuario_id, area, duvida) VALUES ('1', 'Programação', 'Como....');
select * from perguntas;

CREATE TABLE respostas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pergunta_id INT,
    respondente_id INT,
    resposta TEXT NOT NULL,
    data_resposta DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (pergunta_id) REFERENCES perguntas(id),
    FOREIGN KEY (respondente_id) REFERENCES usuarios(id)
);

INSERT INTO respostas (pergunta_id, respondente_id, resposta) VALUES ('1', '8', 'Assim...');
select * from respostas;

CREATE TABLE matches (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pergunta_id INT NOT NULL,
    respondente_id INT NOT NULL,
    data_match DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (pergunta_id) REFERENCES perguntas(id),
    FOREIGN KEY (respondente_id) REFERENCES usuarios(id)
);
