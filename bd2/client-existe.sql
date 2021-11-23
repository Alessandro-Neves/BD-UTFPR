CREATE OR REPLACE FUNCTION clienteExiste(
    IN conta_p INTEGER
)RETURNS boolean AS
$$
BEGIN
    if((select conta from CLIENTES where conta = conta_p) = conta_p) then return True;
    else return false;
    end if;
END;
$$
LANGUAGE plpgsql;

select clienteExiste(1000);