SELECT po.order_date,
       temp_person.name || '(age:' || temp_person.age || ')' AS person_information
FROM person_order po
        NATURAL JOIN (SELECT id AS temp_id, name, age FROM person) AS temp_person
WHERE po.person_id = temp_person.temp_id
ORDER BY order_date, person_information;
