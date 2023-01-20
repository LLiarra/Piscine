WITH vizit(per, piz) AS (
SELECT person_id,
       COUNT(pizzeria_id)
FROM person_visits
GROUP BY person_id
)

SELECT per AS person_id,
       piz AS count_of_visits
FROM vizit
ORDER BY count_of_visits DESC, person_id ASC;
