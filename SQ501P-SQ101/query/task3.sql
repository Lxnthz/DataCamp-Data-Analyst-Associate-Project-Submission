SELECT
    s.description AS service_description,
    b.id AS branch_id,
    b.location,
    r.id AS request_id,
    r.rating
FROM
    request r
    JOIN branch b ON b.id = r.branch_id
    JOIN service s ON r.service_id = s.id
WHERE
    s.description IN ('Meal', 'Laundry')
    AND b.location IN ('EMEA', 'LATAM');