# Conditional Statements
---

## What does it do?

This script prompts a user for a file name, checks if the file exists and prints a message that indicates whether it exists or not. If it does exist, the script will aslo check if the file is readable, writable or executable.

---
## The Bash Script

```bash
#!/bin/bash

# Prompt the user for a file name
read -p "Enter the file name: " filename

# Check if the file exists
if [ -e "$filename" ]; then  
    echo "The file '$filename' exists."

    # Check if the file is readable
    if [ -r "$filename" ]; then
        echo "The file '$filename' is readable."
    else
        echo "The file '$filename'is not readable."
    fi

    # Check if the file is writable
    if [ -w "$filename" ]; then
        echo "It is writable."
    else
        echo "It is not writable."
    fi

    # Check if the file is executable
    if [ -x "$filename" ]; then
        echo "It is executable."
    else
        echo "It is not executable."
    fi
else
    echo "The file '$filename' does not exist."
fi


```

## Key Takeaways from the Script

1. Takes User Input → Uses read `-p` to prompt for a filename.
2. Checks File Existence → Uses `[ -e "$filename" ]` to verify if the file exists.
3. Checks File Permissions →

   * `-r` → Checks if the file is readable.
   
   * `-w` → Checks if the file is writable.
  
   * `-x` → Checks if the file is executable.
---

## Key Bash Commands

* `read -p` → Prompt user input.
* `-e` → Check if the file exists.
* `-r` → Check if the file is readable.
* `-w` → Check if the file is writable.
* `-x` → Check if the file is executable.
* `echo` → Print messages.


