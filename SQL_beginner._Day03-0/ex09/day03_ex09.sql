INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
(SELECT  (SELECT MAX(pv.id) FROM person_visits pv) + 1,
        p.id,
        (SELECT pz.id FROM pizzeria pz WHERE pz.name = 'Dominos'),
        '2022-02-24'::date
FROM person p
WHERE p.name = 'Irina')
UNION
(SELECT  (SELECT MAX(pv.id) FROM person_visits pv) + 2,
        p.id,
        (SELECT pz.id FROM pizzeria pz WHERE pz.name = 'Dominos'),
        '2022-02-24'::date
FROM person p
WHERE p.name = 'Denis');