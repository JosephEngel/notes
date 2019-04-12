#!/bin/bash
# This script is intended to show how to do simple substitution

shopt -s expand_aliases

alias TODAY="date"
A=`TODAY`
alias UFILES="find /home -user joey"
B=`UFILES`

TODAYSDATE=`date`
USERFILES=`find /home -user joey`

echo "Today's Date: $TODAYSDATE"
echo "All Files Ownded by User: $USERFILES"

echo "With Alias, TODAY is: $A"
echo "With Alias, UFILES is: $B"
