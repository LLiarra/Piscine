SET ENABLE_SEQSCAN TO OFF;

CREATE UNIQUE INDEX idx_person_discounts_unique
    ON person_discounts USING btree (person_id, pizzeria_id);

EXPLAIN ANALYSE SELECT *
FROM person_discounts
WHERE person_id = 1;