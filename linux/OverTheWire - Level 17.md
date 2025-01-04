# OverTheWire Bandit - Level 17 to Level 18
There are 2 files in the homedirectory: passwords.old and passwords.new. The password for the next level is in passwords.new and is the only line that has been changed between passwords.old and passwords.new
# Solution
SSH into `bandit17` using the key we got from the previous level:
```bash
ssh -i ssh_key17 bandit17@bandit.labs.overthewire.org -p 2220
```
There are two files in the home directory and the objective is to find the password that’s been changed between the old password file and the new one. I used the following:
```bash
diff passwords.old passwords.new
```
This then returned:
```bash
42c42
< ktfgBvpMzWKR5ENj26IbLGSblgUG9CzB
---
> x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO
```
The `diff` command lets us find the difference between the two files. `<` means that the line exists in the old file but not the new. `>` means that the line exists in the new file and not the old. Therefore, our password for the next level is:
```bash
x2gLTTjFwMOhQ8oWNbMN362QKxfRqGlO
```
# Key Learning Outcome
1. Understanding how to use the `diff` command to compare the contents of two files and identify differences.
2. Learning how to extract relevant information from a file using `cat` and other tools like `diff` to find specific changes between files.
3. Gaining experience with basic file comparison techniques, which are important for tasks like identifying changes in logs or configurations.
