CREATE OR REPLACE FUNCTION cal_fgts (
    sal NUMBER
) RETURN NUMBER IS
BEGIN
    RETURN sal * 0.08;
END;

SELECT
    cal_fgts(1500)
FROM
    dual;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE calc_fgts IS
    valor NUMBER;
BEGIN
    valor := cal_fgts(15000);
    dbms_output.put_line('O valor do calculo é: ' || valor);
END;

EXEC calc_fgts();

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION cal_fgts_exc (
    sal NUMBER
) RETURN NUMBER IS
    meu_erro EXCEPTION;
    v_sal NUMBER;
BEGIN
    v_sal := sal * 0.08;
    IF sal < 1000 THEN
        RAISE meu_erro;
    END IF;
    RETURN v_sal;
EXCEPTION
    WHEN meu_erro THEN
        raise_application_error(-20001, 'Seu cálculo de fgts está abaixo de R$1000');
END;

SELECT cal_fgts_exc(100) from dual;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

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

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fun_valida_nome (
    nome VARCHAR2
) RETURN VARCHAR2 IS
    meu_erro EXCEPTION;
BEGIN
    IF LENGTH(nome) > 3 AND NOT REGEXP_LIKE(nome, '[0-9]') THEN
        RETURN('NOME VÁLIDO!');
    ELSE
        RAISE meu_erro;
    END IF;
EXCEPTION
    WHEN meu_erro THEN
        raise_application_error(-20001, 'NOME INVÁLIDO');
END;

SELECT fun_valida_nome('rog') from dual;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

