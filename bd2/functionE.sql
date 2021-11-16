CREATE OR REPLACE FUNCTION adicionaFuncionario(
    cpf integer,
    nome varchar(50),
    profissao varchar(50),
    salario numeric,
)RETURNS void AS
$$
BEGIN
    INSERT INTO funcionarios VALUES (cpf, nome, profissao, salario);
END;
$$ LANGUAGE plpgsql;



SELECT adicionaFuncionario('4948425', 'Gabriella Anthony', 'Veterinária', 4780.20);