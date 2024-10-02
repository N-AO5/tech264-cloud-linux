### What numeric values are assigned to each permission?
- Read = r = 4
- Write = w =2
- Execute = x = 1
### What can you with the values assign read + write permissions?
 The values can be used to set permissions along size the ```chmod``` command. eg ``` chmod 754 *filename*``` means user = 7 (r+w+x), group = 5 (r+x) and others = 4 (r)

### What value would assign read, write and execute permissions?
7

### What value would assign read and execute permissions?
5

### Often, a file or directory's mode/permissions are represented by 3 numbers. What do you think 644 would mean?
user = r + w
group = r
other = r
