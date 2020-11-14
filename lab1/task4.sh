#!/bin/bash

if [[ $HOME == $PWD ]]
then echo $HOME exit 0
else echo "ERROR: DIRECTORY IS NOT HOME" exit 1
fi
