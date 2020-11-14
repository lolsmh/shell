#!/bin/bash
(
cmd='+'
res=1

(tail -n 0 -f 5.in) | while true;
do
	read line
	case $line in
	'+')
		cmd='+'
		echo "adding.."
	;;
	m)
		cmd='*'
		echo "multiplaying.."
	;;
	[0-9]*)
		if [[ $cmd == '+' ]]
			then let res=$res+$line
			else let res=$res\*$line
		fi
		echo "$cmd $line = $res"
	;;
	QUIT)
		exit
	;;
	*)
	echo "error"
	esac
done
) 2> /dev/null
