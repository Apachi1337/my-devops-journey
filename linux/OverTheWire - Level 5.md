# OverTheWire Bandit - Level 5 to Level 6
The password for this level is stored in a file somewhere under the inhere directory and has all of the following properties:

human-readable
1033 bytes in size
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
Tried opening a few files that had a file size close to 1033 but didn’t contain what I was looking for. After a bit more googling and reading up on commands I decided to see if could filter the file based on the info I was given using:

```bash
find /home/bandit5/inhere - type f -size 1033c -readable ! -executable
```
and that returned:
```bash
/home.bandit5/inhere/maybehere07/.file2
```



