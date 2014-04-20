for i in `cat Stocks.dat`
do
	for j in `cat data/$i`
	do
		s=`echo $j|cut -f1 -d"_"`
		d=`date --date\="@$s" "+%d/%m/%Y,%H:%M:%S"`
		v=`echo $j|cut -f2 -d"_"`
		echo "$d $v" >> data.dat
	done
	gnuplot script.plt
	d=`date "+%s"`
	mv data.png chart/$i/$i"_"$d.png
	rm chart/$i/$i.png
	ln -s $i"_"$d.png chart/$i/$i.png
	rm data.dat
done
