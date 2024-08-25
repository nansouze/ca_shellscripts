#!/bin/bash

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