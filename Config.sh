#!/bin/sh

echo ""
echo "========================================"
echo "Stock watcher - Projet L3 (DELMAS/MHIRI)"
echo "========================================"
echo ""
freq=`crontab -l|grep "/home/stock_watcher/getStock.sh"`
min=`echo "$freq"|cut -f1 -d" "`
m=`echo "$min"|cut -f2 -d"/"`
if [ "$min" != "$m" ]; then
	min=" $m"
else
	min=""
fi
hour=`echo "$freq"|cut -f2 -d" "`
h=`echo "$hour"|cut -f2 -d"/"`
if [ "$hour" != "$h" ]; then
	hour=" $h"
else
	hour=""
fi
day=`echo "$freq"|cut -f3 -d" "`
d=`echo "$day"|cut -f2 -d"/"`
if [ "$day" != "$d" ]; then
	day=" $d"
else
	day=""
fi
echo "Stock value update frequency: every$min minute(s), every$hour hour(s), every$day day(s)"
freq=`crontab -l|grep "/home/stock_watcher/getChart.sh"`
min=`echo "$freq"|cut -f1 -d" "`
m=`echo "$min"|cut -f2 -d"/"`
if [ "$min" != "$m" ]; then
	min=" $m"
else
	min=""
fi
hour=`echo "$freq"|cut -f2 -d" "`
h=`echo "$hour"|cut -f2 -d"/"`
if [ "$hour" != "$h" ]; then
	hour=" $h"
else
	hour=""
fi
day=`echo "$freq"|cut -f3 -d" "`
d=`echo "$day"|cut -f2 -d"/"`
if [ "$day" != "$d" ]; then
	day=" $d"
else
	day=""
fi
echo "Chart update frequency: every$min minute(s), every$hour hour(s), every$day day(s)"
freq=`crontab -l|grep "/home/stock_watcher/Backup.sh"`
min=`echo "$freq"|cut -f1 -d" "`
m=`echo "$min"|cut -f2 -d"/"`
if [ "$min" != "$m" ]; then
	min=" $m"
else
	min=""
fi
hour=`echo "$freq"|cut -f2 -d" "`
h=`echo "$hour"|cut -f2 -d"/"`
if [ "$hour" != "$h" ]; then
	hour=" $h"
else
	hour=""
fi
day=`echo "$freq"|cut -f3 -d" "`
d=`echo "$day"|cut -f2 -d"/"`
if [ "$day" != "$d" ]; then
	day=" $d"
else
	day=""
fi
n=`echo "$freq"|cut -f7 -d" "`
t=`echo "$freq"|cut -f8 -d" "`
if [ "$t" = "m" ]; then
	t="minute(s)"
fi
if [ "$t" = "h" ]; then
	t="hour(s)"
fi
if [ "$t" = "d" ]; then
	t="day(s)"
fi
echo "Backup update frequency: every$min minute(s), every$hour hour(s), every$day day(s) (Keeps the charts $n $t)"
freq=`crontab -l|grep "/home/stock_watcher/Alert.sh"`
percent=`echo "$freq"|cut -f7 -d" "`
mail=`echo "$freq"|cut -f8 -d" "`
echo "Alert if drop by $percent %"
echo "Mail: $mail"
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
			if [ "$n" = "$t" ]; then
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
			if [ "$n" = "$t" ]; then
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
			if [ "$n" = "$t" ]; then
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
			if [ "$n2" = "$t2" ]; then
				echo "Error, try again!"
			else
				break;
			fi
		done
		./setCron.sh $n $t Backup $n2 $t2
		break
	fi
	if [ $input = "no" ]; then
		break
	fi
done
echo ""
while true
do
	echo "Would you like to be alerted by mail if a stock value drops ? (yes/no)"
	read input
	if [ $input = "yes" ]; then
		echo "When to alert ? (Percentage, value between 0 and 100)"
		while true
		do
			read percent
			if [ $percent -lt 0 ] && [ $percent -gt 100 ]; then
				echo "Error, try again!"
			else
				break;
			fi
		done
		echo "What is your e-mail ?"
		read mail
		freq=`crontab -l|grep "/home/stock_watcher/getStock.sh"`
		min=`echo "$freq"|cut -f1 -d" "`
		m=`echo "$min"|cut -f2 -d "/"`
		if [ "$min" != "$m" ]; then
			n=$m
			t="m"
		fi
		hour=`echo "$freq"|cut -f2 -d" "`
		h=`echo "$hour"|cut -f2 -d"/"`
		if [ "$hour" != "$h" ]; then
			n=$h
			t="h"
		fi
		day=`echo "$freq"|cut -f3 -d" "`
		d=`echo "$day"|cut -f2 -d"/"`
		if [ "$day" != "$d" ]; then
			n=$d
			t="d"
		fi
		./setCron.sh $n $t Alert $percent $mail
		break
	fi
	if [ $input = "no" ]; then
		break
	fi
done
echo ""
echo "Thanks !"
