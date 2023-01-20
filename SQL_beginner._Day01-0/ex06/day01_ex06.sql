(SELECT ord.order_date AS action_date,
    (SELECT p.name FROM person p WHERE p.id = ord.person_id) AS person_name
FROM (SELECT order_date, person_id FROM person_order) AS ord)
INTERSECT
(SELECT vis.visit_date AS action_date,
    (SELECT p.name FROM person p WHERE p.id = vis.person_id) AS person_name
 FROM (SELECT visit_date, person_id FROM person_visits) AS vis)
ORDER BY action_date, person_name DESC;