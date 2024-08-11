#Case Statements
#A Case Statement allows you to add logic to your Select Statement, sort of like an if else statement in other programming languages or even things like Excel
SELECT first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
END
FROM employee_demographics;

#lets add more statement
SELECT first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
	WHEN age BETWEEN 31 and 50 THEN 'Old'
END
FROM employee_demographics;

#making it more complicated
SELECT first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
	WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age >= 50 THEN 'On Deaths Door'
END 
FROM employee_demographics;

#renaming to make it more appealing
SELECT first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
	WHEN age BETWEEN 31 and 50 THEN 'Old'
    WHEN age >= 50 THEN 'On Deaths Door'
END AS Age_Bracket
FROM employee_demographics;

#we can also perform calculations
#Let's look at giving bonuses to employees
SELECT *
FROM employee_salary;

#Pawnee Council sent out a memo of their bonus and pay increase structure so we need to follow it
#Basically if they make < 50000 = 5% raise -  generous
#if they make > 50000 = 7% raise - very generous
#they work in finance department = 10% bonus
SELECT first_name, last_name,salary,
CASE
	WHEN salary < 50000 THEN salary + (salary*0.05) #or can use salary < 50000 THEN salary*1.05
    WHEN salary > 50000 THEN salary*1.07
END AS New_Salary,
CASE
	WHEN dept_id = 6 THEN salary * .10
END AS Bonus
FROM employee_salary;


SELECT *
FROM employee_salary;
SELECT *
FROM parks_departments;
