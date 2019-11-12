#!/bin/bash 

declare -A dubletresults
declare -A tripletresults
counter=0;
echo "                                  "
echo "------------Greetings-------------"
headHead=0;
headTail=0;
tailHead=0;
tailTail=0;
TTT=0;
TTH=0;
THT=0;
THH=0;
HTT=0;
HTH=0;
HHT=0;
HHH=0;
read -p "How many times you want to flip the coin " loopingtime

function singletFlip() {
	for(( count=1; count <= $loopingtime; count++ ))
	do
	randomCheck=$(( RANDOM % 2 ))

	if [ $randomCheck -eq 1 ]
	then
		flipcoinresults[$count]=$randomCheck
		headCount=$(( $headCount + 1 ))
		echo "It's Head"
	else
		echo "It's Tail"
		flipcoinresults[$count]=$randomCheck
	fi
	done
}
function doubletFilp() {
	for(( count=1; count <= $loopingtime; count++ ))
	do
	randomCheck1=$(( RANDOM % 2 ))
	randomCheck2=$(( RANDOM % 2 ))
	if   	[[ $randomCheck1 -eq 1 ]] && [[ $randomCheck2 -eq 1 ]]
	then
		dubletresults[ $count ]=$randomCheck1"-"$randomCheck2
		headHead=$(( $headHead + 1 ))
		echo "H-H"

	elif 	[[ $randomCheck1 -eq 1 ]] && [[ $randomCheck2 -eq 0 ]]
	then	echo "H-T"
		dubletresults[$count]=$randomCheck1"-"$randomCheck2
		headTail=$(( $headTail + 1 ))

	elif 	[[ $randomCheck1 -eq 0 ]] && [[ $randomCheck2 -eq 1 ]]
	then	echo "T-H"
		dubletresults[$count]=$randomCheck1"-"$randomCheck2
		tailHead=$(( $tailHead + 1 ))

	elif 	[[ $randomCheck1 -eq 0 ]] && [[ $randomCheck2 -eq 0 ]]
	then	echo "T-T"
		dubletresults[$count]=$randomCheck1"-"$randomCheck2
		tailTail=$(( $tailTail + 1 ))
	fi
	done
}

function tripletFilp() {
	for(( count=1; count <= $loopingtime; count++ ))
	do
	randomCheck3=$(( RANDOM % 2 ))
	randomCheck4=$(( RANDOM % 2 ))
	randomCheck5=$(( RANDOM % 2 ))

	if   	[[ $randomCheck3 -eq 0 ]] && [[ $randomCheck4 -eq 0 ]] && [[ $randomCheck5 -eq 0 ]]
	then
		tripletresults[ $count ]=$randomCheck3$randomCheck4$randomCheck5
		TTT=$(( $TTT + 1 ))
		echo "TTT"

	elif 	[[ $randomCheck3 -eq 0 ]] && [[ $randomCheck4 -eq 0 ]]  && [[ $randomCheck5 -eq 1 ]]
	then	echo "TTH"
		tripletresults[$count]=$randomCheck3$randomCheck4$randomCheck5
		TTH=$(( $TTH + 1 ))

	elif 	[[ $randomCheck3 -eq 0 ]] && [[ $randomCheck4 -eq 1 ]] && [[ $randomCheck5 -eq 0 ]]
	then	echo "THT"
		tripletresults[$count]=$randomCheck3$randomCheck4$randomCheck5
		THT=$(( $THT + 1 ))

	elif 	[[ $randomCheck3 -eq 0 ]] && [[ $randomCheck4 -eq 1 ]] && [[ $randomCheck5 -eq 1 ]]
	then	echo "THH"
		tripletresults[$count]=$randomCheck3$randomCheck4$randomCheck5
		THH=$(( $THH + 1 ))

	elif 	[[ $randomCheck3 -eq 1 ]] && [[ $randomCheck4 -eq 0 ]] && [[ $randomCheck5 -eq 0 ]]
	then	echo "HTT"
		tripletresults[$count]=$randomCheck3$randomCheck4$randomCheck5
		HTT=$(( $HTT + 1 ))

	elif 	[[ $randomCheck3 -eq 1 ]] && [[ $randomCheck4 -eq 0 ]] && [[ $randomCheck5 -eq 1 ]]
	then	echo "HTH"
		tripletresults[$count]=$randomCheck3$randomCheck4$randomCheck5
		HTH=$(( $HTH + 1 ))

	elif 	[[ $randomCheck3 -eq 1 ]] && [[ $randomCheck4 -eq 1 ]] && [[ $randomCheck5 -eq 0 ]]
	then	echo "HHT"
		tripletresults[$count]=$randomCheck3$randomCheck4$randomCheck5
		HHT=$(( $HHT + 1 ))

	elif 	[[ $randomCheck3 -eq 1 ]] && [[ $randomCheck4 -eq 1 ]] && [[ $randomCheck5 -eq 1 ]]
	then	echo "HHH"
		tripletresults[$count]=$randomCheck3$randomCheck4$randomCheck5
		HHH=$(( $HHH + 1 ))
	fi
	done
}




#singletFlip

echo "-------------doublets------------"
doubletFilp
echo "--HH--" $headHead
echo "--HT--" $headTail
echo "--TH--" $tailHead
echo "--TT--" $tailTail
HHPercent=$(( $headHead * 100 / $loopingtime ))
TTPercent=$(( $tailTail * 100 / $loopingtime ))
HTPercent=$(( $headTail * 100 / $loopingtime ))
THPercent=$(( $tailHead * 100 / $loopingtime ))
echo "percentage of getting head-head is" $HHPercent
echo "percentage of getting head-tail is" $HTPercent
echo "percentage of getting tail-head is" $THPercent
echo "percentage of getting tail-tail is" $TTPercent

echo "-------------triplets------------"
tripletFilp
echo "--TTT--" $TTT
echo "--TTH--" $TTH
echo "--THT--" $THT
echo "--THH--" $THH
echo "--HTT--" $HTT
echo "--HTH--" $HTH
echo "--HHT--" $HHT
echo "--HHH--" $HHH
TTTPercent=$(( $TTT * 100 / $loopingtime ))
TTHPercent=$(( $TTH * 100 / $loopingtime ))
THTPercent=$(( $THT * 100 / $loopingtime ))
THHPercent=$(( $THH * 100 / $loopingtime ))
HTTPercent=$(( $HTT * 100 / $loopingtime ))
HTHPercent=$(( $HTH * 100 / $loopingtime ))
HHTpercent=$(( $HHT * 100 / $loopingtime ))
HHHPercent=$(( $HHH * 100 / $loopingtime ))
echo "percentage of getting tail-tail-tail is" $TTTPercent
echo "percentage of getting tail-tail-head is" $TTHPercent
echo "percentage of getting tail-head-tail is" $THTPercent
echo "percentage of getting tail-head-head is" $THHPercent
echo "percentage of getting head-tail-tail is" $HTTPercent
echo "percentage of getting head-tail-head is" $HTHPercent
echo "percentage of getting head-head-tail is" $HHTPercent
echo "percentage of getting head-head-head is" $HHHPercent



echo ${dubletresults[@]}
echo ${tripletresults[@]}

sorted=$( printf "%s\n" ${tripletresults[@]} | sort -nr )

echo $sorted
