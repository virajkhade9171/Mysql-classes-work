
-- QUIZ-1: COMPANY DATABASE
-- Tables 1 to 5 with 10 attributes each

-- 1. Create Database
CREATE DATABASE IF NOT EXISTS Company;
USE Company;


-- TABLE 1: Departments
-- ========================================
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(50) NOT NULL,
    ManagerID INT,
    Location VARCHAR(50),
    DATE varchar(10) ,
    UpdatedAt DATE,
    Budget DECIMAL(10,2),
    NumEmployees INT,
    DeptHead VARCHAR(50),
    DeptEmail VARCHAR(50)
);

INSERT INTO Departments VALUES
(1,'IT',101,'Mumbai','2023-01-01','2023-09-01',5000000,50,'Rohit Sharma','it@company.com'),
(2,'HR',102,'Delhi','2023-01-05','2023-09-01',2000000,20,'Neha Singh','hr@company.com'),
(3,'Finance',103,'Bangalore','2023-01-10','2023-09-01',3000000,30,'Vikram Patel','finance@company.com'),
(4,'Marketing',104,'Mumbai','2023-01-15','2023-09-01',2500000,25,'Pooja Mehta','marketing@company.com'),
(5,'Operations',105,'Chennai','2023-01-20','2023-09-01',3500000,40,'Anil Kumar','operations@company.com'),
(6,'Sales',106,'Delhi','2023-01-25','2023-09-01',4000000,35,'Ramesh Iyer','sales@company.com'),
(7,'Support',107,'Bangalore','2023-01-30','2023-09-01',1500000,15,'Sonia Rao','support@company.com'),
(8,'R&D',108,'Mumbai','2023-02-01','2023-09-01',6000000,45,'Karan Verma','rnd@company.com'),
(9,'Logistics',109,'Chennai','2023-02-05','2023-09-01',2800000,28,'Ritu Sharma','logistics@company.com'),
(10,'Legal',110,'Delhi','2023-02-10','2023-09-01',1800000,12,'Amit Desai','legal@company.com');

SELECT * FROM Departments;
-- DROP TABLE Departments;
-- TRUNCATE TABLE Departments;

-- 1. List all departments
SELECT * FROM Departments;

-- 2. Departments located in 'Mumbai'
SELECT * FROM Departments
WHERE Location = 'Mumbai';

-- 3. Departments with budget > 3,000,000
SELECT DeptName, Budget FROM Departments
WHERE Budget > 3000000;

-- 4. Departments with number of employees between 20 and 40
SELECT DeptName, NumEmployees FROM Departments
WHERE NumEmployees BETWEEN 20 AND 40;

-- 5. Departments whose name contains 'Sales'
SELECT * FROM Departments
WHERE DeptName LIKE '%Sales%';

-- 6. Count of departments per location
SELECT Location, COUNT(*) AS DeptCount
FROM Departments
GROUP BY Location;

-- 7. Maximum budget among all departments
SELECT MAX(Budget) AS MaxBudget FROM Departments;

-- 8. Minimum number of employees in a department
SELECT MIN(NumEmployees) AS MinEmployees FROM Departments;

-- 9. Average budget of departments
SELECT AVG(Budget) AS AvgBudget FROM Departments;

-- 10. List departments ordered by budget descending
SELECT DeptName, Budget FROM Departments
ORDER BY Budget DESC;

-- 11. Departments with more than 30 employees and budget > 3,000,000
SELECT * FROM Departments
WHERE NumEmployees > 30 AND Budget > 3000000;

-- 12. Departments in 'Delhi' or 'Chennai'
SELECT * FROM Departments
WHERE Location IN ('Delhi','Chennai');

-- 13. Departments updated after '2023-08-01'
SELECT * FROM Departments
WHERE UpdatedAt > '2023-08-01';

-- 14. Count of departments per manager
SELECT ManagerID, COUNT(*) AS DeptCount
FROM Departments
GROUP BY ManagerID;

-- 15. Departments having budget above average
SELECT DeptName, Budget FROM Departments
WHERE Budget > (SELECT AVG(Budget) FROM Departments);

-- 16. Total budget of all departments
SELECT SUM(Budget) AS TotalBudget FROM Departments;

-- 17. Departments with email ending with 'company.com'
SELECT DeptName, DeptEmail FROM Departments
WHERE DeptEmail LIKE '%company.com';

-- 18. Departments with more than 25 employees, ordered by number of employees
SELECT DeptName, NumEmployees FROM Departments
WHERE NumEmployees > 25
ORDER BY NumEmployees DESC;




-- ========================================
-- TABLE 2: Employees
-- ========================================
CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    DeptID INT,
    Email VARCHAR(50) UNIQUE,
    Phone VARCHAR(15),
    Salary DECIMAL(10,2),
    Position VARCHAR(50),
    JoiningDate DATE,
    DOB DATE,
    Address VARCHAR(100),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

INSERT INTO Employees VALUES
(1001,'Amit Kumar',1,'amit.kumar@company.com','9876543210',60000,'Developer','2022-05-01','1995-03-15','Mumbai'),
(1002,'Priya Sharma',2,'priya.sharma@company.com','9876543211',50000,'HR Manager','2021-08-01','1990-07-10','Delhi'),
(1003,'Rohit Singh',1,'rohit.singh@company.com','9876543212',65000,'Team Lead','2020-02-15','1988-05-20','Mumbai'),
(1004,'Neha Gupta',3,'neha.gupta@company.com','9876543213',55000,'Accountant','2022-09-01','1992-09-25','Bangalore'),
(1005,'Vikram Patel',3,'vikram.patel@company.com','9876543214',70000,'Finance Manager','2019-03-10','1985-11-12','Bangalore'),
(1006,'Pooja Mehta',4,'pooja.mehta@company.com','9876543215',48000,'Marketing Executive','2021-06-18','1993-01-30','Mumbai'),
(1007,'Anil Kumar',5,'anil.kumar@company.com','9876543216',52000,'Operations Manager','2020-12-05','1989-07-22','Chennai'),
(1008,'Ramesh Iyer',6,'ramesh.iyer@company.com','9876543217',62000,'Sales Lead','2018-11-12','1987-02-14','Delhi'),
(1009,'Sonia Rao',7,'sonia.rao@company.com','9876543218',45000,'Support Executive','2022-04-20','1994-06-05','Bangalore'),
(1010,'Karan Verma',8,'karan.verma@company.com','9876543219',75000,'R&D Manager','2017-07-01','1985-09-18','Mumbai');

SELECT * FROM Employees;
-- DROP TABLE Employees;
-- TRUNCATE TABLE Employees;

-- 1. List all employees
SELECT * FROM Employees;

-- 2. Employees in IT department
SELECT * FROM Employees
WHERE DeptID = 1;

-- 3. Employees with salary > 60,000
SELECT EmpName, Salary FROM Employees
WHERE Salary > 60000;

-- 4. Employees who joined between '2020-01-01' and '2022-12-31'
SELECT EmpName, JoiningDate FROM Employees
WHERE JoiningDate BETWEEN '2020-01-01' AND '2022-12-31';

-- 5. Employees with names starting with 'R'
SELECT * FROM Employees
WHERE EmpName LIKE 'R%';

-- 6. Count of employees per department
SELECT DeptID, COUNT(*) AS EmpCount
FROM Employees
GROUP BY DeptID;

-- 7. Average salary per department
SELECT DeptID, AVG(Salary) AS AvgSalary
FROM Employees
GROUP BY DeptID;

-- 8. Maximum salary in the company
SELECT MAX(Salary) AS MaxSalary FROM Employees;

-- 9. Minimum salary in HR department
SELECT MIN(Salary) AS MinSalary FROM Employees
WHERE DeptID = 2;

-- 10. Employees ordered by salary descending
SELECT EmpName, Salary FROM Employees
ORDER BY Salary DESC;

-- 11. Employees whose salary > department average (using subquery)
SELECT EmpName, Salary, DeptID
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees WHERE DeptID = Employees.DeptID);

-- 12. Employees in departments 1,3,5
SELECT * FROM Employees
WHERE DeptID IN (1,3,5);

-- 13. Employees with email containing 'company.com'
SELECT EmpName, Email FROM Employees
WHERE Email LIKE '%company.com%';

-- 14. Count of employees having salary > 50,000
SELECT COUNT(*) AS HighSalaryEmp FROM Employees
WHERE Salary > 50000;




-- ========================================
-- TABLE 3: Clients
-- ========================================
CREATE TABLE Clients (
    ClientID INT PRIMARY KEY,
    ClientName VARCHAR(50) NOT NULL,
    Industry VARCHAR(50),
    ContactPerson VARCHAR(50),
    Email VARCHAR(50),
    Phone VARCHAR(15),
    Address VARCHAR(100),
    City VARCHAR(50),
    Country VARCHAR(50),
    TotalProjects INT
);

INSERT INTO Clients VALUES
(201,'TCS','IT','Ramesh Gupta','ramesh@tcs.com','9812345670','Mumbai','Mumbai','India',5),
(202,'Reliance','Telecom','Sunita Joshi','sunita@reliance.com','9812345671','Mumbai','Mumbai','India',3),
(203,'Infosys','IT','Amit Sharma','amit@infosys.com','9812345672','Bangalore','Bangalore','India',4),
(204,'Wipro','IT','Sonia Singh','sonia@wipro.com','9812345673','Bangalore','Bangalore','India',2),
(205,'HCL','IT','Vikram Joshi','vikram@hcl.com','Delhi','Delhi','India',3),
(206,'Accenture','Consulting','Neha Verma','neha@accenture.com','9812345675','Mumbai','Mumbai','India',6),
(207,'L&T','Engineering','Anil Kumar','anil@lt.com','9812345676','Mumbai','Mumbai','India',2),
(208,'Adani','Infrastructure','Ritu Sharma','ritu@adani.com','9812345677','Chennai','Chennai','India',4),
(209,'Tech Mahindra','IT','Karan Mehta','karan@techm.com','Pune','Pune','India',3),
(210,'Capgemini','Consulting','Pooja Singh','pooja@capgemini.com','9812345679','Bangalore','Bangalore','India',5);

SELECT * FROM Clients;
-- DROP TABLE Clients;
-- TRUNCATE TABLE Clients;

-- 1. List all clients
SELECT * FROM Clients;

-- 2. Clients in the 'IT' industry
SELECT * FROM Clients
WHERE Industry = 'IT';

-- 3. Clients with more than 3 projects
SELECT ClientName, TotalProjects FROM Clients
WHERE TotalProjects > 3;

-- 4. Clients located in 'Mumbai' or 'Delhi'
SELECT * FROM Clients
WHERE City IN ('Mumbai','Delhi');

-- 5. Clients whose name starts with 'A'
SELECT * FROM Clients
WHERE ClientName LIKE 'A%';

-- 6. Count of clients per industry
SELECT Industry, COUNT(*) AS ClientCount
FROM Clients
GROUP BY Industry;

-- 7. Maximum number of projects any client has
SELECT MAX(TotalProjects) AS MaxProjects FROM Clients;

-- 8. Minimum number of projects
SELECT MIN(TotalProjects) AS MinProjects FROM Clients;

-- 9. Average number of projects per client
SELECT AVG(TotalProjects) AS AvgProjects FROM Clients;

-- 10. Clients ordered by TotalProjects descending
SELECT ClientName, TotalProjects FROM Clients
ORDER BY TotalProjects DESC;

-- 11. Clients with email containing 'infosys' or 'tcs'
SELECT * FROM Clients
WHERE Email LIKE '%infosys%' OR Email LIKE '%tcs%';

-- 12. Clients with TotalProjects between 3 and 5
SELECT ClientName, TotalProjects FROM Clients
WHERE TotalProjects BETWEEN 3 AND 5;

-- 13. Count of clients per city
SELECT City, COUNT(*) AS CityClientCount
FROM Clients
GROUP BY City;

-- 14. Clients with industry 'Consulting' and more than 4 projects
SELECT * FROM Clients
WHERE Industry = 'Consulting' AND TotalProjects > 4;

-- 15. Clients whose ContactPerson name contains 'R'
SELECT * FROM Clients
WHERE ContactPerson LIKE '%R%';

-- 16. Join Clients with Projects to list client names and project names
SELECT c.ClientName, p.ProjectName, p.Status
FROM Clients c
INNER JOIN Projects p ON c.ClientID = p.ClientID;

-- 17. Total projects per client
SELECT ClientName, SUM(TotalProjects) AS TotalProjectsPerClient
FROM Clients
GROUP BY ClientName;





-- TABLE 4: Projects
-- ========================================
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50) NOT NULL,
    DeptID INT,
    ClientID INT,
    StartDate DATE,
    EndDate DATE,
    Budget DECIMAL(10,2),
    Status VARCHAR(20),
    ProjectManager VARCHAR(50),
    Description VARCHAR(200),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID),
    FOREIGN KEY (ClientID) REFERENCES Clients(ClientID)
);

INSERT INTO Projects VALUES
(301,'Website Revamp',1,201,'2023-06-01','2023-09-01',100000,'Ongoing','Amit Kumar','Revamp client website'),
(302,'App Development',1,202,'2023-05-01','2023-08-01',150000,'Completed','Amit Kumar','Develop mobile app'),
(303,'Financial Audit',3,203,'2023-03-01','2023-06-01',120000,'Completed','Vikram Patel','Annual audit'),
(304,'Marketing Campaign',4,204,'2023-07-01','2023-09-30',80000,'Ongoing','Pooja Mehta','Social media campaign'),
(305,'Operations Optimization',5,205,'2023-04-01','2023-08-01',90000,'Completed','Anil Kumar','Improve operations'),
(306,'Sales Strategy',6,206,'2023-05-15','2023-09-15',110000,'Ongoing','Ramesh Iyer','Increase sales revenue'),
(307,'Customer Support Enhancement',7,207,'2023-06-01','2023-09-30',70000,'Ongoing','Sonia Rao','Enhance support'),
(308,'R&D Prototype',8,208,'2023-01-01','2023-12-31',500000,'Ongoing','Karan Verma','Develop new prototype'),
(309,'Logistics Planning',9,209,'2023-02-01','2023-07-01',95000,'Completed','Ritu Sharma','Improve supply chain'),
(310,'Legal Compliance',10,210,'2023-03-01','2023-08-01',60000,'Completed','Amit Desai','Ensure legal compliance');

SELECT * FROM Projects;
-- DROP TABLE Projects;
-- TRUNCATE TABLE Projects;

-- 1. List all projects
SELECT * FROM Projects;

-- 2. Projects belonging to department ID 1 (IT)
SELECT * FROM Projects
WHERE DeptID = 1;

-- 3. Projects with budget greater than 100,000
SELECT ProjectName, Budget FROM Projects
WHERE Budget > 100000;

-- 4. Projects starting between '2023-05-01' and '2023-07-01'
SELECT ProjectName, StartDate FROM Projects
WHERE StartDate BETWEEN '2023-05-01' AND '2023-07-01';

-- 5. Projects whose name contains 'Development'
SELECT * FROM Projects
WHERE ProjectName LIKE '%Development%';

-- 6. Count of projects per department
SELECT DeptID, COUNT(*) AS ProjectCount
FROM Projects
GROUP BY DeptID;

-- 7. Maximum budget among projects
SELECT MAX(Budget) AS MaxBudget FROM Projects;

-- 8. Minimum budget among projects
SELECT MIN(Budget) AS MinBudget FROM Projects;

-- 9. Average budget per department
SELECT DeptID, AVG(Budget) AS AvgBudget
FROM Projects
GROUP BY DeptID;

-- 10. Projects ordered by end date ascending
SELECT ProjectName, EndDate FROM Projects
ORDER BY EndDate ASC;

-- 11. Ongoing projects only
SELECT * FROM Projects
WHERE Status = 'Ongoing';

-- 12. Projects for clients 201, 203, and 205
SELECT * FROM Projects
WHERE ClientID IN (201,203,205);

-- 13. Projects with budget between 80,000 and 150,000
SELECT ProjectName, Budget FROM Projects
WHERE Budget BETWEEN 80000 AND 150000;

-- 14. Join Projects with Departments to show DeptName
SELECT p.ProjectName, d.DeptName, p.Status
FROM Projects p
INNER JOIN Departments d ON p.DeptID = d.DeptID;

-- 15. Join Projects with Clients to show ClientName
SELECT p.ProjectName, c.ClientName, p.Status
FROM Projects p
INNER JOIN Clients c ON p.ClientID = c.ClientID;

-- 16. Total budget per department
SELECT DeptID, SUM(Budget) AS TotalBudget
FROM Projects
GROUP BY DeptID;

-- 17. Projects with budget greater than department average
SELECT p.ProjectName, p.Budget, p.DeptID
FROM Projects p
WHERE p.Budget > (SELECT AVG(Budget) FROM Projects WHERE DeptID = p.DeptID);






