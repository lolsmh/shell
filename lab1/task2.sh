#!/bin/bash

let curr buff

while [ 1 ]
do
read "curr"
if [[ $curr == "q" ]]
then break
else buff+=$curr
fi
done

echo $buff
