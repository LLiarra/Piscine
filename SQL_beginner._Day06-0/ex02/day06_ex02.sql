SELECT p.name AS name,
       m.pizza_name AS pizza_name,
       m.price,
       (m.price * (100 - pd.discount)) * 0.01  AS discount_price,
       pz.name AS pizzeria_name
FROM person_order po
LEFT JOIN person_discounts pd ON po.person_id = pd.person_id
LEFT JOIN person p on po.person_id = p.id
LEFT JOIN menu m on po.menu_id = m.id
LEFT JOIN pizzeria pz on m.pizzeria_id = pz.id
ORDER BY name, pizza_name;
