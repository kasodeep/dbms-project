### What:

- A relation is in the third normal form, if there is no transitive dependency for non-prime attributes as well as it is in the second normal form.

### How To Prevent:

- Mutual Exclusion
- Hold And Wait
- No Preemption
- Circular Wait

### Wait And Die:

- An older transaction is allowed to wait for a younger transaction, whereas a younger transaction requesting an item held by an older transaction is aborted and restarted.

### Wound Wait:

- It is just the opposite of the Wait_Die technique. Here, a younger transaction is allowed to wait for an older one, whereas if an older transaction requests an item held by the younger transaction, we preempt the younger transaction by aborting it.
