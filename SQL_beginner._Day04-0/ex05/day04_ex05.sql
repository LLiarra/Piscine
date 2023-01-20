CREATE VIEW v_price_with_discount AS
SELECT p.name,
       m.pizza_name,
       m.price,
       CAST(price - (price * 0.1) AS BIGINT) AS discount_price
FROM person_order po
LEFT JOIN person p on po.person_id = p.id
LEFT JOIN menu m on po.menu_id = m.id
ORDER BY name, pizza_name;
