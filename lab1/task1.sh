#!/bin/bash

let x=$1 y=$2 z=$3 max

if ((x > y))
  then max=$x
  else max=$y
fi
if ((max > z))
  then echo $max
  else echo $z
fi
