#!/bin/sh

crontab -l|grep -v "$PWD/getChart.sh" >> .tmp
crontab -r 
echo "* */$1 * * * $PWD/getChart.sh" >> .tmp
crontab .tmp
rm .tmp
