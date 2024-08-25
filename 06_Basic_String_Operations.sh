#!/bin/bash

# Basic String Operations

# STRING="this is a string"
# echo ${#STRING} # 16 - string length

# SUBSTRING="hat" # any single character
# expr index "$STRING" "$SUBSTRING" # 1 is the position of the first 't' in $STRING
# POS=1
# LEN=3 # If $LEN is omitted, extract substring from $POS to end of line
# echo ${STRING:$POS:$LEN} # his
# echo ${STRING:1} # his is a string
# echo ${STRING:12} # ring

# Code to extract the First name from the data record
# DATARECORD="last=Clifford,first=Johnny Boy,state=CA"
# COMMA1=`expr index "$DATARECORD" ','` # 14 position of first comma
# CHOP1FIELD=${DATARECORD:$COMMA1} # first=Johnny Boy,state=CA
# COMMA2=`expr index "$CHOP1FIELD" ','` # 14 position of second comma
# LENGTH=`expr $COMMA2 - 6 - 1` # 10
# FIRSTNAME=${CHOP1FIELD:6:$LENGTH} # Johnny Boy
# echo $FIRSTNAME

# SENTENCE="to be or not to be"
# echo ${SENTENCE[@]/be/eat} # to eat or not to be - replace first occurrence of substring with replacement
# echo ${SENTENCE[@]//be/eat} # to eat or not to eat - replace all occurrences of substring
# echo ${SENTENCE[@]//not/} # to be or to be - delete all occurrences of substring (replace with empty string)
# echo ${SENTENCE[@]/#to be/eat now} # eat now or not to be - replace occurrence of substring if at the beginning of $SENTENCE
# echo ${SENTENCE[@]/%be/eat} # to be or not to eat - replace occurrence of substring if at the end of $SENTENCE
# echo ${SENTENCE[@]/%be/be on $(date +%Y-%m-%d)} # to be or not to be on 2012-06-14 - replace occurrence of substring with shell command output

# Exercise

BUFFETT="Life is like a snowball. The important thing is finding wet snow and a really long hill."

# write your code here

ISAY=$BUFFETT
change1=${ISAY[@]/snow/foot}
change2=${change1[@]//snow/}
change3=${change2[@]/finding/getting}
pos=`expr index "$change3" 'w'`
ISAY=${change3::$pos+2} # ${change3:0:$pos+2}

# Test code - do not modify

echo "Warren Buffett said:"
echo $BUFFETT
echo "and I say:"
echo "$ISAY"