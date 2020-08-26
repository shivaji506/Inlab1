#!/bin/bash

calc(){ awk "BEGIN { print "$*" }"; }

input="./q4_in.txt"
sum=0
n=0
arr=()
while IFS= read -r line
do
  numbers=$(echo $line | tr " " "\n")
  for ad in $numbers
  do
    sum=$(( $sum + ad ))
    n=$[$n+1]
    arr+=( $ad )
    # echo $ad
  done
done < "$input"


for ((i = 0; i<$n; i++)) 
do
      
    for((j = 0; j<$n-i-1; j++)) 
    do
      
        if [ ${arr[j]} -gt ${arr[$((j+1))]} ] 
        then
            # swap 
            temp=${arr[j]} 
            arr[$j]=${arr[$((j+1))]}   
            arr[$((j+1))]=$temp 
        fi
    done
done

# for s in ${arr[@]}
#     do
#         echo $s
# done

calc $sum/$n

v=$(( $n % 2 ))
mode=0
indx=$(( $n / 2 ))

if [ $v -ge 1 ]
then  
    indx=$(( $n / 2 ))
    echo ${arr[$indx]}
else
    indx1=$[$indx-1]
    myvar=$(( arr[$indx1] ))

    myvar=$(( $myvar + arr[$indx] ))
    calc $myvar/2
fi


