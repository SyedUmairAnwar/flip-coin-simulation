#!/bin/bash -x
HEAD=1
TAIL=0

#for single count
headc=0
tailc=0

#for double count
headhead=0
tailtail=0
headtail=0
tailhead=0

#for triple count
hhh=0
hht=0
hth=0
htt=0
thh=0
tht=0
tth=0
ttt=0

declare -A dic0
declare -A dic1
declare -A dic
#for array for shorting put all winning percentage in array
j=0

for ((i=0;i<20;i++))
do
var=$((RANDOM%2))
var1=$((RANDOM%2))
var2=$((RANDOM%2))
double=$var$var1
triple=$var$var1$var2

#single combination
if [ $var -eq $HEAD ]
then
	((headc++))
else
	((tailc++))
fi

#double combination
case $double in
	$HEAD$HEAD)
			((headhead++));;
	$HEAD$TAIL)
			((headtail++));;
	$TAIL$HEAD)
			((tailhead++));;
	$TAIL$TAIL)
			((tailtail++));;
esac

#triple combination
case $triple in
	$HEAD$HEAD$HEAD) ((hhh++));;
	$HEAD$HEAD$TAIL) ((hht++));;
	$HEAD$TAIL$HEAD) ((hth++));;
	$HEAD$TAIL$TAIL) ((htt++));;
	$TAIL$HEAD$HEAD) ((thh++));;
	$TAIL$HEAD$TAIL) ((tht++));;
	$TAIL$TAIL$HEAD) ((tth++));;
	$TAIL$TAIL$TAIL) ((ttt++));;
esac

done
dic0[H]=$headc
dic0[T]=$tailc
echo ${dic0[@]}
echo ${!dic0[@]}
perh=`echo $headc | awk '{print ($1/20)*100}'`
echo "the HEAD percentage is $perh%"
arr[j]=$perh
((j++))
pert=`echo $tailc | awk '{print ($1/20)*100}'`
echo "the TAIL percentage is $pert%"
arr[j]=$pert
((j++))



dic[HT]=$headtail
dic[TT]=$tailtail
dic[TH]=$tailhead
dic[HH]=$headhead
echo ${dic[@]}
echo ${!dic[@]}
hper=`echo $headhead | awk '{print ($1/20)*100}'`
echo "the HH percentage is $hper%"
arr[j]=$hper
((j++))
tper=`echo $tailtail | awk '{print ($1/20)*100}'`
echo "the TT percentage is $tper%"
arr[j]=$tper
((j++))
thper=`echo $tailhead | awk '{print ($1/20)*100}'`
echo "the TH percentage is $thper%"
arr[j]=$thper
((j++))
htper=`echo $headtail | awk '{print ($1/20)*100}'`
echo "the HT percentage is $htper%"
arr[j]=$htper
((j++))

dic1[HHH]=$hhh
dic1[HHT]=$hht
dic1[HTH]=$hth
dic1[HTT]=$htt
dic1[THH]=$thh
dic1[THT]=$tht
dic1[TTH]=$tth
dic1[TTT]=$ttt
echo ${dic1[@]}
echo ${!dic1[@]}
hhh=`echo $hhh | awk '{print ($1/20)*100}'`
echo "the HHH percentage is $hhh%"
arr[j]=$hhh
((j++))
hht=`echo $hht | awk '{print ($1/20)*100}'`
echo "the HHT percentage is $hht%"
arr[j]=$hht
((j++))
hth=`echo $hth | awk '{print ($1/20)*100}'`
echo "the HTH percentage is $hth%"
arr[j]=$hth
((j++))
htt=`echo $htt | awk '{print ($1/20)*100}'`
echo "the HTH percentage is $htt%"
arr[j]=$htt
((j++))
thh=`echo $thh | awk '{print ($1/20)*100}'`
echo "the THH percentage is $thh%"
arr[j]=$thh
((j++))
tht=`echo $tht | awk '{print ($1/20)*100}'`
echo "the THT percentage is $tht%"
arr[j]=$tht
((j++))
tth=`echo $tth | awk '{print ($1/20)*100}'`
echo "the TTH percentage is $tth%"
arr[j]=$tth
((j++))
ttt=`echo $ttt | awk '{print ($1/20)*100}'`
echo "the TTT percentage is $ttt%"
arr[j]=$ttt
((j++))

echo ${arr[@]}
#shorting starts
temp=0
for ((i=0;i<${#arr[@]};i++))
do
	for ((j=0;j<$((${#arr[@]}-1-$i));j++))
	do
		if [ ${arr[j]} -lt ${arr[j+1]} ]
		then
			temp=${arr[j]}
			arr[j]=${arr[j+1]}
			arr[j+1]=$temp
		fi
	done
done
echo ${arr[@]}
echo ${!arr[@]}

if [ $perh -gt $pert ]
then echo "H  wins"
elif [ $pert -gt $perh ]
then echo "T wins"
else echo "both H&T wins"
fi
