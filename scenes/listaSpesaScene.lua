--[[
  listaSpesaScene.lua
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
local ut=require("librerie.utility")

local listaSpesaScene = composer.newScene()

-- "scene:create()"
function listaSpesaScene:create( event )

   local sceneGroup = self.view

   dbManager.leggiLista()
   
	-- Function to handle button events
	local function returnButtonEvent( event )			
		if ( "ended" == event.phase ) then 
			listaSpesaScene:destroy()					
			menuScene=require('scenes.menuScene')
			menuScene:create()
			
		end
	end

	returnButton=widget.newButton{
		x= _W/10,
		y= 50,
		width = 50,
		height = 50,
		--The id can be used to tell you what button was pressed in your button event
		id = "returnButton",
		--this is the default button image
		defaultFile="imgs/return-icon.png",	
		--this tells it what function to call when you press the button
		onEvent = returnButtonEvent
	}	

	-- Function to handle button events
	local function saveButtonEvent( event )	
		if(event.phase == "began") then
			labelReturnStatus.text=''
		end
		if ( "ended" == event.phase ) then 
			--ut.sleep(2)
			dbManager.salvaLista()
		end
	end

	saveButton=widget.newButton{
		x= _W-30,
		y= 50,
		width = 50,
		height = 50,
		--The id can be used to tell you what button was pressed in your button event
		id = "saveButton",
		--this is the default button image
		defaultFile="imgs/save-icon.png",	
		--this tells it what function to call when you press the button
		onEvent = saveButtonEvent
	}
	
	
	labelHeadline = display.newText("Lista della spesa", 0, 0, font, 20)
	labelHeadline.x = _W * 0.5
	labelHeadline.y = 50
	
	labelReturnStatus = display.newText("", 0, 0, font, 18)
	labelReturnStatus.x = _W * 0.5
	labelReturnStatus.y = 80	
	
	-- Create text box
	listaTextBox = native.newTextBox( display.contentCenterX, display.contentCenterY+60, _W, _H-(_H/6) )
	listaTextBox.isEditable = true
	listaTextBox.font=native.newFont(font,18)
	listaTextBox.hasBackground = false	
	
end

-- "scene:show()"
function listaSpesaScene:show( event )

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
function listaSpesaScene:hide( event )

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
function listaSpesaScene:destroy( event )

   local sceneGroup = self.view

   saveButton:removeSelf()
   returnButton:removeSelf()
   labelHeadline:removeSelf()
   labelReturnStatus:removeSelf()
   listaTextBox:removeSelf()
   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
listaSpesaScene:addEventListener( "create", listaSpesaScene )
listaSpesaScene:addEventListener( "show", listaSpesaScene )
listaSpesaScene:addEventListener( "hide", listaSpesaScene )
listaSpesaScene:addEventListener( "destroy", listaSpesaScene )

---------------------------------------------------------------------------------

return listaSpesaScene
