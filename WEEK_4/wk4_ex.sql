-- ==============================
-- Write an SQL query to show the total payment amount for each payment date from payments table. 
--(use sampleDB shared during week 2 class)🏫 💥
--Display the payment date and the total amount paid on that date.
--Sort the results by payment date in descending order.
--Show only the top 5 latest payment dates.Query to show total payment amount for each date
-- ==============================

SELECT 
    payment_date, 
    SUM(amount) AS total_amount 
FROM 
    payments 
GROUP BY 
    payment_date 
ORDER BY 
    payment_date DESC 
LIMIT 5;
