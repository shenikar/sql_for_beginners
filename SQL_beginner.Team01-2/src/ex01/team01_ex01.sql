insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

CREATE OR REPLACE FUNCTION fnc_convert_currency_to_usd(
    p_currency_id integer,
    p_updated timestamp without time zone
)
RETURNS numeric AS
$$
DECLARE
    v_rate numeric;
BEGIN
    SELECT rate_to_usd INTO v_rate
    FROM currency
    WHERE id = p_currency_id AND updated < p_updated
    ORDER BY updated DESC
    LIMIT 1;

    IF v_rate IS NULL THEN
        SELECT rate_to_usd INTO v_rate
        FROM currency
        WHERE id = p_currency_id AND updated > p_updated
        ORDER BY updated ASC
        LIMIT 1;
    END IF;

    RETURN v_rate;
END;
$$ LANGUAGE plpgsql;


SELECT 
    COALESCE(U.name, 'not defined') AS name,
    COALESCE(U.lastname, 'not defined') AS lastname,
    C.name AS currency_name,
    B.money * fnc_convert_currency_to_usd(B.currency_id, B.updated) AS currency_in_usd
FROM 
    balance B
LEFT JOIN 
    "user" U ON B.user_id = U.id
LEFT JOIN 
    (SELECT DISTINCT id, name FROM currency) C ON C.id = B.currency_id
WHERE 
    C.name IS NOT NULL
ORDER BY 
    name DESC, lastname, currency_name;
