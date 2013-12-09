
require("config")
require("framework.init")
require("framework.shortcodes")
require("framework.cc.init")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    CCFileUtils:sharedFileUtils():addSearchPath("res/")

    require "kode.init"     -- framework
    require "app.init"          -- app
    require "app.appfacade"     -- application
    require "app.register"      -- register controllers

    appFacade:startup()     -- startup
    --self:enterScene("MainScene")

    MyApp.enterGameLoginScene()
end

function MyApp:enterGameLoginScene()
	local scene = CCScene:create()
    local layer = require("app.view.Login.Loginpane").new()
    scene:addChild(layer)
	display.replaceScene(scene) 
end

return MyApp
