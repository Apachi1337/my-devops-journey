# OverTheWire Bandit - Level 11 to Level 12
The password for this level is stored in the file data.txt, where all lowercase (a-z) and uppercase (A-Z) letters have been rotated by 13 positions
# Solution
SSH into bandit 11 `bandit11@bandit.labs.overthewire.org -p 2220` using the password from previous level:

```bash
dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr
```
In order to decode ROT13 text, you map each letter to its rotated counterpart using the `tr` command:
```bash
tr 'A-Za-z' 'N-ZA-Mn-za-m' < data.txt
```
`'A-Za-z'` matched all uppercase and lowercase letters. `'N-ZA-Mn-za-m'` maps each letter to the one 13 positions forward or backwards. This prints out:

```bash
The password is 7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4
```
We then exit the session using `exit`.
# Key Learning Outcomes
1. Understanding how to use the `tr` command to apply the ROT13 cipher and decode encrypted text.
2. Developing the ability to manipulate and decode text using simple substitution techniques.
