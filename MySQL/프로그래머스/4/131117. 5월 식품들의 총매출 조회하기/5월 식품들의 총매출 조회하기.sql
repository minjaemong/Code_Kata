-- 코드를 입력하세요
SELECT a.PRODUCT_ID, b.PRODUCT_NAME, SUM(a.AMOUNT) * b.PRICE TOTAL_SALES
FROM FOOD_ORDER a JOIN FOOD_PRODUCT b ON a.PRODUCT_ID = b.PRODUCT_ID
WHERE DATE_FORMAT(a.PRODUCE_DATE, '%Y-%m') = '2022-05'
GROUP BY a.PRODUCT_ID
ORDER BY TOTAL_SALES DESC, a.PRODUCT_ID

