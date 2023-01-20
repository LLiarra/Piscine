(SELECT pizza_name
 FROM menu)
UNION
(SELECT
    (SELECT pizza_name FROM menu WHERE id = ID.menu_id)
FROM (SELECT menu_id
      FROM person_order) AS ID)
ORDER BY pizza_name DESC;