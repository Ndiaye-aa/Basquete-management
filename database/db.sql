CREATE TABLE campeonato (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    criado_em TIMESTAMP,
    ganhador VARCHAR(20) 
);

CREATE TABLE time (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(20) NOT NULL,
    sigla VARCHAR(3) NOT NULL,
    campeonato_id INT REFERENCES campeonato(id)
);

CREATE TABLE jogador (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(15),
    numero INT,
    insta VARCHAR(15),
    time_id INT REFERENCES time(id)
);
-- lembar de vir e corrigir a automação das pontuações por time
CREATE TABLE partida (
    id SERIAL PRIMARY KEY,
    ganhador VARCHAR(20),
    pontuacaoA INT DEFAULT 0,
    pontuacaoB INT DEFAULT 0,
    comeco TIMESTAMP,
    campeonato_id INT REFERENCES campeonato(id)
);

CREATE TABLE partida_jogador (
    id SERIAL PRIMARY KEY,
    partida_id INT REFERENCES partida(id),
    jogador_id INT REFERENCES jogador(id),
    pontos INT DEFAULT 0,
    UNIQUE(jogador_id, partida_id)
);

CREATE TABLE partida_time (
    id SERIAL PRIMARY KEY,
    partida_id INT REFERENCES partida(id),
    time_id INT REFERENCES time(id),
    ganhador Boolean,
    pontuacao INT,
    UNIQUE(partida_id, time_id)
);