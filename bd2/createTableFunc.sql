DROP TABLE IF EXISTS CLIENTES;

CREATE TABLE CLIENTES(
    id SERIAL PRIMARY KEY,
    cpf INTEGER NOT NULL,
    nome VARCHAR(50) NOT NULL,
    conta INTEGER,
    saldo NUMERIC
    UNIQUE(cpf),
    UNIQUE(conta)
);

INSERT INTO CLIENTES(cpf, nome, conta, saldo) VALUES(1214361, 'Lucas Stenko', 1001, 0);
INSERT INTO CLIENTES(cpf, nome, conta, saldo) VALUES(2624233, 'Maira Danski Saski', 1002, 0);
INSERT INTO CLIENTES(cpf, nome, conta, saldo) VALUES(1323213, 'Andreina Neves Lastri', 1003, 0);
INSERT INTO CLIENTES(cpf, nome, conta, saldo) VALUES(1839275, 'Pedro Stenko', 1004, 0);
INSERT INTO CLIENTES(cpf, nome, conta, saldo) VALUES(9461892, 'João Danski Saski', 1005, 0);
INSERT INTO CLIENTES(cpf, nome, conta, saldo) VALUES(2946199, 'Thamy Neves Lastri', 1006, 0);
INSERT INTO CLIENTES(cpf, nome, conta, saldo) VALUES(8949274, 'Enzo Stenko', 1007, 0);
INSERT INTO CLIENTES(cpf, nome, conta, saldo) VALUES(9401232, 'Maya Danski Saski', 1008, 0);
INSERT INTO CLIENTES(cpf, nome, conta, saldo) VALUES(4762389, 'Gabriela Neves Lastri', 1009, 0);
INSERT INTO CLIENTES(cpf, nome, conta, saldo) VALUES(3129829, 'Andreina Balestrini', 1010, 0);
INSERT INTO CLIENTES(cpf, nome, conta, saldo) VALUES(8928943, 'Rodrigo Stenko', 1011, 0);


SELECT * FROM CLIENTES;