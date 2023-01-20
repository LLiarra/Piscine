SELECT
    (SELECT name FROM person WHERE id = NAME.person_id)
FROM (SELECT person_id
      FROM person_order
      WHERE (menu_id = 13 OR menu_id = 14 OR menu_id = 18) AND order_date = '2022-01-07') AS NAME;