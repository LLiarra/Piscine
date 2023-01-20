SELECT p.name
FROM person p
LEFT JOIN person_order po ON p.id = po.person_id
LEFT JOIN menu m ON m.id = po.menu_id
WHERE p.address IN ('Moscow', 'Samara') AND p.gender = 'male'
  AND m.pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY p.name DESC;