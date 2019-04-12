#!/bin/bash
# While loop example

echo "How many times do you want to display 'Hello World'?"
read DISPLAYNUMBER
echo ""

COUNT=1

while [ $COUNT -le $DISPLAYNUMBER ]
do
  echo "Hello World - $COUNT"
  COUNT="`expr $COUNT + 1`"
done 
