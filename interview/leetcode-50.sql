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

-- 9
SELECT W.id AS Id
FROM Weather AS W
JOIN Weather AS T ON W.recordDate = T.recordDate + INTERVAL 1 DAY
WHERE W.temperature > T.temperature;

-- 10
SELECT a1.machine_id, ROUND(AVG(a2.TIMESTAMP - a1.TIMESTAMP), 3) AS processing_time 
FROM Activity a1
JOIN Activity a2 
ON a1.machine_id = a2.machine_id AND a1.process_id = a2.process_id
AND a1.activity_type='start' and a2.activity_type='end'
GROUP BY a1.machine_id

-- 11
# Write your MySQL query statement below
SELECT name, bonus
FROM Employee AS E
LEFT JOIN Bonus AS B
ON E.empId = B.empId
WHERE COALESCE(bonus, 0) < 1000;

-- 12
SELECT S.student_id, S.student_name, U.subject_name, count(E.subject_name) AS attended_exams 
FROM Students AS S
JOIN Subjects AS U 
LEFT JOIN Examinations AS E ON S.student_id = E.student_id AND E.subject_name = U.subject_name 
GROUP BY S.student_id, S.student_name, U.subject_name
ORDER BY S.student_id

-- 13
SELECT E.name
FROM Employee AS E
JOIN Employee AS M ON E.id = M.managerId
GROUP BY E.id
HAVING COUNT(M.managerId) >= 5;

-- 14

-- 15
SELECT *
FROM Cinema
WHERE description != 'boring' AND id % 2 <> 0
ORDER BY rating DESC;

-- 16
SELECT DISTINCT P.product_id, IFNULL(ROUND(SUM(P.price * U.units) / SUM(U.units), 2), 0) AS average_price
FROM Prices AS P
LEFT JOIN UnitsSold AS U 
ON P.product_id = U.product_id AND U.purchase_date BETWEEN P.start_date AND P.end_date
GROUP BY P.product_id;

-- 17
SELECT project_id, ROUND(SUM(experience_years) / COUNT(*), 2) AS average_years
FROM Project AS P
JOIN Employee AS E ON P.employee_id = E.employee_id
GROUP BY project_id;

-- 18
SELECT contest_id, ROUND(COUNT(*) / (SELECT COUNT(*) FROM Users) * 100, 2) AS percentage
FROM Users AS U
JOIN Register AS R ON U.user_id = R.user_id
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC;

-- 19
SELECT Q.query_name, ROUND(AVG(Q.rating / Q.position), 2) AS quality,
 ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 end) * 100 / count(*), 2) AS poor_query_percentage
FROM Queries AS Q
WHERE Q.query_name IS NOT NULL
GROUP BY query_name;

-- 20
SELECT  SUBSTR(trans_date,1,7) AS month,
        country,
        COUNT(id) AS trans_count, SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
        SUM(amount) AS trans_total_amount,
        SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY month, country

-- 21
SELECT 
    ROUND(SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT customer_id), 2) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN (
    SELECT customer_id, MIN(order_date) AS first_order_date
    FROM Delivery
    GROUP BY customer_id
);

-- 22

-- 23
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY 1;

-- 24
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN DATE_SUB("2019-07-28", INTERVAL 30 DAY) AND "2019-07-27"
GROUP BY 1;

-- 25
SELECT product_id, year AS first_year, quantity, price
FROM Sales
WHERE (product_id, year) IN (
    SELECT product_id, MIN(year) 
    FROM Sales
    GROUP BY product_id
)

-- 26
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(student) >= 5;

-- 27
SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;

-- 28
SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
) AS unique_numbers;

-- 29
SELECT customer_id
FROM Customer AS C
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(product_key) FROM Product);