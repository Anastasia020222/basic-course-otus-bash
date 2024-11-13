#/bin/bash

	x=$1
	y=$2

	let y=$x/2
	mult=1
	sum=0

	for ((i=1; i<=y; i++))
	do
		let mult=$mult*$i
	done

	if [[ $(( $x%2 )) -ne 0 ]]; then
		let y=$y+1;
	fi

	for ((j=x; j>y; j--))
	do
		let sum=$sum+$j
	done
	echo "mult: $mult"
	echo "sum: $sum"