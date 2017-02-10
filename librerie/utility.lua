--[[
  utility.lua
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
utility={}

local json = require("json")

--funzione che codifica un testo in json
function utility.textToJSON (txt)
	--creo una tabella in cui inserisco il testo
	tableToSave={}
	tableToSave ['saved-text'] = txt		
	return json.encode(tableToSave)
end

--funzione che decodifica un json in testo 
function utility.JSONToText(jsonInfo)		
	--la funzione json.decode restituisce una tabella 
	--da cui prendo solo il contenuto di saved-text
	return json.decode(jsonInfo)['saved-text']	
end

--funzione che ferma l'esecuzione per s secondi
function utility.sleep(s)
  local ntime = os.time() + s
  repeat until os.time() > ntime
end

return utility
