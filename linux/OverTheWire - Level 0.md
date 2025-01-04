# OverTheWire Bandit - Level 0 to Level 1
The goal of this level is for you to log into the game using SSH. The host to which you need to connect is bandit.labs.overthewire.org, on port `2220`. The username is `bandit0` and the password is `bandit0`.
# Solution

SSH is used for logging into secure servers from unsecured servers. SSH wasn't installed by default so we install it using:

```bash
sudo apt install openssh-client openssh-server
```

Once that was installed, I used the following to ssh into the lab using the provided username `bandit0` and the port `2220`. The `-p` option is used to specify the port

```bash
ssh bandit0@bandit.labs.overthewire.org -p 2220
```

I then used the ls command to see what files were present and saw one file called read me. Used the `cat` command which lets us view the contents.

```bash
ls
cat readme
```
The output was:
```bash
Congratulations on your first steps into the bandit game!!
Please make sure you have read the rules at https://overthewire.org/rules/
If you are following a course, workshop, walkthrough or other educational activity,
please inform the instructor about the rules as well and encourage them to
contribute to the OverTheWire community so we can keep these games free!
The password you are looking for is: ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If
```

The password for the next level is: ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If

# What I've Learned

1. Importance of `ssh` and how its used to connect securley to remote machines.
2. Basic navigation and file manipulation using `ls` to list files and `cat` to view contents of a file. 
