--[[
  dbManager.lua
  Copyright (c)Marco Rosario Martino aka marcorm96 <marcorosm96@gmail.com>
  
  All rights reserved.
  This library is free software; you can redistribute it and/or
  modify it under the terms of the GNU Lesser General Public
  License as published by the Free Software Foundation; either
  version 3.0 of the License, or (at your option) any later version.
  This library is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  Lesser General Public License for more details.
  You should have received a copy of the GNU Lesser General Public
  License along with this library.
--]]
dbManager={}
	local risposta
	local op	
	
	local utility=require('librerie.utility')
	
	URLBase="http://sviluppoofficinahardsoft.altervista.org/gestoreOperazioni.php?op="
	
	function networkListener( event ) 		
		if ( event.isError ) then
			risposta= "Network error!"
		else
			if(event.response=="OK") then
				risposta="Inserimento effettuato correttamente"
			else
				risposta=event.response
			end
		end	
		--inserisco il messaggio nella label e coloro il testo di bianco
		if(op=="salvaLista") then
			labelReturnStatus:setFillColor( 1, 1, 1 )
			labelReturnStatus.text=risposta
		end
		if(op=="leggiLista") then					
				listaTextBox.text=utility.JSONToText(risposta)
		end
		if(op=="scriviLetture") then
				labelReturnStatusNL:setFillColor( 1, 1, 1 )
				labelReturnStatusNL.text=risposta
		end	
		if(op=="getLetture") then				
				lettureTextBox.text=risposta				
		end	
	end
	
 function dbManager.scriviLetture (tipo,cifre)
	op="scriviLetture"		
	network.request( URLBase..op.."&tipo="..tipo.."&cifre="..cifre.."&data="..os.time(), "GET", networkListener )    
    end
	
--funzione che salva il contenuto della textBox sul db 
function dbManager.salvaLista ()
	op="salvaLista"					
	network.request( URLBase..op.."&testo="..utility.textToJSON(listaTextBox.text), "GET", networkListener )    	
end

--funzione che legge il contenuto della primo record della tabella liste sul db  e la inserisce nella textBox
function dbManager.leggiLista ()
	op="leggiLista"				
	network.request( URLBase..op, "GET", networkListener )    
 end
 
--funzione che restituisce le letture di questo mese dal db
function dbManager.getLetture()
	op="getLetture"
	network.request( URLBase..op.."&data="..os.time(), "GET", networkListener )   	
end
 
return dbManager
