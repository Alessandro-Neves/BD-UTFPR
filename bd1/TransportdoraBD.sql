-- Alessandro Neves dos Santos, 2044323
DROP SCHEMA IF EXISTS TRANSPORTADORA;
CREATE SCHEMA TRANSPORTADORA;
USE TRANSPORTADORA;

DROP TABLE IF EXISTS
    FUNCIONARIOS,
    OPERARIOS,
    FUNCIONARIOS_ADMINISTRATIVOS,
    MOTORISTAS,
    GERENTES,
    CONTRATOS_TRABALHO,
    UNIDADES_TRANSPORTADORA,
    ENDERECO_TRANSPORTADORA,
    CATEGORIAS_VEICULO,
    CATEGORIAS_CARGA,
    TIPO_DE_VEICULO,
    VEICULO_PERTENCE,
    VEICULOS,
    VIAJENS_ENTREGA,
    LOTES_ENTREGA,
    DESTINOS,
    PRODUTOS,
    PREPARA_LOTE,
    CLIENTES,
    ENDERECO_CLIENTE;

-- Funcionários
CREATE TABLE FUNCIONARIOS(
    id INTEGER PRIMARY,
    cpf INTEGER,
    nome VARCHAR(50),
    UNIQUE(cpf)
);
CREATE TABLE OPERARIOS(
    id INTEGER PRIMARY KEY,
    FOREIGN KEY (id) REFERENCES FUNCIONARIOS(id)
);
CREATE TABLE FUNCIONARIOS_ADMINISTRATIVOS(
    id INTEGER PRIMARY KEY,
    FOREIGN KEY (id) REFERENCES FUNCIONARIOS(id)
);
CREATE TABLE MOTORISTAS(
    id INTEGER PRIMARY KEY,
    cnh INTEGER,
    UNIQUE(cnh),
    FOREIGN KEY (id) REFERENCES FUNCIONARIOS(id)
);
CREATE TABLE GERENTES(
    id INTEGER PRIMARY KEY,
    FOREIGN KEY (id) REFERENCES FUNCIONARIOS(id)
);
-- Contratos de trabalho
CREATE TABLE CONTRATOS_TRABALHO(
    id INTEGER PRIMARY KEY,
    inicio DATA,
    fim DATA,
    salario DECIMAL(5,2),
    idFuncionario INTEGER,
    idUnidadeTransportadora INTEGER,
    FOREIGN KEY (idFuncionario) REFERENCES FUNCIONARIOS(id), -- Relação: Funcionarios <Possui> ContratosTrabalho
    FOREIGN KEY (idUnidadeTransportadora) REFERENCES UNIDADES_TRANSPORTADORA(id) -- Relação: UnidadesTransportadora <possui> Contratos de Trabalho
);
-- Unidade Transportadora

CREATE TABLE UNIDADES_TRANSPORTADORA(
    id INTEGER PRIMARY KEY,
    idGerente INTEGER NOT NULL,
    UNIQUE(idGerente),
    FOREIGN KEY (idGerente) REFERENCES GERENTES(id) -- Relacão: Gerente <responsavel> UnidadeTransportadora
);

-- Endereço Unidade Transportadora

CREATE TABLE ENDERECO_TRANSPORTADORA(
    id INTEGER PRIMARY KEY,
    numero INTEGER,
    bairro VARCHAR(20),
    cidade VARCHAR(20),
    estado VAR(2),
    FOREIGN KEY (id) REFERENCES UNIDADES_TRANSPORTADORA(id)
);

-- Categorias de Veiculo
CREATE TABLE CATEGORIAS_VEICULO(
    id INTEGER PRIMARY KEY,
    nome VARCHAR(20),
    descricao VARCHAR(200)
);
-- Categorias de carga
CREATE TABLE CATEGORIAS_CARGA(
    id INTEGER PRIMARY KEY,
    classe VAR(1),
    peso_maximo INTEGER 
);
-- Possui: relação entre Categoris de Carga e Categorias de Veiculo

CREATE TABLE TIPO_DE_VEICULO(
    idCategoriaVeiculo INTEGER,
    idCategoriaCarga INTEGER,
    PRIMARY KEY (idCategoriaVeiculo, idCategoriaCarga),
    FOREIGN KEY (idCategoriaVeiculo) REFERENCES CATEGORIAS_VEICULO(id),
    FOREIGN KEY (idCategoriaCarga) REFERENCES CATEGORIAS_CARGA(id)
);

-- Pertence: relação entre veiculo e tipo_de_veiculo

CREATE TABLE VEICULO_PERTENCE(
    idCategoriaVeiculo INTEGER,
    idCategoriaCarga INTEGER,
    placa CHAR(7),
    PRIMARY KEY(idCategoriaVeiculo, idCategoriaCarga, placa),
    FOREIGN KEY(idCategoriaCarga, idCategoriaVeiculo) REFERENCES TIPO_DE_VEICULO(idCategoriaCarga, idCategoriaVeiculo),
    FOREIGN KEY(placa) REFERENCES VEICULOS(placa)
);

-- Veiculos
CREATE TABLE VEICULOS(
    placa CHAR(7) PRIMARY KEY,
    ano INTEGER,
    origem VARCHAR(20),
    numero_eixos INTEGER,
    idUnidadeTransportadora INTEGER,
    FOREIGN KEY (idUnidadeTransportadora) REFERENCES UNIDADES_TRANSPORTADORA(id)
);

-- Viajem de entrega
CREATE TABLE VIAJENS_ENTREGA(
    id INTEGER PRIMARY KEY,
    dataViajem DATA,
    tipo VARCHAR(10),
    idMotorista INTEGER,
    placa CHAR(7),
    FOREIGN KEY (idMotorista) REFERENCES MOTORISTAS (id),
    FOREIGN KEY (placa) REFERENCES VEICULOS(placa)
);

-- Lote de Entrega
CREATE TABLE LOTES_ENTREGA(
    id INTEGER PRIMARY KEY,
    idViajemEntrega INTEGER,
    idFuncionarioAdministrativo INTEGER,
    idOperario INTEGER,
    FOREIGN KEY(idViajemEntrega) REFERENCES VIAJENS_ENTREGA(id),
    FOREIGN KEY(idFuncionarioAdministrativo) REFERENCES FUNCIONARIOS_ADMINISTRATIVOS(id),
    FOREIGN KEY(idOperario) REFERENCES OPERARIOS(id)
);

-- Destino
CREATE TABLE DESTINOS(
    id INTEGER,
    numero INTEGER,
    estado CHAR(2),
    bairro VARCHAR(20),
    cidade VARCHAR(20),
);

-- Produtos
CREATE TABLE PRODUTOS(
    codigo INTEGER,
    descricao VARCHAR(40),
    peso DECIMAL(3,2),
    idLoteEntrega INTEGER,
    cnpj CHAR(14),
    FOREIGN KEY (idLoteEntrega) REFERENCES LOTES_ENTREGA(id),
    FOREIGN KEY (cnpj) REFERENCES CLIENTES(cnpj)
);

-- prepara lote

CREATE TABLE PREPARA_LOTE(
    idOperario INTEGER,
    idLoteEntrega INTEGER,
    PRIMARY KEY(idOperario, idLoteEntrega),
    FOREIGN KEY (idOperario) REFERENCES OPERARIOS(id),
    FOREIGN KEY (idLoteEntrega) REFERENCES LOTES_ENTREGA(id)
);

-- cliente
CREATE TABLE CLIENTES(
    cnpj CHAR(14) PRIMARY KEY,
    nome VARCHAR(40),
    telefone VARCHAR(15),
    destino INTEGER,
    FOREIGN KEY destino REFERENCES DESTINOS(id)
);

-- Endereço Cliente
CREATE TABLE ENDERECO_CLIENTE(
    numero INTEGER,
    bairro VARCHAR(20),
    cidade VARCHAR(20),
    estado VAR(2),
    cnpjProprietario CHAR(14),
    PRIMARY KEY(numero, bairro, cidade, estado, cnpjProprietario),
    FOREIGN KEY (cnpjProprietario) REFERENCES CLIENTES(cnpj) ON DELETE CASCADE
);


