#!/bin/bash
# Demo of reading and writing to a file using a file descriptor

echo ""
echo "Enter a file name to read: "
read FILE

# Assigning a file descriptor to a variable value recieved on the cmd
# Open file descriptor - <> indicates rw
exec 5<>$FILE

# Redirect file input into while loop
while read -r SUPERHERO; do
  echo "Superhero Name: $SUPERHERO"
done <&5

# Echo timestamp into file
echo "File was Read On: `date`" >&5

# Close file descriptor
exec 5>&-

