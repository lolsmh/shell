#!/bin/bash

echo "1. OPEN NANO REDACTOR"
echo "2. OPEN VI REDACTOR"
echo "3. OPEN LINKS"
echo "4. EXIT"

let cmd

read "cmd"

case $cmd in
1)
nano
;;
2)
vi
;;
3)
links
;;
4)
exit 0
;;
esac

