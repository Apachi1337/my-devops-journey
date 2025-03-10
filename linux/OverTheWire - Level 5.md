# OverTheWire Bandit - Level 5 to Level 6
The password for this level is stored in a file somewhere under the inhere directory and has all of the following properties:

human-readable,
1033 bytes in size,
not executable
# Solution
SSH into bandit 5 `bandit5@bandit.labs.overthewire.org -p 2220` using the password from previous level:

```bash
4oQYVPkxZOOEOO5pTW81FB8j8lxXGUQw 
```
Use `ls` to see what's available. Saw a directory called `inhere` and navigated to it:

```bash
cd inhere
```
Used `ls-a` to view all the files and saw a lot of files in there. I initially tried to use ‘ls -l’ command to see if I could cheat a little bit and find the correct file by the size. Looked through them all and couldn’t find a file that matched the 1033 byte spec exactly.
Tried opening a few files that had a file size close to 1033 but didn’t contain what I was looking for. After a bit more googling and reading up on commands I ended up using the `find` command to locate the file using the properties of the file:

```bash
find /home/bandit5/inhere - type f -size 1033c -readable ! -executable
```
and that returned:
```bash
/home.bandit5/inhere/maybehere07/.file2
```
Navigated to the path and opened the file:
```bash
cat ./.file2
```
This outputs the password:
```bash
HWasnPhtq9AVKe0dmk45nxy20cvUa6EG
```
Exit the session once you retrieve the password for level 6:
```bash
exit
```
# Key Learning Outcomes
1. Understanding how to use the `find` command to search for files based on name or type in a directory(and subdirectories).
2. Learning how to specify search criteria with options like `-type f` and `- name`.

