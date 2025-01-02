# OverTheWire Bandit - Level 18 to Level 19
The password for this level is stored in a file readme in the homedirectory. Unfortunately, someone has modified .bashrc to log you out when you log in with SSH
# Solution
For this level, I tried to SSH as we normally do with the password from the previous level but it kept disconnecting me. Luckily, we know the password for the next level is stored in the home directory inside a file called `readme`.  This means we can read the file using `cat` command without even having to log in using:

```bash
ssh bandit18@bandit.labs.overthewire.org -p 2220 ‘cat readme’
```
This then returned contents of the file which is the password:

```bash
cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8
```
