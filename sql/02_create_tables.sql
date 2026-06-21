-- =============================================================
-- BANCO DE DADOS I -- Abreu's
-- Script 02: Criacao das tabelas e constraints de integridade
-- =============================================================

DROP TABLE IF EXISTS DOCUMENTO;
DROP TABLE IF EXISTS MORADOR;
DROP TABLE IF EXISTS COLABORADOR;
DROP TABLE IF EXISTS NUCLEO;
DROP TABLE IF EXISTS MUNICIPIO;
DROP TABLE IF EXISTS EMPRESA;

-- -------------------------------------------------------------
-- Tabela: EMPRESA
-- -------------------------------------------------------------
CREATE TABLE EMPRESA (
  ID SERIAL PRIMARY KEY,
  Nome VARCHAR(255) NOT NULL,
  Telefone VARCHAR(20),
  Endereco VARCHAR(255),
  "E-mail" VARCHAR(100),
  Proprietario VARCHAR(255)
);

-- -------------------------------------------------------------
-- Tabela: MUNICIPIO
-- -------------------------------------------------------------
CREATE TABLE MUNICIPIO (
  ID SERIAL PRIMARY KEY,
  Nome VARCHAR(255) NOT NULL,
  CEP VARCHAR(10),
  Estado CHAR(2),
  Nucleos VARCHAR(255),
  Prefeito VARCHAR(255),
  Lei_Municipal VARCHAR(255)
);

-- -------------------------------------------------------------
-- Tabela: NUCLEO
-- -------------------------------------------------------------
CREATE TABLE NUCLEO (
  ID SERIAL PRIMARY KEY,
  Nome VARCHAR(255) NOT NULL,
  CEP VARCHAR(10),
  Topografo VARCHAR(255),
  Lider VARCHAR(255),
  MUNICIPIO_ID INT,
  CONSTRAINT fk_nucleo_municipio
    FOREIGN KEY (MUNICIPIO_ID) REFERENCES MUNICIPIO(ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

-- -------------------------------------------------------------
-- Tabela: COLABORADOR
-- -------------------------------------------------------------
CREATE TABLE COLABORADOR (
  ID SERIAL PRIMARY KEY,
  Nome VARCHAR(255) NOT NULL,
  CPF VARCHAR(14) UNIQUE,
  Telefone VARCHAR(20),
  "E-mail" VARCHAR(100),
  Senha VARCHAR(255),
  Municipios VARCHAR(255),
  EMPRESA_ID INT,
  NUCLEO_ID INT,
  CONSTRAINT fk_colaborador_empresa
    FOREIGN KEY (EMPRESA_ID) REFERENCES EMPRESA(ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT fk_colaborador_nucleo
    FOREIGN KEY (NUCLEO_ID) REFERENCES NUCLEO(ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

-- -------------------------------------------------------------
-- Tabela: MORADOR
-- -------------------------------------------------------------
CREATE TABLE MORADOR (
  ID SERIAL PRIMARY KEY,
  Nome VARCHAR(255) NOT NULL,
  Quadra INT,
  Lote INT,
  Lider VARCHAR(255),
  Nome_do_conjuge VARCHAR(255),
  NUCLEO_ID INT,
  CONSTRAINT fk_morador_nucleo
    FOREIGN KEY (NUCLEO_ID) REFERENCES NUCLEO(ID)
    ON DELETE SET NULL
    ON UPDATE CASCADE
);

-- -------------------------------------------------------------
-- Tabela: DOCUMENTO
-- -------------------------------------------------------------
CREATE TABLE DOCUMENTO (
  ID SERIAL PRIMARY KEY,
  Ficha_de_cadastro VARCHAR(255),
  RG_CPF_CNH VARCHAR(20),
  Renda NUMERIC(10,2),
  Residencia VARCHAR(255),
  Contrato VARCHAR(255),
  Certidao_de_casamento_nascimento VARCHAR(255),
  MORADOR_ID INT,
  CONSTRAINT fk_documento_morador
    FOREIGN KEY (MORADOR_ID) REFERENCES MORADOR(ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);


SELECT 
    m.ID,
    m.Nome AS Morador,
    m.Quadra,
    m.Lote,
    n.Nome AS Nucleo,
    mun.Nome AS Municipio,
    mun.Estado
FROM MORADOR m
LEFT JOIN NUCLEO n ON m.NUCLEO_ID = n.ID
LEFT JOIN MUNICIPIO mun ON n.MUNICIPIO_ID = mun.ID;


-- Criação da tabela IMOVEL
CREATE TABLE IMOVEL (
    ID SERIAL PRIMARY KEY,
    Endereco_Completo VARCHAR(255) NOT NULL,
    Area_Total_m2 NUMERIC(10,2) NOT NULL CHECK (Area_Total_m2 > 0),
    Tipo_Construcao VARCHAR(100) NOT NULL,
    MORADOR_ID INT NOT NULL,
    CONSTRAINT fk_imovel_morador
        FOREIGN KEY (MORADOR_ID) REFERENCES MORADOR(ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

