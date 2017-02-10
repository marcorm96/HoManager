--[[
  menuScene.lua
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

local menuScene = composer.newScene()

-- "scene:create()"
function menuScene:create( event )

   local sceneGroup = self.view

   labelHeadlineMenu = display.newText("Homanager Menu", 0, 0, font, 30)
   labelHeadlineMenu.x = _W * 0.5
   labelHeadlineMenu.y = 70
   
   local function lettureButtonEvent( event )
		if ( "ended" == event.phase ) then
			lettureScene=require('scenes.lettureScene')
			lettureScene:create()			
			menuScene:destroy()
		end
	end
	
	lettureButton = widget.newButton(
		{
			x= _W*0.5,
			y= (_H/3)+70,
			id = "lettureButton",
			label = "Gestione letture",
			onEvent = lettureButtonEvent,
			font= native.newFont(font, 30),
			fontSize=23,
			labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0 } }			
		}
	)	
   
   local function listaButtonEvent( event )
		if ( "ended" == event.phase ) then			
			listaSpesaScene=require('scenes.listaSpesaScene')
			listaSpesaScene:create()
			menuScene:destroy()
		end
	end

	listaSpesaButton = widget.newButton({
			x= _W*0.5,
			y= _H/3+120,
			id = "listaSpesaButton",
			label = "Lista spesa",
			onEvent = listaButtonEvent,
			font= native.newFont(font, 30),
			fontSize=25,
			labelColor = { default={ 1, 1, 1 }, over={ 0, 0, 0, 0.5 } }
		}
	)

end

-- "scene:show()"
function menuScene:show( event )

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
function menuScene:hide( event )

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
function menuScene:destroy( event )

   local sceneGroup = self.view
	
   labelHeadlineMenu:removeSelf()
   lettureButton:removeSelf()
   listaSpesaButton:removeSelf()
   -- Called prior to the removal of scene's view ("sceneGroup").
   -- Insert code here to clean up the scene.
   -- Example: remove display objects, save state, etc.
end

---------------------------------------------------------------------------------

-- Listener setup
menuScene:addEventListener( "create", menuScene )
menuScene:addEventListener( "show", menuScene )
menuScene:addEventListener( "hide", menuScene )
menuScene:addEventListener( "destroy", menuScene )

---------------------------------------------------------------------------------

return menuScene
