create or replace function ehSalarioMaiorMedia(
    IN cpf integer
) RETURNS boolean AS
$$
DECLARE
    media real;
    salario real;
BEGIN
    select avg(salario) from funcionarios into media;
    select salario from funcionarios where cpf = cpf into salario;

    if(salario > media) then
        return True;
    else
        return False;
    end if;
END;
$$
LANGUAGE plpgsql;


select ehSalarioMaiorMedia(1323213);

drop function ehSalarioMaiorMedia(integer);