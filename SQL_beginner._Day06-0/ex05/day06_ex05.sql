COMMENT ON table person_discounts
IS 'Every person wants to see a personal discount and every business wants to be closer for clients.';
COMMENT ON COLUMN person_discounts.id
IS 'id attribute is a Primary Key';
COMMENT ON COLUMN person_discounts.person_id
IS 'person_id attribute is a foreign keys';
COMMENT ON COLUMN person_discounts.pizzeria_id
IS 'pizzeria_id attribute is a foreign keys ';
COMMENT ON COLUMN person_discounts.discount
IS 'value of discount in percent';