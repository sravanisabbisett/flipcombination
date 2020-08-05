#!/bin/bash -x

head=1
tail=0
num=1
num1=1
num2=1
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
while [ $num2 -le 20 ]
do
   var=$(( RANDOM%2))
   var1=$(( RANDOM%2))
   var2=$(( RANDOM%2))
   if [[ $var -eq 1 && $var1 -eq 1 && $var2 -eq 1 ]]
   then
      coin="HHH"
      count7=$(( $count7+1 ))
   elif [[ $var -eq 1 && $var1 -eq 1 && $var2 -eq 0 ]]
   then
      coin="HHT"
      count8=$(( $count8+1 ))
   elif [[ $var -eq 1 && $var1 -eq 0 && $var2 -eq 1 ]]
   then
      coin="HTH"
      count9=$(( $count9+1 ))
   elif [[ $var -eq 0 && $var1 -eq 1 && $var2 -eq 1 ]]
   then
      coin="THH"
      count10=$(( $count10+1 ))
   elif [[ $var -eq 1 && $var1 -eq 0 && $var2 -eq 0 ]]
   then
      coin="HTT"
      count11=$(( $count11+1 ))
   elif [[ $var -eq 0 && $var1 -eq 1 && $var2 -eq 0 ]]
   then
      coin="THT"
      count12=$(( $count12+1 ))
   elif [[ $var -eq 0 && $var1 -eq 0 && $var2 -eq 1 ]]
   then
      coin="TTH"
      count13=$(( $count13+1 ))
   else [[ $var -eq 0 && $var1 -eq 0 && $var2 -eq 0 ]]
      coin="TTT"
      count14=$(( $count14+1 ))
   fi
   triplet[$num2]=$coin
   num2=$(( $num2+1 ))
   echo ${triplet[@]}
done

len2=${#triplet[@]}

HHH=$(echo | awk '{print '$count7/$len2*100'}')
echo "winning percentage for combination HHH" $HHH

HHT=$(echo | awk '{print '$count8/$len2*100'}')
echo "winning percentage for combination HHT" $HHT

HTH=$(echo | awk '{print '$count9/$len2*100'}')
echo "winning percentage for combination HTH" $HTH

THH=$(echo | awk '{print '$count10/$len2*100'}')
echo "winning percentage for combination THH" $THH

HTT=$(echo | awk '{print '$count11/$len2*100'}')
echo "winning percentage for combination HTT" $HTT

THT=$(echo | awk '{print '$count12/$len2*100'}')
echo "winning percentage for combination THT" $THT

TTH=$(echo | awk '{print '$count13/$len2*100'}')
echo "winning percentage for combination TTH" $TTH

TTT=$(echo | awk '{print '$count14/$len2*100'}')
echo "winning percentage for combination TTT" $TTT

array3=($HHH $HHT $HTH $THH $HTT $THT $TTH $TTT)
echo ${array3[@]}

echo ${array2[@]}
length=${#array2[@]}
for ((i=0; i<$length; i++ ))
do
   for ((j=$(( $i+1 )); j<$length; j++ ))
   do
      if [ ${array2[i]} -gt ${array2[j]} ]
      then
         temp=${array2[i]}
         array2[$i]=${array2[j]}
         array2[$j]=$temp
      fi
   done
done

length2=${#array3[@]}
for ((i=0; i<$length2; i++ ))
do
   for ((j=$(( $i+1 )); j<$length2; j++ ))
   do
      if [ ${array3[i]} -gt ${array3[j]} ]
      then
         temp=${array3[i]}
         array3[$i]=${array3[j]}
         array3[$j]=$temp
      fi
   done
done

echo "singlet of winning percentage: " ${array1[@]}
echo "doublet cobination of winning percentage: " ${array2[@]}
echo "tripet combination of winning percentage: "${array3[@]}



