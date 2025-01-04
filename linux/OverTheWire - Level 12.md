# OverTheWire Bandit - Level 12 to Level 13
The password for this level is stored in the file data.txt, which is a hexdump of a file that has been compressed multiple times.
# Solution
SSH into bandit 12 `bandit12@bandit.labs.overthewire.org -p 2220` using the password from previous level:
```bash
7x16WNeHIi5YkIhWsfFIqoognUTyj9Q4
```
Create a new temporary directory using `mktemp -d` and this generated a temporary directory called `tmp/tmp.aPMy98g4o`. I then copied the `data.txt` file using:

```bash
~cp data.txt /tmp/tmp.aPMy98g4o`
````
and verified it was in that location using:
```bash
ls /tmp/tmp.aPMy98g4o | grep data.txt
````
Since the contents of `data.txt` are a hexdump, we use the following to convert it back to binary:
```bash
xxd -r data.txt > compressed_file
````
We then check the file type by using the `file` command:

```bash
file compressed_file
````

The output tells us the file is `gzip` compressed so i used the following command to rename it and `gunzip` decompress it since its `gzip` compressed:
```bash
mv compressed_file compressed_file.gz
gunzip compressed_file.gz
````

Check the file again using `file compressed_file` and it now shows it as `bzip2` compressed. I use the following to rename and decompress using `bunzip2`:
```bash
mv compressed_file compressed_file.bz2
bunzip2 compressed_file.bz2
````

We check the file again using `file compressed_file` and the file is `gzip` compressed so i used the following command to rename it and `gunzip` decompress it since its `gzip` compressed:
```bash
mv compressed_file compressed_file.gz
gunzip compressed_file.gz
```

Check the file but this time it shows as a POSIX tar archive. I use the following to rename it and extract it using the `tar` command:
```bash
mv compressed_file compressed_file.tar
tar -xf compressed_file.tar
```

Once the archive is extracted, we check the new file type:
```bash
file data5.bin
```

The file is another POSIX tar archive so we rename it and extract it using `tar` again:
```bash
mv data5.bin data5.bin.tar
tar -xf data5.bin.tar
```

Check the newly extracted `data6.bin` file and it shows us that its `bzip2` compressed. Rename and use `bunzip2` to decompress it again:

```bash
mv data6.bin data6.bin.bz2
bunzip2 data6.bin.bz2
```
Check the file and its identified as another POSIX tar archive. Extract and rename it using:


```bash
mv data6.bin data6.bin.tar
tar -xf data6.bin.tar
```

After extracting the new file `data8.bin` appears which when checked is a `gzip` file. We rename the `gzip` file and decompress it once again using `gunzip`


```bash
mv data8.bin data8.bin.gz
gunzip data8.bin.gz
```

We check the file type of `data8.bin` one last time and finally it's identified as a ASCII text. Time to use `cat` to display the contents of the file:

```bash
cat data8.bin
```

This outputs our password which was playing hard to get:

```bash
FO5dwFsc0cbaIiH0h8J2eUks2vdTDwAn
```
We then exit the session using `exit`.
# Key Learning Outcome
1. Developing the skill to manage and organize files in directories using commands like `mkdir`, and using `/tmp` for temporary storage in a Linux environment.
2. Understanding how to work with hexdumps using the `xxd` command to convert between binary data and hexadecimal representations.
3. Learning how to apply compression tools like `gzip` or `bzip2` to decompress files that have been repeatedly compressed.






