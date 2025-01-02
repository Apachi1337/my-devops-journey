# OverTheWire Bandit - Level 19 to Level 20
The password for this level is stored in a hidden file in the inhere directory.
# Solution
SSH into bandit 19 `bandit19@bandit.labs.overthewire.org -p 2220` using the password from previous level:
```bash
cGWpMaKXVwDUNgPAVJbWYuGHVn9zl3j8
```
Once logged in, we see a file called `bandit20-do` using `ls`. We then use `ls-l` to check the permissions of the file and the output showed:
```bash
-rwsr-x--- 1 bandit20 bandit19 14880 Sep 19 07:08 bandit20-do
```
This meant the file is executable and owned by `bandit20` and that `bandit19` should also be able to run it. I then run the following to see what it would return:

```bash
./bandit20-do
```
It returns:
```bash
Run a command as another user
```
This hint along with knowing that `bandit20` owns `bandit20-do` means it will run with the privileges of `bandit20`. I use the `cat` command as `bandit20-do` to access the password from `/etc/bandit_pass/bandit20`:

```bash
./bandit20-do cat /etc/bandit_pass/bandit20 
```
That returns the password:
```bash
0qXahG8ZjOVMN9Ghs7iOWsCfZyXOUbYO 
```
We then exit the session using `exit`.
