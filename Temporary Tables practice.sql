#Using Temporary Tables
#Temporary tables are tables that are only visible to the session that created them. 
#They can be used to store intermediate results for complex queries or to manipulate data before inserting it into a permanent table.

#theres two ways to create temp table
#way 1: This is the less commonly used way - which is to build it exactly like a real table and insert data into it
CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

#we cant see it,,so in order to see the table we write;
CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);
SELECT *
FROM temp_table;

#lets insert some data in the table
CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

SELECT *
FROM temp_table;

INSERT INTO temp_table
VALUES('John','Mwendwa','Bad Boys');

SELECT *
FROM temp_table;

#way 2: Build it by inserting data into it - easier and faster
CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM salary_over_50k;






