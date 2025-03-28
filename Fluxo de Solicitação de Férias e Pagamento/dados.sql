-- 4. Popular tabelas com dados de exemplo
DELIMITER //
CREATE PROCEDURE PopularDadosExemplo()
BEGIN
    DECLARE i INT DEFAULT 1;
    
    -- Insere 50 funcionários
    WHILE i <= 50 DO
        INSERT INTO Funcionarios (funcionario_id, nome, departamento, cargo, data_admissao)
        VALUES (
            i,
            CONCAT('Funcionário ', LPAD(i, 3, '0')),
            CASE 
                WHEN i % 3 = 0 THEN 'TI'
                WHEN i % 3 = 1 THEN 'RH'
                ELSE 'Vendas'
            END,
            CASE 
                WHEN i % 4 = 0 THEN 'Analista'
                WHEN i % 4 = 1 THEN 'Gerente'
                WHEN i % 4 = 2 THEN 'Assistente'
                ELSE 'Estagiário'
            END,
            DATE_SUB(CURDATE(), INTERVAL FLOOR(RAND() * 1000) DAY)
        );
        
       -- Insere solicitação de férias para cada funcionário
        CALL InserirSolicitacaoFerias(
            i,
            DATE_ADD(CURDATE(), INTERVAL 30 DAY),
            DATE_ADD(CURDATE(), INTERVAL 45 DAY),
            30,
            CASE 
                WHEN i % 5 = 0 THEN 'Pendente'
                ELSE 'Aprovado'
            END,
            'Solicitação automática'
        );
        
            SET i = i + 1;
    END WHILE;
    
    -- Atualiza algumas solicitações para acionar o trigger
    UPDATE SolicitacoesFerias SET status = 'Pago' WHERE solicitacao_id % 7 = 0;
END//
DELIMITER ;

-- Executa a procedure para popular dados
CALL PopularDadosExemplo();

-- 5. Gera o relatório da view
SELECT * FROM vw_dias_ferias_funcionario
ORDER BY total_dias_ferias DESC
LIMIT 50;