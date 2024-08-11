# Having vs Where
# Both were created to filter rows of data, but they filter 2 separate things
# Where is going to filters rows based off columns of data
# Having is going to filter rows based off aggregated columns when grouped

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;

#let's try to filter on the avg age using where
SELECT gender, AVG(age)
FROM employee_demographics
WHERE AVG(age) > 40
GROUP BY gender
;  #has an error

#let's try to filter on the avg age using having
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;  

# using both where and having on same query
SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000
; 