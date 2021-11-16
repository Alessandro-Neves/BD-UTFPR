CREATE OR REPLACE FUNCTION max_min(
    a NUMERIC,
    b NUMERIC,
    c NUMERIC,
    OUT max NUMERIC,
    OUT min NUMERIC
)RETURNS RECORD AS
$$
BEGIN   
    max := GREATEST(a,b,c);
    min := LEAST(a,b,c);
END;
$$
LANGUAGE plpgsql;

select * from max_min(10,20,30);
select max_min(10,20,30);
