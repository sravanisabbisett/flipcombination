#!/bin/bash -x

head=1
tail=0
num=1
randomCheck=$(( RANDOM%2 ))
if [ $randomCheck -eq $head ]
then
	echo "coin flips head"
else
	echo "coin flips tail"
fi

while [ $num -le 10 ]
do
	var=$(( RANDOM%2 ))
	if [ $var -eq $head ]
	then
		flip="H"
		count1=$(( $count1+1 ))
	else
		flip="T"
		count2=$(( $count2+1 ))
	fi
	singlet[$num]=$flip
	num=$(( $num+1 ))
	echo ${singlet[@]}
done

len=${#singlet[@]}
headper=$(echo | awk '{print '$count1/$len*100'}')
echo "winning percentage of head: " $headper

tailper=$(echo | awk '{print '$count2/$len*100'}')
echo "winning percentage of tail: " $tailper

array1=($headper $tailper)
echo ${array1[@]}
