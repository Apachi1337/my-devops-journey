# OverTheWire Bandit - Level 0
The goal of this level is for you to log into the game using SSH. The host to which you need to connect is bandit.labs.overthewire.org, on port 2220. The username is bandit0 and the password is bandit0. Once logged in, go to the Level 1 page to find out how to beat Level 1.
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
The contents had the password: ZjLjTmM6FvvyRnrb2rfNWOZOTa6ip5If
