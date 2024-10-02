Research:

### What command changes file permissions?

```chmod```

### To change permissions on a file what must the end user be? (2 answers)

- Owner
- Super User


### Give examples of some different ways/syntaxes to set permissions on a new file (named testfile.txt) to:

#### Set User to read, Group to read + write + execute, and Other to read and write only

``` chmod u=r,g=rwx,o=rw testfile.txt```


#### Add execute permissions (to all entities)

``` chmod a+x testfile.txt```

#### Take write permissions away from Group
``` chmod g-w testfile.txt```

#### Use numeric values to give read + write access to User, read access to Group, and no access to Other.

``` chmod 640 testfile.txt```

