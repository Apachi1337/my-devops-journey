# OverTheWire Bandit - Level 1 to Level 2
The goal of this level is to find the password for the next level. Its stored in a file called `-` located in the home directory.

# Solution

We SSH into level 1 using `bandit1@bandit.labs.overthewire.org -p 2220`. You will then be asked for a password. Use the password you found in level 0:
```bash
ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If
```

Once logged in we use the `ls` command to see what files are available in the directory.
```bash
ls
```
This returned a file called `-`. Since its a dashed file name, I needed to specify the full location of the file used so i used the following command to get the password:
```bash
./-
```
The output:
```bash
263JGJPfgU6LtdEvgfWU1XP5yac29mFx
```
Once we have the password, we log out of the session using `exit`

# Key Learning Outcomes
1. Understanding how to manage files with unusual or special characters in their names (e.g. `-`)
2. Using relative paths `./` to accurately reference files in the current directory.
3. Reinforcing the usage of `ls` and `cat` for navigation and file reading.
