#!/bin/sh

dir=`dirname "$0"`
if [ "$dir" = "." ]; then
	dir=$PWD
fi
for i in `ls $dir/data`
do
	before=`cat $dir/data/$i|tail -n2|head -n1|cut -f2 -d"_"`
	after=`cat $dir/data/$i|tail -n1|cut -f2 -d"_"`
	var1=`echo "$1*0.01"|bc -l`
	var2=`echo "$before*$var1"|bc -l`
	result=`echo "$before-$var2"|bc -l`
	cmp=`echo "$after<=$result"|bc -l`
	if [ $cmp -eq 1 ]; then
		echo "Stock value drop - "$i | mail -s "The stock value $i has dropped by $1 \%" $2
	fi
done	
