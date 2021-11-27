CREATE OR REPLACE FUNCTION exWhile(IN valor numeric, IN limite integer)
RETURNS void AS
$$
DECLARE
	cont integer := 1001;
BEGIN
    WHILE (cont <= limite) LOOP
        update clientes set saldo = valor where conta = cont;
		cont = cont + 1;
    END LOOP;
END;
$$
LANGUAGE plpgsql;

select exWhile(50.0, 1011);