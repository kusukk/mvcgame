
require("config")
require("framework.init")
require("framework.shortcodes")
require("framework.cc.init")
--require("gameconfig")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
end

function MyApp:run()
    CCFileUtils:sharedFileUtils():addSearchPath("res/")

    --NetworkLogic = require("network.NetworkMgr").new()
    --NetworkLogic:connect_server(Global.SOCKET_IP, Global.SOCKET_PORT)

    self:enterScene("MainScene")

    require "kode.init"     -- framework
    require "app.init"          -- app
    require "app.appfacade"     -- application
    require "app.register"      -- register controllers

    appFacade:startup()     -- startup

    --MyApp.enterGameLoginScene()
end

function MyApp:enterGameLoginScene()
	-- body
	local scene = CCScene:create()
	--local layer =
	display.replaceScene(scene) 
end


return MyApp
