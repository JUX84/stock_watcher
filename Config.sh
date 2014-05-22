#!/bin/sh

echo ""
echo "========================================"
echo "Stock watcher - Projet L3 (DELMAS/MHIRI)"
echo "========================================"
echo ""
freq=`crontab -l|grep "/home/stock_watcher/getStock.sh"`
min=`echo $freq|cut -f1 -d" "|cut -f2 -d "/"`
if [ "$min" != "" ]; then
	min=" $min"
fi
hour=`echo $freq|cut -f2 -d" "|cut -f2 -d "/"`
if [ "$hour" != "" ]; then
	hour=" $hour"
fi
day=`echo $freq|cut -f3 -d" "|cut -f2 -d "/"`
if [ "$day" != "" ]; then
	day=" $day"
fi
month=`echo $freq|cut -f4 -d" "|cut -f2 -d "/"`
if [ "$month" != "" ]; then
	month=" $month"
fi
echo "Stock value update frequency: every$min minute(s), every$hour hour(s), every$day day(s), every$month month(s)"
freq=`crontab -l|grep "/home/stock_watcher/getChart.sh"`
min=`echo $freq|cut -f1 -d" "|cut -f2 -d "/"`
if [ "$min" != "" ]; then
	min="$min "
fi
hour=`echo $freq|cut -f2 -d" "|cut -f2 -d "/"`
if [ "$hour" != "" ]; then
	hour="$hour "
fi
day=`echo $freq|cut -f3 -d" "|cut -f2 -d "/"`
if [ "$day" != "" ]; then
	day="$day "
fi
month=`echo $freq|cut -f4 -d" "|cut -f2 -d "/"`
if [ "$month" != "" ]; then
	month="$month "
fi
echo "Chart update frequency: every$min minute(s), every$hour hour(s), every$day day(s), every$month month(s)"
freq=`crontab -l|grep "/home/stock_watcher/BackUp.sh"`
min=`echo $freq|cut -f1 -d" "|cut -f2 -d "/"`
if [ "$min" != "" ]; then
	min="$min "
fi
hour=`echo $freq|cut -f2 -d" "|cut -f2 -d "/"`
if [ "$hour" != "" ]; then
	hour="$hour "
fi
day=`echo $freq|cut -f3 -d" "|cut -f2 -d "/"`
if [ "$day" != "" ]; then
	day="$day "
fi
month=`echo $freq|cut -f4 -d" "|cut -f2 -d "/"`
if [ "$month" != "" ]; then
	month="$month "
fi
echo "BackUp update frequency: every$min minute(s), every$hour hour(s), every$day day(s), every$month month(s)"
echo ""
echo "Here's a list of your followed stocks"
echo ""
for i in `cat Stocks.dat`
do
	echo "- "$i
done
echo ""
while true
do
	echo "Would you like to add stocks ? (yes/no)"
	read input
	if [ $input = "yes" ]; then
		./addStock.sh
		break
	fi
	if [ $input = "no" ]; then
		break
	fi
done
echo ""
echo "Example of frequencies:"
echo "2 d = two days"
echo "3 m = three minutes"
echo "1 h = every hour"
echo ""
while true
do
	echo "Would you like to change the stock value update frequency ? (yes/no)"
	read input
	if [ $input = "yes" ]; then
		echo "How often would you like it to be ?"
		while true
		do
			read value
			n=`echo $value|cut -f1 -d" "`
			t=`echo $value|cut -f2 -d" "`
			if [ "$n" == "" || "$t" == "" ]; then
				echo "Error, try again!"
			else
				break;
			fi
		done
		./setCron.sh $n $t getStock
		break
	fi
	if [ $input = "no" ]; then
		break
	fi
done
echo ""
while true
do
	echo "Would you like to change the chart update frequency ? (yes/no)"
	read input
	if [ $input = "yes" ]; then
		echo "How often would you like it to be ?"
		while true
		do
			read value
			n=`echo $value|cut -f1 -d" "`
			t=`echo $value|cut -f2 -d" "`
			if [ "$n" == "" || "$t" == "" ]; then
				echo "Error, try again!"
			else
				break;
			fi
		done
		./setCron.sh $n $t getChart
		break
	fi
	if [ $input = "no" ]; then
		break
	fi
done
echo ""
while true
do
	echo "Would you like to change the chart backup frequency ? (yes/no)"
	read input
	if [ $input = "yes" ]; then
		echo "How often would you like it to be ?"
		while true
		do
			read value
			n=`echo $value|cut -f1 -d" "`
			t=`echo $value|cut -f2 -d" "`
			if [ "$n" == "" || "$t" == "" ]; then
				echo "Error, try again!"
			else
				break;
			fi
		done
		echo "How long do you want to keep the charts ?"
		while true
		do
			read value
			n2=`echo $value|cut -f1 -d" "`
			t2=`echo $value|cut -f2 -d" "`
			if [ "$n2" == "" || "$t2" == "" ]; then
				echo "Error, try again!"
			else
				break;
			fi
		done
		./setCron.sh $n $t BackUp $n2 $t2
		break
	fi
if [ $input = "no" ]; then
		break
	fi
done
echo ""
echo "Thanks !"
