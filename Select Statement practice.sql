#we are selecting everything
SELECT * 
FROM parks_and_recreation.employee_demographics;

#we are selecting a specific column
SELECT first_name
FROM employee_demographics;

#let's add some more columns, we just need to separate the columns with columns
SELECT first_name, last_name
FROM employee_demographics;

#lets put the columns in order and add 10 to years
SELECT first_name, 
last_name, 
birth_date,
age,
age + 10
FROM parks_and_recreation.employee_demographics;

#PEMDAS order of arithmetic calculation
SELECT first_name, 
last_name, 
birth_date,
age,
(age + 10) * 10
FROM parks_and_recreation.employee_demographics;

#selectin unique values
SELECT DISTINCT gender
FROM parks_and_recreation.employee_demographics;