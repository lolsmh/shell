#!/bin/bash

grep -E -s -h -o "[a-zA-Z0-9_.]+@[a-zA-Z0-9_]+(\\.[a-zA-Z]+)+" //etc/* |
echo $(awk 'NR > 1{print line", "}{line=$0;}END{print $0""}') > emails.lst
