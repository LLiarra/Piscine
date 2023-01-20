SELECT m.pizza_name,
       pz.name AS pizzeria_name,
       m.price
FROM menu m
    LEFT JOIN pizzeria pz ON pz.id = m.pizzeria_id
WHERE m.pizza_name = 'pepperoni pizza' OR m.pizza_name = 'mushroom pizza'
ORDER BY  m.pizza_name, pz.name;