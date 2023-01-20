WITH male_data (vm_pizzeria) AS (
    SELECT DISTINCT pz.name
    FROM person_order po
             LEFT JOIN menu m ON po.menu_id = m.id
             LEFT JOIN pizzeria pz ON pz.id = m.pizzeria_id
             LEFT JOIN person p ON p.id = po.person_id
    WHERE p.gender = 'male'),
     female_data (vf_pizzeria) AS (
         SELECT DISTINCT pz.name
             FROM person_order po
             LEFT JOIN menu m ON po.menu_id = m.id
             LEFT JOIN pizzeria pz ON pz.id = m.pizzeria_id
             LEFT JOIN person p ON p.id = po.person_id
         WHERE p.gender = 'female')

(SELECT ml.vm_pizzeria AS pizzeria_name
     FROM male_data ml
     WHERE ml.vm_pizzeria NOT IN (SELECT female_data.vf_pizzeria FROM female_data))
UNION
(SELECT fm.vf_pizzeria AS pizzeria_name
     FROM female_data fm
     WHERE fm.vf_pizzeria NOT IN (SELECT  male_data.vm_pizzeria FROM male_data))
ORDER BY pizzeria_name;
