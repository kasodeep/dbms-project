-- wild cards: % _

SELECT * FROM employees
WHERE first_name LIKE "s%";

SELECT * FROM employees
WHERE hire_date LIKE "%05";

SELECT * FROM employees
WHERE job LIKE "_ook";

SELECT * FROM employees
WHERE hire_date LIKE "____-__-02";

SELECT * FROM employees
WHERE job LIKE "_a%";