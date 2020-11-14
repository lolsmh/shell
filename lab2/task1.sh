#!/bin/bash

ps -U root -o pid,command | tail -n +2 | awk '{print $1 " : " $2}' > task1.txt
echo "$(wc -l task1.txt | awk '{print $1}')" | cat - task1.txt > temp && mv temp task1.txt
