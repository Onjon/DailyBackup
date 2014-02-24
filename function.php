<?php
/*
@Author Name : Onjon Shahadat Hossain
@Email : onjon_sh@yahoo.com

@Project Name : Database Backup
@Version : 1.0.1
@Release Date : 29th December, 2013
*/ 

// Off all Errors and Waring
error_reporting( 0 );

/* backup the db OR just a table */
function backup_tables( $host, $user, $pass, $name ) {
	
	$link = mysql_connect($host,$user,$pass);
	$con = mysql_select_db($name,$link);
	
	//get all of the tables
		$tables = array();
		$aa = mysql_query('SHOW TABLES');
		while( $a = mysql_fetch_row( $aa ) ) {
			$tables[] = $a[0];
		}
	
    $return = "";
    
    // Set Database Name Comment
    $return .= "/* DATABASE CREATE ".$name." */ \n\n" ;
    $return .= "/* CREATE DATABASE " . $name . "; */ \n" ;
    
	//cycle through
	foreach($tables as $table) {
        
        // Select All Column Name From Tables 
		$result = mysql_query('SELECT * FROM '.$table);
        
        // Get All Column
		$num_fields = mysql_num_fields($result);
		
        $return .= "/* CREATE TABLE '".$table."' */ \n" ;
        
        // Get Table SQL 
		$row2 = mysql_fetch_row(mysql_query('SHOW CREATE TABLE '.$table));
		$return.= "\n".$row2[1].";\n\n";
		
        // Print all values 
		for ($i = 0; $i < $num_fields; $i++) {
			while($row = mysql_fetch_row($result)) {
				$return.= 'INSERT INTO '.$table.' VALUES(';
                
				for($j=0; $j<$num_fields; $j++) {
					$row[$j] = addslashes($row[$j]);
					$row[$j] = str_replace("\n","\\n",$row[$j]);
					if (isset($row[$j])) { $return.= '"'.$row[$j].'"' ; } else { $return.= '""'; }
					if ($j<($num_fields-1)) { $return.= ','; }
				}
				$return .= ");\n";
			}
		}
		$return .="\n\n\n";
	}
	
	//save file
    $today_date = date( 'd-m-y' );
	$handle = fopen( 'db-backup'.'@'. $name . '@' . $today_date .'.sql','w' ); // Open the File or Not Exists then Create new File
	fwrite($handle,$return); // Write in file
	fclose($handle); // Close The File 
}

?>