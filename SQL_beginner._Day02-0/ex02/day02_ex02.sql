SELECT
    CASE
        WHEN p.name IS NULL THEN '-'
        ELSE p.name
        END AS person_name,
    temp.visit_date,
    CASE
        WHEN pz.name IS NULL THEN '-'
        ELSE pz.name
        END AS pizzeria_name
FROM person p
FULL OUTER JOIN (SELECT * FROM person_visits pv WHERE pv.visit_date BETWEEN '2022-01-01' AND '2022-01-03') AS temp
ON temp.person_id = p.id
FULL OUTER JOIN pizzeria pz ON temp.pizzeria_id = pz.id
ORDER BY person_name, temp.visit_date, pizzeria_name;