WITH vizit(per, piz) AS (
    SELECT person_id,
           COUNT(pizzeria_id)
    FROM person_visits
    GROUP BY person_id
)

SELECT p.name AS name,
       piz AS count_of_visits
FROM vizit
LEFT JOIN person p ON p.id = vizit.per
ORDER BY count_of_visits DESC, name ASC
LIMIT 4;
