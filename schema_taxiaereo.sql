CREATE TABLE IF NOT EXISTS endereco (
    id INT PRIMARY KEY,
    logradouro STRING,
    cep STRING,
    numero INT
);

CREATE TABLE IF NOT EXISTS pessoa (
    id INT PRIMARY KEY,
    tipo STRING(1),
    nome STRING NOT NULL,
    rg INT UNIQUE NOT NULL,
    cpf INT UNIQUE NOT NULL,
    tel_celular STRING,
    tel_residencial STRING,
    tel_comercial STRING,
    id_endereco INT REFERENCES endereco(id),
    index (id_endereco)
);

CREATE TABLE IF NOT EXISTS cliente (
    id_pessoa INT REFERENCES pessoa(id),
    data_cadastro DATE,
    id_pessoa_indicada INT,
    index (id_pessoa),
    PRIMARY KEY (id_pessoa)
);

CREATE TABLE IF NOT EXISTS funcionario (
    id_pessoa INT REFERENCES pessoa(id),
    salario DECIMAL,
    data_contrato DATE,
    tipo STRING(1),
    index(id_pessoa),
    PRIMARY KEY (id_pessoa)
);

CREATE TABLE IF NOT EXISTS vendedor (
    id_vendedor INT REFERENCES funcionario(id_pessoa),
    index(id_vendedor),
    PRIMARY KEY (id_vendedor)
);

CREATE TABLE IF NOT EXISTS piloto (
    id_piloto INT REFERENCES funcionario(id_pessoa),
    breve INT,
    index(id_piloto),
    PRIMARY KEY (id_piloto)
);

CREATE TABLE IF NOT EXISTS contrato (
    id INT PRIMARY KEY,
    protocolo INT,
    valor DECIMAL
);

CREATE TABLE IF NOT EXISTS veiculo (
    n_chassi INT PRIMARY KEY,
    modelo STRING,
    autonomia STRING,
    capacidade STRING,
    velocidade INT,
    tipo STRING
);

CREATE TABLE IF NOT EXISTS negociacao (
    id INT PRIMARY KEY,
    data DATE,
    desconto DECIMAL,
    id_cliente INT REFERENCES cliente(id_pessoa),
    id_funcionario INT REFERENCES funcionario(id_pessoa),
    id_contrato INT REFERENCES contrato(id),
    index(id_cliente),
    index(id_funcionario),
    index(id_contrato)
);

CREATE TABLE IF NOT EXISTS voo (
    id_protocolo INT PRIMARY KEY,
    data_partida DATE,
    data_chegada DATE,
    horario_partida TIMESTAMP,
    horario_chagada TIMESTAMP,
    duracao TIMESTAMP,
    origem STRING,
    destino STRING,
    id_piloto INT REFERENCES piloto(id_piloto),
    n_chassi INT REFERENCES veiculo(n_chassi),
    index(id_piloto),
    index(n_chassi)
);
