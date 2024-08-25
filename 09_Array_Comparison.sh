#!/bin/bash

a=(3 5 8 10 6)
b=(6 5 4 12)
c=(14 7 5 7)

for i in "${a[@]}" ; do
  for j in "${b[@]}" ; do
    if [[ $i == $j ]] ; then
      d+=("$i")
      break
    fi
  done
done

for k in "${c[@]}" ; do
  for l in "${d[@]}" ; do
    if [[ $k == $l ]] ; then
      result+=("$k")
      break
    fi
  done
done

echo "${result[@]}"