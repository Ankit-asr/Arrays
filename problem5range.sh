#!/bin/bash

declare -a digitarray
declare -a numbers

read -p "Enter lower limit " lowerlimit
read -p "Enter upper limit " upperlimit

count=0                                           #initialize counter for digitarray- the array storing all digits

for (( i=$lowerlimit; i<=$upperlimit; i++ ))
do
divisor=1
while [ $(( $i / $divisor )) -ge 10 ]
do                                                #find divisor to separate digits of respective numbers
divisor=$(( $divisor * 10 ))
done

length=${#divisor}
input=$i

for (( k=0; k<$length; k++ ))
do				                  #compose the array of digits
digitarray[((count++))]=$(( $input / $divisor ))  
input=$(( $input % $divisor ))
divisor=$(( $divisor / 10 ))
done

done

arraylength=${#digitarray[@]}
x=0		                                #initialize counterfor numbers- the array storing repeated digits

for (( j=1; j<$arraylength; j=(($j+2)) ))
do
if [[ ${digitarray[(($j - 1))]} -eq ${digitarray[(($j))]} ]]  
then                                             #compare consecutive indices to find the repeated digits
numbers[((x++))]=${digitarray[(($j - 1))]}
numbers[((x++))]=${digitarray[(($j))]}
fi

done

echo "Numbers in which digits are repeated twice: "
echo ${!numbers[@]}     #Index of array
echo ${numbers[@]}#array of repeated digits in the range
