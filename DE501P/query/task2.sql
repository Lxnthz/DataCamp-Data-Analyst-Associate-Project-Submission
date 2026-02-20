SELECT
  repayment_id,
  loan_id,
  repayment_date,
  repayment_amount,
  CASE
    WHEN repayment_channel = '-' AND repayment_amount > 4000 THEN 'bank account'
    WHEN repayment_channel = '-' AND repayment_amount < 1000 THEN 'mail'
    ELSE repayment_channel
  END AS repayment_channel
FROM repayment;