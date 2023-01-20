CREATE INDEX idx_person_name ON person USING btree (upper(name));

EXPLAIN ANALYSE SELECT name
FROM person WHERE upper(name) = 'ANNA';

EXPLAIN ANALYSE SELECT name
FROM person WHERE name = 'ANNA';