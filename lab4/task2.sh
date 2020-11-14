#!/bin/bash

file=//home/user/lab4/$1

if [[ $# -ne 1 ]]
then
	echo "usage: ./`basename $0` file"
 	exit 1
fi

for i in $(grep -h "$file" //home/trash.log | awk '{print $2":"$5}')
do
	path=$(echo $i | awk -F ":" '{print $1}')
	backup=$(echo $i | awk -F ":" '{print $2}')
	if [[ $file == $path ]]
	then
		restore=//home/.trash/$backup
		if [[ -e $restore ]]
		then
			echo "Restore file $path?"
			read cmd
			if [[ $cmd == "yes" ]]
			then
				if [[ -d $(dirname $path) ]]
				then
					if [[ -e $path ]]
					then
						echo "File with name $file already exists."
						echo "Enter new one:"
						read newFileName
						ln $restore "$(dirname $path)/$newFileName"
					else
						ln $restore $path
					fi
				else
					echo "Directory $(dirname $path) doesn't exsit."
					ln $restore //home/$1
					echo "Backup was created at //home/$1"
				fi
				rm -R $restore
				grep -v $backup //home/trash.log > //home/temp.log
				mv //home/temp.log //home/trash.log
			else
				echo JOPA
			fi
		fi
	fi
done
