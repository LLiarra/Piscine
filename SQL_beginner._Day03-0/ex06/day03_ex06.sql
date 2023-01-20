WITH pizzeria_data (name_pizza, name_pizzeria, prise, id) AS (
    SELECT m.pizza_name,
           pz.name,
           m.price,
           m.id
    FROM menu m
    LEFT JOIN pizzeria pz ON pz.id = m.pizzeria_id
)

SELECT p.name_pizza AS pizza_name,
       p.name_pizzeria AS pizzeria_name_1,
       p2.name_pizzeria AS pizzeria_name_2,
       p.prise
FROM pizzeria_data p
LEFT JOIN pizzeria_data p2 ON p.prise = p2.prise AND p.name_pizza = p2.name_pizza
    WHERE  p.id > p2.id
ORDER BY pizza_name;