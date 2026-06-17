-- =============================================================
-- BANCO DE DADOS I -- Abreu's
-- Script 03: Criacao dos indices
-- =============================================================

-- Índices para otimizar consultas

CREATE INDEX idx_municipio_nome ON MUNICIPIO(Nome);
CREATE INDEX idx_nucleo_nome ON NUCLEO(Nome);
CREATE INDEX idx_colaborador_cpf ON COLABORADOR(CPF);
CREATE INDEX idx_morador_cpf ON MORADOR(CPF);
CREATE INDEX idx_documento_morador ON DOCUMENTO(MORADOR_ID);
