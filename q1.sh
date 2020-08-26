#!/bin/bash

sum=0
l=1
N=$1

while [ $l -le $N ]
do
    intermediate=$(( $l * $l ))
    sum=$(( $sum + $intermediate ))
    l=$[$l+1]
done

echo $sum
