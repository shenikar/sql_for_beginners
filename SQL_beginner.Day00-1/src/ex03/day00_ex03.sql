SELECT DISTINCT pv.person_id
FROM person_visits pv
JOIN person_order po ON pv.person_id = po.person_id
WHERE (pv.visit_date BETWEEN '2022-01-06' AND '2022-01-09') 
   OR pv.pizzeria_id = 2
ORDER BY pv.person_id DESC;
