WITH all_order (name, id, count, sum, max, min) AS (
    SELECT pz.name,
           pz.id,
           COUNT(pizzeria_id) AS count,
           SUM(m.price),
           MAX(m.price),
           MIN(m.price)
    FROM person_order
             LEFT JOIN menu m ON person_order.menu_id = m.id
             LEFT JOIN pizzeria pz ON pz.id = m.pizzeria_id
    GROUP BY pz.id)

SELECT
    ao.name,
    ao.count AS count_of_orders,
    CAST(ao.sum / ao.count AS NUMERIC(10, 2)) AS average_price,
    ao.max AS max_price,
    ao.min AS min_price
FROM all_order ao
ORDER BY name;