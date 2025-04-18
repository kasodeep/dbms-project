### Transactions:

    A transaction can be defined as a group of tasks.

### States of Transactions:

1. Active State.
2. Partially Committed.
3. Committed State.
4. Failed State.
5. Aborted State.
6. Terminated State.

### Commit:

    COMMIT command is used to permanently save any transaction into the database.

### Rollback:

    This command restores the database to last commited state.
    It is also used with SAVEPOINT command to jump to a savepoint in an ongoing transaction.

### SavePoint:

    SAVEPOINT command is used to temporarily save a transaction so that you can rollback, to that point whenever required.

### ACID:

    Atomicity, Consistency, Isolation, Durability.

### Implementation:

1. Atomicity and Durability are implemented by the concept of shadow copy.
2. In the shadow-copy scheme, a transaction that wants to update the database first creates a complete copy of the database.
3. All updates are done on the new database copy, leaving the original copy, the shadow copy, untouched.

### Concurrent Transactions:

Concurrency control is an essential aspect of database management systems (DBMS) that ensures transactions can execute concurrently without interfering with each other.

1. Lost Update:

   - In the lost update problem, an update done to a data item by a transaction is lost as it is overwritten by the update done by another transaction.

2. Dirty Read:

   - Temporary update or dirty read problem occurs when one transaction updates an item and fails.
   - But the updated item is used by another transaction before the item is changed or reverted back to its last value.

3. Incorrect Summary:

   - Consider a situation, where one transaction is applying the aggregate function on some records while another transaction is updating these records.
   - The aggregate function may calculate some values before the values have been updated and others after they are updated.

4. Unrepeatable Read Problem:

   - The unrepeatable problem occurs when two or more read operations of the same transaction read different values of the same variable.

### Advantages:

- Reduce Wait Time
- High Throughput
- High resource utilization.

### Concurrency Control:

    In a multiprogramming environment where multiple transactions can be executed simultaneously, it is highly important to control the concurrency of transactions.

1.  Lock Based Protocol

- Database systems equipped with lock-based protocols use a mechanism by which any transaction cannot read or write data until it acquires an appropriate lock on it.

  - Binary Locks.
  - Shared/Exclusive Locks.
  - Different Protocols:
    - Simplistic Lock Protocol
    - Pre-claiming Lock Protocol.
    - Two Phase Locking.
    - Strict Two Phase. (All not released until end)

2. Time Stamp Based Protocol

- The most commonly used concurrency protocol is the timestamp based protocol.
- This protocol uses either system time or logical counter as a timestamp.
- The timestamp-ordering protocol ensures serializability among transactions in their conflicting read and write operations.

### Schedule:

1.  Serial Schedule:
    Schedules in which the transactions are executed non-interleaved, i.e., a serial schedule is one in which no transaction starts until a running transaction has ended are called serial schedules.

2.  Non-Serial Schedule:
    This is a type of Scheduling where the operations of multiple transactions are interleaved.

    - Serializable:

        - A serializable schedule is a schedule (sequence of operations) for a set of transactions that produces the same results as some serial execution of those transactions.
        - In other words, even though the transactions might be interleaved, the end state of the database will be the same as if the transactions were executed one after the other without overlapping.

        - a. Conflict Serializable
              A schedule is called conflict serializable if it can be transformed into a serial schedule by swapping non-conflicting operations.

        - b. View Serializable

    - Non-Serializable:

    - a. Recoverable
        - Schedules in which transactions commit only after all transactions whose changes they read commit are called recoverable schedules.

        - Cascading
        - Cascade-Less
        - Strict

    - b. Non-Recoverable
