#!/bin/bash

rm task5.txt
for i in $(cat task4.txt | awk '{print $7}' | uniq)
  do
  let count=0 art=0 avg=0
  for j in $(grep "ProcessID = $i" task4.txt | awk '{print $11}')
    do
    art=$(bc<<<"$art + $i")
    let "count+=1"
    done
  let "avg=$art/count"
  grep "Parent_ProcessID = $i" task4.txt | sed "s/$/ : Average_Sleeping_Children_of_ParentID = $i is $avg/" >> task5.txt
done
