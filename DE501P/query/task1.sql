SELECT 
    client_id,
    CAST(date_of_birth AS DATE) AS date_of_birth,
    CASE
        WHEN LOWER(employment_status) = 'unemployed' THEN 'unemployed'
        ELSE 'employed'
    END AS employment_status,
    UPPER(country) AS country
FROM client;