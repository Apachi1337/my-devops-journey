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
