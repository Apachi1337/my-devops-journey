# OverTheWire Bandit - Level 8 to Level 9
The password for this level is stored in the file data.txt and is the only line of text that occurs only once.
# Solution
SSH into bandit 8 `bandit8@bandit.labs.overthewire.org -p 2220` using the password from previous level:

```bash
dfwvzFQi4mU0wfNbFOe9RoWskMLg7eEc
```
Use `ls` to see what's available and we see a `data.txt` file. Since the password only occurs once I use:

```bash
sort data.txt | uniq -u
```
The `sort` command groups together identical lines while `uniq -u` prints lines that only occur once. 
This outputs the password:

```bash
4CKMh1JI91bUIZZPXDqGanal4xvAg0JM
```
We then exit the session using `exit`.

# Key Learning Outcome
1. Learning how to use the sort command to organize lines in a file alphabetically or numerically.
2. Understanding that the `uniq` command identifies lines that occur only once.
3. Gaining the ability to combine multiple commands using the pipe `|` command to filter and find specific content.
