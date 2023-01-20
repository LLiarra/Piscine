CREATE  VIEW v_symmetric_union AS
(((SELECT pv1.person_id
FROM person_visits pv1
WHERE pv1.visit_date = '2022-01-02'::date)
EXCEPT
(SELECT pv2.person_id
 FROM person_visits pv2
 WHERE pv2.visit_date = '2022-01-06'::date)
UNION
((SELECT pv2.person_id
 FROM person_visits pv2
WHERE pv2.visit_date = '2022-01-06'::date)
EXCEPT
(SELECT pv1.person_id
 FROM person_visits pv1
 WHERE pv1.visit_date = '2022-01-02'::date))
ORDER BY person_id));