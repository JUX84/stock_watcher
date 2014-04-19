set terminal png size 1200,800
set output 'data.png'
set timefmt x "%d/%m/%Y,%H:%M:%S"
set xdata time
set format x "%d/%m/%Y"
set grid nopolar
set grid xtics nomxtics ytics nomytics noztics nomztics \
 nox2tics nomx2tics noy2tics nomy2tics nocbtics nomcbtics
set grid layerdefault   linetype 0 linewidth 1.000,  linetype 0 linewidth 1.000
set key inside left top vertical Right noreverse enhanced autotitles nobox
set style increment default
set style histogram clustered gap 2 title  offset character 0, 0, 0
set style data fsteps
set xlabel "Date\nTime" 
set ylabel "Value\n" 
set yrange [ 0.00000 : * ] noreverse nowriteback
plot 'data.dat' using 1:2 with linespoints
