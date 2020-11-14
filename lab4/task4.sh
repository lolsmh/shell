#!/bin/bash

backupDir=//home/user/
restoreDir=//home/user/restore/

if [[ ! -d $restoreDir ]]
then
	mkdir $restoreDir
fi

currLatestBackup=$(find $backupDir"backup-"* -maxdepth 0 | sort -n | tail -n 1)"/"
for i in $(ls $currLatestBackup -1)
do
#	if [[ $(echo $i | grep -Eo "backup-[0-9]{4}-[0-9]{2}-[0-9]{2}") == "" ]]
#	then
		if [[ $(ls $currLatestBackup$i.* 2>/dev/null | grep -Eo "[0-9]{4}-[0-9]{2}-[0-9]{2}") == "" ]]
		then
			cp $currLatestBackup$i $restoreDir$i
		fi
#	fi
done

