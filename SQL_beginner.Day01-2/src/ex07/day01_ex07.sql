SELECT
    po.order_date AS order_date,
    p.name || ' (age:' || p.age || ')' AS person_information
FROM
    person_order po
    JOIN person p ON po.person_id = p.id
ORDER BY
    po.order_date ASC,
    p.name ASC;