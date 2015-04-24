<?php


mysql_connect('localhost','root',''); // MAMP defaults
mysql_select_db('jquery');
//$file=  fopen('csv/dijak.csv', 'r') or die("Unable to open file!");;



$handle = fopen('csv/dijak.csv', 'r') or die("Unable to open file!"); 
    while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
            
         $import="INSERT into dijak(id_D,ime,priimek) values('$data[0]','$data[1]','$data[2]') ON DUPLICATE KEY UPDATE id_d='$data[0]',ime='$data[1]',priimek='$data[2]';";


 
        mysql_query($import) or die(mysql_error());
            
    }
 

    fclose($handle);

 
    print "Import done";

  