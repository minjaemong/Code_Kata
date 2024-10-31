# Write your MySQL query statement below
SELECT ROUND(SUM(CASE WHEN first_order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) immediate_percentage
FROM    
    (
    SELECT MIN(order_date) first_order_date, customer_pref_delivery_date
    FROM Delivery
    GROUP BY customer_id
    ) a