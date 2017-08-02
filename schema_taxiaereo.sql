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
		index (id_endereco),
);
 
CREATE TABLE IF NOT EXISTS endereco (
    id INT PRIMARY KEY,
		logradouro STRING,
		cep STRING,
		numero INT,
);

CREATE TABLE IF NOT EXISTS cliente (
    id_pessoas INT REFERENCES pessoas(id),
    data_cadastro DATE,
		id_pessoa_indicada INT,
		index (id_pessoa),
		PRIMARY KEY (id_pessoas),
);

CREATE TABLE IF NOT EXISTS funcionario (
    id INT PRIMARY KEY,
    salario DECIMAL,
		data_contrato DATE,
		breve INT,
		tipo STRING(1),
		id_pessoa INT REFERENCES pessoas(id),
		index(id_pessoa),
);

CREATE TABLE IF NOT EXISTS contrato (
    id INT PRIMARY KEY,
    protocolo INT,
		valor DECIMAL,
);

CREATE TABLE IF NOT EXISTS veiculo (
    n_chassi INT PRIMARY KEY,
    modelo STRING,
		autonomia STRING,
		capacidade STRING,
		velocidade INT,
		tipo STRING,
);

CREATE TABLE IF NOT EXISTS negociacao (
    id INT PRIMARY KEY,
    data DATE,
		id_pessoa INT REFERENCES pessoa(id),
		id_funcionario INT REFERENCES funcionario(id),
		id_contrato INT REFERENCES contrato(id),
		index(id_pessoa),
		index(id_funcionario),
		index(id_contrato),
);

CREATE TABLE IF NOT EXISTS voo (
    id_protocolo INT PRIMARY KEY,
    data_chegada DATE,
		duracao TIMESTAMP,
		aero_origem STRING,
		aero_destino STRING,
		id_funcionario INT REFERENCES funcionario(id),
		n_chassi INT REFERENCES veiculo(n_chassi),
		horario_partida TIMESTAMP,
		index(id_funcionario),
		index(n_chassi),
);


