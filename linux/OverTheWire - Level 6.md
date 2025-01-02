# OverTheWire Bandit - Level 6 to Level 7
The password for this level is stored somewhere on the server and has all of the following properties:

owned by user bandit7,
owned by group bandit6,
33 bytes in size
# Solution

SSH into bandit 6 `bandit6@bandit.labs.overthewire.org -p 2220` using the password from previous level:
```bash
HWasnPhtq9AVKe0dmk45nxy20cvUa6EG
```
Use `ls` to see what's available but couldn't see anything.

I initially used the following command to try and find the location but it was coming back empty:

```bash
find / -type f -user bandit7 -group bandit6 -size 33c 2>/dev/null 
```
After banging my head at the wall for an hour or so, i decided to take the size variable `-size 33c` out and just use:

```bash
find / -type f -user bandit7 -group bandit6 2>/dev/null 
```
This returned the location: 
```bash
/var/lib/dpkg/info/bandit7.password 
```
Navigate to it using:
```bash
/var/lib/dpkg/info/bandit7.password
```
Open the file:
```bash
cat bandit7.password
```
The outputs:
```bash
morbNTDkSW6jIlUc0ymOdMaLnOlFVAaj
```

# Notes 
Using `2>/dev/null` is helpfull as it hides the errors that are outputted.
