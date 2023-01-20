SELECT m.pizza_name,
       m.price,
       pz.name AS pizzeria_name,
       pv.visit_date
FROM person_visits pv
LEFT JOIN pizzeria pz ON pv.pizzeria_id = pz.id
LEFT JOIN menu m ON pv.pizzeria_id = m.pizzeria_id
LEFT JOIN person p ON p.id = pv.person_id
WHERE p.name = 'Kate' AND m.price BETWEEN 800 AND 1000
ORDER BY pizza_name, price, pizzeria_name
