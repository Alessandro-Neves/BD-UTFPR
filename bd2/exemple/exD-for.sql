CREATE OR REPLACE FUNCTION exFor(IN valor numeric)
RETURNS void AS
$$
BEGIN
    FOR cont IN 1001..1011 by 1 LOOP
    	update clientes set saldo = valor where conta = cont;
    END LOOP;
END;
$$
LANGUAGE plpgsql;

select exFor(20.0);