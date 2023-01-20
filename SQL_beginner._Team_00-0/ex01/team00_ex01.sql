WITH RECURSIVE a_traces AS (
(SELECT point1 AS tour,
        point1,
        point2,
        cost,
        cost   AS sum
FROM nodes
WHERE point1 = 'a')
UNION ALL
(SELECT parent.tour || ',' || child.point1 AS trace,
        child.point1,
        child.point2,
        child.cost,
        parent.sum + child.cost            AS sum
FROM nodes AS child
JOIN a_traces AS parent ON child.point1 = parent.point2
WHERE tour NOT LIKE '%' || child.point1 || '%' ))

SELECT sum AS total_cost,
        '{' || tour || ',' || point2 || '}' AS tour
FROM a_traces
WHERE length(tour) = 7 AND point2 = 'a'
                       AND (sum = (SELECT MIN(sum) FROM a_traces
                       WHERE length(tour) = 7 AND point2 = 'a')
                       or
                       sum = (SELECT MAX(sum) FROM a_traces
                       WHERE length(tour) = 7 AND point2 = 'a'))
ORDER BY total_cost, tour;