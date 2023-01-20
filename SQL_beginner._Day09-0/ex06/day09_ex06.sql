CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(IN pperson VARCHAR DEFAULT 'Dmitriy',
                                                              IN pprice NUMERIC DEFAULT 500,
                                                              IN pdate DATE DEFAULT '2022-01-08')
    RETURNS varchar AS $$
    DECLARE p_name varchar;
    BEGIN
    SELECT pz.name INTO p_name
    FROM person_visits pv
    LEFT JOIN person_order po ON pv.person_id = po.person_id
    LEFT JOIN menu m on m.id = po.menu_id
    LEFT JOIN person p on po.person_id = p.id
    LEFT JOIN pizzeria pz on m.pizzeria_id = pz.id
    WHERE m.price < pprice AND p.name = pperson AND pv.visit_date = pdate;
    RETURN p_name;
    END;
$$ LANGUAGE plpgsql;


SELECT *
FROM fnc_person_visits_and_eats_on_date(pprice := 800);

SELECT *
FROM fnc_person_visits_and_eats_on_date(pperson := 'Dmitriy',pprice := 1000, pdate := '2022-01-08');
