#!/bin/sh

dir=`dirname "$0"`
date=`date +%s`
if [ "$2" = "m" ]; then
	back=`expr $1 \* 60`
	date=`expr $date - $back`
fi
if [ "$2" = "h" ]; then
	back=`expr $1 \* 1440`
	date=`expr $date - $back`
fi
if [ "$2" = "d" ]; then
	back=`expr $1 \* 86400`
	date=`expr $date - $back`
fi
day=`date --date="@$date" +%d`
month=`date --date="@$date" +%m`
year=`date --date="@$date" +%Y`
hour=`date --date="@$date" +%H`
min=`date --date="@$date" +%M`
for i in `ls $dir/chart`
do
	name=`echo $i|sed "s/:/_/g"`
	cd $dir/chart/$i
	tar cpzf $dir/backup/$name.tar.gz *.png --exclude="$i.png" --newer "$year-$month-$day $hour:$min:00"
done
