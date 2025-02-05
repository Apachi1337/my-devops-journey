#!/bin/bash

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
