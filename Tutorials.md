# Variables

```sh
PRICE_PER_APPLE=5
MyFirstLetters=ABC
greeting='Hello world!'
```
A backslash "\\" is used to escape special character meaning

```sh
PRICE_PER_APPLE=5
echo "The price of an Apple today is: \$HK $PRICE_PER_APPLE"
```
Encapsulating the variable name with ${} is used to avoid ambiguity

```sh
MyFirstLetters=ABC
echo "The first 10 letters in the alphabet are: ${MyFirstLetters}DEFGHIJ"
```

Encapsulating the variable name with "" will preserve any white space values

```sh
greeting='Hello        world!'
echo $greeting" now with spaces: $greeting"
```

Variables can be assigned with the value of a command output. This is referred to as substitution. Substitution can be done by encapsulating the command with `` (known as back-ticks) or with $()

```sh
FILELIST=`ls`
FileWithTimeStamp=/tmp/my-dir/file_$(/bin/date +%Y-%m-%d).txt
```
Note that when the script runs, it will run the command inside the $() parenthesis and capture its output.

# Passing arguments to the script

Executing the script on terminal as :

```sh
bash my_shopping.sh apple 5 banana 8 "Fruit Basket" 15
```
my_shopping.sh file contains below code.

```sh
echo "File name is "$0 # holds the current script name
echo $3 # $3 holds banana
Data=$5 # $5 holds "Fruit Basket"
echo "A $Data costs just $6."
echo $# # $# holds the number of arguments passed to the script
```
The variable `$@` holds a space delimited string of all arguments passed to the script.


# Arrays

```sh
my_array=(apple banana "Fruit Basket" orange)
```

```sh
echo  ${#my_array[@]} # 4 - total number of elements in the array
echo  ${my_array[3]} # orange - note that curly brackets are needed
my_array[4]="carrot" # adding another array element - value assignment without a $ and curly brackets
echo ${#my_array[@]} # 5
echo ${my_array[${#my_array[@]}-1]} # carrot
echo ${my_array[@]} # apple banana Fruit Basket orange carrot - all the array values 
```

# Basic operators (+ - * / % **)

```sh
A=3
B=$((100 * $A + 5)) 
echo $B # 305
```

# Basic string operations

## String length

```sh
STRING="this is a string"
echo ${#STRING} # 16 - string length
```

## Index

```sh
STRING="this is a string"
SUBSTRING="hat" # any single character
expr index "$STRING" "$SUBSTRING" # 1 is the position of the first 't' in $STRING
```
## Substring extraction

Note that first position is 0.

```sh
STRING="this is a string"
POS=1
LEN=3
echo ${STRING:$POS:$LEN} # his
```
If `$LEN` is omitted, extract substring from `$POS` to end of line.

If `$POS` is omitted, it will be equal to `0`.


```sh
echo ${STRING:1} # his is a string
echo ${STRING:12} # ring
echo ${STRING::4} # this
echo ${STRING:0:4} # this
```
# Simple data extraction

```sh
# Code to extract the First name from the data record
DATARECORD="last=Clifford,first=Johnny Boy,state=CA"
COMMA1=`expr index "$DATARECORD" ','` # 14 position of first comma
CHOP1FIELD=${DATARECORD:$COMMA1} # first=Johnny Boy,state=CA
COMMA2=`expr index "$CHOP1FIELD" ','` # 14 position of second comma
LENGTH=`expr $COMMA2 - 6 - 1` # 10
FIRSTNAME=${CHOP1FIELD:6:$LENGTH} # Johnny Boy
echo $FIRSTNAME
```

# Substring replacement

```sh
SENTENCE="to be or not to be"

echo ${SENTENCE[@]/be/eat} # to eat or not to be - replace first occurrence of substring with replacement
echo ${SENTENCE[@]//be/eat} # to eat or not to eat - replace all occurrences of substring
echo ${SENTENCE[@]//not/} # to be or to be - delete all occurrences of substring (replace with empty string)
echo ${SENTENCE[@]/#to be/eat now} # eat now or not to be - replace occurrence of substring if at the beginning of $SENTENCE
echo ${SENTENCE[@]/%be/eat} # to be or not to eat - replace occurrence of substring if at the end of $SENTENCE
echo ${SENTENCE[@]/%be/be on $(date +%Y-%m-%d)} # to be or not to be on 2012-06-14 - replace occurrence of substring with shell command output
```
# Decision Making

```sh
NAME="John"
if [ "$NAME" = "John" ]; then
  echo "True - my name is indeed John"
fi
```
It can be expanded with `else` :

```sh
NAME="Bill"
if [ "$NAME" = "John" ]; then
  echo "True - my name is indeed John"
else
  echo "False"
  echo "You must mistaken me for $NAME"
fi
```
It can be expanded with `elif (else-if)` :

```sh
NAME="George"
if [ "$NAME" = "John" ]; then
  echo "John Lennon"
elif [ "$NAME" = "George" ]; then
  echo "George Harrison"
else
  echo "This leaves us with Paul and Ringo"
fi
```

## Types of numeric comparisons

```sh
Comparison   Evaluated to true when
$a -lt $b    $a < $b
$a -gt $b    $a > $b
$a -le $b    $a <= $b
$a -ge $b    $a >= $b
$a -eq $b    $a is equal to $b
$a -ne $b    $a is not equal to $b
```

## Types of string comparisons

```sh
Comparison      Evaluated to true when
"$a" = "$b"     $a is the same as $b
"$a" == "$b"    $a is the same as $b
"$a" != "$b"    $a is different from $b
-z "$a"         $a is empty
```

- Whitespace around = is required

- Use `""` around string variables to avoid shell expansion of special characters as *

## Logical combinations

```sh
if [[ $VAR_A[0] -eq 1 && ($VAR_B = "bee" || $VAR_T = "tee") ]] ; then
    command...
fi
```

## Case structure

```sh
case "$variable" in
    "$condition1" )
        command...
    ;;
    "$condition2" )
        command...
    ;;
esac
```

## simple case bash structure

```sh
mycase=1
case $mycase in
    1) echo "You selected bash";;
    2) echo "You selected perl";;
    3) echo "You selected phyton";;
    4) echo "You selected c++";;
    5) exit
esac
```

# Loops

## For

```sh
# loop on array member
NAMES=(Joe Jenny Sara Tony)
for NAME in ${NAMES[@]} ; do
  echo "My name is $NAME"
done

# loop on command output results
for f in $( ls prog.sh /etc/localtime ) ; do
  echo "File is: $f"
done
```

# While

```sh
COUNT=4
while [ $COUNT -gt 0 ]; do
  echo "Value of count is: $COUNT"
  COUNT=$(($COUNT - 1))
done
```

# Until

```sh
COUNT=1
until [ $COUNT -gt 5 ]; do
  echo "Value of count is: $COUNT"
  COUNT=$(($COUNT + 1))
done
```

## `break` and `continue` statements

```sh
# prints out 0,1,2,3,4
COUNT=0
while [ $COUNT -ge 0 ]; do
  echo "Value of COUNT is: $COUNT"
  COUNT=$((COUNT+1))
  if [ $COUNT -ge 5 ] ; then
    break
  fi
done

# prints out only odd numbers - 1,3,5,7,9
COUNT=0
while [ $COUNT -lt 10 ]; do
  COUNT=$((COUNT+1))
  # Check if COUNT is even
  if [ $(($COUNT % 2)) = 0 ] ; then
    continue
  fi
  echo $COUNT
done
```
# Shell Functions

```sh
function function_A {
  echo "Function A."
}

function function_B {
  echo "$1"
}

function adder {
  echo "$(($1 + $2))"
}
```

```sh
function_A # Function A.
function_B "Wazaaaaaa" # Wazaaaaaa
adder 6 4 # 10
```



