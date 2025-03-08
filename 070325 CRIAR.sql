@ 'C:\Users\labsfiap\Desktop\ORACLE\SCRIPT_MODELO_PEDIDO.SQL'
// EXECUTA O APLICATIVO BASEADO NO PATH

ALTER TABLE CIDADE MODIFY  NOM_CIDADE VARCHAR2(50);
ALTER TABLE PEDIDO ADD  STATUS VARCHAR2(50);

SELECT * FROM PAIS;
INSERT INTO PAIS SELECT * FROM PF1788.PAIS;
COMMIT;

INSERT INTO estado SELECT * FROM PF1788.ESTADO;
COMMIT;

INSERT INTO cidade SELECT * FROM PF1788.CIDADE;
COMMIT;

INSERT INTO estoque SELECT * FROM PF1788.ESTOQUE;
COMMIT;

INSERT INTO tipo_movimento_estoque SELECT * FROM PF1788.TIPO_MOVIMENTO_ESTOQUE;
COMMIT;

INSERT INTO tipo_endereco SELECT * FROM PF1788.TIPO_ENDERECO;
COMMIT;

INSERT INTO cliente SELECT * FROM PF1788.CLIENTE;
COMMIT;

INSERT INTO usuario SELECT * FROM PF1788.USUARIO;
COMMIT;

INSERT INTO vendedor SELECT * FROM PF1788.VENDEDOR;
COMMIT;

INSERT INTO endereco_cliente SELECT * FROM PF1788.ENDERECO_CLIENTE;
COMMIT;

INSERT INTO pedido SELECT * FROM PF1788.PEDIDO;
COMMIT;

INSERT INTO historico_pedido SELECT * FROM PF1788.HISTORICO_PEDIDO;
COMMIT;

INSERT INTO produto SELECT * FROM PF1788.PRODUTO;
COMMIT;

INSERT INTO produto_composto SELECT * FROM PF1788.PRODUTO_COMPOSTO;
COMMIT;

INSERT INTO estoque_produto SELECT * FROM PF1788.ESTOQUE_PRODUTO;
COMMIT;

INSERT INTO movimento_estoque SELECT * FROM PF1788.MOVIMENTO_ESTOQUE;
COMMIT;

INSERT INTO cliente_vendedor SELECT * FROM PF1788.CLIENTE_VENDEDOR;
COMMIT;

INSERT INTO item_pedido SELECT * FROM PF1788.ITEM_PEDIDO;
COMMIT;