/*
SQL script to create the database and tables for the supermarket project.
SQL Script para criação do banco de dados e das tabelas para o projeto de supermercado.

Author: João Pedro Vieira da Costa Chaves
Date: 2026/05/07
Version: 2.0.0

About the project: [https://github.com/joaopedro-chaves/database_supermercado_projeto_UniFECAF]

Project created for the discipline of Database Systems of UniFECAF.
Projeto criado para a disciplina de Banco de Dados do UniFECAF
*/

CREATE DATABASE db_supermercado;

USE db_supermercado;

CREATE TABLE tbl_colaborador (
    id_colaborador INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_colaborador VARCHAR(255) NOT NULL,
    funcao_colaborador ENUM(
        'Atendente',
        'Supervisor',
        'Gerente'
    ) NOT NULL,
    data_contratacao DATE NOT NULL,
    email_colaborador VARCHAR(255) NOT NULL UNIQUE,
    cpf_colaborador CHAR(11) NOT NULL UNIQUE,
    fk_id_supervisor INT NULL,
    -- Chave estrangeira para evitar recursividade
    CONSTRAINT fk_colaborador_supervisor FOREIGN KEY (fk_id_supervisor) REFERENCES tbl_colaborador (id_colaborador) ON DELETE RESTRICT,
    -- Verifica se os valores de CPF são válidos
    CHECK (
        cpf_colaborador REGEXP '^[0-9]{11}$'
    )
);

CREATE TABLE tbl_produto (
    id_produto INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_produto VARCHAR(255) NOT NULL,
    tipo_produto VARCHAR(45) NOT NULL,
    valor_produto DECIMAL(10, 2) NOT NULL CHECK (valor_produto > 0),
    categoria_produto VARCHAR(45) NOT NULL,
    codigo_ean CHAR(13) NOT NULL UNIQUE
);

CREATE TABLE tbl_estoque (
    id_estoque INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    data_validade DATE NOT NULL,
    lote_estoque VARCHAR(45) NOT NULL,
    quantidade_estoque INT NOT NULL CHECK (quantidade_estoque >= 0),
    data_entrada DATE NOT NULL,
    fk_tbl_produto_id_produto INT NOT NULL,
    CONSTRAINT fk_estoque_to_produto FOREIGN KEY (fk_tbl_produto_id_produto) REFERENCES tbl_produto (id_produto) ON DELETE RESTRICT
);

CREATE TABLE tbl_fidelizacao (
    id_fidelizacao INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    data_cadastro DATE NOT NULL DEFAULT(CURRENT_DATE),
    saldo_pontos INT NOT NULL DEFAULT 0 CHECK (saldo_pontos >= 0),
    nivel_fidelizacao INT NOT NULL DEFAULT 1,
    data_ultima_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    preferencias_categoria VARCHAR(45) NULL
);

CREATE TABLE tbl_cliente (
    id_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_cliente VARCHAR(255) NOT NULL,
    cpf_cliente CHAR(11) NOT NULL UNIQUE,
    num_cel_cliente VARCHAR(11) NOT NULL UNIQUE,
    email_cliente VARCHAR(255) NOT NULL UNIQUE,
    fk_tbl_fidelizacao_id_fidelizacao INT, -- O cliente pode ou não ter um programa de fidelização, definido pela regra de negócio.
    CONSTRAINT fk_cliente_to_fidelizacao FOREIGN KEY (
        fk_tbl_fidelizacao_id_fidelizacao
    ) REFERENCES tbl_fidelizacao (id_fidelizacao) ON DELETE RESTRICT,
    -- Verifica se os valores de CPF são válidos
    CHECK (
        cpf_cliente REGEXP '^[0-9]{11}$'
    )
);

CREATE TABLE tbl_endereco_colaborador (
    id_endereco_colaborador INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    rua_colaborador VARCHAR(45) NOT NULL,
    bairro_colaborador VARCHAR(45) NOT NULL,
    cidade_colaborador VARCHAR(45) NOT NULL,
    pais_colaborador VARCHAR(45) NOT NULL,
    cep_colaborador VARCHAR(9) NOT NULL,
    fk_tbl_colaborador_id_colaborador INT NOT NULL UNIQUE,
    CONSTRAINT fk_endereco_colaborador_to_colaborador FOREIGN KEY (
        fk_tbl_colaborador_id_colaborador
    ) REFERENCES tbl_colaborador (id_colaborador) ON DELETE RESTRICT
);

CREATE TABLE tbl_endereco_cliente (
    id_endereco_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    rua_cliente VARCHAR(45) NOT NULL,
    bairro_cliente VARCHAR(45) NOT NULL,
    cidade_cliente VARCHAR(45) NOT NULL,
    pais_cliente VARCHAR(45) NOT NULL,
    cep_cliente VARCHAR(9) NOT NULL,
    fk_tbl_cliente_id_cliente INT NOT NULL UNIQUE,
    CONSTRAINT fk_endereco_cliente_to_cliente FOREIGN KEY (fk_tbl_cliente_id_cliente) REFERENCES tbl_cliente (id_cliente) ON DELETE RESTRICT
);

CREATE TABLE tbl_venda (
    id_venda INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    valor_bruto DECIMAL(10, 2) NOT NULL,
    valor_desconto DECIMAL(10, 2) DEFAULT 0, -- Regra: Aplicado na finalização da venda
    valor_total_liquido DECIMAL(10, 2) NOT NULL,
    datahora_venda DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    comissao_venda DECIMAL(10, 2) NOT NULL,
    numero_venda VARCHAR(45) NOT NULL UNIQUE,
    forma_pagamento ENUM(
        'Dinheiro',
        'Cartão de Crédito',
        'Cartão de Débito',
        'PIX'
    ) NOT NULL,
    fk_tbl_colaborador_id_colaborador INT NOT NULL,
    fk_tbl_cliente_id_cliente INT NULL, -- Pode ser nulo se o cliente não quiser se identificar.
    CONSTRAINT fk_venda_to_colaborador FOREIGN KEY (
        fk_tbl_colaborador_id_colaborador
    ) REFERENCES tbl_colaborador (id_colaborador) ON DELETE RESTRICT,
    CONSTRAINT fk_venda_to_cliente FOREIGN KEY (fk_tbl_cliente_id_cliente) REFERENCES tbl_cliente (id_cliente) ON DELETE RESTRICT,
    -- Verifica se os valores são válidos ou positivos.
    CHECK (
        valor_total_liquido > 0
        AND comissao_venda > 0
        AND valor_desconto >= 0
    )
);

CREATE TABLE tbl_historico_pontos (
    id_historico_pontos INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    entrada_pontos INT NOT NULL,
    saida_pontos INT NOT NULL,
    data_hora_pontos DATETIME NOT NULL,
    fk_tbl_venda_id_venda INT NULL,
    fk_tbl_fidelizacao_id_fidelizacao INT NULL,
    CONSTRAINT fk_historico_pontos_to_venda FOREIGN KEY (fk_tbl_venda_id_venda) REFERENCES tbl_venda (id_venda) ON DELETE RESTRICT,
    CONSTRAINT fk_historico_pontos_to_fidelizacao FOREIGN KEY (
        fk_tbl_fidelizacao_id_fidelizacao
    ) REFERENCES tbl_fidelizacao (id_fidelizacao) ON DELETE RESTRICT,
    -- Garante que ao menos uma origem esteja presente
    CHECK (
        fk_tbl_venda_id_venda IS NOT NULL
        OR fk_tbl_fidelizacao_id_fidelizacao IS NOT NULL
    )
);

CREATE TABLE tbl_produto_venda (
    id_produto_venda INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    quantidade_vendida INT NOT NULL CHECK (quantidade_vendida > 0),
    preco_unitario_praticado DECIMAL(10, 2) NOT NULL,
    fk_tbl_produto_id_produto INT NOT NULL,
    fk_tbl_venda_id_venda INT NOT NULL,
    CONSTRAINT fk_produto_venda_to_produto FOREIGN KEY (fk_tbl_produto_id_produto) REFERENCES tbl_produto (id_produto) ON DELETE RESTRICT,
    CONSTRAINT fk_produto_venda_to_venda FOREIGN KEY (fk_tbl_venda_id_venda) REFERENCES tbl_venda (id_venda) ON DELETE RESTRICT,
    -- Verifica se os valores são válidos ou positivos.
    CHECK (preco_unitario_praticado > 0)
);