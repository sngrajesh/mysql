CREATE DATABASE employee;

USE employee;

-- Create Employees table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(50),
    DepartmentID INT
);
-- Create Departments table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);
-- Create Projects table
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    DepartmentID INT
);
-- Create EmployeeProjects table
CREATE TABLE EmployeeProjects (
    EmployeeID INT,
    ProjectID INT,
    PRIMARY KEY (EmployeeID, ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

-- Insert values into Employees table
INSERT INTO Employees (EmployeeID, Name, DepartmentID) 
VALUES
(1, 'Alice Smith', 101),
(2, 'Bob Johnson', 102),
(3, 'Carol White', 101),
(4, 'Dave Brown', 103),
(5, 'Eve Black', 102);

-- Insert values into Departments table
INSERT INTO Departments (DepartmentID, DepartmentName) 
VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance');

-- Insert values into Projects table
INSERT INTO Projects (ProjectID, ProjectName, DepartmentID) VALUES
(201, 'Project Alpha', 101),
(202, 'Project Beta', 102),
(203, 'Project Gamma', 103);

-- Insert values into EmployeeProjects table
INSERT INTO EmployeeProjects (EmployeeID, ProjectID) 
VALUES
(1, 201),
(2, 202),
(3, 201),
(4, 203),
(5, 202);

-- Find the names of employees, their department names, and the projects they are working on.
SELECT e.Name AS EmployeeName,
       d.DepartmentName,
       p.ProjectName
FROM Employees e
INNER JOIN Departments d
    ON e.DepartmentID = d.DepartmentID
INNER JOIN EmployeeProjects ep
    ON e.EmployeeID = ep.EmployeeID
INNER JOIN Projects p
    ON ep.ProjectID = p.ProjectID;

-- Retrieve all employees along with their department names and the names of the projects they are working on. Include employees who are not assigned to any projects.
SELECT e.Name AS EmployeeName,
       d.DepartmentName,
       p.ProjectName
FROM Employees e
LEFT JOIN Departments d
    ON e.DepartmentID = d.DepartmentID
LEFT JOIN EmployeeProjects ep
    ON e.EmployeeID = ep.EmployeeID
LEFT JOIN Projects p
    ON ep.ProjectID = p.ProjectID;

-- List all projects along with the names of employees working on them and their department names. Include projects that have no employees assigned.
SELECT p.ProjectName, e.Name AS EmployeeName, d.DepartmentName
FROM Projects p
LEFT JOIN EmployeeProjects ep
    ON p.ProjectID = ep.ProjectID
LEFT JOIN Employees e
    ON ep.EmployeeID = e.EmployeeID
LEFT JOIN Departments d
    ON e.DepartmentID = d.DepartmentID;

-- Retrieve a list of all employees and all projects, showing which employees are working on which projects, and include employees or projects with no assignments
SELECT e.Name AS EmployeeName, p.ProjectName
FROM Employees e
CROSS JOIN Projects p
LEFT JOIN EmployeeProjects ep
    ON e.EmployeeID = ep.EmployeeID AND p.ProjectID = ep.ProjectID;
    
DROP DATABASE employee;
