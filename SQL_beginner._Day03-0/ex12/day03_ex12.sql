INSERT INTO person_order
(id,
 person_id,
 menu_id,
 order_date)
SELECT one,
       two,
       (SELECT id FROM menu WHERE menu.pizza_name = 'greek pizza'),
       '2022-02-25'::date
FROM generate_series(
(SELECT MAX(id) FROM person_order) + 1,
((SELECT MAX(id) FROM person_order) + (SELECT COUNT(*) FROM person))) AS one
LEFT JOIN generate_series(1, (SELECT COUNT(*) FROM person)) AS two
    ON two = one - (SELECT MAX(id) FROM person_order)
ORDER BY 1;