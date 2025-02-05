# File Creator Script
---

## What does it do?

This script creates a directory, navigates into it, creates a file inside, writes some text to the file and then displays the contents of the file.

---

## The Scripts Code

```bash
!/bin/bash

# Defines the directory and file names

dir_name="my_directory"
file_name="my_file.txt"

# Creates a directory

mkdir -p "$dir_name"

# Navigate into the directory

cd "$dir_name"  || exit

# Creates a file and writes text into it

echo "Hello, Aresnal have just beat Man City 5-1 $file_name. " >"$file_name"

# Displays the contents of the file
echo "Contents of $file_name:"
cat "$file_name"

```
## Key Takeways from the Script

1. Defines Directory and File Variables → Uses `dir_name="my_directory"` and `file_name="my_file.txt"`.
2. Creates a Directory → Uses `mkdir -p "$dir_name"` to ensure the directory exists.
3. Navigates into the Directory → Uses `cd "$dir_name" || exit` to change the working directory, exiting if it fails.
4. Creates and Writes to a File → Uses `echo "..." > "$file_name"` to write text into the file.
5. Displays File Contents → Uses `cat "$file_name"` to print the file’s contents.

## Key Bash Commands

* `mkdir -p` → Create a directory if it doesn’t exist.
* `cd` → Change directory (with `|| exit` to prevent errors).
* `echo "text" > file` → Write text to a file (overwrite).
* `cat` → Display the file’s content.
