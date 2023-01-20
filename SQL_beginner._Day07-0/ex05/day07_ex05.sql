SELECT DISTINCT p.name
FROM person_order po
LEFT JOIN person p on po.person_id = p.id
ORDER BY name;