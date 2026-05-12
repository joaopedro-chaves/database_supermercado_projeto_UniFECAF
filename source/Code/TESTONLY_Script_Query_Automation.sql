/*
SQL script to automate loyalty points calculation and level management.
Script SQL para automatizar o cálculo de pontos e gestão de níveis de fidelidade.

Author: João Pedro Vieira da Costa Chaves (Assistant)
Date: 2026/05/12
Version: 1.0.0

made by ai for testing purposes
*/

USE db_supermercado;

-- Alterando o delimitador para permitir o uso de ';' dentro do Trigger
DELIMITER / /

/* 
1. TRIGGER: trg_venda_fidelizacao_insert
Objetivo: Após uma venda ser inserida, calcular pontos e atualizar o saldo do cliente.
Regra: 1 ponto para cada R$ 1,00 gasto (arredondado para baixo).
*/

CREATE TRIGGER trg_venda_fidelizacao_insert
AFTER INSERT ON tbl_venda
FOR EACH ROW
BEGIN
    DECLARE v_id_fidelizacao INT;
    DECLARE v_pontos_ganhos INT;

    -- 1. Verifica se a venda possui um cliente identificado
    IF NEW.fk_tbl_cliente_id_cliente IS NOT NULL THEN
        
        -- 2. Busca o ID de fidelização do cliente
        SELECT fk_tbl_fidelizacao_id_fidelizacao INTO v_id_fidelizacao
        FROM tbl_cliente
        WHERE id_cliente = NEW.fk_tbl_cliente_id_cliente;

        -- 3. Se o cliente participar do programa de fidelidade, processa os pontos
        IF v_id_fidelizacao IS NOT NULL THEN
            
            -- Cálculo: R$ 1.00 = 1 ponto
            SET v_pontos_ganhos = FLOOR(NEW.valor_total_liquido);

            -- 4. Insere no histórico de pontos
            INSERT INTO tbl_historico_pontos (
                entrada_pontos, 
                saida_pontos, 
                data_hora_pontos, 
                fk_tbl_venda_id_venda, 
                fk_tbl_fidelizacao_id_fidelizacao
            ) VALUES (
                v_pontos_ganhos, 
                0, 
                NOW(), 
                NEW.id_venda, 
                v_id_fidelizacao
            );

            -- 5. Atualiza o saldo total na tabela de fidelização e ajusta o nível
            UPDATE tbl_fidelizacao 
            SET saldo_pontos = saldo_pontos + v_pontos_ganhos,
                nivel_fidelizacao = CASE 
                    WHEN (saldo_pontos + v_pontos_ganhos) >= 10000 THEN 5
                    WHEN (saldo_pontos + v_pontos_ganhos) >= 6000 THEN 4
                    WHEN (saldo_pontos + v_pontos_ganhos) >= 3000 THEN 3
                    WHEN (saldo_pontos + v_pontos_ganhos) >= 1000 THEN 2
                    ELSE 1
                END
            WHERE id_fidelizacao = v_id_fidelizacao;

        END IF;
    END IF;
END//

DELIMITER;