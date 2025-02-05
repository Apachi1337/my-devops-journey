#!/bin/bash

# Prompt the user for a file name
read -p "Enter the file name: " filename

# Check if the file exists
if [ -e "$filename" ]; then  # Correct spacing
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


