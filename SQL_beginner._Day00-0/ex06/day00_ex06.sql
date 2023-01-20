SELECT p.name,
    CASE
        WHEN p.name = 'Denis' THEN 'true'
        ELSE 'false'
END AS check_name
FROM person p,  (SELECT person_id
                 FROM person_order po
                 WHERE (menu_id = 13 OR menu_id = 14 OR menu_id = 18) AND order_date = '2022-01-07') AS NAME
WHERE NAME.person_id =  p.id;