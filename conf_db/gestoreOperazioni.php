<?php
	include 'functions.php';
	if(isset($_GET)) {
    	$ris="";
    	if($_GET["op"]=="scriviLetture"){
			$tipo=mysql_real_escape_string($_GET["tipo"]);
			$cifre=mysql_real_escape_string($_GET["cifre"]);	
            $data=mysql_real_escape_string($_GET["data"]);	
			$ris=scriviLetture($tipo,$cifre,$data);						
        }
        else if($_GET["op"]=="getLetture"){			
            $data=mysql_real_escape_string($_GET["data"]);	
			$ris=getLetture($data);						
        }
        else if($_GET["op"]=="salvaLista"){        	
        	$testo=mysql_real_escape_string($_GET["testo"]);	
            $ris=salvaLista($testo);
        }
        else if($_GET["op"]=="leggiLista"){        	
            $ris=leggiLista();
        }        
        echo $ris;
	}			
?>