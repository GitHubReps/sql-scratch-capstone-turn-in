/* Unit1 */
SELECT question,
   COUNT(DISTINCT user_id)
FROM survey
GROUP BY 1;

/* Unit2 */

WITH data AS (
SELECT DISTINCT q.user_id,
   CASE WHEN
   h.user_id IS NOT NULL THEN 'True' ELSE 'False' END
   AS 'is_home_try_on',
   CASE WHEN 
   h.number_of_pairs IS NULL THEN 'NULL' ELSE h.number_of_pairs END
   AS 'number_of_pairs', 
   CASE WHEN
   p.user_id IS NULL THEN 'False' ELSE 'True'   	 END
   AS 'is_purchase'
FROM quiz q
LEFT JOIN home_try_on h
   ON q.user_id = h.user_id
LEFT JOIN purchase p
   ON p.user_id = q.user_id)

SELECT COUNT(user_id) AS ‘Costumers tried & purchased’
FROM data
WHERE is_home_try_on = 'True' AND is_purchase = 'True';
