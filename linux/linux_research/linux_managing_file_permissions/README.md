Research:

### Does being the owner of a file mean you have full permissions on that file? Explain.
No, the owner has permission to change the permissions. They must explicitly change the permission to grant full control (read, write and execute).

### If you give permissions to the User entity, what does this mean?
The user entity is the owner. you can give permission to read, write and execute.

### If you give permissions to the Group entity, what does this mean?
This is when you decide what the group that the owner belongs to can do. Like the owner it can be to read, write and execute.

### If you give permissions to the Other entity, what does this mean?
Other refers to all other users that can access the system and also can be given permission to read, write or execute.

### You give the following permissions to a file: User permissions are read-only, Group permissions are read and write, Other permissions are read, write and execute. You are logged in as the user which is owner of the file. What permissions will you have on this file? Explain.
You will have permission to read-only because you are the user which is the owner of the file


### Here is one line from the ls -l. Work everything you can about permissions on this file or directory.
rwxr-xr-- 1 tcboony staff  123 Nov 25 18:36 keeprunning.sh

- *rwx* means the owner can read write and execute
- *r-x* means the group can read and execute
- *r--* measn others can only read 
- *tcboony* is the username
- *staff* is the group name
- *123* is the size of the file in bytes
- *Nov 25 18:36* is the date and time of the last modification
- *keeprunning.sh* file name
