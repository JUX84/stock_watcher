#!/bin/sh
rm donnees/*~
rm ShowData.html
rm ShowData.css
touch ShowData.html
touch ShowData.css

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
				for i in donnees/*
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
				
				for i in graph/*
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

echo 'body{background-color: #00052F;}'>>ShowData.css
echo '@font-face { font-family : "Horror"; src: local("Horror"), url(polices/Hill_House.ttf) format(''truetype'');}'>>ShowData.css
echo 'p, h3, h2, a{font-family: Horror;	text-transform: uppercase;}'>>ShowData.css
echo 'h1{font-family: Horror;font-size: 40px;text-transform: uppercase;}'>>ShowData.css
echo '#titre_menu{	font-family: Horror;font-size: 20px; text-transform: uppercase; display: inline;text-decoration: none;color: black;}'>>ShowData.css
echo '#presentation{	background-color: #FCFEE1;	position: relative;	margin-top: 2%;	width: 50%;	margin-left: 5%;	margin-right: 5%;	float: left; 	 z-index=25;}'>>ShowData.css
echo '#div1{		background-color: #FCFEE1;	margin-left: 5%;    margin-right: 5%;    margin-top: 3%;    width: 90%;    height:auto;    position:absolute;	border-radius:100px 50px 50px 50px;	z-index=8;}'>>ShowData.css
echo '#gallerie{background-color:#FCFEE1;margin-left: 5%; margin-right: 5%;    width: 90%;    height:auto;    position:relative;     float:left;    z-index=6;}'>>ShowData.css
echo '#bigphoto{	width: 100%;	height: 100%;	margin-left: auto;       margin-right: auto;}.s1{	margin-right: 5%;	text-decoration: none;	color: black;	}'>>ShowData.css
echo '.s1bis{	margin-right: 5%;	color: red;	text-decoration: none;}'>>ShowData.css
echo '.s2{	margin-right: 5%;	text-decoration: none;}'>>ShowData.css
echo '.s2bis{	margin-right: 5%;	color: red;	text-decoration: none;}'>>ShowData.css
echo '.s3bis{	margin-right: 5%;	color: red;	text-decoration:none;}'>>ShowData.css
echo 'figure{	background-color: #FCFEE1;	/*box-shadow: 0 3px 10px ;*/	width: 320px;	margin: 5px 10px 0px 20px;	background: #FCFEE1;	border: 10px solid white;	-webkit-box-shadow: 0 3px 10px #ccc;	-moz-box-shadow: 0 3px 10px #ccc;	-webkit-transform: rotate(0);	-moz-transform: rotate(0);	-webkit-transition: all 0.7s ease;	-moz-transition: all 1s ease;	position: relative;}'>>ShowData.css
echo 'figcaption{	background-color: #FCFEE1;	text-align: center;	display: block;	font-size: 12px;	font-style: italic;}'>>ShowData.css
echo 'img{	margin: 0px 0px -15px 0px;	border: 10px solid #FCFEE1;	}'>>ShowData.css
echo 'td{	vertical-align:middle;}'>>ShowData.css
echo 'tr{	box-shadow: 8px 8px 12px;}'>>ShowData.css
echo 'table{	background-color: #FFF7D5;	box-shadow: 8px 8px 12px;	border-collapse:separate;}'>>ShowData.css
echo 'a{	text-decoration: none;	color: brown;}a:hover{	text-decoration: none;	color: red;}'>>ShowData.css
echo 'figure:hover{text-decoration:none;	border: 10px solid black;  -webkit-transform: rotate(-10deg) scale(1.2); -moz-transform: rotate(10deg) scale(1.2); -webkit-box-shadow: 0 3px 10px #666; -moz-box-shadow: 0 3px 10px #666;z-index: 24;}'>>ShowData.css
echo 'figure:focus{text-decoration:none;	border: 10px solid black;  outline: none;  -webkit-transform: rotate(0) scale(4); -moz-transform: rotate(0) scale(4);   -webkit-box-shadow: 0 3px 10px #666; -moz-box-shadow: 0 3px 10px #666;  z-index: 25;}'>>ShowData.css

firefox ShowData.html

