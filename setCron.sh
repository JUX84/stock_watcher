#!/bin/sh

m=""
h=""
d=""
M=""
crontab -l 2>&1|grep -v "$PWD/$3.sh"|grep -v "no crontab" >> .tmp
if [ "`cat .tmp`" != "" ]; then
	crontab -r 2>&1 > /dev/null
fi
if [ "$2" = "m" ]; then
	m="/$1"
fi
if [ "$2" = "h" ]; then
	h="/$1"
fi
if [ "$2" = "d" ]; then
	d="/$1"
fi
if [ "$2" = "M" ]; then
	M="/$1"
fi
args=""
if [ "$3" = "Backup" ] || [ "$3" = "Alert" ]; then
	args="$4 $5"
fi
echo "*$m *$h *$d *$M * $PWD/$3.sh $args" >> .tmp
crontab .tmp
rm .tmp
