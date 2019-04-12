# Introduction to  Python Development

# Index

#### Python From Scratch

1. Running Python

   1. REPL (Read, Evaluate, Print, Loop)

   2. Creating and Running Python Files

   3. Comments

2. Built-in Data Types

   1. Strings

   2. Numbers

   3. Booleans and None

   4. Working with Variables

   5. Lists

   6. Tuples & Ranges

   7. Dictionaries (dicts)

3. Control Flow

   1. Conditionals and Comparisons

   2. Logic Operations

   3. `while` loop

   4. `for` loop

#### Programming Concepts

1. Encapsulating Code

   1. Writing Functions

2. Object-Oriented Programming Basics

   1. Creating Classes

   2. Composition

   3. Inheritance

   4. Polymorphism

3. Using Packages

   1. Standard Library Packages

   2. Third-Party Packages

# Python From Scratch

## Running Python

### REPL (Read, Evaluate, Print, Loop)

* REPL is started with `python3.7`

* Used to write and execute single lines of python code

* Great for testing various small pieces of code

* `exit()` - exit REPL 

* Clear screen - `ctrl + L`

### Creating and Running Python Files

Since this is a course about Python scripting, we will be writing the majority of our code in scripts instead of using the REPL. To create a Python script, we can create a file ending with the file extension of `.py`.

#### Creating Our First Python Script

Let's create our first script to write our obligatory "Hello, World!" program:

```
$ vim hello.py
```

From inside this file we can enter the lines of Python that we need. For the "Hello, World!" example we only need

```
print("Hello, World!")
```

There are a few different pays that we can run this file. The first is by passing it to the `python3.7` CLI.

```
$ python3.7 hello.py
Hello, World!
```

#### Setting a Shebang

You'll most likely want your scripts to be:

1. Executable from anywhere (in our $PATH)
2. Executable without explicitly using the `python3.7` CLI

Thankfully, we can set the process to interpret our scripts by setting a shebang at the top of the file:

*hello.py*

```
#!/usr/bin/env python3.7
print("Hello, World")
```

We're not quite done, because now we need to make the file executable using `chmod`:

```
$ chmod u+x hello.py
```

Run the script now by using `./hello.py` and we'll see the same result. If we'd rather not have a file extension on our script we can now remove that since we've put a shebang in the file. Renaming it to get rid of the extension (`mv hello.py hello`) and running `./hello` will still result in Python 3.7 executing the script.

#### Adding Scripts to Our $PATH

Now we need to make sure that we can put this in our `$PATH`. For this course, we'll be using a `bin` directory in our `$HOME` folder to store our custom scripts, but scripts can go into any directory that is in your $PATH.

Let's create a `bin` directory and move our script:

```
$ mkdir ~/bin
$ mv hello ~/bin/
```

Here's how we add this directory to the $PATH in our `.bashrc` (the `.bashrc` for this course already contains this):

```
$ export PATH=$HOME/bin:$PATH
```

Finally, let's run the hello script from our `$PATH`:

```
$ hello
Hello, World!
```

### Comments

When writing scripts, we often want to leave ourselves notes or explanations. Python (along with most scripting languages) uses the `#` charater to signify that the line should be ignored and not executed.

#### Single Line Comment

We can comment out a whole line:

```
# This is a full like comment
```

or we can comment at the end of a line:

```
2 + 2 # This will add the numbers
```

#### What About Block Comments?

Python does not have the concept of block commenting that you may have encountered in other langauges. Many people mistake a triple quoted string as being a comment, but it is not, it's a multi-line string. That being said, multi-line strings can functionally work like comments, but they will still be allocated into memory.

```
"""
This is not a block comment,
but it will still work when you really need
for some lines of code to not execute.
"""
```

## Built-In Data Types

### Strings

Let's learn about one of the core data types in Python: the `str` type.

#### Documentation

- [strings (the `str` type)](https://docs.python.org/3/library/stdtypes.html#text-sequence-type-str)

#### Strings

Open a REPL to start exploring Python strings:

```
$ python3.7
```

We've already worked with a string when we created our "Hello, World!" program. We create strings using either single quotes (`'`), double quotes (`"`), or triple single or double quotes for a multi-line string.

```python
>>> 'single quoted string'
'single quoted string'
>>> "double quoted string"
'double quoted string'
>>> '''
... this is a triple
... quoted string
... '''
'\nthis is a triple\nquoted string\n'
```

Strings also work with some arithmetic operators.

We can combine strings using the `+` operator and multiply a string by a number using the `*` operator:

```python
>>> "pass" + "word"
'password'
>>> "Ha" * 4
'HaHaHaHa'
```

A string is a sequence of characters grouped together. We do need to cover the concept of an "Object" in object oriented programming before moving on. An "object" encapsulates two things 1) State & 2) behavior. For the built in types, the state makes sense because it's the entire contents of the object. The behavior aspect means that there are functions that we can call on the instances of the objects that we have. A function bound to an object is called a "method". Here are some example methods that we can call on strings:

`find` locates the first instance of a character (or string) in a string. This function returns the index of the character or string.

```python
>>> "double".find('s')
-1
>>> "double".find('u')
2
>>> "double".find('bl')
3
```

`lower` converts all of the characters in a string to their lowercase versions (if they have one). This function returns a new string without changing the original, and this becomes important later.

```python
>>> "TeStInG".lower() # "testing"
'testing'
>>> "another".lower()
'another'
>>> "PassWord123".lower()
'password123'
```

Lastly, if we need to use quotes or special characters in a string we can do that using the '\' character:

```python
Tab     Delimited
>>> print("New\nLine")
New
Line
>>> print("Slash\\Character")
Slash\Character
>>> print("'Single' in Double")
'Single' in Double
>>> print('"Double" in Single')
"Double" in Single
>>> print("\"Double\" in Double")
"Double" in Double
```

### Numbers

Let's learn about some of the core data types in Python: the number types `int` and `float`.

#### Python Documentation For This Video

- [numeric types (the `int` and `float` types)](https://docs.python.org/3/library/stdtypes.html#numeric-types-int-float-complex)

#### Numbers

There are 2 main types of numbers that we'll use in Python, `int` and `float`, and for the most part we won't be calling methods on number types and we will instead be using a variety of operators.

```python
>>> 2 + 2 # Addition
4
>>> 10 - 4 # Subtraction
6
>>> 3 * 9 # Multiplication
27
>>> 5 / 3 # Division
1.66666666666667
>>> 5 // 3 # Floor division, always returns a number without a remainder
1
>>> 8 % 3 # Modulo division, returns the remainder
2
>>> 2 ** 3 # Exponent
8
>>> pow(2,3) # Exponent
8
```

If either of the numbers in a mathmatical operation in Python is a float then the other will be converted before carrying out the operation and the result will always be a float.

* Modulo (%) can be used to check if a number or result is even or odd.  If  `x % 2` returns `1`, it is odd.  If it returns `0`, it is even.

#### Float

If you use a decimal number at all, the result will be a float value.

```python
>>> 1.1 + 3
4.1
>>> 4.0 + 3
7.0
```

#### Converting Strings and Numbers

It's not uncommon for we to need to convert from one type to another when writing a script and Python provides built in functions for doing that with the built in types. For strings and numbers, we can use the `str`, `int`, and `float` functions to convert from one type to another (within reason).

```python
>>> str(1.1)
'1.1'
>>> int("10")
10
>>> int(5.99999)
5
>>> float("5.6")
5.6
>>> float(5)
5.0
```

Using int on a decimal will simply drop the decimal place instead of round

```python
>>> int(5.666)
5
```

You'll run into issues trying to convert strings to other types if they aren't present in the string

```python
>>> float("1.1 things")
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ValueError: could not convert string to float: '1.1 things'
```

### Booleans and None

Learn about how Python represents truthiness and nothingness.

#### Python Documentation For This Section

- [Booleans & None](https://docs.python.org/3/library/stdtypes.html#truth-value-testing)

#### Booleans

Booleans represent "truthiness" and Python has two boolean constants: `True` and `False`.

Notice that these both start with capital letters. Later we will learn about comparisons operations, and those will often return either `True` or `False`.

Every item has a boolean representation

```python
>>> bool(1.0)
True
>>> bool(0)
False
>>> bool("")
False
>>> bool(" ")
True
```

#### Representing Nothingness with `None`

Most programming languages have a type that represents the lack of a value, and Python is no different. The constant used to represent nothingness in Python is `None`. `None` is a "falsy", and we'll often use it to represent when a variable has no value yet.

An interesting thing to note about `None` is that if you type `None` into your REPL there will be nothing printed to the screen. That's because `None` actually evaluates into nothing.

### Working with Variables

Almost any script that we write will need to have a way for us to hold onto information for use later on. That's where variables come into play.

#### Working with Variables

We can assign a value to a variable by using a single `=` and we don't need to (nor can we) specify the type of the variable.

```python
>>> my_str = "This is a simple string"
```

Now we can print the value of that string by using `my_var` later on:

```python
>>> print(my_str)
This is a simple string
```

Before, we talked about how we can't change a string because it's immutable. This is easier to see now that we have variables.

```python
>>> my_str
'This is a simple string testing'
```

That didn't change the string, it reassigned the variable. The original string of `"This is a simple string"` was unchanged.

An important thing to realize is that the contents of a variable can be changed and we don't need to maintain the same type

```python
>>> my_str = 1
>>> print(my_str)
1
```

Ideally, we wouldn't change the contents of a variable called `my_str` to be an int, but it is something that python would let use do.

One last thing to remember is that if we assign a variable with another variable it will be assigned to the result of the variable and not whatever that varible points to later.

```python
>>> my_str = 1
>>> my_int = my_str
>>> my_str = "testing"
>>> print(my_int)
1
>>> print(my_str)
testing
```

### Lists

In Python, there are a few different "sequence" types that we're going to work with, the most common of which being the `list` type.

#### Python Documentation For This Section

- [Sequence Types](https://docs.python.org/3/library/stdtypes.html#sequence-types-list-tuple-range)
- [Lists](https://docs.python.org/3/library/stdtypes.html#list)

#### Lists

A list is created in Python by using the square brackets (`[`, and `]`) and separating the values by commas. Here's an example list:

```python
>>> my_list = [1, 2, 3, 4, 5]
```

There's really not a limit to how long our list can be (there is, but it's very unlikely that we'll hit it while scripting)

#### Reading from Lists

To access an individual element of a list you can use the index and Python uses a zero based index system.

```python
>>> my_list[0]
1
>>> my_list[2]
2
```

If we try to access an index that is too high (or too low) then we'll receive an error:

```python
>>> my_list[5]
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
IndexError: list index out of range
```

To make sure that we're not trying to get an index that is out of range, we can test the length using the `len` function (and then subtract 1)

```python
>>> len(my_list)
5
```

Additionally, we can access subsections of a list by "slicing" it. We provide the starting index and the ending index (the object at that index won't be included).

```python
>>> my_list[0:2]
[1, 2]
>>> my_list[1:]
[2, 3, 4, 5]
>>> my_list[:3]
[1, 2, 3]
>>> my_list[0::1]
[1, 2, 3, 4, 5]
>>> my_list[0::2]
[1, 3, 5]
```

using a negative number will reverse the order of the list

```python
>>> my_list[::-1]
[5, 4, 3, 2, 1]
```

#### Modifying a List

Unlike strings which can't be modified (you can't change a character in a string), you can change a value in a list using the subscript equals operation:

```python
>>> my_list[0] = "a"
>>> my_list
['a', 2, 3, 4, 5]
```

If we want to add to a list we can use the `.append` method. This is an example of a method that modifies the object that is calling the method:

```python
>>> my_list.append(6)
>>> my_list.append(7)
>>> my_list
['a', 2, 3, 4, 5, 6, 7]
```

Lists can be added together (concatenated):

```python
>>> my_list + [8, 9, 10]
['a', 2, 3, 4, 5, 6, 7, 8, 9, 10]
>>> my_list += [8, 9, 10]
>>> my_list
['a', 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

Items in lists can be set using slices also:

```python
>>> my_list[1:3] = ['b', 'c']
>>> my_list
['a', 'b', 'c', 4, 5, 6, 7, 8, 9, 10]
# Replacing 2 sized slice with length 3 list inserts new element
my_list[3:5] = ['d', 'e', 'f']
print(my_list)
```

We can remove a section of a list by assigning an empty list to the slice:

```python
>>> my_list = ['a', 'b', 'c', 'd', 5, 6, 7]
>>> my_list[4:] = []
>>> my_list
['a', 'b', 'c', 'd']
```

Removing items from a list based on value can be done using the `.remove` method:

```python
>>> my_list.remove('b')
>>> my_list
['a', 'c', 'd']
```

Attempting to `remove` and item that isn't in the list will result in an error:

```python
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ValueError: list.remove(x): x not in list
```

Items can also be removed from the end of a list using the `pop` method:

```python
>>> my_list = ['a', 'c', 'd']
>>> my_list.pop()
'd'
>>> my_list
['a', 'c']
```

We can also use the `pop` method to remove items at a specific index:

```python
>>> my_list.pop(0)
'a'
>>> my_list
['c']
>>> my_list.pop(1)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
IndexError: pop index out of range
>>> [].pop()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
IndexError: pop from empty list
```

### Tuples and Ranges

The most common immutable sequence type that we're going to work with is going to be the `tuple`. We'll also look at the `range` type as an alternative to a sequential `list`.

#### Python Documentation For This Video

- [Sequence Types](https://docs.python.org/3/library/stdtypes.html#sequence-types-list-tuple-range)
- [Tuples](https://docs.python.org/3/library/stdtypes.html#tuple)
- [Ranges](https://docs.python.org/3/library/stdtypes.html#range)

#### Tuples

Tuples are a fixed width, immutable sequence type. We create tuples using parenthesis (`(` and `)`) and atleast one comma (`,`):

Commonly used when we know the exact order and how many items are in it

```
>>> point = (2.0, 3.0)
```

Since tuples are immutable, we don't have access to the same methods that we do on a list. We can use tuples in some operations like concatenation, but we can't change the original tuple that we created.

```
>>> point_3d = point + (4.0,)
>>> point_3d
(2.0, 3.0, 4.0)
```

One interesting characterist of tuples is that we can unpack them into multiple variables at the same time:

```
>>> x, y, z = point_3d
>>> x
2.0
>>> y
3.0
>>> z
4.0
```

The time you're most likely to see tuples will be when looking at a format string that's compatible with Python 2:

```
>>> print("My name is: %s %s" % ("Keith", "Thompson"))
```

Review:

* You can't change the length

* You can't change the items

* You can unpack them into a list of variables

#### Ranges

Ranges are an immutable sequence type that defines a start, a stop, and a step value and then the values within are calculated as it is iteracted with. This allows for ranges to be used in place of sequential lists and while taking less memory and including more items.

```
>>> my_range = range(10)
>>> my_range
range(0, 10)
>>> list(my_range)
[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
>>> list(range(1, 14, 2))
[1, 3, 5, 7, 9, 11, 13]
```

Notice that the "stop" value is not included in the range, the values are all up-until the stop.

### Dictionaries (dicts)

Learn how to use dictionaries (the `dict` type) to hold onto key/value information in Python.

#### Python Documentation For This Video

- [Dictionaries](https://docs.python.org/3/library/stdtypes.html#mapping-types-dict)

#### Dictionaries

Dictionaries are the main mapping type that we'll use in Python. This object is comparable to a Hash or "associative array" in other languages.

Things to note about dictionaries:

1. Unlike Python 2 dictionaries, as of Python 3.6 keys are ordered in dictionaries. You will need `OrderedDict` if you want this to work on another version of Python.
2. You can set the key to any IMMUTABLE type (no lists) (can use: strings, floats, ints)
3. Avoid using things other than simple objects as keys.
4. Each key can only have one value (so don't have duplicates when creating a dict)

We create dictionary literals by using curly braces (`{` and `}`), separating keys from values using colons (`:`), and separating key/value pairs using commas (`,`). Here's an example dictionary:

```
>>> ages = { 'kevin': 59, 'alex': 29, 'bob': 40 }
>>> ages
{'kevin': 59, 'alex': 29, 'bob': 40}
```

We can read a value from a dictionary by subscripting using the key:

```
>>> ages['kevin']
59
>>> ages['billy']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'billy'
```

Keys can be added or changed using subscripting and assignment:

```
>>> ages['kayla'] = 21
>>> ages
{'kevin': 59, 'alex': 29, 'bob': 40, 'kayla': 21}
```

Items can be removed from a dictionary using the `del` statement or by using the `pop` method:

```
>>> del ages['kevin']
>>> ages
{'alex': 29, 'bob': 40, 'kayla': 21}
>>> del ages
>>> ages
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
NameError: name 'ages' is not defined
>>> ages = { 'kevin': 59, 'alex': 29, 'bob': 40 }
>>> ages.pop('alex')
29
>>> ages
{'kevin': 59, 'bob': 40}
>>> {}.pop('billy')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'billy'
```

`pop` is a safer way to remove an item, as we are less likely to accidently delete the entire dictionary

Since this is our second time running into a `KeyError` it's worth looking at a way to avoid these when we're attempting to read data from a dictionary. For that, we can use the `get` method:

```
>>> ages.get('kevin')
59
>>> ages.get('billy')
>>>
```

Now we're receiving `None` instead of raising an error when we try to get the value for a key that doesn't exist.

It's not uncommon to want to know what keys or values we have without caring about the pairings. For that situation we have the `values` and `keys` methods:

```
>>> ages = {'kevin': 59, 'bob': 40}
>>> ages.keys()
dict_keys(['kevin', 'bob'])
>>> list(ages.keys())
['kevin', 'bob']
>>> ages.values()
dict_values([59, 40])
>>> list(ages.values())
[59, 40]
```

#### Alternative Ways to Create a `dict` Using Keyword Arguments

There are a few other ways to create dictionaries that we might see, those being using the `dict` constructor with key/value arguments and a list of tuples:

```
>>> weights = dict(kevin=160, bob=240, kayla=135)
>>> weights
{'kevin': 160, 'bob': 240, 'kayla': 135}
>>> colors = dict([('kevin', 'blue'), ('bob', 'green'), ('kayla', 'red')])
>>> colors
{'kevin': 'blue', 'bob': 'green', 'kayla': 'red'}
```

## Control Flow

### Conditionals and Comparisons

Scripts become most interesting when they do the right thing based on the inputs that we provide. To start building robust scripts, we need to understand how to make comparisons and use conditionals.

#### Python Documentation For This Video

- [Comparisons](https://docs.python.org/3/library/stdtypes.html#comparisons)
- [if/elif/else](https://docs.python.org/3/tutorial/controlflow.html#if-statements)

#### Comparisons

There are some standard comparison operators that we'll use that match pretty closely to those used in mathematical equations. Let's take a look at them:

```python
>>> 1 < 2
True
>>> 0 > 2
False
>>> 2 == 1
False
>>> 2 != 1
True
>>> 3.0 >= 3.0
True
>>> 3.1 <= 3.0
False
```

If we try to make comparisons of types that don't match up, we will run into errors:

```python
>>> 3.1 <= "this"
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: '<=' not supported between instances of 'float' and 'str'
>>> 3 <= 3.1
True
>>> 1.1 == "1.1"
False
>>> 1.1 == float("1.1")
True
```

We can compare more than just numbers. Here's what it looks like when we compare strings:

```python
>>> "this" == "this"
True
>>> "this" == "This"
False
>>> "b" > "a"
True
>>> "abc" < "b"
True
>>> "bac" < "b"
False
```

Notice that the string `'b'` is considered greater than the strings `'a'` and `'abc'`. The characters are compared one at a time alphabetically to determine which is greater. This concept is used to sort strings alphabetically.

#### The `in` Check

We often get lists of information that we need to ensure contains (or doesn't contain) a specific item. To make this check in Python, we'll use the `in` and `not in` operations.

```python
>>> 2 in [1, 2, 3]
True
>>> 4 in [1, 2, 3]
False
>>> 2 not in [1, 2, 3]
False
>>> 4 not in [1, 2, 3]
True
```

#### if/elif/else

With a grasp on comparisons, we can now look at how we can run different pieces of logic based on the values that we're working with using conditionals. The keywords for conditionals in Python are `if`, `elif`, and `else`. Conditionals are the first language feature that we're using that requires us to utilize whitespace to separate our code blocks. We will always use indentation of 4 spaces. The basic shape of an `if` statement is this:

```python
if CONDITION:
    pass
```

The `CONDITION` portion can be anything that evaluates to `True` or `False,` and if the value isn't explicitly a boolean then it will be converted to determine how to carry out proceed past the conditional (basically using the `bool` constructor).

```python
>>> if True:
...     print("Was True")
...
Was True
>>> if False:
...     print("Was True")
...
>>>
```

To add an alternative code path, we'll use the `else` keyword, followed by a colon (`:`), and indenting the code underneath:

```python
>>> if False:
...     print("Was True")
... else:
...     print("Was False")
...
Was False
```

In the even that we want to check multiple potential conditions we can use the `elif CONDITION:` statement. Here's a more robust example:

```python
>>> name = "Kevin"
>>> if len(name) >= 6:
...     print("name is long")
... elif len(name) == 5:
...     print("name is 5 characters")
... elif len(name) >= 4:
...     print("name is 4 or more")
... else:
...     print("name is short")
...
name is average
```

Notice that we fell into the first `elif` statement's block and then the second `elif` block was never executed even though it was true. We can only exercise one branch in an if statement.

### Logic Operations

Up to this point, we've learned how to make simple comparisons, and now it's time to make compound comparisons using logic/boolean operators.

#### Python Documentation For This Video

- [Boolean Operators](https://docs.python.org/3/library/stdtypes.html#boolean-operations-and-or-not)

#### The `not` Operation

Sometimes we want to know the opposite boolean value for something. This might not sound intuitive, but sometimes we want to execute an `if` statement when a value is `False`, but that's not how the `if` statement works. Here's an example of how we can use `not` to make this work:

```python
>>> name = ""
>>> not name
True
>>> if not name:
...     print("No name given")
...
>>>
```

We know that an empty string is a "falsy" value, so `not ""` will always return `True`. `not` will return the opposite boolean value for whatever it's operating on.

#### The `or` Operation

Occasionally, we want to carry out a branch in our logic if one condition OR the other condition is `True`. Here is where we'll use the `or` operation. Let's see `or` in action with an `if` statement:

```python
>>> first = ""
>>> last = "Thompson"
>>> if first or last:
...     print("The user has a first or last name")
...
The user has a first or last name
>>>
```

If both `first` and `last` were "falsy" then the print would never happen:

```python
>>> first = ""
>>> last = ""
>>> if first or last:
...     print("The user has a first or last name")
...
>>>
```

Another feature of `or` that we should know is that we can use it to set default values for variables:

```python
>>> last = ""
>>> last_name = last or "Doe"
>>> last_name
'Doe'
>>>
```

The `or` operation will return the first value that is "truthy" or the last value in the chain:

```python
>>> 0 or 1
1
>>> 1 or 2
1
```

#### The `and` Operation

The opposite of `or` is the `and` operation, which requires both conditions to be `True`. Continuing with our first and last name example, let's conditionally print based on what we know:

```python
>>> first = "Keith"
>>> last = ""
>>> if first and last:
...     print(f"Full name: {first} {last}")
... elif first:
...     print(f"First name: {first}")
... elif last:
...     print(f"Last name: {last}")
...
First name: Keith
>>>
```

Now let's try the same thing with both `first` and `last`:

```python
>>> first = "Keith"
>>> last = "Thompson"
>>> if first and last:
...     print(f"Full name: {first} {last}")
... elif first:
...     print(f"First name: {first}")
... elif last:
...     print(f"Last name: {last}")
...
Full name: Keith Thompson
>>>
```

The `and` operation will return the first value that is "falsy" or the last value in the chain:

```python
>>> 0 and 1
0
>>> 1 and 2
2
>>> (1 == 1) and print("Something")
Something
>>> (1 == 2) and print("Something")
False
```

### While Loop

It's incredibly common to need to repeat something a set number of times or to iterate over content. Here is where looping and iteration come into play.

#### Python Documentation For This Video

- [`while` statement](https://docs.python.org/3/tutorial/introduction.html#first-steps-towards-programming)

#### The `while` Loop

The most basic type of loop that we have at our disposal is the `while` loop. This type of loop repeats itself based on a condition that we pass to it. Here's the general structure of a `while` loop:

```python
    pass
```

The `CONDITION` in this statement works the same way that it does for an `if` statement. When we demonstrated the `if` statement we first tried it by simply passing in `True` as the condition. Let's see when we try that same condition with a `while` loop:

```python
>>> while True:
...     print("looping")
...
looping
looping
looping
looping
```

That loop will continue forever, we've created an infinite loop. To stop the loop, press `Ctrl-C`. Infinite loops are one of the potential problems with `while` loops if we don't use a condition that we can change from within the loop then it will continue forever if initially true. Here's how we'll normally approach using a while loop where we modify something about the condition on each iteration:

```python
>>> count = 1
>>> while count <= 4:
...     print("looping")
...     count += 1
...
looping
looping
looping
looping
>>>
```

We can use other loops or conditions inside of our loops; we need only remember to indent four more spaces for each context. If in a nested context we want to continue to the next iteration or stop the loop entirely we also have access to the `continue` and `break` keywords:

```python
>>> count = 0
>>> while count < 10:
...     if count % 2 == 0:
...         count += 1
...         continue
...     print(f"We're counting odd numbers: {count}")
...     count += 1
...
We're counting odd numbers: 1
We're counting odd numbers: 3
We're counting odd numbers: 5
We're counting odd numbers: 7
We're counting odd numbers: 9
>>>
```

In that example, we also show off how to "string interpolation" in Python 3 by prefixing a string literal with an `f` and then using curly braces to substitute in variables or expressions (in this case the `count` value).

Here's an example using the `break` statement:

```python
>>> count = 1
>>> while count < 10:
...     if count % 2 == 0:
...         break
...     print(f"We're counting odd numbers: {count}")
...     count += 1
...
We're counting odd numbers: 1
```

### For Loop

It's incredibly common to need to repeat something a set number of times or to iterate over content. Here is where looping and iteration come into play.

#### Python Documentation For This Video

- [`for` statement](https://docs.python.org/3/tutorial/controlflow.html#for-statements)

#### The `for` Loop

The most common use we have for looping is when we want to execute some code for each item in a sequence. For this type of looping or iteration, we'll use the `for` loop. The general structure for a `for` loop is:

```
for TEMP_VAR in SEQUENCE:
    pass
```

The `TEMP_VAR` will be populated with each item as we iterate through the `SEQUENCE` and it will be available to us in the context of the loop. After the loop finishes one iteration, then the `TEMP_VAR` will be populated with the next item in the `SEQUENCE`, and the loop's body will execute again. This process continues until we either hit a `break` statement or we've iterated over every item in the `SEQUENCE`. Here's an example looping over a list of colors:

```
>>> colors = ['blue', 'green', 'red', 'purple']
>>> for color in colors:
...     print(color)
...
blue
green
red
purple
>>> color
'purple'
```

If we wanted not to print out certain colors we could utilize the `continue` or `break` statements again. Let's say we want to skip the string `'blue'` and terminate the loop if we see the string `'red'`:

```
>>> colors = ['blue', 'green', 'red', 'purple']
>>> for color in colors:
...     if color == 'blue':
...         continue
...     elif color == 'red':
...         break
...     print(color)
...
green
>>>
```

#### Other Iterable Types

Lists will be the most common type that we iterate over using a `for` loop, but we can also iterate over other sequence types. Of the types we already know, we can iterate over strings, dictionaries, and tuples.

Here's a tuple example:

```
>>> point = (2.1, 3.2, 7.6)
>>> for value in point:
...     print(value)
...
2.1
3.2
7.6
>>>
```

A dictionary example:

```
>>> ages = {'kevin': 59, 'bob': 40, 'kayla': 21}
>>> for key in ages:
...     print(key)
...
kevin
bob
kayla
```

A string example:

```
>>> for letter in "my_string":
...     print(letter)
...
m
y
_
s
t
r
i
n
g
>>>
```

#### Unpacking Multiple Items in a `for` Loop

We discussed in the tuples video how you could separate a tuple into multiple variables by "unpacking" the values. Unpacking works in the context of a loop definition, and you'll need to know this to most effectively iterate over dictionaries because you'll usually want the key and the value. Let's iterate of a list of "points" to test this out:

```python
>>> list_of_points = [(1, 2), (2, 3), (3, 4)]
>>> for x, y in list_of_points:
...     print(f"x: {x}, y: {y}")
...
x: 1, y: 2
x: 2, y: 3
x: 3, y: 4
```

Seeing how this unpacking works, let's use the `items` method on our `ages` dictionary to list out the names and ages:

```python
>>> for name, age in ages.items():
...     print(f"Person Named: {name}")
...     print(f"Age of: {age}")
...
Person Named: kevin
Age of: 59
Person Named: bob
Age of: 40
Person Named: kayla
Age of: 21
```

# Programming Concepts

## Encapsulating Code

### Writing Functions

Being able to write code that we can call multiple times without repeating ourselves is one of the most powerful things that we can do when programming. Let's learn how to define functions in Python.

#### Python Documentation For This Video

- [Defining Functions](https://docs.python.org/3/tutorial/controlflow.html#defining-functions)

#### Function Basics

We can create functions in Python using the following:

- The `def` keyword
- The function name - lowercase starting with a letter or underscore (`_`)
- Separate words in function name with an underscore (`_`)
- Left parenthesis (`(`)
- 0 or more argument names
- Right parenthesis (`)`)
- A colon `:`
- An indented function body

Here's an example without an argument:

```python
>>> def hello_world():
...     print("Hello, World!")
...
>>> hello_world()
Hello, World!
>>>
```

If we want to define an argument, we will put the variable name we want it to have within the parentheses:

```python
>>> def print_name(name):
...     print(f"Name is {name}")
...
>>> print_name("Keith")
Name is Keith
```

Let's try to assign the value from `print_name` to a variable:

```python
>>> output = print_name("Keith")
Name is Keith
>>> output
>>>
```

Neither of these examples has a return value, but we will usually want to have a return value unless the function is our "main" function, or carries out a "side-effect" like printing. If we don't explicitly declare a return value, then the result will be `None`.

We can declare what we're returning from a function using the `return` keyword:

```python
>>> def add_two(num):
...     return num + 2
...
>>> result = add_two(2)
>>> result
4
```

#### Working with Multiple Arguments

When we have a function that takes multiple arguments, we need to separate them using commas and give them unique names:

```python
>>> def add(num1, num2):
...     return num1 + num2
...
>>> result = add(1, 5)
>>> result
6
```

#### Using Keyword Arguments

Every function call we've made up to this point has used what are known as positional arguments, but if we know the name of the arguments and not necessarily the positions we can all them *all* using keyword arguments like so:

```python
>>> def contact_card(name, age, car_model):
...     return f"{name} is {age} and drives a {car_model}"
...
>>> contact_card("Keith", 29, "Honda Civic")
'Keith is 29 and drives a Honda Civic'
>>> contact_card(age=29, car_model="Civic", name="Keith")
'Keith is 29 and drives a Civic'
>>> contact_card("Keith", car_model="Civic", age="29")
'Keith is 29 and drives a Civic'
>>> contact_card(age="29", "Keith", car_model="Civic")
  File "<stdin>", line 1
SyntaxError: positional argument follows keyword argument
```

When we're using position and keyword arguments, every argument after the first keyword argument *must* also be a keyword argument. It's sometimes useful to mix them, but often times we'll use either all positional or all keyword.

#### Defining Default Arguments

Along with being able to use keyword arguments when we're calling a function, we're able to define default values for arguments to make them optional when the information is commonly known and the same. To do this, we use the assignment operator (`=`) when we're defining the argument:

```python
>>> def can_drive(age, driving_age=16):
...     return age >= driving_age
...
>>> can_drive(16)
True
>>> can_drive(16, driving_age=18)
False
```

Default arguments need to go at the end of the arguments list when defining the function, so that positional arguments can still be used to call the function.

## Object-Oriented Programming Basics

### Creating Classes

The next step in our programming journey requires us to think about how we can model concepts from our problem's domain. To do that, we'll often use classes to create completely new data types. In this lesson, we'll create our very first class and learn how to work with its data and functionality.

#### Python Documentation For This Video

- [Classes](https://docs.python.org/3/tutorial/classes.html#classes)

#### Defining New Types

Up to this point, we've been working with the built-in types that Python provides (`str`, `int`, `float`, etc.), but when we're modeling problems in our programs we often want to have more complex objects that fit our problem's domain. For instance, if we were writing a program to model information about cars (for an automotive shop) then it would make sense for us to have an object type that represents a car. This is where we start working will classes.

From this point on, most of the code that we'll be writing will be in files. Let's create a `learning_python` directory to hold these files that are really only there to facilitate learning.

```
$ mkdir ~/learning_python
$ cd ~/learning_python
```

#### Creating Our First Class

For this lesson, we'll use a file called `creating_classes.py`. Our goal is to model a car that has tires and an engine. To create a class we use the `class` keyword, followed by a name for the class, starting with a capital letter. Let's create our first class, the `Car` class:

`~/learning_python/creating_classes.py`:

```python
class Car:
    """
    Docstring describing the class
    """

    def __init__(self):
        """
        Docstring describing the method
        """
        pass
```

This is an incredibly simple class. A few things to note here are that by adding a triple-quoted string right under the definition of the class and also right under the definition of a method/function we can add documentation. This documentation is nice because we can even add examples in this string that can be run as tests to help ensure that our documentation stays up to date with the implementation.

A method is a function that is defined within the context of an object, and Python classes can define special functions that start with double underscores `__`, such as the `__init__` method. This method overrides the initializer of the class. The initializer is what is used when we create a new version of our class by running code like this:

```python
>>> my_car = Car()
```

We would like our `Car` class to hold onto a few pieces of data, the tires, and an engine. For the time being, we're just going to have those be a list of strings for the tires and a string for the engine. Let's modify our `__init__` method to receive `engine` and `tires` as arguments:

`~/learning_python/creating_classes.py`

```python
class Car:
    """
    Car models a car w/ tires and an engine
    """

    def __init__(self, engine, tires):
        self.engine = engine
        self.tires = tires
```

#### What is `self`?

A big change from writing functions to writing methods is the presence of `self`. This variable references the individual instance of the class that we're working with. The `Car` class holds on to the information about cars in general in our program, where an instance of the `Car` class (`self`) could represent my Honda Civic specifically. Let's load our class into the REPL using `python3.7 -i creating_classes.py`, and then we'll be able to create a Honda Civic:

```python
$ python3.7 -i creating_classes.py
>>> civic = Car('4-cylinder', ['front-driver', 'front-passenger', 'rear-driver', 'rear-passenger'])
>>> civic.tires
['front-driver', 'front-passenger', 'rear-driver', 'rear-passenger']
>>> civic.engine
'4-cylinder'
```

Once we have our instance, we're able to access our internal attributes by using a period (`.`).

#### Defining a Custom Method

The last thing that we'll do, to round out the first rendition of our first class, is to define a method that prints a description of the car to the screen:

`~/learning_python/creating_classes.py`

```python
class Car:
    """
    Car models a car w/ tires and an engine
    """

    def __init__(self, engine, tires):
        self.engine = engine
        self.tires = tires

    def description(self):
        print(f"A car with an {self.engine} engine, and {self.tires} tires")
```

Our `description` method doesn't have any actual arguments, but we pass the instance in as `self`. From there, we can access the instance's attributes by calling `self.ATTRIBUTE_NAME`.

Let's use this new method:

```python
$ python3.7 -i creating_classes.py
>>> honda = Car('4-cylinder', ['front-driver', 'front-passenger', 'rear-driver', 'rear-passenger'])
>>> honda.engine
'4-cylinder'
>>> honda.tires
['front-driver', 'front-passenger', 'rear-driver', 'rear-passenger']
>>> honda.description
<bound method Car.description of <__main__.Car object at 0x7fb5f3fbbda0>>
>>> honda.description()
A car with a 4-cylinder engine, and ['front-driver', 'front-passenger', 'rear-driver', 'rear-passenger'] tires
```

Just like a normal function, if we don't use parenthesis the method won't execute.

### Composition

With one custom class under our belt, we're ready to think about how we can use classes together to create full-featured domain models. In this lesson, we'll create another class and utilize it with our `Car` class.

#### Python Documentation For This Video

- [Classes](https://docs.python.org/3/tutorial/classes.html#classes)
- [Doctest](https://docs.python.org/3.7/library/doctest.html)

#### Modeling the Tire

Currently, our `Car` class has `tires` and an `engine`, but they're all strings and don't really hold the information that we'd expect. For a tire, it should probably have these attributes:

- `brand` - The brand of the tire.
- `tire_type` - The type of the tire (valid options: None, 'P', 'LT'). We're not using `type` as the name because it's a name of the built-in function.
- `width` - The tire width in millimeters
- `ratio` - The ratio of the tire height to its width. A percentage represented as an integer.
- `construction` - How the tire is constructed. The default (and only) option is 'R'.
- `diameter` - The diameter of the wheel in inches.

Let's model our tire by creating a `Tire` class. We'll create this class in its own file (next to `creating_classes.py`) called `tire.py`:

`~/learning_python/tire.py`

```python
class Tire:
    """
    Tire represents a tire that would be used with an automobile.
    """

    def __init__(self, tire_type, width, ratio, diameter, brand='', construction='R'):
        self.tire_type = tire_type
        self.width = width
        self.ratio = ratio
        self.diameter = diameter
        self.brand = brand
        self.construction = construction
```

Now we have a way to represent an individual tire. Let's go into the REPL and pass a list of `Tire` instances as `tires` when we create a `Car`:

```python
$ python3.7 -i creating_classes.py
>>> from tire import Tire
>>> tire = Tire('P', 205, 55, 15)
>>> tires = [tire, tire, tire, tire]
>>> honda = Car(tires=tires, engine='4-cylinder')
>>> honda.description()
A car with a 4-cylinder engine, and [<tire.Tire object at 0x7ff1b0a7fe48>, <tire.Tire object at 0x7ff1b0a7fe48>, <tire.Tire object at 0x7ff1b0a7fe48>, <tire.Tire object at 0x7ff1b0a7fe48>] tires
```

A few things to note here:

1. To load an additional file into the REPL, we were able to reference it by name using `from [FILE_NAME_MINUS_EXTENSION] import [CLASS/FUNCTION/VARIABLE]`. We'll learn more about loading code from other modules and packages when we look into the standard library, but this is handy for now.
2. We created a list of tires by using the same tire variable 4 times.
3. The printing of each tire isn't very readable, and we can see that each item points to the same tire in memory (based on the `at 0x7ff1b0a7fe48`).

Before we discuss composition, let's improve this print out by adding a new double underscore method to the `Tire` class: the `__repr__` method. The `__repr__` method specifies what should be returned when an instance of the class is passed to the `repr` function, but also when it printed *as part of another object* being printed.

`~/learning_python/tire.py`

```python
class Tire:
    """
    Tire represents a tire that would be used with an automobile.
    """

    def __init__(self, tire_type, width, ratio, diameter,
                 brand='', construction='R'):
        self.tire_type = tire_type
        self.width = width
        self.ratio = ratio
        self.diameter = diameter
        self.brand = brand
        self.construction = construction

    def __repr__(self):
        """
        Represent the tire's information in the standard notation present
        on the side of the tire. Example: 'P215/65R15'
        """
        return (f"{self.tire_type}{self.width}/{self.ratio}"
                + f"{self.construction}{self.diameter}")
```

Now if we repeat the process of creating a car with some tires:

```python
$ python3.7 -i creating_classes.py
>>> from tire import Tire
>>> tire = Tire('P', 205, 55, 15)
>>> tires = [tire, tire, tire, tire]
>>> honda = Car(tires=tires, engine='4-cylinder')
>>> honda.description()
A car with a 4-cylinder engine, and [P205/55R15, P205/55R15, P205/55R15, P205/55R15] tires
```

*Note:* If we were just printing the `tire` by itself then it would use the `__str__` method, and since we didn't implement that, it internally uses the `__repr__` method.

#### What is Composition?

What we just did is use "composition" to build up our `Car` class by passing in `Tire` objects. One of the big ideas behind composition is that we can keep our classes focused on the behaviors and state that pertain to itself, and if it needs functionality from a different object we can inject those. The beautiful thing about composition is that it allows us to have a clean separation of concerns between our objects, and lets us reuse them. To show the power of composition, let's add a `circumference` method to our `Tire` class:

`~/learning_python/tire.py`

```python
import math

class Tire:
    """
    Tire represents a tire that would be used with an automobile.
    """

    def __init__(self, tire_type, width, ratio, diameter, brand='', construction='R'):
        self.tire_type = tire_type
        self.width = width
        self.ratio = ratio
        self.diameter = diameter
        self.brand = brand
        self.construction = construction

    def circumference(self):
        """
        The circumference of the tire in inches.

        >>> tire = Tire('P', 205, 65, 15)
        >>> tire.circumference()
        80.1
        """
        side_wall_inches = (self.width * (self.ratio / 100)) / 25.4
        total_diameter = side_wall_inches * 2 + self.diameter
        return round(total_diameter * math.pi, 1)

    def __repr__(self):
        """
        Represent the tire's information in the standard notation present
        on the side of the tire. Example: 'P215/65R15'
        """
        return (f"{self.tire_type}{self.width}/{self.ratio}"
                + f"{self.construction}{self.diameter}")
```

Now we can use this method within our `Car` class by adding a `wheel_circumference` method:

`~/learning_python/creating_classes.py`

```python
class Car:
    """
    Car models a car w/ tires and an engine
    """

    def __init__(self, engine, tires):
        self.engine = engine
        self.tires = tires

    def description(self):
        print(f"A car with a {self.engine} engine, and {self.tires} tires")

    def wheel_circumference(self):
        if len(self.tires) > 0:
            return self.tires[0].circumference()
        else:
            return 0
```

This is the power of composition. Our `Car` class doesn't need to know how to calculate the circumference of its wheels (which makes sense, since you can swap out wheels on a car).

```python
$ python3.7 -i creating_classes.py
>>> from tire import Tire
>>> tire = Tire('P', 205, 65, 15)
>>> tires = [tire, tire, tire, tire]
>>> honda = Car(tires=tires, engine='4-cylinder')
>>> honda.wheel_circumference()
80.1
>>> honda.tires = []
>>> honda.wheel_circumference()
0
```

#### A Quick Look at Doctests

You may have noticed the extra content that was added to the docstring of our `circumference` method. This is actually so that we can ensure our implementation works. We've simulated how we would use this code in the REPL, and we can use the `doctest` module to evaluate this, ensuring that the output would match the `80.1` we're expecting. Here's how we would run this:

```python
$ python3.7 -m doctest -v tire.py
Trying:
    tire = Tire('P', 205, 65, 15)
Expecting nothing
ok
Trying:
    tire.circumference()
Expecting:
    80.1
ok
4 items had no tests:
    tire
    tire.Tire
    tire.Tire.__init__
    tire.Tire.__repr__
1 items passed all tests:
   2 tests in tire.Tire.circumference
2 tests in 5 items.
2 passed and 0 failed.
Test passed.
```

### Inheritance

Composition is a very powerful tool for code reuse, but one of the other tools that we have at our disposal is inheritance. Inheritance allows us to create new classes that add or modify the behavior of existing classes. In this lesson, we'll create a different type of `Tire`.

#### Documentation For This Video

- [Classes](https://docs.python.org/3/tutorial/classes.html#classes)
- [Inheritance](https://docs.python.org/3.7/tutorial/classes.html#inheritance)

#### Using Inheritance to Customize an Existing Class

Our existing `Tire` implementation does exactly what we need it to do for a general car tire, but there are other, more specific types of tires, such as racing slicks or snow tires. If we wanted to model these other types of tires, we could use our existing `Tire` class as a start by "inheriting" its existing implementation. Let's add a new `SnowTire` class to our `tire.py` file:

`~/learning_python/tire.py`

```
import math

class Tire:
    """
    Tire represents a tire that would be used with an automobile.
    """

    def __init__(self, tire_type, width, ratio, diameter, brand='', construction='R'):
        self.tire_type = tire_type
        self.width = width
        self.ratio = ratio
        self.diameter = diameter
        self.brand = brand
        self.construction = construction

    def circumference(self):
        """
        The circumference of a tire in inches.

        >>> tire = Tire('P', 205, 65, 15)
        >>> tire.circumference()
        80.1
        """
        side_wall_inches = self._side_wall_inches()
        total_diameter = side_wall_inches * 2 + self.diameter
        return round(total_diameter * math.pi, 1)

    def __repr__(self):
        """
        Represent the tire's information in the standard notation present
        on the side of the tire. Example: 'P215/65R15'
        """
        return (f"{self.tire_type}{self.width}/{self.ratio}"
                + f"{self.construction}{self.diameter}")

    def _side_wall_inches(self):
        return (self.width * (self.ratio / 100)) / 25.4

class SnowTire(Tire):
    def __init__(self, tire_type, width, ratio, diameter, chain_thickness, brand='', construction='R'):
        Tire.__init__(self, tire_type, width, ratio, diameter, brand, construction)
        self.chain_thickness = chain_thickness

    def circumference(self):
        """
        The circumference of a tire w/ show chains in inches.

        >>> tire = SnowTire('P', 205, 65, 15, 2)
        >>> tire.circumference()
        92.7
        """
        side_wall_inches = self._side_wall_inches()
        total_diameter = (side_wall_inches + self.chain_thickness) * 2 + self.diameter
        return round(total_diameter * math.pi, 1)
```

We used another doctest here to show the usage of our `SnowTire.circumference` method. If we print a `SnowTire` instance it will automatically use the `__repr__` implementation from the `Tire` class because we inherited all of the behavior of the `Tire` class. We customized both the `__init__` and `circumference` methods to handle the changes that the `chain_thickness` value adds. Because the calculation of the tire sidewall thickness is a little complicated, we extracted that into a separate "private" method so that we could use it in both implementations (the method name starts with a single underscore).

#### Using `super()`

The `circumference` method is a situation where we needed to make a modification midway through the calculation, so it made more sense to extract a helper method and write a whole new implementation. But most of the time when we're working with inheritance it's because we do want most of the initial implementation. In these situations, we have access to the `super` function that allows us to utilize the method implementations from our parent class. As it stands right now, our `SnowTire` class will display itself in the same way as the `Tire` class, but we'd like to distinguish them when they're printed out. To do this, we'll override the `__repr__` method, but we want to simply add a `(Snow)` to the end of the original information. Let's utilize `super` to accomplish this:

`~/learning_python/tire.py`

```
# Implementation of Tire omitted

class SnowTire(Tire):
    def __init__(self, tire_type, width, ratio, diameter, chain_thickness, brand='', construction='R'):
        Tire.__init__(self, tire_type, width, ratio, diameter, brand, construction)
        self.chain_thickness = chain_thickness

    def circumference(self):
        """
        The circumference of a tire w/ show chains in inches.

        >>> tire = SnowTire('P', 205, 65, 15, 2)
        >>> tire.circumference()
        92.7
        """
        side_wall_inches = self._side_wall_inches()
        total_diameter = (side_wall_inches + self.chain_thickness) * 2 + self.diameter
        return round(total_diameter * math.pi, 1)

    def __repr__(self):
        return super().__repr__() + " (Snow)"
```

This implementation is clean, and allows us to avoid repeating ourselves just to add a small modification to the `__repr__` output. Additionally, we can (and should) use `super` as part of the `__init__` customizations that we made earlier. The existing implementation was how it would be done in Python 2, and you might see it from time to time. But in Python 3, we can leverage `super` in the exact way that we did with `__repr__`. Let's clean up our `__init__` method:

`~/learning_python/tire.py`

```
# Implementation of Tire omitted

class SnowTire(Tire):
    def __init__(self, tire_type, width, ratio, diameter, chain_thickness, brand='', construction='R'):
        super().__init__(tire_type, width, ratio, diameter, brand, construction)
        self.chain_thickness = chain_thickness

    def circumference(self):
        """
        The circumference of a tire w/ show chains in inches.

        >>> tire = SnowTire('P', 205, 65, 15, 2)
        >>> tire.circumference()
        92.7
        """
        side_wall_inches = self._side_wall_inches()
        total_diameter = (side_wall_inches + self.chain_thickness) * 2 + self.diameter
        return round(total_diameter * math.pi, 1)

    def __repr__(self):
        return super().__repr__() + " (Snow)"
```

The only real differences are that instead of using the `Tire` constant, we call `super()` and we also don't need to pass `self` into the call to `__init__`. Using `super` allows us to contain the details about our superclass to the initial declaration, and if we end up changing our superclass later on we won't need to modify other spots where we hardcoded the superclass's name.

### Polymorphism

Composition works really well for allowing us to reuse code, and one of the other things that it allows us to do is swap out the dependencies that we pass in. This process works because of the idea of polymorphism. In this lesson, we'll learn what polymorphism is and how it's used.

#### Documentation For This Video

- [Classes](https://docs.python.org/3/tutorial/classes.html#classes)

#### What is Polymorphism?

Polymorphism is a pretty strange word that gets used fairly often when talking about object-oriented programming. Thankfully, the concept of polymorphism isn't as complicated as the name would imply. Our `Car` class is currently taking in a list of `Tire` objects, but do they need to be `Tire` instances? Let's take a look at every interaction with the tire instances that happens within the `Car` class's implementation:

`~/learning_python/creating_classes.py`

```
class Car:
    """
    Car models a car w/ tires and an engine
    """

    def __init__(self, engine, tires):
        self.engine = engine
        self.tires = tires

    def description(self):
        print(f"A car with a {self.engine} engine, and {self.tires} tires")

    def wheel_circumference(self):
        if len(self.tires) > 0:
            return self.tires[0].circumference()
        else:
            return 0
```

We interact with the tires in two spots:

1. When printing in the `description` method
2. By calling the `circumference` method within `wheel_circumference`

If instead of `Tire` instances we used strings for the `tires` attribute, then we would run into issues because the `str` type doesn't have a `circumference` method. Since variables aren't statically typed in Python (they aren't bound to one specific type) the only thing that we need to do to have our `Car` class work is to pass in tires that meet these requirements:

1. They can be printed
2. They implement the `circumference` method

This is polymorphism. It's the idea that we can make different data structures work together so long as the method requirements between them are met. It means that we can pass `SnowTire` instances into a `Car` class where we were currently using `Tire` instances, and there would be no errors or issues.

```
$ python3.7 -i creating_classes.py
>>> from tire import SnowTire
>>> tire = SnowTire('P', 205, 65, 15, 2)
>>> tires = [tire, tire, tire, tire]
>>> honda = Car(tires=tires, engine='4-cylinder')
>>> honda.wheel_circumference()
92.7
```

Technically, we could create a class called `Circle` that also implements a `circumference` method, and that would also work as a "tire" because of polymorphism.

## Using Packages

### Standard Library Packages

One of Python's great strengths is that it comes with a standard library containing many useful modules. In this lesson, we'll learn the various ways that we can use modules, and we'll also take a look at some of the commonly used modules.

#### Documentation For This Video

- [Python Modules Tutorial](https://docs.python.org/3/tutorial/modules.html)
- [Python Module Index](https://docs.python.org/3/py-modindex.html)
- [The `math` module](https://docs.python.org/3/library/math.html#module-math)

#### Using Standard Library Modules

We've already utilized a standard library package when we used the [`math` module](https://docs.python.org/3/library/math.html#module-math) to calculate the circumference of a tire. We used one of the variables from the `math` module in the form of `pi`, but we loaded the entire module using this line:

```
import math
```

Using `import` we're able to access the internals of the module, by chaining off of the module's name as we did with `pi` using `math.pi`, but there are other ways we could have accessed `pi`. Let's take a look at some of our options:

- `from math import pi` - We can access `pi` by itself, and we can't reference `math` because we used a selective import.
- `from math import pi as p` - This would allow us to have access to a `p` variable that contains the value of `pi`.
- `from math import pi, floor, ceil` - This would selectively import the `pi` variable, the `floor` function, and the `ceil` function.
- `from math import *` - This would import *EVERYTHING* (except names starting with an underscore) from the `math` module into the current namespace. Avoid doing this if possible.

#### Useful Standard Library Modules

Here are some of the most useful standard library modules that we'll use throughout the remainder of the course.

- [`argparse`](https://docs.python.org/3/library/argparse.html#module-argparse) - for creating CLIs
- [`json`](https://docs.python.org/3/library/json.html#module-json) - for working with JSON
- [`math`](https://docs.python.org/3/library/math.html#module-math) - for doing math operations
- [`os`](https://docs.python.org/3/library/os.html#module-os) - for interacting with operating system resources
- [`pdb`](https://docs.python.org/3/library/pdb.html#module-pdb) - the Python debugger
- [`sys`](https://docs.python.org/3/library/sys.html#module-sys) - for interacting with system specific parameters and functions

### Third-Party Packages

The standard library is great, but the vast quantity of third-party packages in the Python ecosystem is also at our disposal. In this lesson, we'll learn how to install Python packages and separate our dependencies using a *virtualenv*.

#### Documentation For This Video

- [Installing Python Modules](https://docs.python.org/3/installing/index.html)
- [Pip](https://pip.pypa.io/en/stable/)
- [Pipenv](https://pipenv.readthedocs.io/en/latest/)
- [`boto3`](https://boto3.readthedocs.io/en/latest/)

#### Using `pip` to Install Packages

As a language with strong open-source roots, Python has a very large repository of open-source packages that can be installed for our use. Thankfully, this repository is easy for us to use, and when we installed Python we were even given the tool to install packages. The simplest tool that we have is [`pip`](https://pip.pypa.io/en/stable/). Since we have more than one Python installation, we need to make sure that we're using the version of `pip` that corresponds to the version of Python that we would like to install the package for. With Python 3.7, we'll use `pip3.7`. Let's install our first package, the popular AWS client library [`boto3`](https://boto3.readthedocs.io/en/latest/):

```
$ pip3.7 install boto3
...
Installing collected packages: docutils, jmespath, urllib3, six, python-dateutil, botocore, s3transfer, boto3
Could not install packages due to an EnvironmentError: [Errno 13] Permission denied: '/usr/local/lib/python3.7/site-packages/docutils'
Consider using the `--user` option or check the permissions.
$
```

There's an error because we don't have permissions to install a package globally unless we use `sudo`. If we do use `sudo`, then any other user on the system that could use our Python 3.7 install would also have access to `boto3`. An alternative approach is to install the package into a directory for packages only for our user using the `--user` flag when installing. Let's install the package locally to our user:

```
$ pip3.7 install --user boto3
...
Installing collected packages: urllib3, jmespath, six, python-dateutil, docutils, botocore, s3transfer, boto3
Successfully installed boto3-1.9.93 botocore-1.12.93 docutils-0.14 jmespath-0.9.3 python-dateutil-2.8.0 s3transfer-0.2.0 six-1.12.0 urllib3-1.24.1
$
```

The `boto3` package has some dependencies, so `pip` also installed those as part of the installation process.

#### Viewing Installed Packages

If we want to view the packages that are already installed we'll also use the `pip` for that using the `pip freeze` command:

```
$ pip3.7 freeze
boto3==1.9.93
botocore==1.12.93
certifi==2018.11.29
Click==7.0
docutils==0.14
Flask==1.0.2
itsdangerous==1.1.0
Jinja2==2.10
jmespath==0.9.3
MarkupSafe==1.1.0
pipenv==2018.11.26
python-dateutil==2.8.0
s3transfer==0.2.0
six==1.12.0
urllib3==1.24.1
virtualenv==16.2.0
virtualenv-clone==0.4.0
Werkzeug==0.14.1
```

Since we installed `boto3` with the `--user` flag, we'll still see it in this list. But a different user would not. The `freeze` subcommand gives us the information in a format that puts into a file, and then that file could be used to install packages with the specific version. Here's what that would look like:

```
$ pip3.7 freeze > requirements.txt
$ pip3.7 install --user -r requirements.txt
Requirement already satisfied: boto3==1.9.93 in ./.local/lib/python3.7/site-packages (from -r requirements.txt (line 1)) (1.9.93)
Requirement already satisfied: botocore==1.12.93 in ./.local/lib/python3.7/site-packages (from -r requirements.txt (line 2)) (1.12.93)
Requirement already satisfied: certifi==2018.11.29 in /usr/local/lib/python3.7/site-packages (from -r requirements.txt (line 3)) (2018.11.29)
Requirement already satisfied: Click==7.0 in ./.local/lib/python3.7/site-packages (from -r requirements.txt (line 4)) (7.0)
Requirement already satisfied: docutils==0.14 in ./.local/lib/python3.7/site-packages (from -r requirements.txt (line 5)) (0.14)
Requirement already satisfied: Flask==1.0.2 in ./.local/lib/python3.7/site-packages (from -r requirements.txt (line 6)) (1.0.2)
Requirement already satisfied: itsdangerous==1.1.0 in ./.local/lib/python3.7/site-packages (from -r requirements.txt (line 7)) (1.1.0)
Requirement already satisfied: Jinja2==2.10 in ./.local/lib/python3.7/site-packages (from -r requirements.txt (line 8)) (2.10)
Requirement already satisfied: jmespath==0.9.3 in ./.local/lib/python3.7/site-packages (from -r requirements.txt (line 9)) (0.9.3)
Requirement already satisfied: MarkupSafe==1.1.0 in ./.local/lib/python3.7/site-packages (from -r requirements.txt (line 10)) (1.1.0)
Requirement already satisfied: pipenv==2018.11.26 in /usr/local/lib/python3.7/site-packages (from -r requirements.txt (line 11)) (2018.11.26)
Requirement already satisfied: python-dateutil==2.8.0 in ./.local/lib/python3.7/site-packages (from -r requirements.txt (line 12)) (2.8.0)
Requirement already satisfied: s3transfer==0.2.0 in ./.local/lib/python3.7/site-packages (from -r requirements.txt (line 13)) (0.2.0)
Requirement already satisfied: six==1.12.0 in ./.local/lib/python3.7/site-packages (from -r requirements.txt (line 14)) (1.12.0)
Requirement already satisfied: urllib3==1.24.1 in ./.local/lib/python3.7/site-packages (from -r requirements.txt (line 15)) (1.24.1)
Requirement already satisfied: virtualenv==16.2.0 in /usr/local/lib/python3.7/site-packages (from -r requirements.txt (line 16)) (16.2.0)
Requirement already satisfied: virtualenv-clone==0.4.0 in /usr/local/lib/python3.7/site-packages (from -r requirements.txt (line 17)) (0.4.0)
Requirement already satisfied: Werkzeug==0.14.1 in ./.local/lib/python3.7/site-packages (from -r requirements.txt (line 18)) (0.14.1)
Requirement already satisfied: pip>=9.0.1 in /usr/local/lib/python3.7/site-packages (from pipenv==2018.11.26->-r requirements.txt (line 11)) (18.1)
Requirement already satisfied: setuptools>=36.2.1 in /usr/local/lib/python3.7/site-packages (from pipenv==2018.11.26->-r requirements.txt (line 11))
(40.6.2)
```

#### Creating a `virtualenv`

If you're working on multiple packages that have varying dependency requirements, you can run into issues if you're installing packages either globally or localized to a user. Python's solution to this is what's known as a "virtualenv" (for "virtual environment"). A virtualenv is a localized Python install with its own packages, and it can be activated/deactivated. The Python module for creating a virtualenv is called `venv`, and we can use it by loading the module and providing a path to where we would like to place the virtualenv. Let's create a virtualenv where we can install the package `psycopg2`:

```
$ mkdir ~/venvs
$ python3.7 -m venv ~/venvs/pg
```

Now we have a virtualenv, but we need to "activate" it by running a script that was created within the virtualenv's `bin` directory.

```
$ source ~/venvs/pg/bin/activate
(pg) $ python --version
Python 3.7.2
```

The `(pg)` at the front of our prompt is to indicate to us which virtualenv we currently have active. While this virtualenv is active, the only `python` in our path is the Python 3.7 that we used to generate it, and `pip` will install packages for that Python (so we don't need to use `pip3.7`). Let's install the `psycopg2` package:

```
(pg) $ pip install psycopg2
Collecting psycopg2
  Downloading https://files.pythonhosted.org/packages/0c/ba/e521b9dfae78dc88d3e88be99c8d6f8737a69b65114c5e4979ca1209c99f/psycopg2-2.7.7-cp37-cp37m-manylinux1_x86_64.whl (2.7MB)
    100% |????????????????????????????????| 2.7MB 14.4MB/s
Installing collected packages: psycopg2
Successfully installed psycopg2-2.7.7
```

To deactivate our virtualenv, we can use the `deactivate` executable that was put into our `$PATH`:

```
(pg) $ deactivate
$
```

#### Using `pipenv`

The last tool that we're going to look at is a newer tool, [`pipenv`](https://pipenv.readthedocs.io/en/latest/), built to handle both creating and working with a virtualenv, and also managing dependencies. Let's install [`pipenv`](https://pipenv.readthedocs.io/en/latest/) and see what the workflow looks like:

```
$ pip3.7 install --user pipenv
...
```

Rather than putting all of the virtualenvs in a directory that we have to navigate to, Pipenv would have us create a project and then initialize a virtualenv for it. Let's create a `database` project and then initialize a virtualenv for it using Pipenv:

```
$ mkdir ~/database
$ cd ~/database
$ pipenv --python python3.7
Creating a virtualenv for this project…
Pipfile: /home/cloud_user/database/Pipfile
Using /usr/local/bin/python3.7 (3.7.2) to create virtualenv…
? Creating virtual environment...Already using interpreter /usr/local/bin/python3.7
Using base prefix '/usr/local'
New python executable in /home/cloud_user/.local/share/virtualenvs/database-OGMn9Yao/bin/python3.7
Also creating executable in /home/cloud_user/.local/share/virtualenvs/database-OGMn9Yao/bin/python
Installing setuptools, pip, wheel...
done.

? Successfully created virtual environment!
Virtualenv location: /home/cloud_user/.local/share/virtualenvs/database-OGMn9Yao
```

A few things to note here:

1. Pipenv manages a virtualenv for each project that we set up within `~/.local/share/virtualenvs`
2. We now have a `Pipfile` which is a more customizable file for us to manage our dependencies in than the `requirements.txt` file that we generated earlier.

To activate our virtualenv, we can use a new command from within our project directory:

```
$ pipenv shell
Launching subshell in virtual environment…
$  . /home/cloud_user/.local/share/virtualenvs/database-OGMn9Yao/bin/activate
(database) $
```

When we want to add a dependency to our project we also use `pipenv`:

```
(database) $ pipenv install psycopg2
Installing psycopg2…
Adding psycopg2 to Pipfile's [packages]…
? Installation Succeeded
Pipfile.lock not found, creating…
Locking [dev-packages] dependencies…
Locking [packages] dependencies…
? Success!
Updated Pipfile.lock (59b6f6)!
Installing dependencies from Pipfile.lock (59b6f6)…
  ???????????????????????????????? 1/1 — 00:00:00
```

The big difference between this and just installing the package using `pip` is that Pipenv will work through a dependency graph to make sure that if two of our dependencies have a common dependency, then we install a version that is compatible with both of our explicit dependencies.

The last thing to note is that to exit our virtualenv, we can simply use `exit` and it will drop us back to our previous session without the virtualenv loaded.
