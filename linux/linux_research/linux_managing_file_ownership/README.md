Research:

### Why is managing file ownership important?
Very important for security and system integrity
- Security and access control
  - owners have the permissions to ensure that sensitive files can only be modified and accessed by users with authority. 
  - unauthorized users cannot access specific files, if they can it may cause accidental changes to important files.
- Collaboration
  - collaborators can access the same shared file or folder if they have the appropriate access
  - different file access can determine if users can edit or just read a file

### What is the command to view file ownership?
```ls -l``` give the long form info about a file or folder. Within that there will be a username associated with the owner.

### What permissions are set when a user creates a file or directory? Who does file or directory belong to?
- The default permissions for a file are typically:
  - owner: can read or write
  - group: can read
  - anyone else: can read
- The default permissions for a directory:
  -  owner: can read, write or execute
  - group: can or execute read
  - anyone else: can or execute read
- The file belongs to the specific user and the group that user belongs to


### Why does the owner, by default, not receive X permissions when they create a file?
To avoid accidental execution of a file that is not meant to be executed as program. This stops faulty or malicious code.
  

### What command is used to change the owner of a file or directory?
```chown```

