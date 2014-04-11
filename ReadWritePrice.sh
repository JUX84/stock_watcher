#!/bin/sh

if test $# -ne 0
then
	until [ $# -eq 0 ]
		do
			echo $1>>MesEntreprises.txt;
			shift
		done
	for i in `cat MesEntreprises.txt`
	do 
			wget  google.com/finance?q=$i
			sed -n "/itemprop=\"price\"/,/>/p" finance\?q\=$i | grep content | sed "s/ \+//g" | sed 's/.*"\(.*\)"[^"]*$/\1/' >> donnees/$i
			rm finance\?q\=$i
	done
	rm MesEntreprises.txt
else
	echo "Donnez vos entreprise en arguments s'il vous plait !"
fi
