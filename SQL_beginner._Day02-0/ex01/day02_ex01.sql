SELECT missing_date::date
FROM generate_series(timestamp '2022-01-01', timestamp '2022-01-10', '1 day') AS missing_date
    LEFT JOIN person_visits pv
        ON missing_date = pv.visit_date AND (person_id = 1 OR pv.person_id = 2)
WHERE pv.visit_date IS NULL
ORDER BY missing_date
