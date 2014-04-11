#!/bin/sh

for i in `cat test.txt`
do
	for j in `cat donnees/$i`
	do
		s=`echo $j|cut -f1 -d":"`
		d=`date --date\="@$s" "+%d/%m/%Y %H:%M:%S"`
		v=`echo $j|cut -f2 -d":"`
		echo "$d,$v" >> data.csv
	done
	R -q -f script.R
	mv out.png graph/$i.png
	rm data.csv
done
