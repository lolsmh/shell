#!/bin/bash

fileName=$1 key=$2

grep "\\($key\\)" $fileName > deleted.list
sed "/\\($key\\)/d" $fileName > new.txt
