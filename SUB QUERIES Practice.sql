# Subqueries
#So subqueries are queries within queries.
#lets use subqueries in where clause
SELECT *
FROM employee_demographics
WHERE employee_id IN 
                   (SELECT employee_id
					  FROM employee_salary
                   WHERE dept_id = 1)
;

#lets use subqueries in a select clause
#Let's say we want to look at the salaries and compare them to the average salary
SELECT first_name,salary, AVG(salary)
FROM employee_salary
GROUP BY first_name,salary
;

#it's giving us the average PER GROUP which we don't want
SELECT first_name,salary, 
(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary
;

#We can also use it in the FROM Statement
#here's a good use for a subquery
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

#if we want to find the average of oldest,youngest ages and count for female and males
SELECT gender, AVG(`MAX(age)`)
FROM
(SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender) AS Agg_table
GROUP BY gender
;

#make it look better
SELECT  AVG(max_age)
FROM
(SELECT gender, 
AVG(age) AS avg_age,
 MAX(age) AS max_age, 
 MIN(age) AS min_age,
 COUNT(age) AS count_age
FROM employee_demographics
GROUP BY gender) AS Agg_table
;

