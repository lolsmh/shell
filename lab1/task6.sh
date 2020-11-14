#!/bin/bash

grep "\\(WW\\)" //var/log/anaconda/X.log | sed -E "s/\\(II\\)/Warning: /" > full.log
grep "\\(II\\)" //var/log/anaconda/X.log | sed -E "s/\\(WW\\)/Information: /" >> full.log

