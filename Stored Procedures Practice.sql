#STORED PROCEDURES
#They are ways to save your sql codes that you can reuse over and over again.
#First let's just write a super simple query

SELECT *
FROM employee_salary
WHERE salary >= 50000;

#Now let's put this into a stored procedure
CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000;

#Now if we run this it will work and create the stored procedure
#we can click refresh and see that it is there

#lets see how we can call it
CALL large_salaries();
#Now how we have written is not actually best practice.alter
#Usually when writing a stored procedure you don't have a simple query like that. It's usually more complex
#if we tried to add another query to this stored procedure it wouldn't work. It's a separate query:
CREATE PROCEDURE large_salaries2()
SELECT *
FROM employee_salary
WHERE salary >= 50000;
SELECT *
FROM employee_salary
WHERE salary >= 10000;

#Best practice is to use a delimiter and a Begin and End to really control what's in the stored procedure
# the delimiter is what separates the queries by default, we can change this to something like two $$

DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

#let's refresh to see the SP
#now we can run this stored procedure
CALL large_salaries3();

# we can also create a stored procedure by right clicking on Stored Procedures and creating one:

#we can also add parameters
DELIMITER $$
CREATE PROCEDURE large_salaries4(employee_id INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id = employee_id
	;
END $$
DELIMITER ;

CALL large_salaries4(1);

