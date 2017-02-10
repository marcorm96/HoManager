--[[
  main.lua
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
-- ----------------------------------------------------------------------------
-- SET GLOBAL VARIABLES
-- ----------------------------------------------------------------------------
 _W = display.viewableContentWidth
 _H = display.viewableContentHeight
 
-- ----------------------------------------------------------------------------
-- INCLUDE REQUIRED LIBRARIES
-- ---------------------------------------------------------------------------- 
local background=display.newImageRect("imgs/sfondo.jpg",768,1024)

widget = require("widget")

display.setStatusBar(display.DarkStatusBar)

font = native.systemFontBold

local composer = require( "composer" )
composer.gotoScene( "scenes.menuScene" )
