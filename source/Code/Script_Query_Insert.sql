/*
SQL script to insert sample data into the database.
SQL Script para inserção de dados de exemplo no banco de dados.

Author: João Pedro Vieira da Costa Chaves
Date: 2026/05/08
Version: 2.1.0

About the project: [https://github.com/joaopedro-chaves/database_supermercado_projeto_UniFECAF]

Project created for the discipline of Database Systems of UniFECAF.
Projeto criado para a disciplina de Banco de Dados do UniFECAF

NOTA: todos os dados abaixo são fictícios e foram gerados apenas para fins de demonstração.
NOTE: all the data below are fictitious and were generated only for demonstration purposes.
*/

USE db_supermercado;

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO
    tbl_colaborador (
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
        'Gerente',
        '2017-01-10',
        'roberto.costa@supermercado.com',
        '33344455566',
        NULL
    );

INSERT INTO
    tbl_colaborador (
        nome_colaborador,
        funcao_colaborador,
        data_contratacao,
        email_colaborador,
        cpf_colaborador,
        fk_id_supervisor
    )
VALUES (
        'Ana Paula Ferreira',
        'Atendente',
        '2021-05-20',
        'ana.ferreira@supermercado.com',
        '44455566677',
        1
    ),
    (
        'Lucas Martins Oliveira',
        'Atendente',
        '2022-08-14',
        'lucas.oliveira@supermercado.com',
        '55566677788',
        1
    ),
    (
        'Juliana Ramos Pereira',
        'Gerente',
        '2020-11-03',
        'juliana.pereira@supermercado.com',
        '66677788899',
        2
    ),
    (
        'Thiago Nascimento Silva',
        'Atendente',
        '2023-02-17',
        'thiago.silva@supermercado.com',
        '77788899900',
        2
    ),
    (
        'Beatriz Carvalho Santos',
        'Atendente',
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
        'Atendente',
        '2023-06-22',
        'mariana.barbosa@supermercado.com',
        '10011122233',
        1
    );

INSERT INTO
    tbl_produto (
        nome_produto,
        tipo_produto,
        valor_produto,
        categoria_produto,
        codigo_ean
    )
VALUES (
        'Arroz Tipo 1 5kg',
        'Grão',
        18.90,
        'Mercearia',
        '7891234567890'
    ),
    (
        'Feijão Carioca 1kg',
        'Grão',
        8.50,
        'Mercearia',
        '7891234567891'
    ),
    (
        'Óleo de Soja 900ml',
        'Óleo',
        9.75,
        'Mercearia',
        '7891234567892'
    ),
    (
        'Macarrão Espaguete 500g',
        'Massa',
        5.20,
        'Mercearia',
        '7891234567893'
    ),
    (
        'Açúcar Refinado 1kg',
        'Açúcar',
        4.80,
        'Mercearia',
        '7891234567894'
    ),
    (
        'Leite Integral 1L',
        'Laticínio',
        5.50,
        'Laticínios',
        '7891234567895'
    ),
    (
        'Queijo Mussarela 250g',
        'Laticínio',
        14.90,
        'Laticínios',
        '7891234567896'
    ),
    (
        'Iogurte Natural 170g',
        'Laticínio',
        3.90,
        'Laticínios',
        '7891234567897'
    ),
    (
        'Peito de Frango Kg',
        'Carne',
        18.00,
        'Carnes',
        '7891234567898'
    ),
    (
        'Carne Moída Bovina Kg',
        'Carne',
        32.50,
        'Carnes',
        '7891234567899'
    ),
    (
        'Linguiça Calabresa 500g',
        'Embutido',
        13.40,
        'Carnes',
        '7891234567800'
    ),
    (
        'Pão de Forma Integral',
        'Panificação',
        8.20,
        'Padaria',
        '7891234567801'
    ),
    (
        'Biscoito Cream Cracker 200g',
        'Biscoito',
        4.50,
        'Biscoitos',
        '7891234567802'
    ),
    (
        'Refrigerante Cola 2L',
        'Bebida',
        10.90,
        'Bebidas',
        '7891234567803'
    ),
    (
        'Água Mineral 1,5L',
        'Bebida',
        3.20,
        'Bebidas',
        '7891234567804'
    ),
    (
        'Detergente Líquido 500ml',
        'Limpeza',
        3.80,
        'Limpeza',
        '7891234567805'
    ),
    (
        'Sabão em Pó 1kg',
        'Limpeza',
        14.50,
        'Limpeza',
        '7891234567806'
    ),
    (
        'Desinfetante 1L',
        'Limpeza',
        6.90,
        'Limpeza',
        '7891234567807'
    ),
    (
        'Shampoo 400ml',
        'Higiene',
        18.90,
        'Higiene Pessoal',
        '7891234567808'
    ),
    (
        'Papel Higiênico 12un',
        'Higiene',
        22.90,
        'Higiene Pessoal',
        '7891234567809'
    );

INSERT INTO
    tbl_estoque (
        data_validade,
        lote_estoque,
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

INSERT INTO
    tbl_cliente (
        nome_cliente,
        cpf_cliente,
        num_cel_cliente,
        email_cliente,
        fk_tbl_fidelizacao_id_fidelizacao
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
        rua_colaborador,
        bairro_colaborador,
        cidade_colaborador,
        pais_colaborador,
        cep_colaborador,
        fk_tbl_colaborador_id_colaborador
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
        rua_cliente,
        bairro_cliente,
        cidade_cliente,
        pais_cliente,
        cep_cliente,
        fk_tbl_cliente_id_cliente
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
-- tbl_venda
-- ============================================================

INSERT INTO
    tbl_venda (
        valor_bruto,
        valor_desconto,
        valor_total_liquido,
        datahora_venda,
        comissao_venda,
        numero_venda,
        forma_pagamento,
        fk_tbl_colaborador_id_colaborador,
        fk_tbl_cliente_id_cliente
    )
VALUES (
        152.40,
        0.00,
        152.40,
        '2026-04-01 09:15:00',
        7.62,
        'VND-2026-0001',
        'Cartão de Crédito',
        4,
        1
    ),
    (
        89.90,
        0.00,
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
        0.00,
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
        0.00,
        47.20,
        '2026-04-05 08:45:00',
        2.36,
        'VND-2026-0004',
        'Cartão de Débito',
        10,
        4
    ),
    (
        330.00,
        0.00,
        330.00,
        '2026-04-07 16:20:00',
        16.50,
        'VND-2026-0005',
        'Cartão de Crédito',
        7,
        5
    ),
    (
        75.60,
        0.00,
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
        0.00,
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
        0.00,
        62.80,
        '2026-04-15 09:00:00',
        3.14,
        'VND-2026-0008',
        'Cartão de Débito',
        7,
        8
    ),
    (
        415.50,
        0.00,
        415.50,
        '2026-04-18 15:45:00',
        20.78,
        'VND-2026-0009',
        'Cartão de Crédito',
        4,
        9
    ),
    (
        130.00,
        0.00,
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
        0.00,
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
        0.00,
        240.90,
        '2026-04-24 14:30:00',
        12.05,
        'VND-2026-0012',
        'Cartão de Crédito',
        4,
        2
    ),
    (
        53.10,
        0.00,
        53.10,
        '2026-04-26 08:20:00',
        2.66,
        'VND-2026-0013',
        'Cartão de Débito',
        10,
        3
    ),
    (
        178.60,
        0.00,
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
        0.00,
        305.75,
        '2026-04-30 11:45:00',
        15.29,
        'VND-2026-0015',
        'Cartão de Crédito',
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
        fk_tbl_venda_id_venda,
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
        preco_unitario_praticado,
        fk_tbl_produto_id_produto,
        fk_tbl_venda_id_venda
    )
VALUES
    -- Venda 1 (VND-2026-0001): Arroz + Feijão + Óleo
    (2, 18.90, 1, 1),
    (3, 8.50, 2, 1),
    (2, 9.75, 3, 1),
    -- Venda 2 (VND-2026-0002): Leite + Queijo + Iogurte
    (4, 5.50, 6, 2),
    (2, 14.90, 7, 2),
    (5, 3.90, 8, 2),
    -- Venda 3 (VND-2026-0003): Frango + Carne Moída + Linguiça
    (3, 18.00, 9, 3),
    (2, 32.50, 10, 3),
    (3, 13.40, 11, 3),
    -- Venda 4 (VND-2026-0004): Biscoito + Refrigerante
    (4, 4.50, 13, 4),
    (2, 10.90, 14, 4),
    -- Venda 5 (VND-2026-0005): Shampoo + Sabão + Detergente + Papel Higiênico
    (3, 18.90, 19, 5),
    (4, 14.50, 17, 5),
    (6, 3.80, 16, 5),
    (4, 22.90, 20, 5),
    -- Venda 6 (VND-2026-0006): Macarrão + Açúcar
    (6, 5.20, 4, 6),
    (6, 4.80, 5, 6),
    -- Venda 7 (VND-2026-0007): Pão + Iogurte + Leite
    (3, 8.20, 12, 7),
    (4, 3.90, 8, 7),
    (10, 5.50, 6, 7),
    -- Venda 8 (VND-2026-0008): Água + Refrigerante
    (6, 3.20, 15, 8),
    (4, 10.90, 14, 8),
    -- Venda 9 (VND-2026-0009): Arroz + Feijão + Frango + Carne + Óleo
    (4, 18.90, 1, 9),
    (5, 8.50, 2, 9),
    (4, 18.00, 9, 9),
    (3, 32.50, 10, 9),
    (3, 9.75, 3, 9),
    -- Venda 10 (VND-2026-0010): Detergente + Desinfetante + Sabão
    (4, 3.80, 16, 10),
    (3, 6.90, 18, 10),
    (4, 14.50, 17, 10),
    -- Venda 11 (VND-2026-0011): Queijo + Leite + Biscoito
    (2, 14.90, 7, 11),
    (6, 5.50, 6, 11),
    (5, 4.50, 13, 11),
    -- Venda 12 (VND-2026-0012): Frango + Linguiça + Pão
    (5, 18.00, 9, 12),
    (4, 13.40, 11, 12),
    (3, 8.20, 12, 12),
    -- Venda 13 (VND-2026-0013): Água + Biscoito
    (5, 3.20, 15, 13),
    (4, 4.50, 13, 13),
    -- Venda 14 (VND-2026-0014): Shampoo + Papel Higiênico + Desinfetante
    (3, 18.90, 19, 14),
    (3, 22.90, 20, 14),
    (3, 6.90, 18, 14),
    -- Venda 15 (VND-2026-0015): Arroz + Feijão + Carne Moída + Óleo + Macarrão
    (4, 18.90, 1, 15),
    (5, 8.50, 2, 15),
    (2, 32.50, 10, 15),
    (3, 9.75, 3, 15),
    (6, 5.20, 4, 15);

SET FOREIGN_KEY_CHECKS = 1;