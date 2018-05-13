#!/bin/bash

nOneko=1000
randRevColor=true
minSpeed=10
maxSpeed=25

#functions
rand()
{
	echo $(( ${RANDOM} % $1 ))
}

# Opts

for (( i=0; i < ${nOneko}; i++ )); do

opts=""

	if [ $(rand 1) == 0 ]; then
		opts="${opts} -rv"
	fi

	if [ $minSpeed -lt $maxSpeed ]; then
		speed=$((  $(rand $(( ${maxSpeed} - ${minSpeed} )) ) + ${minSpeed} ))
		opts="${opts} -speed ${speed}"
	fi

	case $(rand 4) in
	0)
		opts="${opts} -neko"
	;;
	1)
		opts="${opts} -tora"
	;;
	2)
		opts="${opts} -dog"
	;;
	3)
		opts="${opts} -sakura"
	;;
	4)
		opts="${opts} -tomoyo"
	;;
	*)
		echo 'ERREUR'
	esac

	#echo "${opts}"
	oneko ${opts} &
done

