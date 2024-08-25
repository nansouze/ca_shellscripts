#!/bin/bash

# Shell Functions

# function function_A {
#   echo "Function A."
# }

# function function_B {
#   echo "$1"
# }

# function adder {
#   echo "$(($1 + $2))"
# }

# function_A # Function A.
# function_B "Wazaaaaaa" # Wazaaaaaa
# adder 6 4 # 10

# Exercise

function ENGLISH_CALC {
  nb1=$1
  nb2=$3
  operator=$2

  case $operator in
      "plus") echo "$nb1 + $nb2 = $(($nb1+$nb2))";;
      "minus") echo "$nb1 - $nb2 = $(($nb1-$nb2))";;
      "times") echo "$nb1 * $nb2 = $(($nb1*$nb2))";;
  esac
}

# testing code

ENGLISH_CALC 3 plus 5
ENGLISH_CALC 5 minus 1
ENGLISH_CALC 4 times 6