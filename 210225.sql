SET SERVEROUTPUT ON;

DECLARE
    idade    NUMBER;
    nome     VARCHAR2(30) := 'JO�O';
    endereco nome%TYPE := '&DIGITE_ENDERECO';
BEGIN
    idade := 22;
    dbms_output.put_line('A IDADE DECLARADA � ' || idade);
    dbms_output.put_line('O NOME DECLARADO � ' || nome);
    dbms_output.put_line('O ENDERECO INFORMADO � ' || endereco);
END;
--------------------------------------------------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;

DECLARE
    salario NUMBER := '&DIGITE_SALARIO';
BEGIN
    dbms_output.put_line('O NOVO SAL�RIO �: ' || salario * 1.25);
END;
--------------------------------------------------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;

DECLARE
    DOLAR NUMBER := '&DIGITE_VALOR';
BEGIN
    dbms_output.put_line('AP�S A TRANSA��O O NOVO VALOR � DE: ' || DOLAR * 5.73 || ' REAIS');
END;
---------------------------------------------------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;

DECLARE
    PARCELA NUMBER := '&DIGITE_VALOR';
    MES NUMBER := '&DIGITE_TEMPO';
BEGIN
    dbms_output.put_line('O VALOR A VISTA FICOU: ' || PARCELA || ' REAIS, O VALOR TOTAL PARCELADO FICOU: ' || PARCELA * 1.03 || ' REAIS, E CADA PARCELA � DE: ' || (PARCELA * 1.03)/mes || ' REAIS CADA M�S POR ' || MES || ' MESES.');
END;
---------------------------------------------------------------------------------------------------------------------------------
SET SERVEROUTPUT ON;

DECLARE
    PARCELA NUMBER := '&DIGITE_VALOR';
BEGIN
    dbms_output.put_line('O VALOR APOS A ENTRADA FICOU: ' || PARCELA / 1.25 || ' REAIS, O VALOR DA PARCELA EM 6 PARCELAS FICOU: ' || ((PARCELA / 1.25)*1.1)/6 || ' REAIS, O VALOR DA PARCELA EM 12 PARCELAS FICOU: ' || ((PARCELA / 1.25)*1.15)/12 || ' REAIS, O VALOR DA PARCELA EM 18 PARCELAS FICOU: ' || ((PARCELA / 1.25)*1.2)/18 || ' MESES.');
END;