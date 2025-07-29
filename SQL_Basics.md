# **SQL Basics**

What is Database?
A database is an organized collection of structured information or data typically stored electronically in a computer system or server.

What is DBMS?
A database is usually controlled by a database management system. It is a kind of application used to interact with database.

**Note:*  Together, the data and database management system, along with other applications associated with them are referred to as database system, often shortened to just database.

What is RDBMS?
* RDBMS stands for Relational Database Management System.
* It is a type of database management system where:
* Data is stored in tables (called relations).
* Each table consists of rows (records) and columns (fields).
* Relationships can exist between different tables using keys (like primary keys and foreign keys).

> High-level overview of how databases interact with applications using SQL and a DBMS.

![image](https://hackmd.io/_uploads/S1Cou1lveg.png)

What is ER model/Conceptual Data Model?
An Entity-Relationship (ER) Model is a diagrammatic approach to database design that visually represents the entities in a system and the relationships between them.

What is Logical Model Design?
Logical Model Design is the second stage in the database design process. It translates the conceptual model (ER diagram) into a detailed, structured schema that defines how data will be logically organized — without worrying yet about physical storage or performance.

A Logical Data Model (LDM) defines:

* Tables (based on entities)
* Columns/Attributes
* Data types
* Primary and foreign keys
* Relationships between tables (1:1, 1:M, M:N)
* Normalization rules (to reduce redundancy)

What is Physical Model?
A Physical Data Model (PDM) is the third and final stage of database design. It represents how the data will actually be stored in the database, including technical and performance-related details specific to the chosen DBMS (like Oracle, MySQL, PostgreSQL, etc.).

A Physical Data Model is a detailed representation of a database that includes:

* Exact table structures
* Data types and sizes
* Indexes and partitions
* Constraints (PK, FK, UNIQUE, CHECK)
* Storage details (tablespaces, filegroups, etc.)
* DBMS-specific features (e.g., triggers, sequences)

What is Normalization?
* Normalization is a process of organizing the data in the database to avoid data redundancy, insertion anomaly, update anomaly and deletion anomaly.
* Normalization is the process to eliminate data redundancy and ehance data integrity in the table.

What are different type of anomalies in DBMS?
Anomalies are problems or inconsistencies that can occur in a database when it is not properly normalized. These usually happen when all the data is stored in a single large table instead of being divided into related tables.

There are three main types:

1. Insertion Anomaly: Occurs when you cannot insert data into a table without adding unnecessary or unrelated data.
2. Update Anomaly: Occurs when the same piece of data is duplicated in multiple places, and updating one instance requires updating all copies to avoid inconsistency.
3. Deletion Anomaly: Occurs when deleting a record also unintentionally deletes useful information.

Example:

![image](https://hackmd.io/_uploads/HksFsNHDgx.png)

What are different types of Normalization?
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
6. Fifth Normal Form (5NF):
Deals with join dependencies and ensures that a table can be reconstructed from smaller tables without losing information.










