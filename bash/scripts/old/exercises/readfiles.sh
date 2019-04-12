#!/bin/bash
# Create a simple text file containing a list of super heros (or some names if preferred), use at least four values, one per line in the file. Write a bash shell script that then reads that file and displays it line by line on the terminal window.

echo ""
echo "Enter a filename to read: "
read FILE

while read -r SUPERHERO; do
  echo "Superhero Name: $SUPERHERO"
done<"$FILE"
