#!/bin/bash

BUFFETT="Life is like a snowball. The important thing is finding wet snow and a really long hill."

# write your code here

ISAY=$BUFFETT
change1=${ISAY[@]/snow/foot}
change2=${change1[@]//snow/}
change3=${change2[@]/finding/getting}
length=`expr index "$change3" 'w'`
ISAY=${change3::$length+2} # ${change3:0:$length+2}

# Test code - do not modify

echo "Warren Buffett said:"
echo $BUFFETT
echo "and I say:"
echo "$ISAY"