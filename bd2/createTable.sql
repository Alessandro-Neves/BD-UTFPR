DROP TABLE IF EXISTS FUNCIONARIOS;

CREATE TABLE FUNCIONARIOS(
    id SERIAL PRIMARY KEY,
    cpf INTEGER NOT NULL,
    nome VARCHAR(50) NOT NULL,
    profissao VARCHAR(50),
    salario NUMERIC,
    UNIQUE(cpf)
);

INSERT INTO FUNCIONARIOS(cpf, nome, profissao, salario) VALUES('1214361', 'Lucas Stenko', 'Bombeiro', 2285.00);
INSERT INTO FUNCIONARIOS(cpf, nome, profissao, salario) VALUES('2624233', 'Maira Danski Saski', 'Professor', 3740.00);
INSERT INTO FUNCIONARIOS(cpf, nome, profissao, salario) VALUES('1323213', 'Andreina Neves Lastri', 'Medico', 8572.00);
INSERT INTO FUNCIONARIOS(cpf, nome, profissao, salario) VALUES('1839275', 'Pedro Stenko', 'Professor', 3740.00);
INSERT INTO FUNCIONARIOS(cpf, nome, profissao, salario) VALUES('9461892', 'João Danski Saski', 'Gerente', 5674.00);
INSERT INTO FUNCIONARIOS(cpf, nome, profissao, salario) VALUES('2946199', 'Thamy Neves Lastri', 'Bombeiro', 2285.00);
INSERT INTO FUNCIONARIOS(cpf, nome, profissao, salario) VALUES('8949274', 'Enzo Stenko', 'Administrador', 3094.00);
INSERT INTO FUNCIONARIOS(cpf, nome, profissao, salario) VALUES('9401232', 'Maya Danski Saski', 'Administrador', 3094.00);
INSERT INTO FUNCIONARIOS(cpf, nome, profissao, salario) VALUES('4762389', 'Gabriela Neves Lastri', 'Administrador', 3094.00);
INSERT INTO FUNCIONARIOS(cpf, nome, profissao, salario) VALUES('3129829', 'Andreina Balestrini', 'Contador', 4271.00);
INSERT INTO FUNCIONARIOS(cpf, nome, profissao, salario) VALUES('8928943', 'Rodrigo Stenko', 'Biologo', 3512.00);


SELECT * FROM FUNCIONARIOS;