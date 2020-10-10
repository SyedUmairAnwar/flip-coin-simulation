#!/bin/bash -x
HEAD=1
TAIL=0
headhead=0
tailtail=0
headtail=0
tailhead=0
hhh=0
hht=0
hth=0
htt=0
thh=0
tht=0
tth=0
ttt=0
declare -A dic1
declare -A dic
for ((i=0;i<20;i++))
do
var=$((RANDOM%2))
var1=$((RANDOM%2))
var2=$((RANDOM%2))
double=$var$var1
triple=$var$var1$var2
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
hht=`echo $hht | awk '{print ($1/20)*100}'`
echo "the HHT percentage is $hht%"
hth=`echo $hth | awk '{print ($1/20)*100}'`
echo "the HTH percentage is $hth%"
htt=`echo $htt | awk '{print ($1/20)*100}'`
echo "the HTH percentage is $htt%"
thh=`echo $thh | awk '{print ($1/20)*100}'`
echo "the THH percentage is $thh%"
tht=`echo $tht | awk '{print ($1/20)*100}'`
echo "the THT percentage is $tht%"
tth=`echo $tth | awk '{print ($1/20)*100}'`
echo "the TTH percentage is $tth%"
ttt=`echo $ttt | awk '{print ($1/20)*100}'`
echo "the TTT percentage is $ttt%"







