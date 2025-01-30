WITH
    aggregated_balance AS (
        SELECT
            user_id,
            type AS type,
            currency_id,
            SUM(money) AS total_amount
        FROM
            balance
        GROUP BY
            user_id,
            type,
            currency_id
    ),
    rate AS (
        SELECT DISTINCT
            ON (id) id,
            rate_to_usd
        FROM
            currency
        ORDER BY
            id,
            updated DESC
    )
SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    ab.type,
    ab.total_amount AS volume,
    COALESCE(c.name, 'not defined') AS currency_name,
    COALESCE(r.rate_to_usd, 1) AS last_rate_to_usd,
    COALESCE(ab.total_amount * COALESCE(r.rate_to_usd, 1), 0) AS total_volume_in_usd
FROM
    aggregated_balance ab
    LEFT JOIN "user" AS u ON ab.user_id = u.id
    LEFT JOIN (
        SELECT DISTINCT
            id,
            name
        FROM
            currency
    ) AS c ON ab.currency_id = c.id
    LEFT JOIN rate AS r ON c.id = r.id
ORDER BY
    name DESC,
    lastname,
    ab.type;