# OverTheWire Bandit - Level 13 to Level 14
The password for this level is stored in /etc/bandit_pass/bandit14 and can only be read by user bandit14. For this level, you don’t get the next password, but you get a private SSH key that can be used to log into the next level.
# Solution
SSH into bandit 13 `bandit13@bandit.labs.overthewire.org -p 2220` using the password from previous level:
```bash
FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn
```
Once logged in, we see a file called `sshkey.private` after using `ls` to view what files are available. Since the goal of the level is to use the private SSH key to log into the next level instead of a password, I used:
```bash
ssh -i sshkey.private bandit14@localhost -p 2220
```
This command let me use the private key `sshkey.private` to login into the `bandit14` user account on `localhost` through port `-p 2220`.

We then exit the session using `exit`.
