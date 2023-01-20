WITH sity_order(sity, count, id) AS (
SELECT p.address,
       COUNT(pizzeria_id),
       m.pizzeria_id
FROM person_order po
LEFT JOIN person p on po.person_id = p.id
LEFT JOIN menu m on po.menu_id = m.id
GROUP BY p.address, m.pizzeria_id
ORDER BY p.address
)

SELECT so.sity AS address,
       pz.name AS name,
       so.count AS count_of_orders
FROM sity_order so
LEFT JOIN pizzeria pz ON pz.id = so.id
ORDER BY address, name;