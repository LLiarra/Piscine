WITH pep_data (o_date, p_name) AS (SELECT po.order_date, p.name
FROM person_order po
         LEFT JOIN menu m ON m.id = po.menu_id
         LEFT JOIN person p ON p.id = po.person_id
WHERE m.pizza_name = 'pepperoni pizza'
  AND p.gender = 'female'
ORDER BY p.name),
ch_data (o_date, p_name) AS (
SELECT po.order_date, p.name
FROM person_order po
         LEFT JOIN menu m ON m.id = po.menu_id
         LEFT JOIN person p ON p.id = po.person_id
WHERE m.pizza_name = 'cheese pizza'
  AND p.gender = 'female'
ORDER BY p.name)

SELECT DISTINCT p.p_name AS name
FROM pep_data p
 LEFT JOIN ch_data c ON p.p_name = c.p_name
WHERE p.p_name = c.p_name
ORDER BY name;