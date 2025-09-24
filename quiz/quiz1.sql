-- 1. Select all projects
SELECT * FROM Projects;

-- 2. Select ongoing projects
SELECT * FROM Projects WHERE Status='Ongoing';

-- 3. Select projects with budget > 50,000
SELECT ProjectName, Budget FROM Projects WHERE Budget > 50000;

-- 4. Select projects starting in 2025
SELECT ProjectName, StartDate FROM Projects WHERE YEAR(StartDate)=2025;

-- 5. Projects ending between '2025-04-01' and '2025-06-30'
SELECT * FROM Projects WHERE EndDate BETWEEN '2025-04-01' AND '2025-06-30';

-- 6. Projects in department 2 or 3
SELECT * FROM Projects WHERE DepartmentID IN (2,3);

-- 7. Projects with names containing 'App'
SELECT * FROM Projects WHERE ProjectName LIKE '%App%';

-- 8. Count total projects
SELECT COUNT(*) AS TotalProjects FROM Projects;

-- 9. Maximum budget
SELECT MAX(Budget) AS MaxBudget FROM Projects;

-- 10. Minimum budget
SELECT MIN(Budget) AS MinBudget FROM Projects;

-- 11. Average budget
SELECT AVG(Budget) AS AvgBudget FROM Projects;

-- 12. Total budget
SELECT SUM(Budget) AS TotalBudget FROM Projects;

-- 13. Number of projects per department
SELECT DepartmentID, COUNT(*) AS ProjectCount
FROM Projects
GROUP BY DepartmentID;

-- 14. Number of ongoing projects per department
SELECT DepartmentID, COUNT(*) AS OngoingProjects
FROM Projects
WHERE Status='Ongoing'
GROUP BY DepartmentID;

-- 15. Projects with budget > 50,000 ordered by budget descending
SELECT ProjectName, Budget FROM Projects
WHERE Budget > 50000
ORDER BY Budget DESC;

-- 16. Projects with end date before start date (check errors)
SELECT * FROM Projects WHERE EndDate < StartDate;

-- 17. Join Projects with Departments
SELECT p.ProjectName, d.DepartmentName
FROM Projects p
INNER JOIN Departments d ON p.DepartmentID = d.DepartmentID;

-- 18. Projects grouped by status having more than 2 projects
SELECT Status, COUNT(*) AS CountStatus
FROM Projects
GROUP BY Status
HAVING COUNT(*) > 2;

-- 19. Projects with budget above average
SELECT * FROM Projects
WHERE Budget > (SELECT AVG(Budget) FROM Projects);

-- 20. Projects starting in January or February
SELECT * FROM Projects
WHERE MONTH(StartDate) IN (1,2);
