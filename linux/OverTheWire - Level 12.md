# OverTheWire Bandit - Level 12 to Level 13
The password for this level is stored in the file data.txt, which is a hexdump of a file that has been compressed multiple times.
# Solution
SSH into bandit 12 `bandit12@bandit.labs.overthewire.org -p 2220` using the password from previous level:
```bash
7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4
```
Create a new temporary directory using “`mktemp -d` and this generated a temporary directory called `tmp/tmp.aPMy98g4o`. I then copied the data.txt file using:

```bash
~cp data.txt /tmp/tmp.aPMy98g4o`
````
and verified it was in that location using:
```bash
ls /tmp/tmp.aPMy98g4o | grep data.txt
````
