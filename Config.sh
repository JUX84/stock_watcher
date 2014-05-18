#!/bin/sh

echo ""
echo "========================================"
echo "Stock watcher - Projet L3 (DELMAS/MHIRI)"
echo "========================================"
echo ""
echo "Stock value update frequency: every "`crontab -l|grep "/home/stock_watcher/getStock.sh"|cut -f2 -d" "|cut -f2 -d"/"`" hour(s)"
echo "Chart update frequency: every "`crontab -l|grep "/home/stock_watcher/getChart.sh"|cut -f2 -d" "|cut -f2 -d"/"`" hour(s)"
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
	if [ $input == "yes" ]; then
		./addStock.sh
		break
	fi
	if [ $input == "no" ]; then
		break
	fi
done
echo ""
while true
do
	echo "Would you like to change the stock value update frequency ? (yes/no)"
	read input
	if [ $input == "yes" ]; then
		echo "How often would you like it to be ? (in hours)"
		read value
		./setStockFrequency.sh $value
		break
	fi
	if [ $input == "no" ]; then
		break
	fi
done
echo ""
while true
do
	echo "Would you like to change the chart update frequency ? (yes/no)"
	read input
	if [ $input == "yes" ]; then
		echo "How often would you like it to be ? (in hours)"
		read value
		./setChartFrequency.sh $value
		break
	fi
	if [ $input == "no" ]; then
		break
	fi
done
echo ""
echo "Thanks !"
