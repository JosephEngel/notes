#!/bin/bash
# Create a simple text file containing a list of names (superheroes) and name it whatever you wish, should contain at least four values, one per line.
# Write a script that will use a file descriptor defined for both reading and writing to that file (pick an appropriate number greater than the system reserved handles as talked about in the course). Filtering that file into an appropriate loop, display all values with that file. Finally, once complete, write a message with the time/date stamp to the file and close the descriptor.

echo ""
echo "Enter a filename to read: "
read FILE

exec 3<>$FILE

while read -r SUPERHERO; do
  echo "Superhero Name: $SUPERHERO"
done <&3

echo "File read via script on `date`" >&3

exec 3&>-


