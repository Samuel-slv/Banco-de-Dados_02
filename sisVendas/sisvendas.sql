--Procedure para atualizar o preço de um produto:

--Esta procedure receberá o ID do produto e o novo preço como parâmetros, e atualizará o preço do produto na tabela Produtos.
CREATE OR REPLACE PROCEDURE atualizar_preco_produto(
    produto_id INT,
    novo_preco DECIMAL(10, 2)
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Produtos
    SET preco = novo_preco
    WHERE id = produto_id;


    -- Aqui você pode adicionar mais lógica, como logs ou notificações.
      RAISE NOTICE 'Preço do produto % atualizado para %', produto_id, novo_preco;

    -- Confirma a transação
    COMMIT;
END;
$$;

  
--Execute:
CALL atualizar_preco_produto(1, 1300.00);

--Trigger para registrar alterações nos preços dos produtos:

--Esta trigger será acionada sempre que o preço de um produto for alterado na tabela Produtos, e registrará a alteração em uma tabela de log chamada LogPrecosProdutos.
CREATE TABLE LogPrecosProdutos (
    id SERIAL PRIMARY KEY,
    produto_id INT,
    preco_antigo DECIMAL(10, 2),
    preco_novo DECIMAL(10, 2),
    data_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


--Criando a Trigger
CREATE OR REPLACE FUNCTION registrar_alteracao_preco()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF NEW.preco <> OLD.preco THEN
        INSERT INTO LogPrecosProdutos (produto_id, preco_antigo, preco_novo)
        VALUES (OLD.id, OLD.preco, NEW.preco);
    END IF;
    RETURN NEW;
END;
$$;

CREATE TRIGGER trigger_alteracao_preco
AFTER UPDATE OF preco ON Produtos
FOR EACH ROW
EXECUTE FUNCTION registrar_alteracao_preco();


--Criar view consulta pre pronta de categoria de dados
create or replace view ProdutosPorCategoriaComContagemClientes as
select
	c.nome as categoria,
	p.nome as produto,
	count(cp.cliente_id) as numero_de_clientes
from
	categorias c
join
	Produtos p on c.id = p.categoria_id
left join  
	Clientes_Produtos cp on p.id = cp.produto_id
group by 
	c.nome, p.nome
order by 
	c.nome, p.nome;


























