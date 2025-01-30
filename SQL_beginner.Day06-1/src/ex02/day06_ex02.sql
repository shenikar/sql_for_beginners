SELECT
    person.name,
    menu.pizza_name,
    menu.price AS price,
    ROUND(menu.price - (menu.price * pd.discount / 100), 0) AS discount_price,
    pizzeria.name AS pizzeria_name
FROM
    person_order po
    JOIN menu ON po.menu_id = menu.id
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person ON po.person_id = person.id
    LEFT JOIN person_discounts pd ON po.person_id = pd.person_id
    AND menu.pizzeria_id = pd.pizzeria_id
ORDER BY
    person.name,
    menu.pizza_name;