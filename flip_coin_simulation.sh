#!/bin/bash -x
HEAD=1
TAIL=0
headc=0
tailc=0
declare -A dic
for ((i=0;i<20;i++))
do
var=$((RANDOM%2))
if [ $var -eq $HEAD ]
then 
	((headc++))
else
	((tailc++))

fi
done
dic[head]=$headc
dic[tail]=$tailc
echo ${dic[@]}
hper=`echo $headc | awk '{print ($1/20)*100}'`
echo "the head percentage is $hper%"
tper=`echo $tailc | awk '{print ($1/20)*100}'`
echo "the tail percentage is $tper%"

