#!/bin/bash
# Create a script that prompts the user for a number. That number is to be used to display a simple message to the terminal X number of times (where X is the number captured from the user input). The message should include an indication of the number for each count the message is displayed.

echo ""
echo "Enter a number, preferably not too high:"
read NUMBER
echo ""

x=1
while [ "$x" -le "$NUMBER" ]
do
  echo "This message will be displayed $NUMBER times."
  x="`expr $x + 1`" 
done
