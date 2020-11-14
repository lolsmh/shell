#!/bin/bash

echo "+" > 5.in

while true; do
	read line
	if [[ $line == "QUIT" ]]
		then echo $line >> 5.in
		exit
	fi
	if [[ $line != '*' ]]
		then echo $line >> 5.in
		else echo 'm' >> 5.in
	fi
done
