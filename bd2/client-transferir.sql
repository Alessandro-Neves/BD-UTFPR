CREATE OR REPLACE FUNCTION transferir(
    IN contaA_p INTEGER,
    IN valor_p NUMERIC,
    IN contaB_p INTEGER
)RETURNS boolean AS
$$
DECLARE
    ok boolean := clienteExiste(contaA_p) AND clienteExiste(contaB_p) AND valor_p > 0;
    aux numeric;
BEGIN
    if(ok AND (select saldo from clientes where conta = contaB_p) >= valor_p) then
        select saldo from clientes where conta = contaB_p into aux;
        aux := aux - valor_p;
        update clientes set saldo = aux where conta = contaB_p;

        select saldo from clientes where conta = contaA_p into aux;
        aux := aux + valor_p;
        update clientes set saldo = aux where conta = contaA_p;
        return true;
    else return false;
    end if;
END;
$$
LANGUAGE plpgsql;

select transferir(1009, 70.00, 1001);