WITH male_data (vm_pizzeria) AS (
SELECT pz.name
FROM person_visits pv
        LEFT JOIN pizzeria pz ON pz.id = pv.pizzeria_id
        LEFT JOIN person p ON p.id = pv.person_id
WHERE p.gender = 'male'),
female_data (vf_pizzeria) AS (
SELECT pz.name
FROM person_visits pv
         LEFT JOIN pizzeria pz ON pz.id = pv.pizzeria_id
         LEFT JOIN person p ON p.id = pv.person_id
WHERE p.gender = 'female')

(SELECT ml.vm_pizzeria AS pizzeria_name
FROM male_data ml
EXCEPT ALL
SELECT fm.vf_pizzeria
FROM female_data fm)
UNION ALL
(SELECT fm.vf_pizzeria AS pizzeria_name
FROM female_data fm
EXCEPT ALL
SELECT ml.vm_pizzeria
FROM male_data ml)
ORDER BY pizzeria_name;