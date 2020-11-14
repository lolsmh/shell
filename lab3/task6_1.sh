#!/bin/bash

echo $$ > mypid
i=1
cmd="+"

sigterm()
{
	echo "exit"
	exit
}

user1()
{
	cmd="+"
}

user2()
{
	cmd="*"
}

trap 'sigterm' SIGTERM
trap 'user1' USR1
trap 'user2' USR2

while true
do
	case $cmd in
	"+")
		let i=$i+2
		echo $i
	;;
	"*")
		let i=$i*2
		echo $i
	;;
	esac
sleep 2
done
