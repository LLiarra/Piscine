CREATE INDEX idx_person_order_multi
    ON person_order USING btree (person_id, menu_id) INCLUDE (order_date);

EXPLAIN ANALYZE SELECT *
FROM person_order
WHERE person_id = 1;

EXPLAIN ANALYZE SELECT *
FROM person_order po
LEFT JOIN person p ON po.person_id = p.id
WHERE person_id = 8 AND menu_id = 19;

EXPLAIN ANALYZE SELECT person_id, menu_id,order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19;

