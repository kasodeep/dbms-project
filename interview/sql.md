### What is SQL:

    SQL stands for Structured Query Language. SQL lets you access and manipulate databases.

### Important Key-Words:

```sql
Create, Primary Key, Insert, Select, From, Alter, Add, Distinct, Update, Set, Delete, Truncate.
As, Order By, Asc, Desc, Between, Where, And, Or, Not, Limit, Is Null, Drop, Drop Column.
Drop Database, Drop Table, Group By, Having, In, Join, Union, Exists, Like, Case.
```

### Composite Key:

- It is a primary key with more than one attribute.
- CONSTRAINT COMP_KEY PRIMARY KEY (Person_ID, Person_PHONE).

### Join And It's Types:

#### Inner Join:

    The INNER JOIN keyword selects all rows from both the tables as long as the condition is satisfied.

#### Left Join:

    LEFT JOIN returns all the rows of the table on the left side of the join and matches rows for the table on the right side of the join. For the rows for which there is no matching row on the right side, the result-set will contain null.

#### Right Join:

    RIGHT JOIN returns all the rows of the table on the right side of the join and matching rows for the table on the left side of the join.

#### Full Join:

    FULL JOIN creates the result-set by combining results of both LEFT JOIN and RIGHT JOIN. The result-set will contain all the rows from both tables.

### Views:

- Views in SQL are a kind of virtual table.
- A view also has rows and columns like tables, but a view doesn’t store data on the disk like a table.
- View defines a customized query that retrieves data from one or more tables, and represents the data as if it was coming from a single source.

```sql
CREATE VIEW DetailsView AS
SELECT NAME, ADDRESS
FROM StudentDetails
WHERE S_ID < 5;

SELECT * FROM DetailsView;
```

### Trigger:

- A trigger is a stored procedure in a database that automatically invokes whenever a special event in the database occurs.
- For example, a trigger can be invoked when a row is inserted into a specified table or when specific table columns are updated.

### Unique vs Primary:

- A primary key is a column of a table that uniquely identifies each tuple (row) in that table.
- The primary key enforces integrity constraints to the table.

- Unique Key constraints also identify an individual tuple uniquely in a relation or table.
- A table can have more than one unique key, unlike a primary key.
- Unique key constraints can accept only one NULL value for the column.

### Delete vs Truncate:

- Delete is DML used to delete a record from a table.
- Truncate is DDL used to delete a table.

### Grant & Revoke:

```sql
CREATE USER gfguser1@localhost IDENTIFIED BY 'abcd';
SHOW GRANTS FOR gfguser1@localhost

GRANT EXECUTE ON FUNCTION TO [username]
GRANT ALL ON user_table TO [usernamE]
```

### Indexing:

- Indexing is a data structure technique which allows you to quickly retrieve records from a database file. An - - Index is a small table having only two columns.
- The first column comprises a copy of the primary or candidate key of a table.

#### Primary Key Indexing:

##### Dense:

- In a dense index, a record is created for every search key valued in the database.
- This helps you to search faster but needs more space to store index records.

##### Sparse:

- In this method of indexing technique, a range of index columns stores the same data block address, and when data needs to be retrieved, the block address will be fetched.

#### Secondary Key Indexing:

- The secondary Index in DBMS can be generated by a field which has a unique value for each record.
- It is also known as a non-clustering index.

#### Clustered Index:

- In a clustered index, records themselves are stored in the Index and not pointers.
- Sometimes the Index is created on non-primary key columns which might not be unique for each record.
- In such a situation, you can group two or more columns to get the unique values and create an index which is called clustered Index.
