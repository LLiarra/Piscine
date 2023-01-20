CREATE OR REPLACE FUNCTION fnc_fibonacci(value integer DEFAULT 10) RETURNS NUMERIC ARRAY AS $$
DECLARE
fibo NUMERIC ARRAY;
a NUMERIC := 0;
b NUMERIC := 1;
temp NUMERIC;
i NUMERIC;

BEGIN
    fibo = ARRAY[0, 1];
    FOR i IN 3..value
    LOOP
        temp:= a + b;
        fibo[i] := temp;
        a := b;
        b := temp;
        END LOOP;
    RETURN fibo;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();
