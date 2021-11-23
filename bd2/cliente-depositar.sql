CREATE OR REPLACE FUNCTION depositar(
    IN conta_p INTEGER,
    IN valor_p NUMERIC
)RETURNS boolean AS
$$
DECLARE
    ok boolean := clienteExiste(conta_p) AND valor_p > 0;
    aux numeric;
BEGIN
    if(ok) then
        select saldo from clientes where conta = conta_p into aux;
        aux := aux + valor_p;
        update clientes set saldo = aux where conta = conta_p;
        return true;
    else return false;
    end if;
END;
$$
LANGUAGE plpgsql;

select depositar(1001, 100.00);
