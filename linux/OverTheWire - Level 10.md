# OverTheWire Bandit - Level 10 to Level 11
The password for this level is stored in the file data.txt, which contains base64 encoded data
# Solution
SSH into bandit 10 `bandit10@bandit.labs.overthewire.org -p 2220` using the password from previous level:
```bash
 FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey
```
Used `cat data.txt` to see what the encoded file looked like and it returned:
```bash
 VGhlIHBhc3N3b3JkIGlzIGR0UjE3M2ZaS2IwUlJzREZTR3NnMlJXbnBOVmozcVJyCg==
```
I then used the following to decode the file:
```bash
base64 -d data.txt 
```
This returned the password:
```bash
dtR173fZKb0RRsDFSGsg2RWnpNVj3qRr 
```
We then exit the session using `exit`
# Key Learning Outcomes
1. Learning how to decode base64-encoded data using the `base64 -d` command.
2. Using the `cat` command to inspect the encoded data.
3. Understanding the concept of encoding and decoding in base64, a common technique for data transmissions.
