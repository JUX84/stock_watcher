#!/bin/sh

m=""
h=""
d=""
M=""
crontab -l|grep -v "$PWD/$3.sh" >> .tmp
crontab -r
if [ "$2" == "m" ]; then
	m="/$1"
fi
if [ "$2" == "h" ]; then
	h="/$1"
fi
if [ "$2" == "d" ]; then
	d="/$1"
fi
if [ "$2" == "M" ]; then
	M="/$1"
fi
args=""
if [ "$3" == "BackUp" ]; then
	args="$4 $5"
fi
echo "*$m *$h *$d *$M * $PWD/$3.sh $args" >> .tmp
crontab .tmp
rm .tmp
