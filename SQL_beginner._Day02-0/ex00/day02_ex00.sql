SELECT p.name, p.rating
FROM pizzeria p LEFT JOIN person_visits pv
ON p.id = pv.pizzeria_id WHERE pv.visit_date IS NULL;