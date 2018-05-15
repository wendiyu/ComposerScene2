-----------------------------------------------------------------------------------------
--
-- main.lua
--
-- Created by: Wendi Yu
-- Created on: May 2018
-- 
-- This file is create a composer
-----------------------------------------------------------------------------------------

local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 
-- function to change the scene

local function showMenuScene()
    -- body
    local options = {
        efefect = "fade",
        time = 500
    }
    composer.gotoScene("Menucene", options )
end

-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
 
end
 
 
-- show()
function scene:show( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Called when the scene is still off scene (but ids about to come on screen)
        local background = display.newRect(display.contentCenterX, display.contentCenterY, display.contentWidth, display.contentHeight )
        background:setFillColor( 0.3, 0.1, 0.8)
        sceneGroup:insert(background)

        local title = display.newText( "Splash Scene", 1024, 700, native.systemFont, 80 )
        title:setFillColor( 1, 1, 1)
        sceneGroup:insert(title)
 
    elseif ( phase == "did" ) then
        -- Called when the scene is now on screen

        timer.performWithDelay( 3000, showMenuScene )
 
    end
end
 
 -- hide()
function scene:hide( event )
 
    local sceneGroup = self.view
    local phase = event.phase
 
    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)
 
    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen
 
    end
end
 
 
-- destroy()
function scene:destroy( event )
 
    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view
 
end
 
 
-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------
 
return scene