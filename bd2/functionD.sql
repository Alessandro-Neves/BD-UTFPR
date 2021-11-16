CREATE OR REPLACE FUNCTION rel_funcionarios(
    OUT max NUMERIC,
    OUT media NUMERIC,
    OUT min NUMERIC
)RETURNS RECORD AS
$$
BEGIN
    select min(salario) from funcionarios into min;
    select round(avg(salario),2) from funcionarios into media;
    select max(salario) from funcionarios into max;
END;
$$
LANGUAGE plpgsql;

select * from rel_funcionarios();
select rel_funcionarios();
