/*==========================================================
  1. Basic CREATE TABLE
  - A simple table with a primary key and standard columns
==========================================================*/
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,            -- Unique identifier
    FirstName VARCHAR(50),                 -- Employee's first name
    LastName VARCHAR(50),                  -- Employee's last name
    HireDate DATE,                         -- Date of hire
    Salary DECIMAL(10,2)                   -- Salary with 2 decimal places
);


/*==========================================================
  2. CREATE TABLE with Constraints
  - Adds NOT NULL, UNIQUE, DEFAULT, and CHECK constraints
==========================================================*/
CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,                -- Primary key
    DeptName VARCHAR(50) NOT NULL UNIQUE,  -- Dept name cannot be null and must be unique
    Location VARCHAR(100) DEFAULT 'Head Office', -- Default location
    CONSTRAINT chk_location CHECK (Location <> '') -- Prevent empty string as location
);


/*==========================================================
  3. CREATE TABLE with Foreign Keys
  - Defines relationships between tables
==========================================================*/
CREATE TABLE EmployeeDepartments (
    EmployeeID INT,                        -- References Employees
    DeptID INT,                            -- References Departments
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);


/*==========================================================
  4. CREATE TABLE from Another Table
  - Copy structure + data, or only structure
==========================================================*/
-- Copy both structure and data
CREATE TABLE backup_employees AS
SELECT * FROM employees;

-- Copy only structure (no data)
CREATE TABLE empty_employees AS
SELECT * FROM employees WHERE 1=0;


/*==========================================================
  5. Temporary Table
  - Exists only for the session
==========================================================*/
CREATE TEMPORARY TABLE TempEmployees (
    ID INT,
    Name VARCHAR(50)
);


/*==========================================================
  6. CREATE IF NOT EXISTS
  - Prevents error if table already exists
==========================================================*/
CREATE TABLE IF NOT EXISTS EmployeesBackup (
    ID INT,
    Name VARCHAR(50)
);


/*==========================================================
  7. Table with Identity (Auto-Increment)
  - Oracle 12c+ syntax for auto-generated primary key
==========================================================*/
CREATE TABLE users (
    user_id   NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY, -- Auto-incrementing ID
    username  VARCHAR2(50) UNIQUE NOT NULL,                   -- Username must be unique and not null
    created_at DATE DEFAULT SYSDATE                           -- Default: current system date
);


/*==========================================================
  8. Table with Check and Default Constraints
  - Ensures valid data entry with business rules
==========================================================*/
CREATE TABLE products (
    product_id   NUMBER PRIMARY KEY,
    product_name VARCHAR2(100) NOT NULL,
    price        NUMBER(10,2) DEFAULT 0 CHECK (price >= 0), -- Price cannot be negative
    stock        NUMBER DEFAULT 0 CHECK (stock >= 0)        -- Stock cannot be negative
);


/*==========================================================
  9. Composite Primary Key
  - Primary key on multiple columns
==========================================================*/
CREATE TABLE enrollments (
    student_id   NUMBER,
    course_id    NUMBER,
    enroll_date  DATE DEFAULT SYSDATE,
    CONSTRAINT enroll_pk PRIMARY KEY (student_id, course_id) -- Composite key
);


/*==========================================================
  10. Global Temporary Table
  - Structure persists, data is session-specific
==========================================================*/
CREATE GLOBAL TEMPORARY TABLE temp_sales (
    sale_id NUMBER,
    product_name VARCHAR2(100),
    amount NUMBER(10,2)
) ON COMMIT PRESERVE ROWS; -- Data remains for session unless explicitly deleted
