#!/bin/bash
# simple example of if then else statements

clear

echo "Enter a number between 1 and 3:"
read VALUE

#if [ "$VALUE" -eq "1" ]
#then
#  echo "You entered $VALUE"
#fi

if [ "$VALUE" -eq "1" ] 2>/dev/null; then 
  echo "You entered $VALUE"
elif [ "$VALUE" -eq "2" ] 2>/dev/null; then
  echo "You entered #2"
elif [ "$VALUE" -eq "3" ] 2>/dev/null; then
  echo "You entered the 3rd number"
else
  echo "You didn't follow the directions!"
fi
