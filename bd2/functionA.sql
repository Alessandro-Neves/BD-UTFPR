CREATE OR REPLACE FUNCTION olamundo() 
RETURNS varchar AS
$$
DECLARE
    msg varchar := 'olá mundo, meu nome é Alessandro!';
BEGIN
    return msg;
END;
$$
LANGUAGE plpgsql;

select olamundo();