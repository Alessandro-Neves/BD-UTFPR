CREATE OR REPLACE FUNCTION verificaIdade(IN idade)
RETURNS char(20) AS
$$
BEGIN
    if(idade > 18) then
        return 'é maior de idade';
    elsif(idade = 18) then
        return 'agora é maior de idade';
    else
        return 'é menor de idade';
    end if;
END;
$$
LANGUAGE plpgsql;