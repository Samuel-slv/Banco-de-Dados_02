-- 1. Criação da tabela de histórico de férias
CREATE TABLE HistoricoFerias (
    historico_id INT PRIMARY KEY AUTO_INCREMENT,
    solicitacao_id INT NOT NULL,
    funcionario_id INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    dias_solicitados INT NOT NULL,
    status VARCHAR(50) NOT NULL,
    data_solicitacao DATE NOT NULL,
    data_aprovacao DATE,
    observacoes TEXT,
    data_modificacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    acao VARCHAR(10) NOT NULL
);

-- 2. Procedure para inserir solicitações de férias
DELIMITER //
CREATE PROCEDURE InserirSolicitacaoFerias(
    IN p_funcionario_id INT,
    IN p_data_inicio DATE,
    IN p_data_fim DATE,
    IN p_dias_solicitados INT,
    IN p_status VARCHAR(50),
    IN p_observacoes TEXT
)
BEGIN
    DECLARE next_id INT;
    
    SELECT COALESCE(MAX(solicitacao_id), 0) + 1 INTO next_id 
    FROM SolicitacoesFerias;
    
    INSERT INTO SolicitacoesFerias (
        solicitacao_id,
        funcionario_id,
        data_inicio,
        data_fim,
        dias_solicitados,
        status,
        data_solicitacao,
        observacoes
    ) VALUES (
        next_id,
        p_funcionario_id,
        p_data_inicio,
        p_data_fim,
        p_dias_solicitados,
        p_status,
        CURDATE(),
        p_observacoes
    );
    
   END//
DELIMITER ;


-- 3. Trigger para manter o histórico
DELIMITER //
CREATE TRIGGER trg_historico_ferias
AFTER UPDATE ON SolicitacoesFerias
FOR EACH ROW
BEGIN
    INSERT INTO HistoricoFerias (
        solicitacao_id,
        funcionario_id,
        data_inicio,
        data_fim,
        dias_solicitados,
        status,
        data_solicitacao,
        data_aprovacao,
        observacoes,
        acao
    ) VALUES (
        OLD.solicitacao_id,
        OLD.funcionario_id,
        OLD.data_inicio,
        OLD.data_fim,
        OLD.dias_solicitados,
        OLD.status,
        OLD.data_solicitacao,
        OLD.data_aprovacao,
        OLD.observacoes,
        'UPDATE'
    );
   
   
   END//
DELIMITER ;









