# **SQL Basics**

**_What is Database?_**

> A database is an organized collection of structured information or data typically stored electronically in a computer system or server.

**_What is DBMS?_**

> A database is usually controlled by a database management system. It is a kind of application used to interact with database.

> \*_Note:_ Together, the data and database management system, along with other applications associated with them are referred to as database system, often shortened to just database.\*

**_What is RDBMS?_**

- RDBMS stands for Relational Database Management System.
- It is a type of database management system where:
- Data is stored in tables (called relations).
- Each table consists of rows (records) and columns (fields).
- Relationships can exist between different tables using keys (like primary keys and foreign keys).

> High-level overview of how databases interact with applications using SQL and a DBMS.

![image](https://hackmd.io/_uploads/S1Cou1lveg.png)

**_What is ER model/Conceptual Data Model?_**

> An Entity-Relationship (ER) Model is a diagrammatic approach to database design that visually represents the entities in a system and the relationships between them.

**_What is Logical Model Design?_**

> Logical Model Design is the second stage in the database design process. It translates the conceptual model (ER diagram) into a detailed, structured schema that defines how data will be logically organized — without worrying yet about physical storage or performance.

> A Logical Data Model (LDM) defines:

- Tables (based on entities)
- Columns/Attributes
- Data types
- Primary and foreign keys
- Relationships between tables (1:1, 1:M, M:N)
- Normalization rules (to reduce redundancy)

**_What is Physical Model?_**

> A Physical Data Model (PDM) is the third and final stage of database design. It represents how the data will actually be stored in the database, including technical and performance-related details specific to the chosen DBMS (like Oracle, MySQL, PostgreSQL, etc.).

> A Physical Data Model is a detailed representation of a database that includes:

- Exact table structures
- Data types and sizes
- Indexes and partitions
- Constraints (PK, FK, UNIQUE, CHECK)
- Storage details (tablespaces, filegroups, etc.)
- DBMS-specific features (e.g., triggers, sequences)

**_What is Normalization?_**

- Normalization is a process of organizing the data in the database to avoid data redundancy, insertion anomaly, update anomaly and deletion anomaly.
- Normalization is the process to eliminate data redundancy and ehance data integrity in the table.

What are different type of anomalies in DBMS?
Anomalies are problems or inconsistencies that can occur in a database when it is not properly normalized. These usually happen when all the data is stored in a single large table instead of being divided into related tables.

There are three main types:

1. Insertion Anomaly: Occurs when you cannot insert data into a table without adding unnecessary or unrelated data.
2. Update Anomaly: Occurs when the same piece of data is duplicated in multiple places, and updating one instance requires updating all copies to avoid inconsistency.
3. Deletion Anomaly: Occurs when deleting a record also unintentionally deletes useful information.

Example:

![image](https://hackmd.io/_uploads/HksFsNHDgx.png)

**_What are different types of Normalization?_**

1. First Normal Form (1NF):
   Ensures each attribute (column) in a table contains atomic (indivisible) values, and eliminates repeating groups of data.
2. Second Normal Form (2NF):
   Requires the table to be in 1NF and eliminates redundant data by ensuring that non-key attributes are fully dependent on the primary key.
3. Third Normal Form (3NF):
   Requires the table to be in 2NF and removes transitive dependencies, where non-key attributes are dependent on other non-key attributes.
4. Boyce-Codd Normal Form (BCNF):
   A stricter form than 3NF, it ensures that every determinant is a candidate key.
   5.Fourth Normal Form (4NF):
   Addresses multi-valued dependencies, ensuring that no table contains more than one independent one-to-many relationship.
5. Fifth Normal Form (5NF):
   Deals with join dependencies and ensures that a table can be reconstructed from smaller tables without losing information.

_Note:_ We have many DBS in market. If we get perfect with one we can learn the rest easily.
In this, guide we are going to learn Oracle DB.

**_Why Use Oracle DB?_**

>

1. **Reliability & ACID Compliance**

- Ensures transactions are safe, consistent, and recoverable.
- Critical for industries like **banking, healthcare, telecom**.

2. **High Performance**

- Optimized for **large-scale OLTP (transactions)** and **OLAP (analytics)**.
- Advanced indexing, partitioning, and query optimization.

3. **Scalability**

- Handles **small apps to enterprise-level workloads**.
- Supports millions of transactions per second in big systems.

4. **Security**

- Strong authentication, encryption, and auditing features.
- - Used in industries with strict data protection requirements.

5. **Multi-Model Support**

- Supports **relational, JSON, XML, spatial, graph, blockchain tables** in one DB.
- Flexible for modern applications.

6. **High Availability & Disaster Recovery**

- **Real Application Clusters (RAC)** for clustering.
- **Data Guard** for standby databases.
- Ensures near-zero downtime.

7. **Cross-Platform & Cloud Ready**

- Runs on Windows, Linux, UNIX, and Oracle Cloud.
- Available on **Oracle Autonomous Database** for self-tuning.

8. **Strong Ecosystem & Tools**

- Oracle SQL Developer, APEX (low-code), PL/SQL (procedural SQL).
- Enterprise management and monitoring tools.

**_What is ACID?_**

> | Property        | Meaning                                                                                 |
> | --------------- | --------------------------------------------------------------------------------------- |
> | **Atomicity**   | All steps in a transaction happen fully or not at all. (All-or-nothing rule)            |
> | **Consistency** | A transaction keeps the database in a valid state, following all rules and constraints. |
> | **Isolation**   | Transactions run independently, without interfering with each other.                    |
> | **Durability**  | Once committed, the transaction’s result is permanent, even if the system crashes.      |

**_What is the core structure of oracle database?_**

![image](https://hackmd.io/_uploads/r1KBv3Vqxx.png)

**Oracle Database 21c – Diagram Explanation**

- **System/Admin (DBA)** → Users like SYS and SYSTEM manage the entire database. They control security, storage, and metadata.

- **Schemas (HR, CORE, etc.)** → Each user account has a schema, which is a collection of objects like tables, views, sequences, indexes.

> **Example:** HR schema has EMPLOYEES table, CORE schema can have its own tables.

**Dictionary (Metadata) Tables** → Store information about the database (e.g., list of tables, columns, users, privileges).

**In short:** DBA manages schemas → schemas contain objects (tables, views) → dictionary tables track everything.

**_What is SQL developer?_**

> SQL Developer is not a DBMS itself, but a client GUI tool provided by Oracle that allows developers and DBAs to easily interact with the database. It connects to the Oracle DBMS and lets you run SQL queries, manage tables, views, and other database objects without using command-line tools.

**_What are the Dictionary tables present in oracle DB?_**

| **View Name**               | **Description**                                                                                       |
| --------------------------- | ----------------------------------------------------------------------------------------------------- | --- | --- |
| **USER_ERRORS**             | Compilation errors for PL/SQL objects **you own** (procedures, functions, packages, triggers, views). |
| **ALL_ERRORS**              | Compilation errors for objects **you can access** (owned by you or granted).                          |
| **DBA_ERRORS**              | Compilation errors for **all objects** in the database (DBA privilege required).                      |     |     |
| **DBA_USERS**               | Information about all users in the database                                                           |
| **DBA_TABLES**              | Details of all tables in the database (DBA only)                                                      |
| **USER_TABLES**             | Tables owned by the current user                                                                      |
| **ALL_TABLES**              | Tables accessible to the current user                                                                 |
| **DBA_VIEWS**               | Information about all views in the database                                                           |
| **USER_VIEWS**              | Views owned by the current user                                                                       |
| **ALL_VIEWS**               | Views accessible to the current user                                                                  |
| **DBA_OBJECTS**             | Details of all database objects                                                                       |
| **USER_OBJECTS**            | Objects owned by the current user                                                                     |
| **ALL_OBJECTS**             | Objects accessible to the current user                                                                |
| **DBA_TAB_COLUMNS**         | Information about columns of all tables                                                               |
| **USER_TAB_COLUMNS**        | Columns of tables owned by the user                                                                   |
| **ALL_TAB_COLUMNS**         | Columns of tables accessible to the user                                                              |
| **DBA_CONSTRAINTS**         | Constraints on all tables                                                                             |
| **USER_CONSTRAINTS**        | Constraints on user’s tables                                                                          |
| **ALL_CONSTRAINTS**         | Constraints accessible to the user                                                                    |
| **DBA_INDEXES**             | Details about indexes in the database                                                                 |
| **USER_INDEXES**            | Indexes created by the current user                                                                   |
| **ALL_INDEXES**             | Indexes accessible to the current user                                                                |
| **DICTIONARY**              | List of all dictionary views and tables                                                               |
| **DICT_COLUMNS**            | Description of columns in dictionary views                                                            |
| **GLOBAL_NAME**             | Shows the global database name                                                                        |
| **NLS_DATABASE_PARAMETERS** | Permanent NLS parameters of the database                                                              |
| **NLS_INSTANCE_PARAMETERS** | NLS parameters at the instance level                                                                  |
| **NLS_SESSION_PARAMETERS**  | NLS parameters of the user session                                                                    |

**_What are the Datatypes in SQL?_**

| Category  | Data Type(s)                                                     | Definition / Use                                                                                                                                             | Example                                                                           |
| --------- | ---------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------ | --------------------------------------------------------------------------------- |
| Numeric   | INT, BIGINT, SMALLINT, DECIMAL, NUMERIC, FLOAT, REAL, **NUMBER** | Store whole numbers or decimals; `NUMBER` is Oracle-specific with optional precision and scale                                                               | `salary NUMBER(10,2)`, `age INT`, `quantity NUMBER(5)`                            |
| String    | CHAR, NCHAR, VARCHAR, VARCHAR2, NVARCHAR, TEXT, CLOB             | Store text data; `CHAR`/`NCHAR` are fixed-length, `VARCHAR`/`VARCHAR2`/`NVARCHAR` variable-length, `CLOB` for large text; `NCHAR`/`NVARCHAR` support Unicode | `first_name VARCHAR2(50)`, `country NCHAR(20)`, `description CLOB`                |
| Date/Time | DATE, TIME, DATETIME, TIMESTAMP, INTERVAL                        | Store dates, times, or durations; `DATE` includes day/month/year in Oracle; `TIMESTAMP` includes time                                                        | `hire_date DATE`, `created_at TIMESTAMP`, `duration INTERVAL DAY(3) TO SECOND(0)` |
| Binary    | BLOB, BINARY, VARBINARY                                          | Store binary data like images, files, or multimedia                                                                                                          | `photo BLOB`, `file_data VARBINARY(1000)`                                         |
| Boolean   | BOOLEAN, BIT                                                     | Store true/false values; BIT often 0/1 in SQL Server                                                                                                         | `is_active BOOLEAN`, `flag BIT`                                                   |
| Special   | JSON, XML, UUID, ENUM, ROWID, Spatial types                      | Store structured data, unique identifiers, or special formats                                                                                                | `config JSON`, `user_id UUID`, `status ENUM('A','B','C')`                         |

**_Reference link for Datatypes in oracle:_**
[https://drive.google.com/drive/my-drive](https://)

**_What is the result of Number(2,2)?_**

1. What it is NUMBER(p,s) is Oracle’s flexible numeric type:

- p = precision (total digits, max 38)
- s = scale (digits to the right of the decimal)
- Digits left of decimal = p - s.

2. How to choose p and s (step by step)

`NUMBER(p, s)`

- p = precision → total number of digits (max 38).
- s = scale → number of digits to the right of the decimal point.
- Digits before decimal = p - s.

3. For examples

`NUMBER(4,2)`

Precision = 4 (max 4 digits total).
Scale = 2 (2 digits after the decimal).
Digits before decimal = p - s = 4 - 2 = 2.

Full range = -99.99 to +99.99.

**_What are types of SQL?_**

![image](https://hackmd.io/_uploads/rJ66dJfsge.png)

| Type    | Full Form                    | Purpose                                        | Examples                                             |
| ------- | ---------------------------- | ---------------------------------------------- | ---------------------------------------------------- |
| **DDL** | Data Definition Language     | Defines and manages database schema/structure  | `CREATE`, `ALTER`, `DROP`, `TRUNCATE`, `RENAME`      |
| **DML** | Data Manipulation Language   | Manipulates the data inside tables             | `INSERT`, `UPDATE`, `DELETE`, `MERGE`                |
| **DQL** | Data Query Language          | Retrieves/query data from tables               | `SELECT`                                             |
| **DCL** | Data Control Language        | Manages access/permissions to database objects | `GRANT`, `REVOKE`                                    |
| **TCL** | Transaction Control Language | Controls transactions (save/undo changes)      | `COMMIT`, `ROLLBACK`, `SAVEPOINT`, `SET TRANSACTION` |

**In-Short:**

1. DDL → define structure
1. DML → manipulate data
1. DQL → query data
1. DCL → control permissions
1. TCL → manage transactions

**_Note:_**

Case Sensitivity in Oracle DB:

1. Identifiers (tables, columns, etc.),By default, not case-sensitive → Oracle stores them in uppercase.
1. SELECT name FROM employees; = SELECT NAME FROM EMPLOYEES;
1. If created with double quotes ("Name"), they become case-sensitive.
1. Case-sensitive → 'Alice' ≠ 'ALICE'.
1. Use UPPER() / LOWER() for case-insensitive search.
