/*==========================================================
  1. Insert Single Row
  - Basic INSERT specifying column list
==========================================================*/
INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate, Salary)
VALUES (1, 'John', 'Doe', '2023-01-15', 55000.00);


/*==========================================================
  2. Insert Without Column List
  - Values must match all table columns in order
==========================================================*/
INSERT INTO Employees
VALUES (2, 'Jane', 'Smith', '2023-02-01', 60000.00);


/*==========================================================
  3. Insert Multiple Rows
  - Insert more than one row in a single statement
==========================================================*/
INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate, Salary)
VALUES
(3, 'Alice', 'Brown', '2023-03-01', 50000.00),
(4, 'Bob', 'White', '2023-03-15', 52000.00);


/*==========================================================
  4. Insert with Default Values
  - Only specify required column, defaults apply for others
==========================================================*/
INSERT INTO Departments (DeptID) VALUES (10); -- DeptName uses default


/*==========================================================
  5. Insert from Another Table
  - Copy data from one table to another
==========================================================*/
INSERT INTO EmployeesArchive (EmployeeID, FirstName, LastName, HireDate, Salary)
SELECT EmployeeID, FirstName, LastName, HireDate, Salary
FROM Employees
WHERE HireDate < '2024-01-01';


/*==========================================================
  6. Insert with Subquery
  - Dynamically generate values while inserting
==========================================================*/
INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate, Salary)
SELECT MAX(EmployeeID)+1, 'Chris', 'Green', CURRENT_DATE, 58000
FROM Employees;


/*==========================================================
  7. Bulk Insert (File Import)
  - Import data directly from a CSV file (SQL Server example)
==========================================================*/
BULK INSERT Employees
FROM 'C:\data\employees.csv'
WITH (
    FIELDTERMINATOR = ',', -- Columns separated by comma
    ROWTERMINATOR = '\n',  -- Each row ends with newline
    FIRSTROW = 2           -- Skip header row
);


/*==========================================================
  8. Insert Using Stored Procedure
  - Wrap INSERT inside a stored procedure for reusability
==========================================================*/
CREATE PROCEDURE AddEmployee(
    IN p_ID INT,
    IN p_First VARCHAR(50),
    IN p_Last VARCHAR(50),
    IN p_Hire DATE,
    IN p_Salary DECIMAL(10,2)
)
BEGIN
    INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate, Salary)
    VALUES (p_ID, p_First, p_Last, p_Hire, p_Salary);
END;

-- Example procedure call
CALL AddEmployee(5, 'David', 'Miller', '2023-04-01', 61000.00);


/*==========================================================
  9. Insert with Merge / Upsert (Advanced)
  - If record exists → Update
  - If record doesn’t exist → Insert
==========================================================*/
MERGE Employees AS target
USING (SELECT 6 AS EmployeeID,
              'Eva' AS FirstName,
              'Lee' AS LastName,
              '2023-05-01' AS HireDate,
              57000.00 AS Salary) AS source
ON (target.EmployeeID = source.EmployeeID)
WHEN MATCHED THEN
    UPDATE SET Salary = source.Salary
WHEN NOT MATCHED THEN
    INSERT (EmployeeID, FirstName, LastName, HireDate, Salary)
    VALUES (source.EmployeeID, source.FirstName, source.LastName, source.HireDate, source.Salary);
