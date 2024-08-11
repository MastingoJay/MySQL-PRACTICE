#string functions.
#we start with length function
SELECT LENGTH('skyfall');

#We can look how long each persons name is
SELECT first_name, LENGTH(first_name)
FROM employee_demographics;

#we can order by from shortest to length
SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2
;

#UPPER function- it changes all string functions to upper case
SELECT UPPER('john doe');

SELECT first_name, UPPER(first_name)
FROM employee_demographics;

#Lower function - it changes all string functions to lower case
SELECT LOWER('JOHN DOE');

SELECT first_name, LOWER(first_name)
FROM employee_demographics;

#TRIM function - removes space from left or right
SELECT TRIM('               john doe              ');
#left trim - removes space from left
SELECT LTRIM('               john doe              ');
#right trim - removes space from right
SELECT RTRIM('               john doe             ');

#left string - selects how many characters to output from the left
#right string - selects how many characters to output from the right
SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 4)
FROM employee_demographics;

#substring - allows you to specify a starting point and how many characters you want so you can take characters from anywhere in the string.
SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name,3,2)
FROM employee_demographics;

#we wanna find the month everyone is born
SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name,3,2),
birth_date,
SUBSTRING(birth_date,6,2) AS birth_month
FROM employee_demographics;

#REPLACE FUNCTION - it will replace specific characters with the characters you want
SELECT first_name, REPLACE(first_name, 'a','z')
FROM employee_demographics;

#LOCATE FUNCTION - 
SELECT LOCATE('d','john doe');

SELECT first_name, LOCATE('An',first_name)
FROM employee_demographics;

#concatenate - it will combine the strings together
SELECT first_name, last_name,
CONCAT(first_name,' ',last_name) AS full_name
FROM employee_demographics;








