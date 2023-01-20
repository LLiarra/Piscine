SET ENABLE_SEQSCAN TO OFF;

SELECT m.pizza_name,
       p.name
FROM menu m
LEFT JOIN pizzeria p on m.pizzeria_id = p.id;

EXPLAIN ANALYSE SELECT m.pizza_name,
                        p.name
FROM menu m
LEFT JOIN pizzeria p on m.pizzeria_id = p.id;

