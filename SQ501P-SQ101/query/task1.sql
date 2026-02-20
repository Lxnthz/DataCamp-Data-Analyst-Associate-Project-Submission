SELECT 
    id,
    CASE
        WHEN location IN ('EMEA', 'NA', 'LATAM', 'APAC') THEN location
        ELSE 'Unknown'
    END AS location,
    CASE
        WHEN total_rooms IS NULL OR total_rooms NOT BETWEEN 1 AND 400 THEN 100
        ELSE total_rooms
    END AS total_rooms,
    COALESCE(
        staff_count, 
        (CASE 
            WHEN total_rooms IS NULL OR total_rooms NOT BETWEEN 1 AND 400 THEN 100
            ELSE total_rooms
        END) * 1.5
    ) AS staff_count,
    CASE
        WHEN opening_date IS NULL OR opening_date = '-' OR opening_date NOT BETWEEN '2000' AND '2023' THEN '2023'
        ELSE opening_date
    END AS opening_date,
    CASE
        WHEN target_guests IN ('Leisure', 'Business') THEN target_guests
        WHEN LOWER(target_guests) LIKE 'b%' THEN 'Business'
        ELSE 'Leisure'
    END AS target_guests
FROM public.branch;