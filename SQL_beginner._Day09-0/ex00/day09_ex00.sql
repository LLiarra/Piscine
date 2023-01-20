CREATE TABLE person_audit
(created TIMESTAMP WITH TIME ZONE DEFAULT current_timestamp NOT NULL,
 type_event CHAR(1) DEFAULT 'I' NOT NULL,
 row_id BIGINT NOT NULL,
 name VARCHAR NOT NULL,
 age INTEGER NOT NULL DEFAULT 10,
 gender VARCHAR DEFAULT 'female' NOT NULL,
 address VARCHAR
);

alter table person_audit add constraint ch_type_event check ( type_event in ('I','U', 'D') );
alter table person_audit add constraint ch_gender check ( gender in ('female','male') );

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $trg_person_insert_audit$
BEGIN
    INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
    VALUES ( default, 'I', new.id, new.name, new.age, new.gender, new.address);
    RETURN NEW;
END;
$trg_person_insert_audit$ LANGUAGE plpgsql;

CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) VALUES (10,'Damir', 22, 'male', 'Irkutsk');
