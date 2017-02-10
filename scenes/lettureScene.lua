--[[
  lettureScene.lua
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

local lettureScene = composer.newScene()

-- "scene:create()"
function lettureScene:create( event )

   local sceneGroup = self.view

	-- Function to handle button events
	local function returnButtonEvent( event )			
		if ( "ended" == event.phase ) then 
			lettureScene:destroy()					
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
	local function addNewElementButtonEvent( event )	
		if ( "ended" == event.phase ) then 
			nuovaLetturaScene=require('scenes.nuovaLetturaScene')
			nuovaLetturaScene:create()			
			lettureScene:destroy()
		end
	end

	addNewElementButton=widget.newButton{
		x= _W-30,
		y= 50,
		width = 50,
		height = 50,
		--The id can be used to tell you what button was pressed in your button event
		id = "addNewElementButton",
		--this is the default button image
		defaultFile="imgs/plus-icon.png",	
		--this tells it what function to call when you press the button
		onEvent = addNewElementButtonEvent
	}
	
	mese=os.date("%m")
	anno=os.date("%Y")
	
	labelHeadlineLetture = display.newText("Elenco letture "..mese..'/'..anno, 0, 0, font, 20)
	labelHeadlineLetture.x = _W * 0.5
	labelHeadlineLetture.y = 50
	
	lettureTextBox = native.newTextBox( display.contentCenterX, display.contentCenterY+60, _W, _H-(_H/6) )
	lettureTextBox.isEditable = true
	lettureTextBox.font=native.newFont(font,20)
	lettureTextBox.hasBackground = false
	lettureTextBox.align = 'center'

	dbManager.getLetture()
	
end

-- "scene:show()"
function lettureScene:show( event )

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
function lettureScene:hide( event )

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
function lettureScene:destroy( event )

   local sceneGroup = self.view
   
   returnButton:removeSelf()
   addNewElementButton:removeSelf()
   labelHeadlineLetture:removeSelf()
   lettureTextBox:removeSelf()
   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
lettureScene:addEventListener( "create", lettureScene )
lettureScene:addEventListener( "show", lettureScene )
lettureScene:addEventListener( "hide", lettureScene )
lettureScene:addEventListener( "destroy", lettureScene )

---------------------------------------------------------------------------------

return lettureScene
