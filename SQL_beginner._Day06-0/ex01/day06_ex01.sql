WITH count_order(per, piz, discount) AS (
SELECT person_id,
       pz.id,
       COUNT(pz.id)
FROM person_order
LEFT JOIN menu m ON person_order.menu_id = m.id
LEFT JOIN  pizzeria pz on m.pizzeria_id = pz.id
GROUP BY person_id, pz.id
ORDER BY person_id
)

INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT  ROW_NUMBER() OVER() AS id,
        co.per AS person_id,
        co.piz AS pizzeria_id,
        CASE
        WHEN co.discount = 1 THEN 10.5
        WHEN co.discount  = 2 THEN 22.0
        ELSE 30.0
        END AS discount
FROM count_order co;

