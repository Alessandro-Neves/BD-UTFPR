create or replace function	exInOut(
    in nome varchar(30),
    inout idade integer,
    out codigo integer,
    out msg varchar(50)
) returns record as
$$
declare
	code constant integer := 1234;
begin
    codigo := code;
    msg = format('%s tem %s de idade', nome, idade);
end;
$$
language plpgsql;

select teste('Alessandro', 20);
select * from teste('Alessandro', 20);