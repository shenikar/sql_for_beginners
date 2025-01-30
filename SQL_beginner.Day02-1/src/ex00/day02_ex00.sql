SELECT
    p.id AS pizzeria_id,
    p.name AS pizzeria_name,
    p.rating
FROM
    pizzeria p
    LEFT JOIN person_visits pv ON p.id = pv.pizzeria_id
WHERE
    pv.id IS NULL;