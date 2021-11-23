CREATE OR REPLACE FUNCTION depTodos(
    IN valor numeric
)RETURNS void AS
$$
DECLARE
    aux numeric;
BEGIN
    FOR c IN 1001..1011 by 1 LOOP
        select saldo from clientes where conta = c into aux;
        aux := aux + valor;
        update clientes set saldo = aux where conta = c;
    END LOOP;
END;
$$
LANGUAGE plpgsql;