### Functional Dependency:

- Functional Dependency (FD) is a constraint that determines the relation of one attribute to another attribute in a Database Management System (DBMS).
- Functional Dependency helps to maintain the quality of data in the database.

### Multivalued Dependency:

- Multivalued dependency occurs in the situation where there are multiple independent multivalued attributes in a single table.

### Trivial Dependency:

- The Trivial dependency is a set of attributes which are called a trivial if the set of attributes are included in that attribute.
- Ex: {Emp_id, Emp_name} -> Emp_id

### Non-Trivial Dependency:

- Functional dependency which also known as a nontrivial dependency occurs when A->B holds true where B is not a subset of A.
- Ex: (Company) -> {CEO}

### Transitive Dependency:

- (Company) -> (Name) -> (Age)

### Normalization:

- Normalization is a method of organizing the data in the database which helps you to avoid data redundancy, insertion, update & deletion anomaly.

### Why Normalization:

- Prevent the Same Data from Being Stored in Many Places
- Prevent Updates Made to Some Data and Not Others
- Prevent Deleting Unrelated Data

### First Normal Form:

- If a relation contains a composite or multi-valued attribute, it violates the first normal form, or the relation is in the first normal form if it does not contain any composite or multi-valued attribute.
- Ex: Multiple Phone Numbers.

### Second Normal Form:

- To be in the second normal form, a relation must be in the first normal form and the relation must not contain any partial dependency.
- Ex: Student No, Course No, Fee.

### Third Normal Form:

- A relation is in the third normal form, if there is no transitive dependency for non-prime attributes as well as it is in the second normal form.
