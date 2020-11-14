#!/bin/bash

rm text
(
for i in $(ls /proc | grep "[0-9]")
do
  printf "ProcessID = %d : Parent_ProcessID = " $i >> text
  grep "PPid" /proc/$i/status | awk '{print $2" :"}' | tr "\n" " " >> text
  x=$(grep "sum_exec_runtime" /proc/$i/sched | awk '{print $3}')
  y=$(grep "nr_switches" /proc/$i/sched | awk '{print $3}')
  printf "Average_Running_Time = %f\n" $(awk "BEGIN {print $x/$y}") >> text
done
) 2> /dev/null
sort -k 7 -r text | tail -n +4 | sort -k 7 -n > task4.txt

