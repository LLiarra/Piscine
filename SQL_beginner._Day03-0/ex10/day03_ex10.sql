INSERT INTO person_order (id, person_id, menu_id, order_date)
    (SELECT  (SELECT MAX(po.id) FROM person_order po) + 1,
             p.id,
             (SELECT m.id FROM menu m WHERE m.pizza_name = 'sicilian pizza'),
             '2022-02-24'::date
     FROM person p
     WHERE p.name = 'Denis')
UNION
(SELECT  (SELECT MAX(po.id) FROM person_order po) + 2,
         p.id,
         (SELECT m.id FROM menu m WHERE m.pizza_name = 'sicilian pizza'),
         '2022-02-24'::date
 FROM person p
 WHERE p.name = 'Irina')
ORDER BY 1