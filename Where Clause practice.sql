#The WHERE clause is used to filter records (rows of data)
#It's going to extract only those records that fulfill a specified condition.

SELECT *
FROM employee_salary
WHERE first_name = 'Leslie'
;

#checking salary greater than 50000
SELECT *
FROM employee_salary
WHERE salary > 50000
;

#checking salary greater or equal to 50000
SELECT *
FROM employee_salary
WHERE salary >= 50000
;

#checking salary less than 50000
SELECT *
FROM employee_salary
WHERE salary < 50000
;

#checking salary less than or equal to 50000
SELECT *
FROM employee_salary
WHERE salary <= 50000
;

#checking gender for female only
SELECT *
FROM employee_demographics
WHERE gender = 'Female'
;

#checking gender for male only by using not equal to female formula
SELECT *
FROM employee_demographics
WHERE gender != 'Female'
;

#filtering date greater than 1985
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
;

#logical operators in where clause(AND)
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male'
;

#logical operators in where clause(OR)
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'male'
;

#logical operators in where clause(OR NOT)
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male'
;

#PEMDAS looking for unique values
SELECT *
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55
;

#LIKE Statement using special characters % and _
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'Jer%'
;

#looking for name that starts with er
SELECT *
FROM employee_demographics
WHERE first_name LIKE '%er%'
;

#looking for name that starts with a
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%'
;

#looking for name that starts with a and has two characters after it
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__'
;

#looking for name that starts with a and has three characters after it
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___'
;

#looking for name that starts with a ,has three characters after it and also it can have anything after that
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%'
;

#looking for name born in certain date
SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1989%'
;
