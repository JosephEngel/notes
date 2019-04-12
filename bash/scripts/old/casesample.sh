#!/bin/bash
# case statement demo

clear

echo "MAIN MENU"
echo "========="
echo "1) Choice One"
echo "2) Choice Two"
echo "3) Choice three"
echo ""
echo "Enter Choice: "
read MENUCHOICE

case $MENUCHOICE in 
  1)
    echo "You chose the first option";;
  2)
    echo "Choice 2 chosen";;
  3)
    echo "Last choice made";;
  *)
    echo "You chose unwisely";;
esac
