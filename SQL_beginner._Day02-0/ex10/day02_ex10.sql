SELECT p.name AS person_name1,
       p1.name AS person_name2,
       p.address AS common_address
FROM person p
LEFT JOIN person p1 ON p.address = p1.address
WHERE p.name <> p1.name AND p.id > p1.id
ORDER BY person_name1, person_name2, common_address;
