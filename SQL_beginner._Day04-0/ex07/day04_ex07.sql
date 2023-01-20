INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
SELECT   (SELECT MAX(pv.id) FROM person_visits pv) + 1,
         p.id,
         pz.id,
         '2022-01-08'::date
FROM person_visits pv
LEFT JOIN pizzeria pz ON pz.id = pv.pizzeria_id
LEFT JOIN person p on pv.person_id = p.id
LEFT JOIN menu m on pz.id = m.pizzeria_id
WHERE p.name = 'Dmitriy' AND pz.name <> 'Papa Johns' AND m.price < 800;

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;