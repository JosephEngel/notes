#!/bin/bash
# Create a script that, when run, will accept two command line values as arguments. These arguments should be a username and password and assigned to two variables in the script named appropriately. Finally, echo those values out to the terminal when run to indicate they were read and assigned as expected.

USERNAME=$1
PASSWORD=$2
echo ""
echo "The following are your credentials: "
echo "Username: $USERNAME"
echo "Password: $PASSWORD"
