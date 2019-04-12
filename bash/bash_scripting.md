# Bash Scripting For System Administrators



## Core Concepts

### Environment Variables

* We can refer to existing environment variables in a script by using `$VAR`
* View environment variables - `env`

```bash
#!/bin/bash

clear

echo "This script will give us environment information."                      
echo "================================================="                      
echo ""
echo "Hello Username: $USER"
echo ""
echo "Your Home Directory is: $HOME"
echo ""
echo "Your History File Will Ignore: $HISTCONTROL"                            
echo ""
echo "Your Terminal Session Type is: $TERM"                                   
echo ""
```

* SHELL environment variables should be in all caps, value in double quotes, no spaces

* Create an environment variable to show our first name:

```bash
$ FIRSTNAME="Joey"
$ export FIRSTNAME
$ env | grep FIRST
FIRSTNAME=Joey
$ echo "Your first name is: $FIRSTNAME"
Your first name is: Joey


```

* set and export variable with `export SEARCHSITE=""http://www.startpage.com"`

* Set new value for a variable by overwriting the current value

* Variable value can be substituted

  * ex.)

```bash
cripts[master ?] $ export TODAYSDATE=`date`
scripts[master ?] $ echo $TODAYSDATE
Fri Apr 12 17:29:16 EDT 2019
scripts[master ?] $ 

```



### Shell Variables

* Script variables are set and used the same way as environment scripts, but they are contained to just the script

```bash
#!/bin/bash

MYUSERNAME="username"
MYPASSWORD="password"
STARTOFSCRIPT=`date`

echo "My login name is: $MYUSERNAME"
echo "My login password is: $MYPASSWORD"
echo "I started this script at: $STARTOFSCRIPT"

ENDOFSCRIPT=`date`

echo "I ended this script at: $ENDOFSCRIPT"

```

```bash
scripts[master ?] $ ./varexample.sh                                            
My login name is: username                                                     
My login password is: password                                                 
I started this script at: Fri Apr 12 17:36:34 EDT 2019                         
I ended this script at: Fri Apr 12 17:36:34 EDT 2019 
```

### Command Substitution (Alias)

#### ALIAS Vs VARIABLE:

* An Alias will alias a command to a variable, running the aliased command when called

* A Variable is setting the variable to the value of whatever the command is.

* Aliases re-run the command every time it is called, while variables are set to the output of the command when it is created.



Example:

```bash
#!/bin/bash
# This script is intended to show how to do simple substitution

shopt -s expand_aliases

alias TODAY="date"
A=`TODAY`
alias UFILES="find /home -user joey"
B=`UFILES`

echo "With Alias, TODAY is: $A"
echo "With Alias, UFILES is: $B"
```

* 4 steps to using aliases:

  * enable expand aliases - `shopt -s expand_aliases`

  * Create alias - `alias NAME="command"`

  * set alias to var - ``N=`NAME```

  * Call alias - `$N`
