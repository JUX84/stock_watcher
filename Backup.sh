#!/bin/sh

dir=`dirname "$0"`
day=`date +%d`
month=`date +%m`
year=`date +%Y`
hour=`date +%H`
min=`date +%M`
m=0
h=0
d=0
M=0
if [ "$2" == "m" ]; then
	$m=$1
fi
if [ "$2" == "h" ]; then
	$h=$1
fi
if [ "$2" == "d" ]; then
	$d=$1
fi
if [ "$2" == "M" ]; then
	$M=$1
fi
min=`expr $min - $m`
hour=`expr $hour - $h`
day=`expr $day - $d`
month=`expr $month - $M`
for i in `ls chart`
do
	tar cpzf $dir/save/$i.tar $dir/chart/$i/*.png --newer "$year-$month-$day $hour:$min:00"
done
