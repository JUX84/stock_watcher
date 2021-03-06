#!/bin/sh

dir=`dirname "$0"`
if [ "$dir" = "." ]; then
	dir=$PWD
fi
while true
do
	echo "Insert a stock name such as: NASDAQ:GOOG, EPA:CO, ... (q to exit)"
	read stock
	if [ $stock = "q" ]; then
		exit;
	fi
	echo $stock >> $dir/Stocks.dat
done
