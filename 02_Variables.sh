#!/bin/bash

# Variables

PRICE_PER_APPLE=5
MyFirstLetters=ABC
greeting='Hello        world!'

FILELIST=`ls`
FileWithTimeStamp=/tmp/my-dir/file_$(/bin/date +%Y-%m-%d).txt

# Exercise

BIRTHDATE="Jan 1, 2000"
Presents=10
BIRTHDAY=`date -d "${BIRTHDATE}" +%A`

# Testing code - do not change it

if [ "$BIRTHDATE" == "Jan 1, 2000" ] ; then
    echo "BIRTHDATE is correct, it is $BIRTHDATE"
else
    echo "BIRTHDATE is incorrect - please retry"
fi
if [ $Presents == 10 ] ; then
    echo "I have received $Presents presents"
else
    echo "Presents is incorrect - please retry"
fi
if [ "$BIRTHDAY" == "Saturday" ] ; then
    echo "I was born on a $BIRTHDAY"
else
    echo "BIRTHDAY is incorrect - please retry"
fi