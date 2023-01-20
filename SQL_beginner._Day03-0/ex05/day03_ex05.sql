(SELECT pz.name AS pizzeria_name
FROM person_visits pv
    LEFT JOIN person p ON p.id = pv.person_id
    LEFT JOIN pizzeria pz ON pz.id = pv.pizzeria_id
WHERE p.name = 'Andrey')
EXCEPT
(SELECT pz.name AS pizzeria_name
 FROM person_order po
    LEFT JOIN person p ON p.id = po.person_id
    LEFT JOIN menu m ON m.id = po.menu_id
    LEFT JOIN pizzeria pz ON pz.id = m.pizzeria_id
 WHERE p.name = 'Andrey')
ORDER BY pizzeria_name;