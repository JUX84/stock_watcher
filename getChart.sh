#!/bin/sh

dir=`dirname "$0"`
for i in `cat $dir/Stocks.dat`
do
	for j in `cat $dir/data/$i`
	do
		s=`echo $j|cut -f1 -d"_"`
		d=`date --date\="@$s" "+%d/%m/%Y,%H:%M:%S"`
		v=`echo $j|cut -f2 -d"_"`
		echo "$d $v" >> data.dat
	done
	gnuplot $dir/script.plt
	d=`date "+%s"`
	if [ ! -d $dir/chart/$i ]; then
		mkdir $dir/chart/$i
	fi
	mv data.png $dir/chart/$i/$i"_"$d.png
	rm $dir/chart/$i/$i.png
	ln -s $i"_"$d.png $dir/chart/$i/$i.png
	rm data.dat
done
