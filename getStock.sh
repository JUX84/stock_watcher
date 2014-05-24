#!/bin/sh

dir=`dirname "$0"`
if [ "$dir" = "." ]; then
	dir=$PWD
fi
for i in `cat $dir/Stocks.dat`
do
	wget google.com/finance?q=$i -O $dir/$i
	d=`date "+%s"`
	p=`sed -n "/itemprop=\"price\"/,/>/p" $dir/$i | grep content | sed "s/ \+//g" | sed 's/.*"\(.*\)"[^"]*$/\1/'`
	echo $d"_"$p  >> $dir/data/$i
	rm $dir/$i
done
