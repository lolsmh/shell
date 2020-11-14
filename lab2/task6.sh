#!/bin/bash
(
let max=0
for i in $(ls /proc | grep "[0-9]")
do
   tempMax=$(awk '$1 == "VmSize:" {print $2}' /proc/$i/status)
	if [[ "$tempMax" -gt "$max" ]];
	then
	max=$tempMax
	fi
done
echo "Max: $max"
top -o VIRT | head -8 | tail -1 | awk '{print "Top: "$6}'
) 2> /dev/null
