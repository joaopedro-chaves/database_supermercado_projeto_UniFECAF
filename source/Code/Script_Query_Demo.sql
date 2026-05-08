/*
SQL script to demonstrate the functionality of the database and tables for the supermarket project.
SQL Script para demonstrar o funcionamento do banco de dados e das tabelas para o projeto de supermercado.

Author: João Pedro Vieira da Costa Chaves
Date: 2026/05/08
Version: 1.0.0

About the project: [https://github.com/joaopedro-chaves/database_supermercado_projeto_UniFECAF]

Project created for the discipline of Database Systems of UniFECAF.
Projeto criado para a disciplina de Banco de Dados do UniFECAF
*/

USE db_supermercado;

-- ============================================================
-- Demonstração de Consultas (Queries de Exemplo)
-- ============================================================

-- 1. Listar todos os colaboradores e seus respectivos supervisores (Self Join)
-- Demonstra como relacionar a tabela de colaboradores com ela mesma.
SELECT 
    c.nome_colaborador AS 'Colaborador',
    c.funcao_colaborador AS 'Cargo',
    IFNULL(s.nome_colaborador, 'Sem Supervisor') AS 'Supervisor'
FROM tbl_colaboradores c
LEFT JOIN tbl_colaboradores s ON c.fk_id_supervisor = s.id_colaboradores
ORDER BY s.nome_colaborador, c.nome_colaborador;

-- 2. Consultar o estoque de produtos, incluindo a categoria e ordenando pelos que vencem primeiro
-- Útil para o controle de validade dos produtos.
SELECT 
    p.nome_produto AS 'Produto',
    p.categoria_produto AS 'Categoria',
    e.lote_produto AS 'Lote',
    e.quantidade_estoque AS 'Qtd em Estoque',
    DATE_FORMAT(e.data_validade, '%d/%m/%Y') AS 'Data de Validade'
FROM tbl_estoque e
INNER JOIN tbl_produto p ON e.fk_tbl_produto_id_produto = p.id_produto
ORDER BY e.data_validade ASC;

-- 3. Calcular o valor total de vendas realizadas por cada colaborador
-- Agrupa as vendas por colaborador e soma o valor total, útil para relatórios de desempenho.
SELECT 
    c.nome_colaborador AS 'Colaborador',
    COUNT(v.id_vendas) AS 'Total de Vendas',
    CONCAT('R$ ', REPLACE(FORMAT(SUM(v.valor_total), 2), ',', '.')) AS 'Faturamento Total',
    CONCAT('R$ ', REPLACE(FORMAT(SUM(v.comissao_venda), 2), ',', '.')) AS 'Comissão Total'
FROM tbl_vendas v
INNER JOIN tbl_colaboradores c ON v.fk_tbl_colaboradores_id_colaboradores = c.id_colaboradores
GROUP BY c.id_colaboradores, c.nome_colaborador
ORDER BY SUM(v.valor_total) DESC;

-- 4. Listar os clientes (Top 5) com maior saldo de pontos de fidelização
-- Identifica os clientes mais fiéis e engajados com o supermercado.
SELECT 
    c.nome_cliente AS 'Cliente',
    c.cpf_cliente AS 'CPF',
    f.saldo_pontos AS 'Pontos',
    f.nivel_fidelizacao AS 'Nível',
    f.preferencias_categoria AS 'Preferência'
FROM tbl_clientes c
INNER JOIN tbl_fidelizacao f ON c.tbl_fidelizacao_id_fidelizacao = f.id_fidelizacao
ORDER BY f.saldo_pontos DESC
LIMIT 5;

-- 5. Exibir os detalhes de uma venda específica (ex: a venda 'VND-2026-0005')
-- Mostra os produtos, quantidades e subtotais que compõem uma venda.
SELECT 
    v.numero_venda AS 'Nº da Venda',
    c.nome_cliente AS 'Cliente',
    p.nome_produto AS 'Produto',
    pv.quantidade_produto AS 'Quantidade',
    CONCAT('R$ ', REPLACE(FORMAT(p.valor_produto, 2), ',', '.')) AS 'Preço Unitário',
    CONCAT('R$ ', REPLACE(FORMAT(pv.valor_total_itens, 2), ',', '.')) AS 'Subtotal'
FROM tbl_vendas v
INNER JOIN tbl_clientes c ON v.fk_tbl_clientes_id_clientes = c.id_clientes
INNER JOIN tbl_produto_venda pv ON v.id_vendas = pv.fk_tbl_vendas_id_vendas
INNER JOIN tbl_produto p ON pv.fk_tbl_produto_id_produto = p.id_produto
WHERE v.numero_venda = 'VND-2026-0005'
ORDER BY pv.valor_total_itens DESC;

-- 6. Relatório de Vendas (Faturamento) por Categoria de Produto
-- Mostra quais categorias de produtos geram mais receita para o supermercado.
SELECT 
    p.categoria_produto AS 'Categoria',
    SUM(pv.quantidade_produto) AS 'Quantidade Vendida',
    CONCAT('R$ ', REPLACE(FORMAT(SUM(pv.valor_total_itens), 2), ',', '.')) AS 'Faturamento'
FROM tbl_produto_venda pv
INNER JOIN tbl_produto p ON pv.fk_tbl_produto_id_produto = p.id_produto
GROUP BY p.categoria_produto
ORDER BY SUM(pv.valor_total_itens) DESC;

-- 7. Histórico de Pontos de um cliente específico detalhando entradas e saídas
-- Acompanha o fluxo de pontos gerados nas compras de um cliente pelo Nome.
SELECT 
    c.nome_cliente AS 'Cliente',
    hp.entrada_pontos AS 'Pontos Ganhos',
    hp.saida_pontos AS 'Pontos Usados',
    DATE_FORMAT(hp.data_hora_pontos, '%d/%m/%Y %H:%i') AS 'Data/Hora',
    v.numero_venda AS 'Nº da Venda Relacionada'
FROM tbl_historico_pontos hp
INNER JOIN tbl_fidelizacao f ON hp.fk_tbl_fidelizacao_id_fidelizacao = f.id_fidelizacao
INNER JOIN tbl_clientes c ON c.tbl_fidelizacao_id_fidelizacao = f.id_fidelizacao
LEFT JOIN tbl_vendas v ON hp.fk_tbl_vendas_id_vendas = v.id_vendas
WHERE c.nome_cliente LIKE 'Marcos Vinícius Almeida%'
ORDER BY hp.data_hora_pontos DESC;

-- 8. Visão Geral de Endereços (Clientes vs Colaboradores)
-- Retorna os endereços separando se pertencem a um colaborador ou a um cliente.
SELECT 
    e.rua AS 'Rua',
    e.bairro AS 'Bairro',
    e.cidade AS 'Cidade',
    CASE 
        WHEN e.fk_tbl_colaboradores_id_colaboradores IS NOT NULL THEN 'Colaborador'
        WHEN e.fk_tbl_clientes_id_clientes IS NOT NULL THEN 'Cliente'
    END AS 'Tipo de Vínculo',
    IFNULL(c.nome_colaborador, cl.nome_cliente) AS 'Nome'
FROM tbl_endereco e
LEFT JOIN tbl_colaboradores c ON e.fk_tbl_colaboradores_id_colaboradores = c.id_colaboradores
LEFT JOIN tbl_clientes cl ON e.fk_tbl_clientes_id_clientes = cl.id_clientes
ORDER BY 'Tipo de Vínculo', 'Nome';