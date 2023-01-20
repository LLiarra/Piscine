WITH all_order (name, id, count) AS (
SELECT pz.name,
       pz.id,
        COUNT(pizzeria_id) AS count
FROM person_order
LEFT JOIN menu m ON person_order.menu_id = m.id
LEFT JOIN pizzeria pz ON pz.id = m.pizzeria_id
GROUP BY pz.id),
all_visit (name, id, count) AS (
SELECT pz.name,
       pz.id,
       COUNT(pizzeria_id) AS count
FROM person_visits pv
LEFT JOIN pizzeria pz ON pz.id = pv.pizzeria_id
GROUP BY pz.id)

SELECT av.name,
       COALESCE(ao.count, 0) + av.count AS total_count
FROM all_visit av
LEFT JOIN all_order ao ON av.id = ao.id
ORDER BY total_count DESC, name ASC;