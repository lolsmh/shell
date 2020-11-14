#!/bin/bash

mkdir ~/test && {
	echo "catalog test was created successfuly" >> ~/report.txt $$
	touch ~/test/$(date '+%d.%m.%y_%H:%M').txt
}
ping -c 1 www.net_nikogo.ru || echo "$(date '+%d.%m.%y_%H:%M') error pinging www.net_nikogo.ru" >> ~/report.txt
