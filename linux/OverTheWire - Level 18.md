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
We then exit the session using `exit`.

# Key Learning Outcomes
1. Understanding how to use SSH to run a single command on a remote system without triggering a login shell environment.
2. Learning how you can use the `ssh` command with a single remote command `cat readme`, you can retrieve the password while avoiding the issues caused by the `.bashrc` logout configuration.
3. Gaining experience in using SSH with custom commands to interact with remote systems securely while avoiding side effects such as automatic logout.
