/*
SQL script to insert sample data into the database.
SQL Script para inserção de dados de exemplo no banco de dados.

Author: João Pedro Vieira da Costa Chaves
Date: 2026/05/08
Version: 1.0.0

About the project: [https://github.com/joaopedro-chaves/database_supermercado_projeto_UniFECAF]

Project created for the discipline of Database Systems of UniFECAF.
Projeto criado para a disciplina de Banco de Dados do UniFECAF

This script was made by AI to facilitate the insertion and testing of data in the database.
Este script foi feito pela AI para facilitar a inserção e teste de dados no banco de dados.
*/

USE db_supermercado;

SET FOREIGN_KEY_CHECKS = 0;

-- ============================================================
-- tbl_colaboradores
-- Inserir supervisores primeiro (fk_id_supervisor = NULL)
-- ============================================================

INSERT INTO
    tbl_colaboradores (
        nome_colaborador,
        funcao_colaborador,
        data_contratacao,
        email_colaborador,
        cpf_colaborador,
        fk_id_supervisor
    )
VALUES (
        'Carlos Alberto Mendes',
        'Supervisor',
        '2018-03-15',
        'carlos.mendes@supermercado.com',
        '11122233344',
        NULL
    ),
    (
        'Fernanda Souza Lima',
        'Supervisor',
        '2019-07-01',
        'fernanda.lima@supermercado.com',
        '22233344455',
        NULL
    ),
    (
        'Roberto Alves Costa',
        'Gerente Geral',
        '2017-01-10',
        'roberto.costa@supermercado.com',
        '33344455566',
        NULL
    );

-- Inserir colaboradores vinculados aos supervisores
INSERT INTO
    tbl_colaboradores (
        nome_colaborador,
        funcao_colaborador,
        data_contratacao,
        email_colaborador,
        cpf_colaborador,
        fk_id_supervisor
    )
VALUES (
        'Ana Paula Ferreira',
        'Caixa',
        '2021-05-20',
        'ana.ferreira@supermercado.com',
        '44455566677',
        1
    ),
    (
        'Lucas Martins Oliveira',
        'Repositor',
        '2022-08-14',
        'lucas.oliveira@supermercado.com',
        '55566677788',
        1
    ),
    (
        'Juliana Ramos Pereira',
        'Açougueiro',
        '2020-11-03',
        'juliana.pereira@supermercado.com',
        '66677788899',
        2
    ),
    (
        'Thiago Nascimento Silva',
        'Caixa',
        '2023-02-17',
        'thiago.silva@supermercado.com',
        '77788899900',
        2
    ),
    (
        'Beatriz Carvalho Santos',
        'Repositor',
        '2021-09-30',
        'beatriz.santos@supermercado.com',
        '88899900011',
        1
    ),
    (
        'Rafael Gomes Rodrigues',
        'Atendente',
        '2022-04-05',
        'rafael.rodrigues@supermercado.com',
        '99900011122',
        2
    ),
    (
        'Mariana Teixeira Barbosa',
        'Caixa',
        '2023-06-22',
        'mariana.barbosa@supermercado.com',
        '10011122233',
        1
    );

-- ============================================================
-- tbl_produto
-- ============================================================

INSERT INTO
    tbl_produto (
        nome_produto,
        tipo_produto,
        valor_produto,
        quantidade_produto,
        categoria_produto
    )
VALUES (
        'Arroz Tipo 1 5kg',
        'Grão',
        18.90,
        200,
        'Mercearia'
    ),
    (
        'Feijão Carioca 1kg',
        'Grão',
        8.50,
        150,
        'Mercearia'
    ),
    (
        'Óleo de Soja 900ml',
        'Óleo',
        9.75,
        180,
        'Mercearia'
    ),
    (
        'Macarrão Espaguete 500g',
        'Massa',
        5.20,
        300,
        'Mercearia'
    ),
    (
        'Açúcar Refinado 1kg',
        'Açúcar',
        4.80,
        250,
        'Mercearia'
    ),
    (
        'Leite Integral 1L',
        'Laticínio',
        5.50,
        400,
        'Laticínios'
    ),
    (
        'Queijo Mussarela 250g',
        'Laticínio',
        14.90,
        80,
        'Laticínios'
    ),
    (
        'Iogurte Natural 170g',
        'Laticínio',
        3.90,
        120,
        'Laticínios'
    ),
    (
        'Peito de Frango Kg',
        'Carne',
        18.00,
        90,
        'Carnes'
    ),
    (
        'Carne Moída Bovina Kg',
        'Carne',
        32.50,
        60,
        'Carnes'
    ),
    (
        'Linguiça Calabresa 500g',
        'Embutido',
        13.40,
        75,
        'Carnes'
    ),
    (
        'Pão de Forma Integral',
        'Panificação',
        8.20,
        100,
        'Padaria'
    ),
    (
        'Biscoito Cream Cracker 200g',
        'Biscoito',
        4.50,
        200,
        'Biscoitos'
    ),
    (
        'Refrigerante Cola 2L',
        'Bebida',
        10.90,
        160,
        'Bebidas'
    ),
    (
        'Água Mineral 1,5L',
        'Bebida',
        3.20,
        300,
        'Bebidas'
    ),
    (
        'Detergente Líquido 500ml',
        'Limpeza',
        3.80,
        200,
        'Limpeza'
    ),
    (
        'Sabão em Pó 1kg',
        'Limpeza',
        14.50,
        100,
        'Limpeza'
    ),
    (
        'Desinfetante 1L',
        'Limpeza',
        6.90,
        130,
        'Limpeza'
    ),
    (
        'Shampoo 400ml',
        'Higiene',
        18.90,
        70,
        'Higiene Pessoal'
    ),
    (
        'Papel Higiênico 12un',
        'Higiene',
        22.90,
        150,
        'Higiene Pessoal'
    );

-- ============================================================
-- tbl_estoque
-- ============================================================

INSERT INTO
    tbl_estoque (
        data_validade,
        lote_produto,
        quantidade_estoque,
        data_entrada,
        fk_tbl_produto_id_produto
    )
VALUES (
        '2027-01-10',
        'LOTE-ARR-001',
        200,
        '2026-01-10',
        1
    ),
    (
        '2026-12-15',
        'LOTE-FEI-001',
        150,
        '2026-01-12',
        2
    ),
    (
        '2027-03-20',
        'LOTE-OLE-001',
        180,
        '2026-02-01',
        3
    ),
    (
        '2027-06-30',
        'LOTE-MAC-001',
        300,
        '2026-01-15',
        4
    ),
    (
        '2027-08-01',
        'LOTE-ACU-001',
        250,
        '2026-01-20',
        5
    ),
    (
        '2026-09-05',
        'LOTE-LEI-001',
        400,
        '2026-04-01',
        6
    ),
    (
        '2026-08-10',
        'LOTE-QUE-001',
        80,
        '2026-04-05',
        7
    ),
    (
        '2026-07-22',
        'LOTE-IOG-001',
        120,
        '2026-04-10',
        8
    ),
    (
        '2026-06-30',
        'LOTE-FRG-001',
        90,
        '2026-04-15',
        9
    ),
    (
        '2026-06-25',
        'LOTE-CRN-001',
        60,
        '2026-04-15',
        10
    ),
    (
        '2026-11-01',
        'LOTE-LIN-001',
        75,
        '2026-03-01',
        11
    ),
    (
        '2026-10-30',
        'LOTE-PAO-001',
        100,
        '2026-04-20',
        12
    ),
    (
        '2027-02-28',
        'LOTE-BIS-001',
        200,
        '2026-02-10',
        13
    ),
    (
        '2027-05-15',
        'LOTE-REF-001',
        160,
        '2026-03-15',
        14
    ),
    (
        '2028-01-01',
        'LOTE-AGU-001',
        300,
        '2026-01-05',
        15
    ),
    (
        '2027-12-31',
        'LOTE-DET-001',
        200,
        '2026-01-08',
        16
    ),
    (
        '2027-11-20',
        'LOTE-SAB-001',
        100,
        '2026-01-10',
        17
    ),
    (
        '2027-10-15',
        'LOTE-DES-001',
        130,
        '2026-01-12',
        18
    ),
    (
        '2027-09-01',
        'LOTE-SHA-001',
        70,
        '2026-02-05',
        19
    ),
    (
        '2027-07-20',
        'LOTE-PAP-001',
        150,
        '2026-02-08',
        20
    );

-- ============================================================
-- tbl_fidelizacao
-- ============================================================

INSERT INTO
    tbl_fidelizacao (
        data_cadastro,
        saldo_pontos,
        nivel_fidelizacao,
        data_ultima_atualizacao,
        preferencias_categoria
    )
VALUES (
        '2023-01-15',
        1200,
        2,
        '2026-04-30',
        'Mercearia'
    ),
    (
        '2022-06-10',
        3500,
        3,
        '2026-05-01',
        'Laticínios'
    ),
    (
        '2024-03-22',
        450,
        1,
        '2026-04-28',
        'Bebidas'
    ),
    (
        '2021-11-05',
        8900,
        4,
        '2026-05-02',
        'Carnes'
    ),
    (
        '2023-08-14',
        2100,
        2,
        '2026-05-01',
        'Higiene Pessoal'
    ),
    (
        '2025-01-30',
        200,
        1,
        '2026-03-15',
        'Padaria'
    ),
    (
        '2022-04-19',
        5600,
        3,
        '2026-04-29',
        'Limpeza'
    ),
    (
        '2020-09-03',
        15000,
        5,
        '2026-05-03',
        'Mercearia'
    ),
    (
        '2024-07-11',
        900,
        1,
        '2026-04-20',
        'Biscoitos'
    ),
    (
        '2023-12-25',
        3200,
        2,
        '2026-05-04',
        'Bebidas'
    );

-- ============================================================
-- tbl_clientes
-- ============================================================

INSERT INTO
    tbl_clientes (
        nome_cliente,
        cpf_cliente,
        num_cel_cliente,
        email_cliente,
        tbl_fidelizacao_id_fidelizacao
    )
VALUES (
        'Marcos Vinícius Almeida',
        '12345678901',
        '11987654321',
        'marcos.almeida@email.com',
        1
    ),
    (
        'Patrícia Helena Duarte',
        '23456789012',
        '11976543210',
        'patricia.duarte@email.com',
        2
    ),
    (
        'Gustavo Henrique Pinto',
        '34567890123',
        '11965432109',
        'gustavo.pinto@email.com',
        3
    ),
    (
        'Camila Cristina Lopes',
        '45678901234',
        '11954321098',
        'camila.lopes@email.com',
        4
    ),
    (
        'Diego Fernando Rocha',
        '56789012345',
        '11943210987',
        'diego.rocha@email.com',
        5
    ),
    (
        'Simone Aparecida Moura',
        '67890123456',
        '11932109876',
        'simone.moura@email.com',
        6
    ),
    (
        'Henrique Augusto Freitas',
        '78901234567',
        '11921098765',
        'henrique.freitas@email.com',
        7
    ),
    (
        'Larissa Michelle Castro',
        '89012345678',
        '11910987654',
        'larissa.castro@email.com',
        8
    ),
    (
        'Fábio Alexandre Cunha',
        '90123456789',
        '11909876543',
        'fabio.cunha@email.com',
        9
    ),
    (
        'Viviane Cristina Araújo',
        '01234567890',
        '11898765432',
        'viviane.araujo@email.com',
        10
    );

-- ============================================================
-- tbl_endereco_colaborador
-- ============================================================

INSERT INTO
    tbl_endereco_colaborador (
        rua,
        bairro,
        cidade,
        pais,
        cep,
        fk_tbl_colaboradores_id_colaboradores
    )
VALUES (
        'Rua das Flores, 45',
        'Centro',
        'São Paulo',
        'Brasil',
        '01001-000',
        1
    ),
    (
        'Av. Paulista, 1200',
        'Bela Vista',
        'São Paulo',
        'Brasil',
        '01310-100',
        2
    ),
    (
        'Rua Oscar Freire, 88',
        'Jardins',
        'São Paulo',
        'Brasil',
        '01426-001',
        3
    ),
    (
        'Rua Vergueiro, 320',
        'Liberdade',
        'São Paulo',
        'Brasil',
        '01504-000',
        4
    ),
    (
        'Av. Rebouças, 550',
        'Pinheiros',
        'São Paulo',
        'Brasil',
        '05401-300',
        5
    ),
    (
        'Rua Augusta, 700',
        'Consolação',
        'São Paulo',
        'Brasil',
        '01305-000',
        6
    ),
    (
        'Rua da Mooca, 1100',
        'Mooca',
        'São Paulo',
        'Brasil',
        '03103-000',
        7
    ),
    (
        'Av. Ibirapuera, 200',
        'Moema',
        'São Paulo',
        'Brasil',
        '04029-000',
        8
    ),
    (
        'Rua Haddock Lobo, 50',
        'Cerqueira César',
        'São Paulo',
        'Brasil',
        '01414-002',
        9
    ),
    (
        'Av. Santo Amaro, 980',
        'Santo Amaro',
        'São Paulo',
        'Brasil',
        '04506-001',
        10
    );

-- ============================================================
-- tbl_endereco_cliente
-- ============================================================

INSERT INTO
    tbl_endereco_cliente (
        rua,
        bairro,
        cidade,
        pais,
        cep,
        fk_tbl_clientes_id_clientes
    )
VALUES (
        'Rua Tutóia, 340',
        'Paraíso',
        'São Paulo',
        'Brasil',
        '04007-001',
        1
    ),
    (
        'Rua Frei Caneca, 220',
        'Bela Vista',
        'São Paulo',
        'Brasil',
        '01307-001',
        2
    ),
    (
        'Av. Brasil, 1500',
        'Jardim América',
        'São Paulo',
        'Brasil',
        '01430-001',
        3
    ),
    (
        'Rua Apa, 60',
        'Santa Cecília',
        'São Paulo',
        'Brasil',
        '01215-020',
        4
    ),
    (
        'Rua Groenlândia, 90',
        'Jardim Europa',
        'São Paulo',
        'Brasil',
        '01434-000',
        5
    ),
    (
        'Av. Angélica, 800',
        'Higienópolis',
        'São Paulo',
        'Brasil',
        '01228-000',
        6
    ),
    (
        'Rua Bela Cintra, 710',
        'Consolação',
        'São Paulo',
        'Brasil',
        '01415-001',
        7
    ),
    (
        'Rua Itapeva, 500',
        'Bela Vista',
        'São Paulo',
        'Brasil',
        '01332-000',
        8
    ),
    (
        'Av. 9 de Julho, 3000',
        'Jardim Paulista',
        'São Paulo',
        'Brasil',
        '01313-902',
        9
    ),
    (
        'Rua Amauri, 255',
        'Jardim Europa',
        'São Paulo',
        'Brasil',
        '01448-000',
        10
    );

-- ============================================================
-- tbl_vendas
-- ============================================================

INSERT INTO
    tbl_vendas (
        valor_total,
        datahora_venda,
        comissao_venda,
        numero_venda,
        forma_pagamento,
        fk_tbl_colaboradores_id_colaboradores,
        fk_tbl_clientes_id_clientes
    )
VALUES (
        152.40,
        '2026-04-01 09:15:00',
        7.62,
        'VND-2026-0001',
        'Cartão Crédito',
        4,
        1
    ),
    (
        89.90,
        '2026-04-02 10:30:00',
        4.50,
        'VND-2026-0002',
        'Dinheiro',
        7,
        2
    ),
    (
        210.75,
        '2026-04-03 14:00:00',
        10.54,
        'VND-2026-0003',
        'PIX',
        4,
        3
    ),
    (
        47.20,
        '2026-04-05 08:45:00',
        2.36,
        'VND-2026-0004',
        'Cartão Débito',
        10,
        4
    ),
    (
        330.00,
        '2026-04-07 16:20:00',
        16.50,
        'VND-2026-0005',
        'Cartão Crédito',
        7,
        5
    ),
    (
        75.60,
        '2026-04-10 11:05:00',
        3.78,
        'VND-2026-0006',
        'PIX',
        4,
        6
    ),
    (
        185.30,
        '2026-04-12 13:30:00',
        9.27,
        'VND-2026-0007',
        'Dinheiro',
        10,
        7
    ),
    (
        62.80,
        '2026-04-15 09:00:00',
        3.14,
        'VND-2026-0008',
        'Cartão Débito',
        7,
        8
    ),
    (
        415.50,
        '2026-04-18 15:45:00',
        20.78,
        'VND-2026-0009',
        'Cartão Crédito',
        4,
        9
    ),
    (
        130.00,
        '2026-04-20 10:10:00',
        6.50,
        'VND-2026-0010',
        'PIX',
        10,
        10
    ),
    (
        98.40,
        '2026-04-22 12:00:00',
        4.92,
        'VND-2026-0011',
        'Dinheiro',
        7,
        1
    ),
    (
        240.90,
        '2026-04-24 14:30:00',
        12.05,
        'VND-2026-0012',
        'Cartão Crédito',
        4,
        2
    ),
    (
        53.10,
        '2026-04-26 08:20:00',
        2.66,
        'VND-2026-0013',
        'Cartão Débito',
        10,
        3
    ),
    (
        178.60,
        '2026-04-28 17:00:00',
        8.93,
        'VND-2026-0014',
        'PIX',
        7,
        4
    ),
    (
        305.75,
        '2026-04-30 11:45:00',
        15.29,
        'VND-2026-0015',
        'Cartão Crédito',
        4,
        5
    );

-- ============================================================
-- tbl_historico_pontos
-- ============================================================

INSERT INTO
    tbl_historico_pontos (
        entrada_pontos,
        saida_pontos,
        data_hora_pontos,
        fk_tbl_vendas_id_vendas,
        fk_tbl_fidelizacao_id_fidelizacao
    )
VALUES (
        152,
        0,
        '2026-04-01 09:16:00',
        1,
        1
    ),
    (
        89,
        0,
        '2026-04-02 10:31:00',
        2,
        2
    ),
    (
        210,
        0,
        '2026-04-03 14:01:00',
        3,
        3
    ),
    (
        47,
        0,
        '2026-04-05 08:46:00',
        4,
        4
    ),
    (
        330,
        0,
        '2026-04-07 16:21:00',
        5,
        5
    ),
    (
        75,
        0,
        '2026-04-10 11:06:00',
        6,
        6
    ),
    (
        185,
        0,
        '2026-04-12 13:31:00',
        7,
        7
    ),
    (
        0,
        62,
        '2026-04-15 09:01:00',
        8,
        8
    ),
    (
        415,
        0,
        '2026-04-18 15:46:00',
        9,
        9
    ),
    (
        130,
        0,
        '2026-04-20 10:11:00',
        10,
        10
    ),
    (
        98,
        0,
        '2026-04-22 12:01:00',
        11,
        1
    ),
    (
        240,
        0,
        '2026-04-24 14:31:00',
        12,
        2
    ),
    (
        53,
        0,
        '2026-04-26 08:21:00',
        13,
        3
    ),
    (
        178,
        0,
        '2026-04-28 17:01:00',
        14,
        4
    ),
    (
        305,
        0,
        '2026-04-30 11:46:00',
        15,
        5
    );

-- ============================================================
-- tbl_produto_venda
-- ============================================================

INSERT INTO
    tbl_produto_venda (
        quantidade_vendida,
        valor_total_itens,
        fk_tbl_produto_id_produto,
        fk_tbl_vendas_id_vendas
    )
VALUES
    -- Venda 1 (VND-2026-0001): Arroz + Feijão + Óleo
    (2, 37.80, 1, 1),
    (3, 25.50, 2, 1),
    (2, 19.50, 3, 1),
    -- Venda 2 (VND-2026-0002): Leite + Queijo + Iogurte
    (4, 22.00, 6, 2),
    (2, 29.80, 7, 2),
    (5, 19.50, 8, 2),
    -- Venda 3 (VND-2026-0003): Frango + Carne Moída + Linguiça
    (3, 54.00, 9, 3),
    (2, 65.00, 10, 3),
    (3, 40.20, 11, 3),
    -- Venda 4 (VND-2026-0004): Biscoito + Refrigerante
    (4, 18.00, 13, 4),
    (2, 21.80, 14, 4),
    -- Venda 5 (VND-2026-0005): Shampoo + Sabão + Detergente + Papel Higiênico
    (3, 56.70, 19, 5),
    (4, 58.00, 17, 5),
    (6, 22.80, 16, 5),
    (4, 91.60, 20, 5),
    -- Venda 6 (VND-2026-0006): Macarrão + Açúcar
    (6, 31.20, 4, 6),
    (6, 28.80, 5, 6),
    -- Venda 7 (VND-2026-0007): Pão + Iogurte + Leite
    (3, 24.60, 12, 7),
    (4, 15.60, 8, 7),
    (10, 55.00, 6, 7),
    -- Venda 8 (VND-2026-0008): Água + Refrigerante
    (6, 19.20, 15, 8),
    (4, 43.60, 14, 8),
    -- Venda 9 (VND-2026-0009): Arroz + Feijão + Frango + Carne + Óleo
    (4, 75.60, 1, 9),
    (5, 42.50, 2, 9),
    (4, 72.00, 9, 9),
    (3, 97.50, 10, 9),
    (3, 29.25, 3, 9),
    -- Venda 10 (VND-2026-0010): Detergente + Desinfetante + Sabão
    (4, 15.20, 16, 10),
    (3, 20.70, 18, 10),
    (4, 58.00, 17, 10),
    -- Venda 11 (VND-2026-0011): Queijo + Leite + Biscoito
    (2, 29.80, 7, 11),
    (6, 33.00, 6, 11),
    (5, 22.50, 13, 11),
    -- Venda 12 (VND-2026-0012): Frango + Linguiça + Pão
    (5, 90.00, 9, 12),
    (4, 53.60, 11, 12),
    (3, 24.60, 12, 12),
    -- Venda 13 (VND-2026-0013): Água + Biscoito
    (5, 16.00, 15, 13),
    (4, 18.00, 13, 13),
    -- Venda 14 (VND-2026-0014): Shampoo + Papel Higiênico + Desinfetante
    (3, 56.70, 19, 14),
    (3, 68.70, 20, 14),
    (3, 20.70, 18, 14),
    -- Venda 15 (VND-2026-0015): Arroz + Feijão + Carne Moída + Óleo + Macarrão
    (4, 75.60, 1, 15),
    (5, 42.50, 2, 15),
    (2, 65.00, 10, 15),
    (3, 29.25, 3, 15),
    (6, 31.20, 4, 15);

SET FOREIGN_KEY_CHECKS = 1;