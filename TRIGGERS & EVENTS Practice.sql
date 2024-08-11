#Triggers
#a Trigger is a block of code that executes automatically executes when an event takes place in a table.
#for example we have these 2 tables, invoice and payments - when a client makes a payment we want it to update the invoice field "total paid"
#to reflect that the client has indeed paid their invoice
SELECT * FROM employee_salary;

SELECT * FROM employee_demographics;

#so really when we get a new row or data is inserted into the payments table we want a trigger to update the correct invoice with the amount that was paid
#let's write this out

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

 INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, 
 salary, dept_id)
 VALUES(13, 'Kevin', 'Ngugi', 'Senior Data Analyst', 1000000, NULL);
#now it was updated in the payments table and the trigger was triggered and update the corresponding values in the invoice table


#Events
#Events are task or block of code that gets executed according to a schedule. These are fantastic for so many reasons. Importing data on a schedule. Scheduling reports to be exported to files and so many other things
#you can schedule all of this to happen every day, every monday, every first of the month at 10am. Really whenever you want
#This really helps with automation in MySQL

#let's say Parks and Rec has a policy that anyone over the age of 60 is immediately retired with lifetime pay
#All we have to do is delete them from the demographics table

SELECT *
FROM employee_demographics;

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 1 MONTH
DO
BEGIN
	DELETE 
	FROM employee_demographics
    WHERE age >= 60 ;
END $$
DELIMITER ;

#if we run it again you can see Jerry is now retired

SHOW VARIABLES LIKE 'event%' ;






