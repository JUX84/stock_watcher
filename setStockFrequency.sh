#!/bin/sh

crontab -l|grep -v "$PWD/getStock.sh" >> .tmp
crontab -r
echo "* */$1 * * * $PWD/getStock.sh" >> .tmp
crontab .tmp
rm .tmp
