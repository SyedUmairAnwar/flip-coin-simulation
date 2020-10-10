#!/bin/bash -x
HEAD=1
TAIL=0
headhead=0
tailtail=0
headtail=0
tailhead=0
declare -A dic
for ((i=0;i<20;i++))
do
var=$((RANDOM%2))
var1=$((RANDOM%2))
double=$var$var1
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
done
dic[HT]=$headtail
dic[TT]=$tailtail
dic[TH]=$tailhead
dic[HH]=$headhead
echo ${dic[@]}
echo ${!dic[@]}
hper=`echo $headhead | awk '{print ($1/20)*100}'`
echo "the HH percentage is $hper%"
tper=`echo $tailtail | awk '{print ($1/20)*100}'`
echo "the TT percentage is $tper%"
thper=`echo $tailhead | awk '{print ($1/20)*100}'`
echo "the TH percentage is $thper%"
htper=`echo $headtail | awk '{print ($1/20)*100}'`
echo "the HT percentage is $htper%"



