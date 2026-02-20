SELECT service_id, 
		branch_id, 
		ROUND(AVG(time_taken), 2) AS avg_time_taken, 
		MAX(time_taken) AS max_time_taken
FROM public.request
GROUP BY service_id, branch_id;