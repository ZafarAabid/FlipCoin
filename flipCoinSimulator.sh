#! /bin/bash


echo "                                  "
echo "------------Greetings-------------"

randomCheck=$(( RANDOM % 2 ))

	if [ $randomCheck -eq 1 ]
	then
		echo "It's Head"
	else
		echo "It's Tail"
	fi
