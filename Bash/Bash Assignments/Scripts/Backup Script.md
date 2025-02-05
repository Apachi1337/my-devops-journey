# Backup Script

---

## What it does

This is a scrip that copies all .txt files from a specified directory to a backup directory. If the backup directory doesn't exist, the script will create it first.

---

## The scripts code

```bash
!/bin/bash

# This will prompt the user for the source directory

read -p "Enter the source directory: " src_dir

# This is to define the backup

backup_dir="${src_dir}/backup"

# Check if the source directory exists
# The ! is used to invert the result of the expression
if  [ ! -d "$src_dir" ]; then
echo "Error: This directory doesn't exist. "
exit 1
fi

# Create the backup directory if it doesn't exist

if [ ! -d "$src_dir" ]; then
echo "Creating a backup directory at $backup_dir"
mkdir -p "$backup_dir"
fi

# Copy all .txt files to the backup directory

cp "$src_dir"/*.txt "$backup_dir" 2>/dev/null

# Check if the copy was successful

if [ $? -eq 0 ]; then
echo "All .txt files have been backed up to $backup_dir. "
else
echo "No .txt files found in $src_dir or an error occurred. "
fi
```

## Key Takeaways

User Input Handling (read -p)

    The script prompts the user to enter a source directory using read -p.

Defining Variables (backup_dir)

    The script sets up a backup directory by appending /backup to the user-provided source directory.

Checking Directory Existence ([ ! -d "$src_dir" ])

    Uses an if condition with -d to check if the source directory exists.
    The ! negates the condition, meaning "if the directory does not exist, exit with an error."

Creating a Backup Directory (mkdir -p)

    If the backup directory does not exist, it should be created.
    Bug Alert! There's an issue in your script: it checks "$src_dir" instead of "$backup_dir" before creating the backup.

Copying Files (cp *.txt)

    The script copies all .txt files from the source directory to the backup directory.
    2>/dev/null suppresses error messages (e.g., if no .txt files exist).

Checking Command Success ($?)

    $? captures the exit status of the last command.
    if [ $? -eq 0 ] checks if the cp command was successful and prints an appropriate message.













