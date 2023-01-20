WITH generated_date (series)
AS
(SELECT *
FROM generate_series(timestamp '2022-01-01', timestamp '2022-01-10', '1 day'))

SELECT generated_date.series::date AS missing_date
FROM generated_date
         LEFT JOIN person_visits pv
                   ON generated_date.series = pv.visit_date AND (person_id = 1 OR pv.person_id = 2)
WHERE pv.visit_date IS NULL
ORDER BY generated_date.series