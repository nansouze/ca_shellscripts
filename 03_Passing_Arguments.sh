#!/bin/bash

# Passing Arguments to the Script
# bash my_shopping.sh apple 5 banana 8 "Fruit Basket" 15

# echo "File name is "$0 # holds the current script name
# echo $3 # $3 holds banana
# Data=$5 # $5 holds "Fruit Basket"
# echo "A $Data costs just $6."
# echo $# # $# holds the number of arguments passed to the script
# The variable $@ holds a space delimited string of all arguments passed to the script

# Exercise

function File {
    # think you are inside the file
    # Change Here
    echo $#
}

# Do not change anything
if [ ! $# -lt 1 ]; then
    File $*
    exit 0
fi