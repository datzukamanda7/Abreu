-- =============================================================
-- BANCO DE DADOS I -- Abreu's
-- Script 05: Consultas / Relatorios
-- =============================================================

-- 1. Relatório de cadastros com status 'Pendente de Análise'
-- Mostra nome do morador, CPF, endereço do imóvel, núcleo urbano e data de cadastramento
-- Ordenado pela data de cadastramento crescente
SELECT 
    m.Nome AS Morador,
    m.CPF,
    CONCAT('Quadra ', m.Quadra, ', Lote ', m.Lote) AS Endereco_Imovel,
    n.Nome AS Nucleo,
    d.Data_Cadastro
FROM MORADOR m
JOIN DOCUMENTO d ON m.ID = d.MORADOR_ID
JOIN NUCLEO n ON m.NUCLEO_ID = n.ID
WHERE d.Status = 'Pendente de Análise'
ORDER BY d.Data_Cadastro ASC;

-- ============================================================

-- 2. Relatório de cadastros REURB com informações do imóvel
-- Exibe nome do morador, CPF, endereço completo, área total, tipo de construção e status
-- Apenas processos em andamento, ordenado pelo nome do morador
SELECT 
    m.Nome AS Morador,
    m.CPF,
    CONCAT('Quadra ', m.Quadra, ', Lote ', m.Lote) AS Endereco_Imovel,
    i.Area_Total_m2,
    i.Tipo_Construcao,
    d.Status
FROM MORADOR m
JOIN DOCUMENTO d ON m.ID = d.MORADOR_ID
JOIN NUCLEO n ON m.NUCLEO_ID = n.ID
JOIN MUNICIPIO mun ON n.MUNICIPIO_ID = mun.ID
JOIN IMOVEL i ON m.ID = i.MORADOR_ID
WHERE d.Status IN ('Na instituição', 'Em execução de processo')
ORDER BY m.Nome ASC;

-- ============================================================

-- 3. Relatório de documentos entregues nos últimos 60 dias
-- Exibe nome do morador, tipo de documento, data de entrega e servidor responsável
-- Ordenado por nome do morador e data de entrega
SELECT 
    m.Nome AS Morador,
    doc.Tipo_Documento,
    doc.Data_Entrega,
    c.Nome AS Servidor_Responsavel
FROM MORADOR m
JOIN DOCUMENTO doc ON m.ID = doc.MORADOR_ID
JOIN COLABORADOR c ON doc.Servidor_ID = c.ID
WHERE doc.Data_Entrega >= CURRENT_DATE - INTERVAL '60 days'
ORDER BY m.Nome ASC, doc.Data_Entrega ASC;

-- ============================================================

-- 4. Relatório de sumarização por núcleo urbano
-- Total de cadastros, total de processos aprovados, pendentes e data mais recente
-- Ordenado pelo total de cadastros decrescente
SELECT 
    n.Nome AS Nucleo,
    COUNT(m.ID) AS Total_Cadastros,
    SUM(CASE WHEN d.Status = 'Aprovado' THEN 1 ELSE 0 END) AS Total_Aprovados,
    SUM(CASE WHEN d.Status = 'Pendente' THEN 1 ELSE 0 END) AS Total_Pendentes,
    MAX(d.Data_Cadastro) AS Cadastro_Mais_Recente
FROM NUCLEO n
LEFT JOIN MORADOR m ON n.ID = m.NUCLEO_ID
LEFT JOIN DOCUMENTO d ON m.ID = d.MORADOR_ID
GROUP BY n.Nome
ORDER BY Total_Cadastros DESC;
