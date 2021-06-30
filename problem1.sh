#!/bin/bash  

#ARRAY

declare -a random


for (( count=0; count<=9; count++ ))
do
random[(($count))]=$(( RANDOM%900 + 100 ))
done

if [[ ${random[0]} < ${random[1]} ]]
then
smallest=${random[0]}
secondsmallest=${random[1]}
else
smallest=${random[1]}
secondsmallest=${random[0]}
fi

for (( i=2; i<=9; i++ ))
do
if [[ ${random[i]} < $smallest ]]
then
	secondsmallest=$smallest
smallest=${random[i]}
elif [[ ${random[i]} < $secondsmallest ]] && [[ ${random[i]} > $smallest ]]
	then
	secondsmallest=${random[i]}
	fi
	
done
echo ${random[@]}
echo "Minimum is $smallest , Second minimum is $secondsmallest " 


if [[ ${random[0]} < ${random[1]} ]]
then
biggest=${random[1]}
secondbiggest=${random[0]}
else
biggest=${random[0]}
secondbiggest=${random[1]}
fi


for (( i=2; i<=9; i++ ))
do
if [[ ${random[i]} > $biggest ]]
then
secondbiggest=$biggest
biggest=${random[i]}
elif [[ ${random[i]} > $secondbiggest ]] && [[ ${random[i]} < $biggest ]]
then
secondbiggest=${random[i]}
fi

done
echo "Maximum is $biggest , Second maximum is $secondbiggest "
