<?php
	//funzione che effettua la connessione al db
	function connessione() {
		//connessione al db
		$connessione=mysql_connect("localhost","sviluppoofficinahardsoft","") or die ("Connessione non riuscita: ".mysql_error());		
		//selezione del db
		mysql_select_db("my_sviluppoofficinahardsoft") or die("Selezione del db non riuscita: ".mysql_error());
		return $connessione;
	}
    
	//funzione che codifica la stringa passata in json
    function codificaRisQueryJSON($s){
    	$risultato=array();
        //$risultato[]=$s;
        if(mysql_num_rows($s)){
        	while($row=mysql_fetch_row($s)){ 
				$risultato[]=$row;
            }
        }
        return json_encode($risultato);
    }
    
    //funzione che crea una stringa contente il risultato della query
    function queryRisToString($s){
    	$risultato="";
        if(mysql_num_rows($s)!=0) {
			while($linea=mysql_fetch_array($s,MYSQL_NUM)) {
				foreach ($linea as $valoreColonna) {
					$risultato.=$valoreColonna;
                    $risultato.=" ";                    
                }
                $risultato.="\n";
			}
        }        
        return $risultato;
    }
    
    //funzione che esegue la query passata
	function eseguiQuery($query) {	
    	$c=connessione();        
        $ris=mysql_query($query) or die ("Query fallita: ".mysql_error());
        mysql_close($c);        
        if($ris=="true")
        	$ris="OK";        
        return $ris;
	}
    
	//funzione che inserisce un nuovo record nella tabella letture
	function scriviLetture($tipo,$cifre,$data) {	    	
        $d=date("Y-m-d",$data);        
		$query="INSERT INTO letture (tipo , cifre , data) VALUES('$tipo', '$cifre','$d');";		        
        return eseguiQuery($query);
	}
    
    //funzione che inserisce un nuovo record nella tabella lista
	function salvaLista($testo) {	    	
		$query="UPDATE lista 
        		SET testo='$testo'
                 WHERE id=1;";		
        return eseguiQuery($query);        
	}
    
    //funzione che legge tutti i record della tabella lista
	function leggiLista() {	    	
		$query="SELECT testo FROM lista;";		
        $s=eseguiQuery($query);
        return queryRisToString($s);
	}
    
     //funzione che legge tutti i record della tabella lista
	function getLetture($data) {	
    	$oggi=date("Y-m-d",$data); 
        $inizioMese=date("Y-m-1",$data); 
        //echo $oggi." ".$inizioMese;
		$query="SELECT tipo,cifre,DATE_FORMAT(data, '%d/%m/%Y') FROM letture WHERE (data BETWEEN '".$inizioMese."' AND '".$oggi."') ORDER BY tipo;";		
        $s=eseguiQuery($query);
        return queryRisToString($s);
	}
?>
