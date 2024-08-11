# LIMIT and ALIASING
# Limit is just going to specify how many rows you want in the output

#Lets try to specify 3 rows
SELECT *
FROM employee_demographics
LIMIT 3
;

#lets try to combine with order by
#lets try to order by the three oldest employees
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3
;

#lets try to order by the three youngest employees
SELECT *
FROM employee_demographics
ORDER BY age ASC
LIMIT 3
;

# now there is an additional paramater in limit which we can access using a comma that specifies the starting place
# this now says start at position 2 and take 1 row after that
SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1
;

# Aliasing
#aliasing is just a way to change the name of the column (for the most part) and it can also be used in joins
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
;

#we can use the keyword AS to specify we are using an Alias
SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40
;
