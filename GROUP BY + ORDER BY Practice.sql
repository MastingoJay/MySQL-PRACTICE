#GROUP BY is going to allow us to group rows that have the same data and run aggregate functions on them

SELECT *
FROM employee_demographics;

#We wanna group gender column
SELECT gender
FROM employee_demographics
GROUP BY gender
;

#we wanna look at age,,by using aggregate functions like AVG
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;

#we wanna look at occupation
SELECT occupation
FROM employee_salary
GROUP BY occupation
;

#we wanna look at salary,,
SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary
;

#we wanna use other aggregate functions like MAX
SELECT gender,AVG(age), MAX(age)
FROM employee_demographics
GROUP BY gender
;

#we wanna use other aggregate functions like MIN
SELECT gender,AVG(age), MAX(age), MIN(age)
FROM employee_demographics
GROUP BY gender
;

#we wanna use other aggregate functions like COUNT
SELECT gender,AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;

#ORDER BY is used to sort the results set by either ascending or descending order
#ORDER BY ascending fomart
SELECT *
FROM employee_demographics
ORDER BY first_name ASC;

#ORDER BY descending fomart
SELECT *
FROM employee_demographics
ORDER BY first_name DESC;

#ORDER BY gender and age
SELECT *
FROM employee_demographics
ORDER BY gender,age
;

#ORDER BY gender and age but age should be in ascending fomart
SELECT *
FROM employee_demographics
ORDER BY age,gender
;

#ORDER BY column position
SELECT *
FROM employee_demographics
ORDER BY 5, 4
;
