SELECT service_id, branch_id, ROUND(AVG(rating),2) AS avg_rating
FROM public.request
GROUP BY service_id, branch_id
HAVING AVG(rating) < 4.5;