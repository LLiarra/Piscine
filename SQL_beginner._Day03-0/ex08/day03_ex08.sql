INSERT INTO menu (id, pizzeria_id, pizza_name, price)
SELECT  (SELECT MAX(m.id) FROM menu m) + 1,
       pz.id,
       'sicilian pizza',
       900
FROM pizzeria pz
WHERE pz.name = 'Dominos'
