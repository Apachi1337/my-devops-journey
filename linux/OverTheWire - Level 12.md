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
mv compr_file compr_file.gz
gunzip compr_file.gz
````
Check the file again using `file compressed_file` and it now shows it as `bzip2` compressed. I use the following to rename and decompress using `bunzip2`:
```bash
mv compr_file compr_file.bz2
bunzip2 compr_file.bz2
````
