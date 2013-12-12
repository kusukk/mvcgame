if kode == nil then return end
require("gameconfig")

local LoginPane = class("LoginPane", function()
    return display.newLayer()
end)

function LoginPane:ctor()
    local layer = ccs.layer()
    self:addChild(layer)
    local widget = ccs.loadWidget("DemoLogin/DemoLogin.json")--CCSWidgetExtend.extend(GUIReader:shareReader():widgetFromJsonFile("DemoLogin/DemoLogin.json"))
    widget:setPosition(CCPoint(display.cx - widget:getSize().width/2,display.cy - widget:getSize().height/2))
    layer:addWidget(widget)
    --widget:getChild("star_ImageView"):setVisible(false)
    local loginBtn = widget:getChild("login_Button")
    loginBtn:setTouchEnabled(true)
    loginBtn:setListener({[ccs.TouchEventType.ended] = function() LoginPane:onLoginBtnHandler() end})
    --loginBtn:setListener({[ccs.TouchEventType.state_change_to_pressed]  = function() print("h") end})
    
end

function LoginPane:onLoginBtnHandler(event)
    print("hello")
    return true
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
