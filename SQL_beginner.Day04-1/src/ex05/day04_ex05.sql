CREATE VIEW
    v_price_with_discount AS
SELECT
    person.name AS person_name,
    menu.pizza_name,
    menu.price AS price,
    CAST(price - price * 0.1 AS INTEGER) AS discount_price
FROM
    person_order
    JOIN person ON person_order.person_id = person.id
    JOIN menu ON person_order.menu_id = menu.id
ORDER BY
    person_name,
    pizza_name;