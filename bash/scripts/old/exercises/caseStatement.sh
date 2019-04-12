#!/bin/bash
# Develop a simple three item menu to display on the terminal. Your script, upon display of the menu, should prompt the user to choose one of the three available options. Using the 'case' statement from the course, display three unique messages depending on which number they chose, with a catch all message letting them know if they went outside the bounds of instructions.

echo ""
echo "Please choose one of the following options:"
echo "==========================================="
echo "1) Hello World"
echo "2) date"
echo "3) System Info"
echo ""

read OPTION

case "$OPTION" in
  1)
    echo "Hello World!" ;;
  2)
    echo "`date`" ;;
  3)
    echo "`neofetch`" ;;
  *)
    echo "You did not select an available option. Bad User."
esac
