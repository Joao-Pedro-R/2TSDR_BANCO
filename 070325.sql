SET SERVEROUTPUT ON //EXECUTA OS PUT LINE

--------------------------------------------------------------------------------

DECLARE
    V_CONTADOR NUMBER(2):=1;
BEGIN
LOOP
    DBMS_OUTPUT.put_line(V_CONTADOR);
    V_CONTADOR := V_CONTADOR + 1;
    EXIT WHEN V_CONTADOR > 20;
END LOOP;
END;

--------------------------------------------------------------------------------

DECLARE
    V_CONTADOR NUMBER(2):=1;
BEGIN
WHILE v_contador <= 20 LOOP
    DBMS_OUTPUT.put_line(V_CONTADOR);
    V_CONTADOR := V_CONTADOR + 1;
END LOOP;
END;

--------------------------------------------------------------------------------

DECLARE
    V_CONTADOR NUMBER(2):=1;
BEGIN
FOR V_CONTADOR IN 1..20 LOOP
    DBMS_OUTPUT.put_line(V_CONTADOR);
END LOOP;
END;

--------------------------------------------------------------------------------

DECLARE
    NUMERO NUMBER := '&DIGITE_NUMERO';
    MULTIPLICADOR NUMBER(2):=1;
BEGIN
FOR MULTIPLICADOR IN 1..10 LOOP
    DBMS_OUTPUT.put_line(NUMERO * MULTIPLICADOR);
END LOOP;
END;

--------------------------------------------------------------------------------

DECLARE
    NUMERO NUMBER := '&DIGITE_NUMERO';
    V_CONTADOR NUMBER(2):=1;
    PAR NUMBER := 0;
    IMPAR NUMBER := 0;
BEGIN
FOR V_CONTADOR IN 1..NUMERO LOOP
    IF MOD(V_CONTADOR , 2) = 0 THEN
        PAR := PAR + 1;
    ELSE
        IMPAR  := IMPAR + 1;
    END IF;
END LOOP;
DBMS_OUTPUT.put_line('PARES: '|| PAR);
DBMS_OUTPUT.put_line('ÍMPARES: '|| IMPAR);
END;

--------------------------------------------------------------------------------

DECLARE
    NUMERO NUMBER := '&DIGITE_NUMERO';
    V_CONTADOR NUMBER(2):=1;
    PAR NUMBER := 0;
    S_PAR NUMBER := 0;
    IMPAR NUMBER := 0;
BEGIN
FOR V_CONTADOR IN 1..NUMERO LOOP
    IF MOD(V_CONTADOR , 2) = 0 THEN
        PAR := PAR + 1;
        S_PAR := S_PAR + V_CONTADOR;
    ELSE
        IMPAR  := IMPAR + V_CONTADOR;
    END IF;
END LOOP;
DBMS_OUTPUT.put_line('MEDIA DOS PARES: '|| S_PAR / PAR);
DBMS_OUTPUT.put_line('SOMA DOS ÍMPARES: '|| IMPAR);
END;

--------------------------------------------------------------------------------

BEGIN
FOR X IN (SELECT TABLE_NAME FROM USER_TABLES WHERE TABLE_NAME = 'ALUNOS') LOOP

EXECUTE IMMEDIATE 'DROP TABLE ' || X.TABLE_NAME || ' CASCADE CONSTRAINTS';
END LOOP;
END;