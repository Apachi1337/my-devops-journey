# OverTheWire Bandit - Level 7 to Level 8
The password for this level is stored in the file data.txt next to the word millionth.
# Solution

SSH into bandit 7:

```bash
ssh bandit7@bandit.labs.overthewire.org -p 2220
```
Use `ls` to see what's available. Fount a `data.txt` file, opened it using `cat`:

```bash
cat data.txt
```
However there were too many entires to manually go through. I then used the following command:

```bash
grep 'millionth' data.txt
```
This command let me search for the pattern `millionth` in the file and found the password which was:

```bash
dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc
```

We then exit the session using `exit`.

# Key Learning Outcomes
1. Developing an approach for searching through large text files to locate keywords or specific phrases.
2. Understanding how to use the `grep` command to search for specific patterns or text within a file.
3. Reinforcing the use of `cat` for displaying file contents when locating specific information.
