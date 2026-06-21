-- =============================================================
-- BANCO DE DADOS I -- Abreu's
-- Script 04: Dados de exemplo para testes e demonstracao
-- =============================================================

-- Inserção de dados de exemplo para testes

INSERT INTO EMPRESA (Nome, Telefone, Endereco, Email, Proprietario)
VALUES ('Empresa Teste', '4999999999', 'Rua Central, 100', 'teste@empresa.com', 'João Silva');

INSERT INTO MUNICIPIO (Nome, CEP, Estado, Prefeito, Lei_Municipal)
VALUES ('São Miguel do Oeste', '89900-000', 'SC', 'Maria Souza', 'Lei 123/2025');

INSERT INTO NUCLEO (Nome, CEP, Topografo, Lider, MUNICIPIO_ID)
VALUES ('Núcleo Norte', '89900-001', 'Carlos Topógrafo', 'Ana Líder', 1);

INSERT INTO COLABORADOR (Nome, CPF, Telefone, Email, Senha, EMPRESA_ID, NUCLEO_ID)
VALUES ('Pedro Colaborador', '12345678900', '49988887777', 'pedro@empresa.com', 'senha123', 1, 1);

INSERT INTO MORADOR (Nome, CPF, Quadra, Lote, Lider, Nome_do_conjuge, NUCLEO_ID)
VALUES ('José Morador', '98765432100', 5, 12, 'Líder Comunitário', 'Maria Moradora', 1);

INSERT INTO DOCUMENTO (Ficha_de_cadastro, RG_CPF_CNH, Renda, Residencia, Contrato, Certidao_de_casamento_nascimento, MORADOR_ID)
VALUES ('Ficha001', 'RG123456', 2500.00, 'Comprovante.pdf', 'Contrato.pdf', 'Certidão.pdf', 1);

-- Inserção de dados de exemplo na tabela IMOVEL

INSERT INTO IMOVEL (Endereco_Completo, Area_Total_m2, Tipo_Construcao, MORADOR_ID)
VALUES 
('Rua das Flores, Quadra 5, Lote 12', 250.00, 'Alvenaria', 1),
('Av. Central, Quadra 3, Lote 8', 180.50, 'Madeira', 2),
('Rua do Sol, Quadra 7, Lote 20', 300.00, 'Mista', 3),
('Travessa Norte, Quadra 2, Lote 4', 150.75, 'Alvenaria', 4),
('Rua das Palmeiras, Quadra 10, Lote 15', 220.00, 'Madeira', 5);
