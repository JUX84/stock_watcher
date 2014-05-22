#!/bin/sh

pourcent=50
cmp=1
for i in data/*
	do
		nb=`wc -l $i | cut -d" " -f1`
		nb2=`expr $nb - 1`
		for j in `cat $i`
			do
				if [ $cmp = $nb ]
				then 
					after=`echo $j | cut -d"_" -f2`
				elif [ $cmp = $nb2 ]
				then
					before=`echo $j | cut -d"_" -f2`
				fi
				cmp=`expr $cmp + 1`
			done
		var1=`echo "$pourcent*0.01" |bc -l`
		var2=`echo "$before*$var1" |bc -l`
		result=`echo "$before-$var2" |bc -l`
		after=`echo "$after*1.0" |bc -l`
		compare=`echo "$after<=$result" |bc -l`
		if [ $compare -eq 1 ]
		then 
			echo "Alert entreprise "$i | mail -s "The price of the entreprise called "$i" has fallen more than "$pourcent truc@hotmail.fr
		fi
	done	
