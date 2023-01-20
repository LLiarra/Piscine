CREATE MATERIALIZED VIEW  mv_dmitriy_visits_and_eats  AS
SELECT pz.name
FROM person_visits pv
         LEFT JOIN person p ON pv.person_id = p.id
         LEFT JOIN pizzeria pz ON pz.id = pv.pizzeria_id
         LEFT JOIN menu m ON m.pizzeria_id = pz.id
WHERE p.name = 'Dmitriy' AND m.price < 800 AND visit_date = '2022-01-08';


SELECT m.name
FROM mv_dmitriy_visits_and_eats m;
