WITH all_visit (id, count) AS (
SELECT pv.person_id,
       COUNT(pizzeria_id) AS count
FROM person_visits pv
LEFT JOIN pizzeria pz ON pz.id = pv.pizzeria_id
GROUP BY person_id
HAVING COUNT(pizzeria_id) > 3)

SELECT p.name,
       av.count AS count_of_visits
FROM all_visit av
LEFT JOIN person p ON p.id = av.id;