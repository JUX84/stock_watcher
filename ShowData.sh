#!/bin/sh

if [ -f ShowData.html ]; then
	rm ShowData.html
fi

echo '<!DOCTYPE html > '>>ShowData.html
echo '<html>'>>ShowData.html
echo '<head>'>>ShowData.html
echo '<link rel="stylesheet" type="text/css" href="ShowData.css">'>>ShowData.html
echo '</head>'>>ShowData.html
echo '<body>'>>ShowData.html	
echo '	<div id="div1" >'>>ShowData.html
echo '		<div id="presentation">'>>ShowData.html
echo '			<h1>'>>ShowData.html
echo '				MES ENTREPRISES'>>ShowData.html
echo '			</h1>'>>ShowData.html
echo '			<br>'>>ShowData.html
echo '		</div>'>>ShowData.html
echo '		<div id="gallerie">	'>>ShowData.html
				for i in data/*
				do
					echo '<p><font color="red">'$i'</font></p>'>>ShowData.html
					for j in `cat $i`
					do
						var1=`echo $j | cut -d"_" -f1`
						echo $var1
						var2=`echo $j | cut -d"_" -f2`
						echo $var2
						echo '<p>'`date --date\="@$var1" "+%d/%m/%Y,%H:%M:%S"` : $var2'</p>'>>ShowData.html
					done
				done	
				
				for i in chart/*
				do
					echo '<p><font color="red">'$i'</font></p><br><br>'>>ShowData.html
					for j in $i
					do
						echo '<figure tabindex="1" style="margin-left: 35%; margin-bottom: 2%;">'>>ShowData.html
						src=`basename $j`
						echo '<img src="'$j/$src'.png" alt="jump, matey"  width="300px" height="130px" align="center"/>'>>ShowData.html
						echo '<p align="center">'$src'</p>'>>ShowData.html
						echo '</figure><p> </p>'>>ShowData.html;
					done
				done		
echo '		</div>'>>ShowData.html
echo '	</div>'>>ShowData.html	
echo '</body>'>>ShowData.html
echo '</html>'>>ShowData.html

firefox ShowData.html
