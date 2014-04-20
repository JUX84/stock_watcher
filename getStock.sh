#!/bin/sh

if test $# -ne 0
then
	until [ $# -eq 0 ]
	do
		echo $1>>.Stocks.dat;
		shift
	done
	for i in `cat .Stocks.dat`
	do
		wget google.com/finance?q=$i
		d=`date "+%s"`
		p=`sed -n "/itemprop=\"price\"/,/>/p" finance\?q\=$i | grep content | sed "s/ \+//g" | sed 's/.*"\(.*\)"[^"]*$/\1/'`
		echo $d"_"$p  >> data/$i
		rm finance\?q\=$i
	done
		rm .Stocks.dat
	else
		echo "Donnez vos entreprises en arguments s'il vous plait !"
fi
