/*
SQL script to demonstrate the functionality of the database and tables for the supermarket project.
SQL Script para demonstrar o funcionamento do banco de dados e das tabelas para o projeto de supermercado.

Author: João Pedro Vieira da Costa Chaves
Date: 2026/05/09
Version: 2.1.0

About the project: [https://github.com/joaopedro-chaves/database_supermercado_projeto_UniFECAF]

Project created for the discipline of Database Systems of UniFECAF.
Projeto criado para a disciplina de Banco de Dados do UniFECAF

This script was made by AI to facilitate the testing of data in the database.
Este script foi feito pela AI para facilitar o teste de dados no banco de dados.
*/

USE db_supermercado;

-- ============================================================
-- Demonstração de Consultas (Queries de Exemplo)
-- ============================================================

-- 1. Listar todos os colaboradores e seus respectivos supervisores (Self Join)
-- Demonstra como relacionar a tabela de colaboradores com ela mesma.
SELECT c.nome_colaborador AS 'Colaborador', c.funcao_colaborador AS 'Cargo', IFNULL(
        s.nome_colaborador, 'Sem Supervisor'
    ) AS 'Supervisor'
FROM
    tbl_colaborador c
    LEFT JOIN tbl_colaborador s ON c.fk_id_supervisor = s.id_colaborador
ORDER BY s.nome_colaborador, c.nome_colaborador;

-- 2. Consultar o estoque de produtos, incluindo a categoria e ordenando pelos que vencem primeiro
-- Útil para o controle de validade dos produtos.
SELECT p.nome_produto AS 'Produto', p.categoria_produto AS 'Categoria', e.lote_estoque AS 'Lote', e.quantidade_estoque AS 'Qtd em Estoque', DATE_FORMAT(e.data_validade, '%d/%m/%Y') AS 'Data de Validade'
FROM tbl_estoque e
    INNER JOIN tbl_produto p ON e.fk_tbl_produto_id_produto = p.id_produto
ORDER BY e.data_validade ASC;

-- 3. Calcular o valor total de vendas realizadas por cada colaborador
-- Agrupa as vendas por colaborador e soma o valor total, útil para relatórios de desempenho.
SELECT c.nome_colaborador AS 'Colaborador', COUNT(v.id_venda) AS 'Total de Vendas', CONCAT(
        'R$ ',
        REPLACE (
                FORMAT(SUM(v.valor_total_liquido), 2), ',', '.'
            )
    ) AS 'Faturamento Total', CONCAT(
        'R$ ',
        REPLACE (
                FORMAT(SUM(v.comissao_venda), 2), ',', '.'
            )
    ) AS 'Comissão Total'
FROM
    tbl_venda v
    INNER JOIN tbl_colaborador c ON v.fk_tbl_colaborador_id_colaborador = c.id_colaborador
GROUP BY
    c.id_colaborador,
    c.nome_colaborador
ORDER BY SUM(v.valor_total_liquido) DESC;

-- 4. Listar os clientes (Top 5) com maior saldo de pontos de fidelização
-- Identifica os clientes mais fiéis e engajados com o supermercado.
SELECT c.nome_cliente AS 'Cliente', c.cpf_cliente AS 'CPF', f.saldo_pontos AS 'Pontos', f.nivel_fidelizacao AS 'Nível', f.preferencias_categoria AS 'Preferência'
FROM
    tbl_cliente c
    INNER JOIN tbl_fidelizacao f ON c.fk_tbl_fidelizacao_id_fidelizacao = f.id_fidelizacao
ORDER BY f.saldo_pontos DESC
LIMIT 5;

-- 5. Exibir os detalhes de uma venda específica (ex: a venda 'VND-2026-0005')
-- Mostra os produtos, quantidades e subtotais que compõem uma venda.
SELECT v.numero_venda AS 'Nº da Venda', c.nome_cliente AS 'Cliente', p.nome_produto AS 'Produto', pv.quantidade_vendida AS 'Quantidade', CONCAT(
        'R$ ',
        REPLACE (
                FORMAT(pv.preco_unitario_praticado, 2), ',', '.'
            )
    ) AS 'Preço Unitário', CONCAT(
        'R$ ',
        REPLACE (
                FORMAT(pv.quantidade_vendida * pv.preco_unitario_praticado, 2), ',', '.'
            )
    ) AS 'Subtotal'
FROM
    tbl_venda v
    INNER JOIN tbl_cliente c ON v.fk_tbl_cliente_id_cliente = c.id_cliente
    INNER JOIN tbl_produto_venda pv ON v.id_venda = pv.fk_tbl_venda_id_venda
    INNER JOIN tbl_produto p ON pv.fk_tbl_produto_id_produto = p.id_produto
WHERE
    v.numero_venda = 'VND-2026-0005'
ORDER BY Subtotal DESC;

-- 6. Relatório de Vendas (Faturamento) por Categoria de Produto
-- Mostra quais categorias de produtos geram mais receita para o supermercado.
SELECT p.categoria_produto AS 'Categoria', SUM(pv.quantidade_vendida) AS 'Quantidade Vendida', CONCAT(
        'R$ ',
        REPLACE (
                FORMAT(SUM(pv.quantidade_vendida * pv.preco_unitario_praticado), 2), ',', '.'
            )
    ) AS 'Faturamento'
FROM
    tbl_produto_venda pv
    INNER JOIN tbl_produto p ON pv.fk_tbl_produto_id_produto = p.id_produto
GROUP BY
    p.categoria_produto
ORDER BY SUM(pv.quantidade_vendida * pv.preco_unitario_praticado) DESC;

-- 7. Histórico de Pontos de um cliente específico detalhando entradas e saídas
-- Acompanha o fluxo de pontos gerados nas compras de um cliente pelo Nome.
SELECT c.nome_cliente AS 'Cliente', hp.entrada_pontos AS 'Pontos Ganhos', hp.saida_pontos AS 'Pontos Usados', DATE_FORMAT(
        hp.data_hora_pontos, '%d/%m/%Y %H:%i'
    ) AS 'Data/Hora', v.numero_venda AS 'Nº da Venda Relacionada'
FROM
    tbl_historico_pontos hp
    INNER JOIN tbl_fidelizacao f ON hp.fk_tbl_fidelizacao_id_fidelizacao = f.id_fidelizacao
    INNER JOIN tbl_cliente c ON c.fk_tbl_fidelizacao_id_fidelizacao = f.id_fidelizacao
    LEFT JOIN tbl_venda v ON hp.fk_tbl_venda_id_venda = v.id_venda
WHERE
    c.nome_cliente LIKE 'Marcos Vinícius Almeida%'
ORDER BY hp.data_hora_pontos DESC;

-- 8. Visão Geral de Endereços (Clientes vs Colaboradores)
-- Retorna os endereços separando se pertencem a um colaborador ou a um cliente.
SELECT ec.rua_colaborador AS 'Rua', ec.bairro_colaborador AS 'Bairro', ec.cidade_colaborador AS 'Cidade', 'Colaborador' AS 'Tipo de Vínculo', c.nome_colaborador AS 'Nome'
FROM
    tbl_endereco_colaborador ec
    INNER JOIN tbl_colaborador c ON ec.fk_tbl_colaborador_id_colaborador = c.id_colaborador
UNION ALL
SELECT ecl.rua_cliente AS 'Rua', ecl.bairro_cliente AS 'Bairro', ecl.cidade_cliente AS 'Cidade', 'Cliente' AS 'Tipo de Vínculo', cl.nome_cliente AS 'Nome'
FROM
    tbl_endereco_cliente ecl
    INNER JOIN tbl_cliente cl ON ecl.fk_tbl_cliente_id_cliente = cl.id_cliente
ORDER BY 4, 5;