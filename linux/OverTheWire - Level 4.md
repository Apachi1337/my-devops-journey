# OverTheWire Bandit - Level 4 to Level 5
The password for this level is stored in the only human-readable file in the `inhere` directory
# Solution
SSH into bandit 4 `bandit4@bandit.labs.overthewire.org -p 2220` using the password found in the previous level:
```bash
2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ
```
Use `ls` to see what files are available. This returned a directory called:
```bash
inhere
```
Navigate to it using:
```bash
cd /home/bandit4/inhere
```
Used `ls-a` to view all files and this returned 10 files:
```bash
./-file00: data
./-file01: data
./-file02: data
./-file03: data
./-file04: data
./-file05: data
./-file06: data
./-file07: ASCII text
./-file08: data
./-file09: data
```
Being the newbie i am, i opened each file using `cat` but later found out i could've using the following command to return the required file:
```bash
file * | grep "ASCII text"
```
This would have returned the only human readable file available in the directory which is `file07. Oh well, what doesn't kill you makes you stronger i guess...

Use `cat` to view the `file07` which returns the password:
```bash
4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw
```

Exit the session using `exit`.

# Key Learning Outcomes
1. How to use the `file` command to inspect and identify file types.
2. Understanding how to use wildcards `*` for efficient handling of multiple files.
3. Learning to use the `grep` command to search for specific patterns or strings within files
