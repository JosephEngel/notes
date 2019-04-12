#!/bin/bash
# Write a script that will prompt the user to enter a number between 1 and 3. Capture that number in a variable and then test that variable. Be sure to display the variable and it's value as appropriate within an if/then/else statement where the final statement will display if they did not enter a number between 1 and 3 telling them they failed to follow instructions. Redirect errors from each of the tests to /dev/null (to prevent script errors from showing if text is entered for example).

echo ""
echo "Enter a number between 1 and 3: "
read NUMBER

if [ "$NUMBER" -eq "1" ] 2>/dev/null;
  then
    echo "You chose the number 1"
  elif [ "$NUMBER" -eq "2" ] 2>/dev/null;
  then
    echo "You chose the number 2" 
  elif [ "$NUMBER" -eq "3" ] 2>/dev/null;
    then
      echo "You chose the number 3"
  else
    echo "You did not follow directions."
fi
