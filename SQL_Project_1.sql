Create Table EmployeeDetail(
    EmployeeID int,
    FirstName varchar(max),
    LastName varchar(max),
    Salary int,
    JoiningDate datetime,
    Department varchar(max),
    Gender varchar(max)
);

insert into EmployeeDetail values('1', 'Vikash', 'Ahlawat', '600000', '2013/02/12 11:16:00', 'IT', 'Male');
insert into EmployeeDetail values('2', 'Nikita', 'Jain', '530000', '2013/02/14 11:16:00', 'HR', 'Female');
insert into EmployeeDetail values('3', 'Ashish', 'Kumar', '1000000', '2013/02/14 11:16:00', 'IT', 'Male');
insert into EmployeeDetail values('4', 'Nikhil', 'Sharma', '480000', '2013/02/15 11:16:00', 'HR', 'Male');
insert into EmployeeDetail values('5', 'Anish', 'Kadian', '500000', '2013/02/16 11:16:00', 'Paroll', 'Male');

--1-Write a query to get all employee detail from "EmployeeDetail" table

SELECT * FROM EmployeeDetail;

--2-Write a query to get only "FirstName" column from "EmployeeDetail" table

SELECT FirstName FROM EmployeeDetail;

--3-Write a query to get FirstName in upper case as "First Name"

SELECT UPPER(FirstName) AS "First Name" FROM EmployeeDetail;

--4-Write a query to get FirstName in upper case as "First Name"

SELECT UPPER(FirstName) AS "First Name" FROM EmployeeDetail;

--5-Write a query for combine FirstName and LastName and display it as "Name" (also include white space between first name & last name)

SELECT CONCAT(FirstName, ' ', LastName) AS "Name" FROM EmployeeDetail;

--6-SELECT employee detail whose name is "Vikas"

SELECT * FROM EmployeeDetail WHERE FirstName = 'Vikash';

--7-Get all employee detail from EmployeeDetail table whose "FirstName" start with letter 'a'

SELECT * FROM EmployeeDetail WHERE FirstName LIKE 'a%';

--8-Get all employee detail from EmployeeDetail table whose "FirstName" start with letter 'a'

SELECT * FROM EmployeeDetail WHERE FirstName LIKE 'a%';

--9-Get all employee details from EmployeeDetail table whose "FirstName" end with 'h'

SELECT * FROM EmployeeDetail WHERE FirstName LIKE '%h';

--10-Get all employee detail from EmployeeDetail table whose "FirstName" start with any single character between 'a-p'

SELECT * FROM EmployeeDetail WHERE FirstName LIKE '[a-p]%';

--11-Get all employee detail from EmployeeDetail table whose "FirstName" not start with any single character between 'a-p'

SELECT * FROM EmployeeDetail WHERE FirstName NOT LIKE '[a-p]%';

--12-Get all employee detail from EmployeeDetail table whose "Gender" end with 'le' and contain 4 letters-The Underscore(_) Wildcard Character represents any single character

SELECT * FROM EmployeeDetail WHERE Gender LIKE '_le';

--13-Get all employee detail from EmployeeDetail table whose "FirstName" start with 'A' and contain 5 letters

SELECT * FROM EmployeeDetail WHERE FirstName LIKE 'A____';

--14-Get all employee detail from EmployeeDetail table whose "FirstName" containing '%'-ex:-"Vik%as"

SELECT * FROM EmployeeDetail WHERE FirstName LIKE '%[%]%';

--15-Get all unique "Department" from EmployeeDetail table

SELECT DISTINCT Department FROM EmployeeDetail;

--16-Get the highest "Salary" from EmployeeDetail table.

SELECT MAX(Salary) AS "Highest Salary" FROM EmployeeDetail;

--17-Get the lowest "Salary" from EmployeeDetail table

SELECT MIN(Salary) AS "Lowest Salary" FROM EmployeeDetail;

--18-Show "JoiningDate" in "dd mmm yyyy" format, ex- "15 Feb 2013"

SELECT EmployeeID, FirstName, LastName, Salary, 
FORMAT(JoiningDate, 'dd MMM yyyy') AS JoiningDate, Department, Gender 
FROM EmployeeDetail;

--19-Show "JoiningDate" in "yyyy/mm/dd" format, ex- "2013/02/15"

SELECT EmployeeID, FirstName, LastName, Salary, 
FORMAT(JoiningDate, 'yyyy/MM/dd') AS JoiningDate, Department, Gender 
FROM EmployeeDetail;

--20-Show only time part of the "JoiningDate"

SELECT EmployeeID, FirstName, LastName, Salary, 
CAST(JoiningDate AS TIME) AS JoiningTime, Department, Gender 
FROM EmployeeDetail;

--21-Get only Year part of "JoiningDate"

SELECT EmployeeID, FirstName, LastName, Salary, 
YEAR(JoiningDate) AS JoiningYear, Department, Gender 
FROM EmployeeDetail;

--22-Get only Month part of "JoiningDate"

SELECT EmployeeID, FirstName, LastName, Salary, 
MONTH(JoiningDate) AS JoiningMonth, Department, Gender 
FROM EmployeeDetail;

--23-Get system date

SELECT GETDATE() AS SystemDate;

--24-Get UTC date.

SELECT GETUTCDATE() AS UTCDate;

--25-Get the first name, current date, joiningdate and diff between current date and joining date in months.

SELECT FirstName, GETDATE() AS CurrentDate, JoiningDate,
DATEDIFF(MONTH, JoiningDate, GETDATE()) AS MonthsDifference
FROM EmployeeDetail;

--26-Get the first name, current date, joiningdate and diff between current date and joining date in days.

SELECT FirstName, GETDATE() AS CurrentDate, JoiningDate,
DATEDIFF(DAY, JoiningDate, GETDATE()) AS DaysDifference
FROM EmployeeDetail;

--27-Get all employee details from EmployeeDetail table whose joining year is 2013

SELECT * FROM EmployeeDetail WHERE YEAR(JoiningDate) = 2013;

--28-Get all employee details from EmployeeDetail table whose joining month is Jan(1)

SELECT * FROM EmployeeDetail WHERE MONTH(JoiningDate) = 1;

--29-Get all employee details from EmployeeDetail table whose joining month is Jan(1)

SELECT * FROM EmployeeDetail WHERE MONTH(JoiningDate) = 1;

--30-Get how many employee exist in "EmployeeDetail" table

SELECT COUNT(*) AS EmployeeCount FROM EmployeeDetail;

--31-Select only one/top 1 record from "EmployeeDetail" table

SELECT TOP 1 * FROM EmployeeDetail;

--32-Select all employee detail with First name "Vikas", "Ashish", and "Nikhil"

SELECT * FROM EmployeeDetail WHERE FirstName IN ('Vikash', 'Ashish', 'Nikhil');

--33-Select all employee detail with First name not in "Vikas", "Ashish", and "Nikhil"

SELECT * FROM EmployeeDetail WHERE FirstName NOT IN ('Vikash', 'Ashish', 'Nikhil');

--34-Select first name from "EmployeeDetail" table after removing white spaces from right side

SELECT RTRIM(FirstName) AS FirstName FROM EmployeeDetail;

--35-Select first name from "EmployeeDetail" table after removing white spaces from left side

SELECT LTRIM(FirstName) AS FirstName FROM EmployeeDetail;

--36-Display first name and Gender as M/F (if male then M, if Female then F)

SELECT FirstName, 
CASE WHEN Gender = 'Male' THEN 'M' WHEN Gender = 'Female' THEN 'F' END AS Gender 
FROM EmployeeDetail;

--37-Select first name from "EmployeeDetail" table prefixed with "Hello"

SELECT CONCAT('Hello ', FirstName) AS Greeting FROM EmployeeDetail;

--38-Get employee details from "EmployeeDetail" table whose Salary greater than 600000

SELECT * FROM EmployeeDetail WHERE Salary > 600000;

--39-Get employee details from "EmployeeDetail" table whose Salary less than 700000

SELECT * FROM EmployeeDetail WHERE Salary < 700000;

--40-Get employee details from "EmployeeDetail" table whose Salary between 500000 than 600000

SELECT * FROM EmployeeDetail WHERE Salary BETWEEN 500000 AND 600000;

---------------------------------------------------------------------------------------------------------------------------

Create table ProjectDetail(
    ProjectDetailID int,
    EmployeeDetailID int,
    ProjectName varchar(max)
);

insert into ProjectDetail values('1', '1', 'Task Track');
insert into ProjectDetail values('2', '1', 'CLP');
insert into ProjectDetail values('3', '1', 'Survey Management');
insert into ProjectDetail values('4', '2', 'HR Management');
insert into ProjectDetail values('5', '3', 'Task Track');
insert into ProjectDetail values('6', '3', 'GRS');
insert into ProjectDetail values('7', '3', 'DDS');
insert into ProjectDetail values('8', '4', 'HR Management');
insert into ProjectDetail values('9', '6', 'GL Management');

--41-Give records of ProjectDetail table

SELECT * FROM ProjectDetail;

--42-Write the query to get the department and department wise total(sum) salary from "EmployeeDetail" table

SELECT Department, SUM(Salary) AS TotalSalary 
FROM EmployeeDetail 
GROUP BY Department;

--43-Write the query to get the department and department wise total(sum) salary, display it in ascending order according to salary

SELECT Department, SUM(Salary) AS TotalSalary 
FROM EmployeeDetail 
GROUP BY Department 
ORDER BY TotalSalary ASC;

--44-Write the query to get the department and department wise total(sum) salary, display it in descending order according to salary

SELECT Department, SUM(Salary) AS TotalSalary 
FROM EmployeeDetail 
GROUP BY Department 
ORDER BY TotalSalary DESC;

--45-Write the query to get the department, total no. of departments, total(sum) salary with respect to department from "EmployeeDetail" table

SELECT Department, COUNT(*) AS TotalDepartments, SUM(Salary) AS TotalSalary 
FROM EmployeeDetail 
GROUP BY Department;

--46-Get department wise average salary from "EmployeeDetail" table order by salary ascending

SELECT Department, AVG(Salary) AS AvgSalary 
FROM EmployeeDetail 
GROUP BY Department 
ORDER BY AvgSalary ASC;

--47-Get department wise maximum salary from "EmployeeDetail" table order by salary ascending

SELECT Department, MAX(Salary) AS MaxSalary 
FROM EmployeeDetail 
GROUP BY Department 
ORDER BY MaxSalary ASC;

--48-Get department wise minimum salary from "EmployeeDetail" table order by salary ascending

SELECT Department, MIN(Salary) AS MinSalary 
FROM EmployeeDetail 
GROUP BY Department 
ORDER BY MinSalary ASC;

--49-Join both the table that is Employee and ProjectDetail based on some common parameter

SELECT * FROM EmployeeDetail 
JOIN ProjectDetail ON EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID;

--50-Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for those employee which have assigned project already

SELECT EmployeeDetail.FirstName, ProjectDetail.ProjectName 
FROM EmployeeDetail 
JOIN ProjectDetail ON EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID 
ORDER BY EmployeeDetail.FirstName;

--51-Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee even they have not assigned project

SELECT EmployeeDetail.FirstName, ProjectDetail.ProjectName 
FROM EmployeeDetail 
LEFT JOIN ProjectDetail ON EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID 
ORDER BY EmployeeDetail.FirstName;

--52-Get employee name, project name order by firstname from "EmployeeDetail" and "ProjectDetail" for all employee if project is not assigned then display "-No Project Assigned"

SELECT EmployeeDetail.FirstName, 
COALESCE(ProjectDetail.ProjectName, '-No Project Assigned') AS ProjectName 
FROM EmployeeDetail 
LEFT JOIN ProjectDetail ON EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID 
ORDER BY EmployeeDetail.FirstName;

--53-Get all project name even they have not matching any employeeid, in left table, order by firstname from "EmployeeDetail" and "ProjectDetail"

SELECT ProjectDetail.ProjectName 
FROM ProjectDetail 
LEFT JOIN EmployeeDetail ON ProjectDetail.EmployeeDetailID = EmployeeDetail.EmployeeID 
ORDER BY EmployeeDetail.FirstName;

--54-Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL

SELECT EmployeeDetail.FirstName, ProjectDetail.ProjectName 
FROM EmployeeDetail 
FULL OUTER JOIN ProjectDetail ON EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID;

--55-Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL

SELECT EmployeeDetail.FirstName, ProjectDetail.ProjectName 
FROM EmployeeDetail 
FULL OUTER JOIN ProjectDetail ON EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID;

--56-Get complete record (employeename, project name) from both tables ([EmployeeDetail],[ProjectDetail]), if no match found in any table then show NULL

SELECT EmployeeDetail.FirstName, ProjectDetail.ProjectName 
FROM EmployeeDetail 
FULL OUTER JOIN ProjectDetail ON EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID;

--57-Write down the query to fetch EmployeeName & Project who has assigned more than one project

SELECT EmployeeDetail.FirstName, ProjectDetail.ProjectName 
FROM EmployeeDetail 
JOIN ProjectDetail ON EmployeeDetail.EmployeeID = ProjectDetail.EmployeeDetailID 
GROUP BY EmployeeDetail.FirstName, ProjectDetail.ProjectName 
HAVING COUNT(ProjectDetail.ProjectName) > 1;

--58-Write down the query to fetch ProjectName on which more than one employee are working along with EmployeeName

SELECT ProjectDetail.ProjectName, EmployeeDetail.FirstName 
FROM ProjectDetail 
JOIN EmployeeDetail ON ProjectDetail.EmployeeDetailID = EmployeeDetail.EmployeeID 
GROUP BY ProjectDetail.ProjectName, EmployeeDetail.FirstName 
HAVING COUNT(EmployeeDetail.FirstName) > 1;

--59-Apply Cross Join in Both the tables

SELECT * FROM EmployeeDetail 
CROSS JOIN ProjectDetail;
