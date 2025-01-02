# OverTheWire Bandit - Level 9 to Level 10
The password for this level is stored in the file data.txt in one of the few human-readable strings, preceded by several ‘=’ characters.
# Solution
SSH into bandit 9 `bandit9@bandit.labs.overthewire.org -p 2220` using the password from previous level:
```bash
4CKMh1JI91bUIZZPXDqGanal4xvAg0JM
```

 Used the `string` command on the `data.txt` file to sort the human readable contents.

 ```bash
string data.txt
```
Now we use the following to filter even further and view all human-readable strings that were preceeded by several `=` characters:
```bash
string data.txt | grep “===” 
```

The output gave me:
```bash
}========== the
3JprD========== passwordi
~fDV3========== is
D9========== FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey
So the password is FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey

```
Password is:

 ```bash
FGUW5ilLVJrxX9kMYMmlN4MgbpfMiqey
```

We then exit the session using `exit`.


