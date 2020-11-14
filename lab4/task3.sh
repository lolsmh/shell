#!/bin/bash

backupDir=//home/user/
sourceDir=//home/user/source/
reportDir=//home/user/Backup-report
currDate=$(date +%F)
currDateSec=$(date --date=$currDate +%s)
dirIsCreated=false
lastBackupDir=$(ls $backupDir -1 | grep -E "backup-[0-9]{4}-[0-9]{2}-[0-9]{2}" | sort -r -k2 | head -1)
lastBackupSec=$(date --date=$(ls $backupDir | grep -Eo "backup-[0-9]{4}-[0-9]{2}-[0-9]{2}" | sort -r -k2 | head -1 | sed "s/^backup-//") +%s)
let dateDifference=($currDateSec\-$lastBackupSec)/60/60/24

if [[ $dateDifference -le 7 ]]
then
	currBackupDir=$backupDir$lastBackupDir"/"
	dirIsCreated=false
else
	mkdir $backupDir"backup-"$currDate
	currBackupDir=$backupDir"backup-"$currDate"/"
	dirIsCreated=true
fi

if $dirIsCreated
then
	echo "backup was created in $currBackupDir on date $currDate" >> $reportDir
	for i in $(ls $sourceDir -1)
	do
		if [[ ! -d $sourceDir$i ]]
		then
			echo "copied from $sourceDir$i to $currBackupDir$i"
			cp $sourceDir$i $currBackupDir$i
			echo $i >> $reportDir
		else
			echo "$i is a directory and it wasn't copied." >> $reportDir
		fi
	done
else
	echo "updating backup in directory $currBackupDir on date $currDate" >> $reportDir
	for i in $(ls $sourceDir -1)
	do
		if [[ ! -d $sourceDir$i ]]
		then
			currFile=$currBackupDir$i
			if [[ -f $currFile ]]
			then
				sourceSize=$(stat $sourceDir$i -c%s)
 				currSize=$(stat $currFile -c%s)
					if [[ $sourceSize != $currSize ]]
					then
						mv $currFile $currFile"."$currDate
						cp $sourceDir$i $currFile
						echo "File $i was updated. Old version in $i.$currDate" >> $reportDir
					fi
			else
				cp $sourceDir$i $currFile
				echo "New file $i copied" >> $reportDir
			fi
		else
			echo "$i is a directory and it wasn't copied" >> $reportDir
		fi
	done
fi
