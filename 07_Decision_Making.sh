#!/bin/bash

# Decision Making

# NAME="John"
# if [ "$NAME" = "John" ]; then
#   echo "True - my name is indeed John"
# fi

# types of numeric comparisons

# comparison    Evaluated to true when
# $a -lt $b    $a < $b
# $a -gt $b    $a > $b
# $a -le $b    $a <= $b
# $a -ge $b    $a >= $b
# $a -eq $b    $a is equal to $b
# $a -ne $b    $a is not equal to $b

# types of string comparisons

# comparison    Evaluated to true when
# "$a" = "$b"     $a is the same as $b
# "$a" == "$b"    $a is the same as $b
# "$a" != "$b"    $a is different from $b
# -z "$a"         $a is empty

# logical combinations

# if [[ $VAR_A[0] -eq 1 && ($VAR_B = "bee" || $VAR_T = "tee") ]] ; then
#     command...
# fi

# case structure

# case "$variable" in
#     "$condition1" )
#         command...
#     ;;
#     "$condition2" )
#         command...
#     ;;
# esac

# simple case bash structure

# mycase=1
# case $mycase in
#     1) echo "You selected bash";;
#     2) echo "You selected perl";;
#     3) echo "You selected phyton";;
#     4) echo "You selected c++";;
#     5) exit
# esac

# Exercise

# change these variables

NUMBER=16
APPLES=16
KING="LUIS"

# modify above variables
# to make all decisions below TRUE

if [ $NUMBER -gt 15 ] ; then
  echo 1
fi
if [ $NUMBER -eq $APPLES ] ; then
  echo 2
fi
if [[ ($APPLES -eq 12) || ("$KING" = "LUIS") ]] ; then
  echo 3
fi
if [[ $(($NUMBER + $APPLES)) -le 32 ]] ; then
  echo 4
fi