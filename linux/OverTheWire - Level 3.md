# OverTheWire Bandit - Level 3 to Level 4
The password for this level is stored in a hidden file in the inhere directory.
# Solution
SSH into bandit 3 `bandit3@bandit.labs.overthewire.org -p 2220` using the password from previous level:

```bash
MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx
```

Use `ls` to see what files are available, this returns a directory called:
```bash
inhere
```

Navigate to it using:

```bash
cd /home/bandit3/inhere
```
Once in the directory, we use the command:

```bash
ls-a
```
This lets us view all files including hidden ones and would you look at that, there's a file called:

```bash
...Hiding-From-You
```
To view the file we use:

```bash
cat ...Hiding-From-You
```
This outputs the password we were looking for:
```bash
2WmrDFRmJIq3IPxneAaMGhap0pFhF3NJ
```
We then exit the session using `exit`.

# Key Learning Outcomes
1. Improving navigation skills by exploring nestes directories using the `cd` command.
2. Understanding how to locate hidden files and directories with `ls-a`.
3. Reinforcing the ability to read file contents using the `cat` command effectively.
