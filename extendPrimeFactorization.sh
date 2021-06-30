#!/bin/bash

#ARRAY
declare -a prime

squareroot()

        {

local input=$1
i=1

while [ $(( i*i )) -lt $input ]
do
i=$(( i+1 ))

done

if [[ $(( i*i )) -gt $input ]]
then
i=$(( i - 1 ))
fi

echo $i
}

getexponent()

{

local number=$1
local sqrt=$2

for (( counter=2; counter<=$(( sqrt )); counter=$(( $counter + 1 )) ))
do
if [ $(( $number % $counter )) -eq 0 ]
then
times=0
while [ $(( $number % $counter )) -eq 0 ]
do
times=$(( times + 1 ))
number=$(( $number / $counter ))

done
prime[$((count++))]=$counter
fi

if [[ $number -eq 1 ]]
then
break
fi

done

if [[ $number -ne 1 ]]
then
prime[$((count))]=$number
fi
}

read -p "Enter the number whose factors are to be found: " num

sqrt=$( squareroot $num )
getexponent $num $sqrt

echo "Prime factors"
echo ${prime[@]}
