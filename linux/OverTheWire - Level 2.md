# OverTheWire Bandit - Level 2 to Level 3
The password for this level is stored in a file called spaces in this filename located in the home directory. We need to retrieve this password to access the next level.
# Solution

We SSH into `bandit2@bandit.bandit.labs.overthewire.org -p 2220` using the password found in the previous level:

```bash
263JGJPfgU6LtdEvgfWU1XP5yac29mFx
```

Once in, `ls` will show us what files are available. This returned a file called:
```bash
spaces in this filename
```
Since there are spaces in between the filename, you can either enclose the filename in quotes `"` or `'`:

```bash
cat "spaces in this filename"
```
Or you can use the 2nd method which is to put a `\` before every space in the filename:

```bash
cat spaces\ in\ this\ filename 
```

This outputted the password for Level 3:

```bash
 MNk8KNH3Usiio41PRUEoDFPqfxLPlSmx
```
Exit the session once done using `exit`



