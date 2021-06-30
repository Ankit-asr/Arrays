#!/bin/bash

declare -a random


for (( count=0; count<=9; count++ ))

do
random[(($count))]=$(( RANDOM%900 + 100 ))
done

echo "UNSORTED:" ${random[@]}


for (( i=0; i<=8; i++  ))
do
min_index=$i
for (( j=$(( $i + 1)); j<=9; j++ ))
do
if [ ${random[(($j))]} -lt ${random[(($min_index))]} ]
then
min_index=$j
fi
done

temp=${random[(($i))]}
random[(($i))]=${random[((min_index))]}    #min number is at leftmost position
random[((min_index))]=$temp        #the larger number is placed in mins position

done

echo "Sorted" ${random[@]}
echo "Second min" ${random[1]}

for (( i=0; i<=8; i++ ))
do
max_index=$i

for(( j=$(( $i + 1 )); j<=9; j++ ))
do
if [ ${random[(($j))]} -gt ${random[(($max_index))]} ]
then
max_index=$j
fi
done


temp=${random[(($i))]}
random[(($i))]=${random[(($max_index))]}
random[(($max_index))]=$temp

done

echo "Sorted descending: " ${random[@]}
echo "Second max" ${random[1]}
