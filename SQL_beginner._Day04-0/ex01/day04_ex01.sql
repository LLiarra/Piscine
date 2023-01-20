(SELECT f.name
FROM v_persons_female f)
UNION
(SELECT m.name
FROM v_persons_male m)
ORDER BY name;