# Joinsx
# joins allow you to combine 2 tables together (or more) if they have a common column.
# doesn't mean they need the same column name, but the data in it are the same and can be used to join the tables together
# there are several joins we will look at today, inner joins, outer joins, and self joins

 #here are the first 2 tables - let's see what columns and data in the rows we have in common that we can join on
 SELECT *
 FROM employee_demographics;
 SELECT *
 FROM employee_salary;
 
 #Lets start with inner join-returns rows that are the same in both columns from both tables
 SELECT *
 FROM employee_demographics
 INNER JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id
 ;
 
 #lets use aliasing in joins
 SELECT *
 FROM employee_demographics AS dem
 INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
 ;
 
#selecting actual columns
 SELECT dem.employee_id, age, occupation
 FROM employee_demographics AS dem
 INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
 ;
 
#Outer joins
#for outer joins we have a left and a right join
# a left join will take everything from the left table even if there is no match in the join, but will only return matches from the right table
# a right join will take everything from the right table even if there is no match in the join, but will only return matches from the left table
 
  SELECT *
 FROM employee_demographics AS dem
 LEFT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
 ;
 
 SELECT *
 FROM employee_demographics AS dem
 RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
 ;
 
 # SELF JOIN
 # Its a join you tie the table to itself
 #lets do a secret santa so the person with the higher ID is the person's secret santa
 SELECT * 
 FROM employee_salary AS emp1
 JOIN employee_salary AS emp2
	ON emp1.employee_id  = emp2.employee_id
 ;

#let's change it to give them their secret santa
 SELECT * 
 FROM employee_salary AS emp1
 JOIN employee_salary AS emp2
	ON emp1.employee_id + 1 = emp2.employee_id
 ;
 
 SELECT emp1.employee_id AS emp_santa,
 emp1.first_name AS first_name_santa,
 emp1.last_name AS last_name_santa,
 emp2.employee_id AS emp_name,
 emp2.first_name AS first_name_emp,
 emp2.last_name AS last_name_emp
 FROM employee_salary emp1
 JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id
 ;
 
 #Joining multiple tables together
 SELECT *
 FROM employee_demographics AS dem
 INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
    INNER JOIN parks_departments pd
		ON sal.dept_id = pd.department_id
    ;
    

 
 
 
 
 
 
 
 
 
 
 
 
 
 