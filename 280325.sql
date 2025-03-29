--1
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE ListarPedidosClientes(X NUMBER) IS   
BEGIN
    FOR PEDIDO IN (Select COD_PEDIDO, DAT_PEDIDO, VAL_TOTAL_PEDIDO FROM PEDIDO WHERE COD_CLIENTE = X) LOOP
    DBMS_OUTPUT.PUT_LINE('Pedido do número: ' || PEDIDO.COD_PEDIDO || ' da data: ' || PEDIDO.DAT_PEDIDO || ' e de valor de: R$' || PEDIDO.VAL_TOTAL_PEDIDO || ' pertence ao ID: ' || X);
    END LOOP;
END ListarPedidosClientes;

EXEC ListarPedidosClientes(120);

--------------------------------------------------------------------------------------
--2
CREATE OR REPLACE PROCEDURE ListarItensPedidos (X NUMBER) IS   
BEGIN
    FOR ITEM IN (Select I.COD_ITEM_PEDIDO, P.NOM_PRODUTO, I.QTD_ITEM FROM ITEM_PEDIDO I INNER JOIN PRODUTO P ON (I.COD_PRODUTO = P.COD_PRODUTO) WHERE COD_PEDIDO = X) LOOP
    DBMS_OUTPUT.PUT_LINE('Item do número: ' || ITEM.COD_ITEM_PEDIDO || ' do nome: ' || ITEM.NOM_PRODUTO || ' e de quantidae de: ' || ITEM.QTD_ITEM || ' pertence ao ID de pedido: ' || X);
    END LOOP;
END ListarItensPedidos;

EXEC ListarItensPedidos(130517);

//Select I.COD_ITEM_PEDIDO, P.NOM_PRODUTO, I.QTD_ITEM FROM ITEM_PEDIDO I INNER JOIN PRODUTO P ON (I.COD_PRODUTO = P.COD_PRODUTO) WHERE COD_PEDIDO = 130517;

--------------------------------------------------------------------------------------
--3
CREATE OR REPLACE PROCEDURE ListarMovimentosEstoqueProduto (X NUMBER) IS   
BEGIN
    FOR PRODUTO IN (Select m.qtd_movimentacao_estoque, m.dat_movimento_estoque, t.des_tipo_movimento_estoque FROM movimento_estoque M INNER JOIN TIPO_MOVIMENTO_ESTOQUE T ON (M.cod_tipo_movimento_estoque = T.cod_tipo_movimento_estoque) WHERE M.COD_PRODUTO = X) LOOP
    DBMS_OUTPUT.PUT_LINE('Produto do número: ' || X || ' teve um total de: ' || PRODUTO.qtd_movimentacao_estoque || ' na data: ' || PRODUTO.dat_movimento_estoque || ' de tipo: ' || PRODUTO.des_tipo_movimento_estoque);
    END LOOP;
END ListarMovimentosEstoqueProduto;

EXEC ListarMovimentosEstoqueProduto(1);

-------------------------------------------------------------------------------------
--4
CREATE OR REPLACE PROCEDURE prc_insere_produto (
    COD_PRODUTO NUMBER,
    NOM_PRODUTO VARCHAR2
) IS
BEGIN
    IF LENGTH(nom_produto) > 3 AND NOT REGEXP_LIKE(nom_produto, '[0-9]') THEN
        INSERT INTO PRODUTO (COD_PRODUTO, NOM_PRODUTO)
        VALUES (COD_PRODUTO, NOM_PRODUTO);
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Produto inserido com sucesso: ' || nom_produto);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Erro: O nome do produto deve ter mais de 3 caracteres e não pode conter número.');
    END IF;
END prc_insere_produto;

EXEC prc_insere_produto(6969, 'SOLJ');

SELECT * FROM PRODUTO WHERE COD_PRODUTO = 6969;

---------------------------------------------------------------------------------------
--5
CREATE OR REPLACE PROCEDURE prc_insere_cliente (
    p_cod_cliente NUMBER,
    p_nom_cliente VARCHAR2
) IS
BEGIN
    IF LENGTH(p_nom_cliente) > 3 AND NOT REGEXP_LIKE(p_nom_cliente, '[0-9]') THEN
        INSERT INTO CLIENTE (COD_CLIENTE, NOM_CLIENTE)
        VALUES (p_cod_cliente, p_nom_cliente);
        
        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Cliente inserido com sucesso: ' || p_nom_cliente);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Erro: O nome do cliente deve ter mais de 3 caracteres e não pode conter números.');
    END IF;
END prc_insere_cliente;

EXEC prc_insere_cliente(6969, 'ROGER');

SELECT * FROM CLIENTE WHERE COD_CLIENTE = 6969;
