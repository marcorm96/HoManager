--[[
  nuovaLetturaScene.lua
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
local composer = require( "composer" )
local dbManager = require("librerie.dbManager")

local nuovaLettureScene = composer.newScene()

-- "scene:create()"
function nuovaLettureScene:create( event )

   local sceneGroup = self.view

	-- Function to handle button events
	local function returnButtonNLEvent( event )			
		if ( "ended" == event.phase ) then 
			nuovaLettureScene:destroy()					
			menuScene=require('scenes.menuScene')
			menuScene:create()
			
		end
	end

	returnButtonNL=widget.newButton{
		x= _W/10,
		y= 50,
		width = 50,
		height = 50,
		--The id can be used to tell you what button was pressed in your button event
		id = "returnButton",
		--this is the default button image
		defaultFile="imgs/return-icon.png",	
		--this tells it what function to call when you press the button
		onEvent = returnButtonNLEvent
	}	

	labelHeadlineNL = display.newText("Inserimento nuova lettura", 0, 0, font, 25)
	labelHeadlineNL.x = _W * 0.5
	labelHeadlineNL.y = 70

	labelReturnStatusNL = display.newText("", 0, 0, font, 18)
	labelReturnStatusNL.x = _W * 0.5
	labelReturnStatusNL.y = 100

	labelTipo = display.newText("Tipo", 0, 0, font, 18)
	labelTipo:setTextColor(180, 180, 180)
	labelTipo.x = _W * 0.5
	labelTipo.y = 120


	labelCifre = display.newText("Cifre", 0, 0, font, 18)
	labelCifre:setTextColor(180, 180, 180)
	labelCifre.x = _W * 0.5
	labelCifre.y = 185
	
	tfTipo = native.newTextField(0, 0, _W*0.5, 30)
    tfTipo.inputType = "default"
    tfTipo.font = native.newFont(font, 18)    
    tfTipo.isEditable = true
    tfTipo.align = "center"    
    tfTipo.x = _W * 0.5
    tfTipo.y = 145
    tfTipo.text = ''
	
	tfCifre = native.newTextField(0, 0, _W * 0.5, 30)
    tfCifre.inputType = "number"
    tfCifre.font = native.newFont(font, 18)
    tfCifre.isEditable = true
    tfCifre.align = "center"    
    tfCifre.x = _W * 0.5
    tfCifre.y = 210
    tfCifre.text = ''

	-- Function to handle button events
	local function handleButtonEvent( event )
 
		if ( "ended" == event.phase ) then
			if(tfTipo.text=="" or tfCifre.text=="") then
				--se i campi sono vuoti
				labelReturnStatusNL:setFillColor( 1, 0, 0 )
				labelReturnStatusNL.text="Riempire entrambi i campi!"
			else					
				dbManager.scriviLetture(tfTipo.text,tfCifre.text)
			end		
		end
	end
 
	-- Create the widget
	inserisciButton = widget.newButton({
        x= _W*0.5,
		y= 270,
        id = "inserisciButton",
        label = "Inserisci",
        onEvent = handleButtonEvent,
		font= native.newFont(font, 30),
		fontSize=30,
		labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } }
    })

	
end

-- "scene:show()"
function nuovaLettureScene:show( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is still off screen (but is about to come on screen).
   elseif ( phase == "did" ) then
      -- Called when the scene is now on screen.
      -- Insert code here to make the scene come alive.
      -- Example: start timers, begin animation, play audio, etc.
   end
end

-- "scene:hide()"
function nuovaLettureScene:hide( event )

   local sceneGroup = self.view
   local phase = event.phase

   if ( phase == "will" ) then
      -- Called when the scene is on screen (but is about to go off screen).
      -- Insert code here to "pause" the scene.
      -- Example: stop timers, stop animation, stop audio, etc.
   elseif ( phase == "did" ) then
      -- Called immediately after scene goes off screen.
   end
end

-- "scene:destroy()"
function nuovaLettureScene:destroy( event )

   local sceneGroup = self.view
   
   returnButtonNL:removeSelf()
   labelHeadlineNL:removeSelf()
   labelReturnStatusNL:removeSelf()
   labelTipo:removeSelf()
   labelCifre:removeSelf()
   tfTipo:removeSelf()
   tfCifre:removeSelf()
   inserisciButton:removeSelf()
   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
nuovaLettureScene:addEventListener( "create", nuovaLettureScene )
nuovaLettureScene:addEventListener( "show", nuovaLettureScene )
nuovaLettureScene:addEventListener( "hide", nuovaLettureScene )
nuovaLettureScene:addEventListener( "destroy", nuovaLettureScene )

---------------------------------------------------------------------------------

return nuovaLettureScene
