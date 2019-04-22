/*
Write a query calculating the amount of error (i.e.: Caused by broken key '0' affecting average monthly salaries), and round it up to the next integer.
*/

SELECT CEIL(AVG(Salary)- AVG(REPLACE(Salary,'0','')))
FROM employees;
