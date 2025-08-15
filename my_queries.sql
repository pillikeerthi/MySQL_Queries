CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(30)
    );

INSERT INTO Departments VALUES
    (1,'HR'),
    (2,'IT'),
    (3,'Sales');

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(30),
    DeptID INT,
    Salary INT,
    HireDate DATE,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
    );

INSERT INTO Employees VALUES
    (101,'John', 1, 50000, '2018-02-12'),
    (102,'Alice',2,60000,'2019-07-10'),
    (103,'Bob',1,55000,'2020-05-05'),
    (104,'Carol',3,45000,'2017-09-20');

-- 1.Display all records from the Employees table.
SELECT * FROM Employees;

-- 2. Display only EmpName and Salary of all employees.
SELECT EmpName, Salary FROM Employees;

-- 3. Find all employees who belong to the IT department.
SELECT EmpName FROM Employees JOIN Departments ON
Employees.DeptID=Departments.DeptID WHERE DeptName = 'IT';

-- 4. List employees whose salary is greater than 50,000.
SELECT * FROM Employees WHERE Salary > 50000;

-- 5. Find employees hired before 2020-01-01.
SELECT * FROM Employees WHERE HireDate < '2020-01-01';

-- 6. Display employees in descending order of salary.
SELECT * FROM Employees ORDER BY Salary DESC;

-- 7. Count total number of employees.
SELECT COUNT(*) AS TotalEmployees FROM Employees;

-- 8. Find the average salary of all employees.
SELECT AVG(Salary) AS AverageSalary FROM Employees;

-- 9. Find the maximum salary in each department.
SELECT DeptName, Max(Salary) AS MaxSalary FROM Employees JOIN Departments ON
Employees.DeptID = Departments.DeptID GROUP BY DeptName;

-- 10. Find departments having more than 1 employee.
SELECT DeptName, COUNT(*) AS EmployeeCount FROM Employees JOIN Departments ON
Employees.DeptID=Departments.DeptID GROUP BY DeptName HAVING COUNT(*) >1;

-- 11. Display employees whose names start with 'A'.
SELECT * FROM Employees WHERE EmpName LIKE 'A%';

-- 12. Find employees whose salary is between 45,000 and 60,000.alter
SELECT * FROM Employees WHERE Salary BETWEEN 45000 AND 60000;

-- 13. Show the department name of each employee.
SELECT e.EmpName, d.DeptName FROM Employees e JOIN Departments d ON e.DeptID = d.DeptID;

-- 14. Find the number of employees in each department.
SELECT d.DeptID, d.DeptName, COUNT(*) AS EmployeeCount FROM Employees e JOIN Departments d ON e.DeptID = d.DeptID GROUP BY d.DeptID, d.DeptName;

-- 15. Display all employees, including those without a department.
SELECT e.EmpName, e.DeptID, d.DeptName FROM Employees e LEFT JOIN Departments d ON e.DeptID = d.DeptID;