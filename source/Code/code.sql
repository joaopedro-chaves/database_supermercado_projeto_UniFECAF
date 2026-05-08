/*
SQL script to create the database and tables for the supermarket project.
SQL Script para criação do banco de dados e das tabelas para o projeto de supermercado.

Author: João Pedro Vieira da Costa Chaves
Date: 2026/05/07
Version: 1.0.0

About the project: [https://github.com/joaopedro-chaves/database_supermercado_projeto_UniFECAF]

Project created for the discipline of Database Systems of UniFECAF.
Projeto criado para a disciplina de Banco de Dados do UniFECAF
*/

CREATE DATABASE db_supermercado;
USE db_supermercado;

CREATE TABLE tbl_historico_pontos (
  id_historico_pontos INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
  entrada_pontos VARCHAR(45) NULL,
  saida_pontos VARCHAR(45) NULL,
  fk_tbl_vendas_id_vendas INT NOT NULL,

  CONSTRAINT fk_historico_pontos_to_vendas
    FOREIGN KEY (fk_tbl_vendas_id_vendas)
    REFERENCES tbl_vendas (id_vendas)
);

CREATE TABLE tbl_fidelizacao (
  id_fidelizacao INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
  data_cadastro DATE NULL,
  saldo_pontos VARCHAR(999) NULL,
  nivel_fidelizacao FLOAT NULL,
  data_ultima_atualizacao DATE NULL,
  preferencias_categoria VARCHAR(45) NULL,
  fk_tbl_historico_pontos_id_historico_pontos INT NOT NULL,

  CONSTRAINT fk_fidelizacao_to_historico_pontos
    FOREIGN KEY (fk_tbl_historico_pontos_id_historico_pontos)
    REFERENCES tbl_historico_pontos (id_historico_pontos)
);

CREATE TABLE tbl_clientes (
  id_clientes INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
  nome_cliente VARCHAR(255) NULL,
  cpf_cliente VARCHAR(11) NULL,
  num_cel_cliente VARCHAR(12) NULL,
  email_cliente VARCHAR(255) NULL,
  tbl_fidelizacao_id_fidelizacao INT NOT NULL,

  CONSTRAINT fk_clientes_to_fidelizacao
    FOREIGN KEY (tbl_fidelizacao_id_fidelizacao)
    REFERENCES tbl_fidelizacao (id_fidelizacao)
);

CREATE TABLE tbl_colaboradores (
  id_colaboradores INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
  supervisor VARCHAR(45) NULL,
  data_contratacao VARCHAR(45) NULL,
  email_colaborador VARCHAR(45) NULL,
  cpf_colaborador VARCHAR(45) NULL,
);

CREATE TABLE tbl_endereco (
  id_endereco INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
  rua VARCHAR(45) NULL,
  bairro VARCHAR(45) NULL,
  cidade VARCHAR(45) NULL,
  pais VARCHAR(45) NULL,
  cep VARCHAR(45) NULL,
  fk_tbl_colaboradores_id_colaboradores INT NOT NULL,
  fk_tbl_clientes_id_clientes INT NOT NULL,

  CONSTRAINT fk_endereco_to_colaboradores
    FOREIGN KEY (fk_tbl_colaboradores_id_colaboradores)
    REFERENCES tbl_colaboradores (id_colaboradores),

  CONSTRAINT fk_endereco_to_clientes
    FOREIGN KEY (fk_tbl_clientes_id_clientes)
    REFERENCES tbl_clientes (id_clientes)
);

CREATE TABLE tbl_vendas (
  id_vendas INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
  valor_total VARCHAR(45) NULL,
  datahora_venda VARCHAR(45) NULL,
  comissao_venda VARCHAR(45) NULL,
  numero_venda VARCHAR(45) NULL,
  forma_pagamento VARCHAR(45) NULL,
  fk_tbl_colaboradores_id_colaboradores INT NOT NULL,
  fk_tbl_clientes_id_clientes INT NOT NULL,

  CONSTRAINT fk_vendas_to_colaboradores
    FOREIGN KEY (fk_tbl_colaboradores_id_colaboradores)
    REFERENCES tbl_colaboradores (id_colaboradores),
    
  CONSTRAINT fk_vendas_to_clientes
    FOREIGN KEY (fk_tbl_clientes_id_clientes)
    REFERENCES tbl_clientes (id_clientes)
);

CREATE TABLE tbl_produto (
  id_produto INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
  tipo_produto VARCHAR(45) NULL,
  valor_produto VARCHAR(45) NULL,
  quantidade_produto VARCHAR(45) NULL,
  categoria_produto VARCHAR(45) NULL
);

CREATE TABLE tbl_estoque (
  id_estoque INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
  data_validade DATE NULL,
  quantidade_estoque DECIMAL(10,3) NULL,
  lote_estoque VARCHAR(45) NULL,
  data_entrada DATE NULL,
  fk_tbl_produto_id_produto INT NOT NULL,

  CONSTRAINT fk_estoque_to_produto
    FOREIGN KEY (fk_tbl_produto_id_produto)
    REFERENCES tbl_produto (id_produto)
);

CREATE TABLE tbl_produto_venda (
  id_produto_venda INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
  valor_total_itens VARCHAR(45) NULL,
  fk_tbl_produto_id_produto INT NOT NULL,
  fk_tbl_vendas_id_vendas INT NOT NULL,

  CONSTRAINT fk_produto_venda_to_produto
    FOREIGN KEY (fk_tbl_produto_id_produto)
    REFERENCES tbl_produto (id_produto),

  CONSTRAINT fk_produto_venda_to_vendas
    FOREIGN KEY (fk_tbl_vendas_id_vendas)
    REFERENCES tbl_vendas (id_vendas)
);

