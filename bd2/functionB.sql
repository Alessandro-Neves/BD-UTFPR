CREATE OR REPLACE FUNCTION olamundo(msg varchar) 
RETURNS varchar AS
$$
BEGIN
    return msg;
END;
$$
LANGUAGE plpgsql;

select olamundo();  