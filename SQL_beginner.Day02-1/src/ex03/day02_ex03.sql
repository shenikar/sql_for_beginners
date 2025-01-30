WITH all_dates AS (
  SELECT 
    generate_series(
      '2022-01-01' :: DATE, '2022-01-10' :: DATE, 
      interval '1 day'
    ) AS days
) 
SELECT 
  all_dates.days :: DATE AS missing_date 
FROM 
  all_dates 
  FULL JOIN (
    SELECT 
      DISTINCT visit_date 
    FROM 
      person_visits 
    WHERE 
      person_id = 1 
      OR person_id = 2 
      AND visit_date BETWEEN '2022-01-01' 
      AND '2022-01-10'
  ) AS d ON all_dates.days = d.visit_date 
WHERE 
  d.visit_date IS NULL 
ORDER BY 
  all_dates.days;
