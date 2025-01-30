SELECT (
    SELECT name
    FROM person
    WHERE person.id = po.person_id
) AS name
FROM person_order po
WHERE po.order_date = '2022-01-07'
AND (
    EXISTS (
        SELECT 1
        FROM menu m1
        WHERE m1.id = 13 AND m1.id = po.menu_id
    )
    OR EXISTS (
        SELECT 1
        FROM menu m2
        WHERE m2.id = 14 AND m2.id = po.menu_id
    )
    OR EXISTS (
        SELECT 1
        FROM menu m3
        WHERE m3.id = 18 AND m3.id = po.menu_id
    )
);
