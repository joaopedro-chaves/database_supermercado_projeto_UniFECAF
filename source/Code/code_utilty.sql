/*
SQL script to create the database and tables for the supermarket project.
SQL Script para criação do banco de dados e das tabelas para o projeto de supermercado.

Author: João Pedro Vieira da Costa Chaves
Date: 2026/05/07
Version: 1.0.0

About the project: [https://github.com/joaopedro-chaves/database_supermercado_projeto_UniFECAF]

Project created for the discipline of Database Systems of UniFECAF.
Projeto criado para a disciplina de Banco de Dados do UniFECAF

------------------------------------------------------

Codigo de utilidade, não utilize no trabalho final.
Utilize apenas como base, para estudar ou como inspiração.

-------------------------------------------------------

*/

-- Criação do Banco de Dados
CREATE DATABASE db_supermercado;
USE db_supermercado;

-- Tabela de Fidelização
CREATE TABLE tbl_fidelizacao (
    id_fidelizacao INT PRIMARY KEY AUTO_INCREMENT,
    data_cadastro DATE,
    saldo_pontos INT DEFAULT 0,
    nivel_fidelizacao FLOAT,
    data_ultima_atualizacao DATE,
    preferencias_categoria VARCHAR(45)
);

-- Tabela de Clientes
CREATE TABLE tbl_clientes (
    id_clientes INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(255) NOT NULL,
    cpf_cliente CHAR(11) UNIQUE,
    num_cel_cliente VARCHAR(12),
    email_cliente VARCHAR(255),
    fk_tbl_fidelizacao_id_fidelizacao INT,
    FOREIGN KEY (fk_tbl_fidelizacao_id_fidelizacao) REFERENCES tbl_fidelizacao(id_fidelizacao)
);

-- Tabela de Endereços (Exemplo para Clientes)
CREATE TABLE tbl_endereco_clientes (
    id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    rua VARCHAR(255),
    bairro VARCHAR(255),
    cidade VARCHAR(255),
    pais VARCHAR(255),
    cep CHAR(8),
    fk_tbl_clientes_id_clientes INT,
    FOREIGN KEY (fk_tbl_clientes_id_clientes) REFERENCES tbl_clientes(id_clientes)
);

-- Tabela de Colaboradores
CREATE TABLE tbl_colaboradores (
    id_colaboradores INT PRIMARY KEY AUTO_INCREMENT,
    nome_colaborador VARCHAR(255),
    supervisor VARCHAR(45),
    data_contratacao DATE,
    email_colaborador VARCHAR(255),
    cpf_colaborador CHAR(11) UNIQUE
);

-- Tabela de Vendas
CREATE TABLE tbl_vendas (
    id_vendas INT PRIMARY KEY AUTO_INCREMENT,
    valor_total DECIMAL(10,2),
    datahora_venda DATETIME,
    comissao_venda DECIMAL(10,2),
    numero_venda VARCHAR(45),
    forma_pagamento VARCHAR(45),
    fk_tbl_colaboradores_id_colaboradores INT,
    fk_tbl_clientes_id_clientes INT,
    FOREIGN KEY (fk_tbl_colaboradores_id_colaboradores) REFERENCES tbl_colaboradores(id_colaboradores),
    FOREIGN KEY (fk_tbl_clientes_id_clientes) REFERENCES tbl_clientes(id_clientes)
);

-- Tabela de Histórico de Pontos
CREATE TABLE tbl_historico_pontos (
    id_historico_pontos INT PRIMARY KEY AUTO_INCREMENT,
    entrada_pontos INT,
    saida_pontos INT,
    fk_tbl_vendas_id_vendas INT,
    FOREIGN KEY (fk_tbl_vendas_id_vendas) REFERENCES tbl_vendas(id_vendas)
);

-- Tabela de Produtos
CREATE TABLE tbl_produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    tipo_produto VARCHAR(45),
    valor_produto DECIMAL(10,2),
    quantidade_produto DECIMAL(10,3), -- Usar decimal para itens vendidos por quilo
    categoria_produto VARCHAR(45)
);

-- Tabela Intermediária: Itens da Venda (Produto_Venda)
CREATE TABLE tbl_produto_venda (
    id_produto_venda INT PRIMARY KEY AUTO_INCREMENT,
    valor_total_itens DECIMAL(10,2),
    fk_tbl_produto_id_produto INT,
    fk_tbl_vendas_id_vendas INT,
    FOREIGN KEY (fk_tbl_produto_id_produto) REFERENCES tbl_produto(id_produto),
    FOREIGN KEY (fk_tbl_vendas_id_vendas) REFERENCES tbl_vendas(id_vendas)
);

-- Tabela de Estoque
CREATE TABLE tbl_estoque (
    id_estoque INT PRIMARY KEY AUTO_INCREMENT,
    data_validade DATE,
    quantidade_estoque DECIMAL(10,3),
    lote_estoque VARCHAR(45),
    data_entrada DATE,
    fk_tbl_produto_id_produto INT,
    FOREIGN KEY (fk_tbl_produto_id_produto) REFERENCES tbl_produto(id_produto)
);