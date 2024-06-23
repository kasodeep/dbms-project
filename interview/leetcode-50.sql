-- 1
SELECT product_id FROM Products AS P WHERE P.low_fats = 'Y' AND P.recyclable = 'Y';

-- 2
SELECT name
FROM Customer
WHERE COALESCE(referee_id, 0) <> 2;

-- 3
SELECT P.name, P.population, P.area 
FROM World AS P
WHERE P.area >= 3000000 OR P.population >= 25000000;

-- 4
SELECT DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id;

-- 5
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;

-- 6
SELECT unique_id, name
FROM EmployeeUNI AS I
RIGHT JOIN Employees AS E ON I.id = E.id;

-- 7
SELECT product_name, year, price
FROM Sales AS S
JOIN Product AS P ON S.product_id = P.product_id;

-- 8
SELECT v.customer_id, COUNT(v.visit_id) AS count_no_trans 
from Visits v 
LEFT JOIN Transactions t 
ON v.visit_id = t.visit_id  
WHERE t.transaction_id IS NULL 
GROUP BY v.customer_id; 