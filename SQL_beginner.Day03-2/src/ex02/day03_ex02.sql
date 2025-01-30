WITH available_pizzas AS (
    SELECT 
        id AS menu_id,
        pizza_name,
        price,
        pizzeria_id
    FROM 
        menu
    WHERE 
        id NOT IN (SELECT menu_id FROM person_order)
)
SELECT
    available_pizzas.pizza_name,
    available_pizzas.price,
    pizzeria.name AS pizzeria_name
FROM 
    available_pizzas
INNER JOIN 
    pizzeria ON available_pizzas.pizzeria_id = pizzeria.id
ORDER BY 
    pizza_name, 
    price;
