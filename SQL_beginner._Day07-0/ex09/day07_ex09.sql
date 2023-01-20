SELECT p.address,
       CAST(MAX(p.age)::numeric - (MIN(p.age)::numeric / MAX(p.age)::numeric)
       AS NUMERIC(10, 2)) AS formula,
       CAST(AVG(p.age) AS NUMERIC(10, 2)) AS average,
       MAX(p.age) - (MIN(p.age) / MAX(p.age)) > AVG(p.age) AS comparison
FROM person p
GROUP BY p.address
ORDER BY address;