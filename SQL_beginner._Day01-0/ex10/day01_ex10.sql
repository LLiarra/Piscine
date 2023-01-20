SELECT p.name AS person_name,
       m.pizza_name AS pizza_name,
       pz.name AS pizzeria_name
FROM person_order po
    LEFT JOIN person p ON po.person_id = p.id
    LEFT JOIN menu m ON po.menu_id = m.id
    LEFT JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY person_name, pizza_name, pizzeria_name;
