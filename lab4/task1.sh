#!/bin/bash

script=$1

case $script in
*\ *)
echo "ERROR: You can't use strings with spaces"
exit 1
;;
esac

if (( $# != 1 ))
then
	exit 1
fi

if [[ ! -d //home/.trash ]]
	then mkdir //home/.trash
fi

curr=$(date +%s%N)
if [[ ! -e $script ]]
then
	echo "ERROR: file doesn't exist"
	exit 1
fi

ln $script //home/.trash/$curr
rm -R $script

if [[ ! -e //home/trash.log ]]
	then touch //home/trash.log
fi

echo "Path: $PWD/$script Link Name: $curr" >> //home/trash.log
