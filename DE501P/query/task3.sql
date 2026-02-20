SELECT
    client.client_id,
    contract.contract_date,
    loan.principal_amount,
    loan.loan_type
FROM
    client
JOIN
    loan ON client.client_id = loan.client_id
JOIN
    contract ON loan.contract_id = contract.contract_id
WHERE
    client.country = 'USA'
    AND contract.contract_date >= '2022-01-01';