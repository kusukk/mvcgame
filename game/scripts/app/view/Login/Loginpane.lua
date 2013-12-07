if kode == nil then return end
require("gameconfig")

local LoginPane = class("LoginPane", function()
    return display.newLayer()
end)

function LoginPane:ctor()
    ui.newTTFLabel({text = "Hello, LoginPane", size = 32, align = ui.TEXT_ALIGN_CENTER})
        :pos(display.cx, display.cy + 200)
        :addTo(self)
    print("LoginPane ctor")
end

function LoginPane.testPrint()
    NetworkLogic = require("network.NetworkMgr").new()
    NetworkLogic:connect_server(Global.SOCKET_IP, Global.SOCKET_PORT)
	print("hello Loginpane")
end

function LoginPane:onEnter()
    self:setTouchEnabled(true)
end

function LoginPane:onExit()
    self:removeAllEventListeners()
end

return LoginPane
