CREATE UNIQUE INDEX idx_menu_unique
    ON menu USING btree (pizzeria_id, pizza_name);


EXPLAIN ANALYSE SELECT pizza_name,
                       pizzeria_id
FROM menu
WHERE pizzeria_id = 6;

EXPLAIN ANALYSE SELECT pizza_name,
                       pizzeria_id
FROM menu
WHERE pizzeria_id = 9;