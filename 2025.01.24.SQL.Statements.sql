CREATE DATABASE ltsu;
USE ltsu;
CREATE TABLE employee (
empid char(5) PRIMARY KEY, 
name varchar(100) NOT NULL,
gender char(6) NOT NULL CHECK (gender IN('Male','Female','Trans')),
department varchar(50) not null,
designation varchar(50) not null,
dob date,
email varchar(50),
mobile char(10) NOT NULL,
salary int NOT NULL CHECK(salary>0)
);
DESC employee;
INSERT INTO employee 
VALUES ('E0001','Amit Verma','Male','Sales','Manager','1988-03-23','amit@gmail.com','1122334455',45000);

INSERT INTO employee (empid,name,gender,department,designation,mobile,salary) 
VALUES ('E0002','Rohit Verma','Male','Marketing','Director','2233445566',59000);

INSERT INTO employee (empid,name,gender,department,designation,mobile,salary) 
VALUES ('E0003','Suresh Sharma','Male','Human Resource','Manager','3344556677',70000);

INSERT INTO employee (empid,name,gender,department,designation,mobile,salary) 
VALUES ('E0004','Harish Sharma','Male','Sales','Executive','4455667700',23000);


-- view all records with all columns
SELECT * FROM employee;

-- view all records with selected columns
SELECT empid, name, salary FROM employee;

-- view all records with selected columns using AS clause
SELECT empid as 'Employee ID', Name, Salary FROM employee;

-- Show the employee id, deparatment, designation, salary and tax as 30% of salary
SELECT empid as 'Employee ID', Name, Department, Designation, Salary, 0.3*Salary as 'Tax' FROM employee;

-- Show the employee having employee id as E0002
SELECT * FROM employee WHERE empid='E0002';

-- Show the employee other than employee id E0002
SELECT * FROM employee WHERE NOT empid='E0002';

-- Secret statement for 24-01-2025
SELECT current_timestamp();

-- SELECT All those records where salary is greater than 50000
SELECT * FROM employee WHERE salary>50000;

-- SELECT All those employee who blongs to Sales or Marketing Department
SELECT * FROM employee WHERE department='Sales' OR department='Marketing';
-- Using IN operator
SELECT * FROM employee WHERE department IN ('Sales','Marketing');

-- Show all employee who are managers in sales department
SELECT * FROM employee WHERE department='Sales' AND designation='Manager';

-- Show all employees whose salary in the range of 40000 to 60000
SELECT * FROM employee WHERE salary>=40000 AND salary<=60000;
-- Using Between x And y
SELECT * FROM employee WHERE salary BETWEEN 40000 AND 60000;

-- Display all those record where email is not specified
SELECT * FROM employee WHERE email IS NULL;

-- Update the salary of all employees by 20%
SELECT * FROM employee;
UPDATE employee SET salary=salary*1.2;
SELECT * FROM employee;

-- Update the email id of employee with employee id E0004 with harish@yahoo.com
UPDATE employee SET email='harish@yahoo.com' WHERE empid='E0004';
SELECT * FROM employee;

-- DELETE the employee with employee id as E0003
DELETE FROM employee WHERE empid='E0003';
SELECT * FROM employee;

-- Delete all records from employee
DELETE FROM employee;
SELECT * FROM employee;