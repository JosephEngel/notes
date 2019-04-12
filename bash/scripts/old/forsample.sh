#!/bin/bash
# demo of the for loop

echo "List all the shel script contents of the directory"

SHELLSCRIPTS=`ls *.sh`

echo "Listing is:"
echo "$SHELLSCRIPTS"
echo ""

for SCRIPT in "$SHELLSCRIPTS"; do
  DISPLAY="`cat $SCRIPT`"
  echo "File: $SCRIPT - Contents $DISPLAY"
done

