SELECT
    pizzeria.name
FROM
    person_visits
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    JOIN menu ON pizzeria.id = menu.pizzeria_id
    JOIN person ON person_visits.person_id = person.id
WHERE
    person.name = 'Dmitriy'
    AND person_visits.visit_date = '2022-01-08'
    AND menu.price < 800