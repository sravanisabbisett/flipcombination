#!/bin/bash -x

head=1
tail=0
num=1
num1=1
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

while [ $num1 -le 10 ]
do
   var=$(( RANDOM%2 ))
   var1=$(( RANDOM%2 ))
   if [[ $var -eq $head && $var1 -eq $head ]]
   then
      flip="HH"
		count3=$(( $count3+1 ))
   elif [[ $var -eq $head && $var1 -eq $tail ]]
   then
      flip="HT"
		count4=$(( $count4+1 ))
   elif [[ $var -eq $tail && $var1 -eq $head ]]
   then
      flip="TH"
		count5=$(( $count5+1 ))
   else [[ $var -eq $tail && $var1 -eq $head ]]
      flip="TT"
		count6=$(( $count6+1 ))
   fi
   doublet[$num1]=$flip
   num1=$(( $num1+1 ))
   echo ${doublet[@]}
done

len1=${#doublet[@]}

HH=$(echo | awk '{print '$count3/$len1*100'}')
echo "winning percentage for combination HH" $HH

HT=$(echo | awk '{print '$count4/$len1*100'}')
echo "winning percentage for combination HT" $HT

TH=$(echo | awk '{print '$count5/$len1*100'}')
echo "winning percentage for combination TH" $TH

TT=$(echo | awk '{print '$count6/$len1*100'}')
echo "winning percentage for combination TT" $TT

array2=($HH $HT $TH $TT)
echo ${array2[@]}
