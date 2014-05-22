#!/bin/sh

cmp=1
for i in data/*
do
	nb=`wc -l $i | cut -d" " -f1`
	nb2=`expr $nb - 1`
	for j in `cat $i`
	do
		if [ $cmp = $nb ]
		then 
			after=`echo $j | cut -d"_" -f2`
		elif [ $cmp = $nb2 ]
		then
			before=`echo $j | cut -d"_" -f2`
		fi
		cmp=`expr $cmp + 1`
	done
	var1=`echo "$1*0.01" |bc -l`
	var2=`echo "$before*$var1" |bc -l`
	result=`echo "$before-$var2" |bc -l`
	compare=`echo "$after<=$result" |bc -l`
	if [ $compare -eq 1 ]; then
		echo "Stock value drop - "$i | mail -s "The stock value $i has dropped by $1 \%" $2
	fi
done	
