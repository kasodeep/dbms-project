### What is a database?

- A database is an organized collection of data, so that it can be easily accessed and managed.
- The main purpose of the database is to operate a large amount of information by storing, retrieving, and managing data.

### What is DBMS

- A database management system is a collection of programs that enables users to create and maintain a database.
- If facilitates the process of defining, constructing, manipulating and sharing databases among various users and applications.

### Need for DBMS

1. Data Organization and Management
2. Data Security and Privacy
3. Data Integrity and Consistency
4. Concurrent Data Access
5. Data Analysis and Reporting
6. Scalability and Flexibility
7. Cost-Effectiveness

### File based Approach Vs DBMS:

The 3 main reasons to switch from file based to dbms are as follows:

1.  Data Security
2.  Data Redundancy
3.  Data Independence

### Two Tier vs Three Tier:

1.  Two-Tier Database Architecture:

    - In two-tier, the application logic is either buried inside the User Interface on the client or within the database on the server (or both).
    - With two-tier client/server architectures, the user system interface is usually located in the user’s desktop environment and the database management services are usually in a server that is a more powerful machine that services many clients.

2.  Three-Tier Database Architecture:
    - In three-tier, the application logic or process lives in the middle-tier, it is separated from the data and the user interface.
    - Three-tier systems are more scalable, robust and flexible. In addition, they can integrate data from multiple sources.

### Database Languages:

1.  DDL:

    - DDL is a set of SQL commands used to create, modify, and delete database structures but not data. These commands are normally not used by a general user, who should be accessing the database via an application.

2.  DML:

    - The SQL commands that deal with the manipulation of data present in the database belong to DML or Data Manipulation Language and this includes most of the SQL statements.

3.  DCL:

    - DCL includes commands such as GRANT and REVOKE which mainly deal with the rights, permissions, and other controls of the database system.

4.  TCL:
    - Transactions group a set of tasks into a single execution unit. Each transaction begins with a specific task and ends when all the tasks in the group are successfully completed. If any of the tasks fail, the transaction fails.

### Instance/State:

- In simple words, it is the snapshot of the database taken at a particular moment.
- It can also be described in more significant way as the collection of the information stored in the database at that particular moment.

### Schema:

- It is the overall description or the overall design of the database specified during the database design.
- Important thing to be remembered here is it should not be changed frequently.

### Physical Database Schema:

- This schema pertains to the actual storage of data and its form of storage like files, indices, etc. It defines how the data will be stored in a secondary storage.

### Logical Database Schema:

- This schema defines all the logical constraints that need to be applied on the data stored. It defines tables, views, and integrity constraints.

### Data Abstraction:

1.  View Level.
2.  Conceptual Level. (Concentrates on entities, data-types and relationships.)
3.  Physical Level.

### Entity Integrity Constraint:

    The primary key value cannot be null.

### Referential Integrity Constraint:

    The FK should refer to an existing PK in another table of must be null.

### Degree Of Relation:

- 1:1 -> One instance of entity A associated with one instance of B.
- 1:M -> One instance of entity A associated withn zero or many instances of B.
- M:M -> Self Explanatory.

### Keys:

1.  Primary Key:

    - There can be more than one candidate key in relation out of which one can be chosen as the primary key. It is a unique key.
    - It can identify only one tuple (a record) at a time.

2.  Foreign Key:

3.  Candidate Key:

    - The minimal set of attributes that can uniquely identify a tuple is known as a candidate key.
    - It is a minimal super key.

4.  Alternate Key:

    - The candidate key other than the primary key is called an alternate key.
    - All the keys which are not primary keys are called alternate keys.
    - It is a secondary key.

5.  Super Key:
    - A super key is a group of single or multiple keys that identifies rows in a table. It supports NULL values.
    - Adding zero or more attributes to the candidate key generates the super key.

### Relational Algebra:

1. Select:

   - The SELECT operation is used for selecting a subset of the tuples according to a given selection condition.

2. Projection:

   - The projection eliminates all attributes of the input relation but those mentioned in the projection list.

3. Union:

   - UNION is symbolized by ∪ symbol. It includes all tuples that are in tables A or in B. It also eliminates duplicate tuples.

4. Cartesian Product:

   - Cartesian Product in DBMS is an operation used to merge columns from two relations. Generally, a cartesian product is never a meaningful operation when it performs alone.
