#!/bin/bash -x

declare -A flipcoinresults
counter=0;
echo "                                  "
echo "------------Greetings-------------"
headCount=0;
read -p "How many times you want to flip the coin " loopingtime

function flipCoin() {
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

flipCoin
echo "-----" $headCount
headPercent=$(( $headCount * 100 / $loopingtime ))
echo ${flipcoinresults[@]}
echo "percentage of getting head is" $headPercent

