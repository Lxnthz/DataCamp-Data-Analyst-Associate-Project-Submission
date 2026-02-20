SELECT
    l.loan_type,
    c.country,
    AVG(l.interest_rate) AS avg_rate
FROM
    loan AS l
JOIN
    client AS c ON l.client_id = c.client_id
GROUP BY
    l.loan_type, c.country
ORDER BY
    l.loan_type, country;