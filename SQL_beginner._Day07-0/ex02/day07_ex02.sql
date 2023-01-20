(SELECT pz.name,
       COUNT(pizzeria_id) AS count,
       'order' AS action_type
FROM person_order
LEFT JOIN menu m ON person_order.menu_id = m.id
LEFT JOIN pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY pz.name
ORDER BY count DESC
LIMIT 3)
UNION ALL
(SELECT pz.name,
       COUNT(pizzeria_id) AS count,
       'visit' AS action_type
FROM person_visits pv
LEFT JOIN pizzeria pz ON pz.id = pv.pizzeria_id
GROUP BY pz.name
ORDER BY count DESC
LIMIT 3)
ORDER BY action_type, count DESC;
