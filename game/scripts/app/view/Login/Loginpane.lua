if kode == nil then return end
require("gameconfig")

local LoginPane = class("LoginPane", function()
    return display.newLayer()
end)

function LoginPane:ctor()
    ui.newTTFLabel({text = "Hello, LoginPane", size = 32, align = ui.TEXT_ALIGN_CENTER})
        :pos(display.cx, display.cy + 200)
        :addTo(self)
    --print("LoginPane ctor")
    local __luaSocketSendLabel = ui.newTTFLabelMenuItem({
        text = "lua socket send",
        size = 32,
        x = display.cx,
        y = display.top - 160,
        listener = handler(self, self.onLuaSocketSendClicked),
    })

    self:addChild(ui.newMenu({__luaSocketSendLabel}))
end

function LoginPane.testPrint()
    NetworkLogic = require("network.NetworkMgr"):Instance()
    NetworkLogic:connect_server(Global.SOCKET_IP, Global.SOCKET_PORT)
	--print("hello Loginpane")
end

function LoginPane:onLuaSocketSendClicked()
    local msg = {
                    username="test106",
                    password="ss",
                    msgID = 101
                }
    NetworkLogic:send_message(msg)
end

function LoginPane:onEnter()
    self:setTouchEnabled(true)
end

function LoginPane:onExit()
    self:removeAllEventListeners()
end

return LoginPane
