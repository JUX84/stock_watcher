for i in `cat test.txt`
do
	for j in `cat donnees/$i`
	do
		s=`echo $j|cut -f1 -d"_"`
		d=`date --date\="@$s" "+%d/%m/%Y,%H:%M:%S"`
		v=`echo $j|cut -f2 -d"_"`
		echo "$d $v" >> data.dat
	done
	gnuplot script.plt
	d=`date "+%s"`
	mv data.png graph/$i/$i"_"$d.png
	rm graph/$i/$i.png
	ln -s graph/$i/$i"_"$d.png graph/$i/$i.png
	rm data.dat
done
