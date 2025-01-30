CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10) 
RETURNS TABLE (fibonacci_num INTEGER) AS $$
DECLARE
    fib_prev INTEGER := 0;
    fib_curr INTEGER := 1;
    fib_next INTEGER;
BEGIN
    fibonacci_num := fib_prev;
    RETURN NEXT;

    WHILE fib_curr < pstop LOOP
        fibonacci_num := fib_curr;
        RETURN NEXT;
        
        fib_next := fib_prev + fib_curr;
        fib_prev := fib_curr;
        fib_curr := fib_next;
    END LOOP;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();