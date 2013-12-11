if kode == nil then return end
require("gameconfig")

local LoginPane = class("LoginPane", function()
    return display.newLayer()
end)

function LoginPane:ctor()
    --[[ui.newTTFLabel({text = "Hello, LoginPane", size = 32, align = ui.TEXT_ALIGN_CENTER})
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
    --]]
    --local node = SceneReader:sharedSceneReader():createNodeWithSceneFile("DemoLogin/DemoLogin.json")

    --local layer = CCSWidgetExtend.extend(GUIReader:shareReader():widgetFromJsonFile("DemoLogin/DemoLogin.json")) --ccs.loadLayer("DemoLogin/DemoLogin.json")
    --CCSWidgetExtend.extend(GUIReader:shareReader():widgetFromJsonFile(filename))

    --local rect = layer:getBoundingBox()
   
    --local size = layer:getContentSize()
    --layer:setPosition(display.cx - size.width/2,display.cy - size.height/2)
    --print(size.height)
    --print(size.width)
    --print(rect.size.width, rect.size.height)
    --group:addChild(node)

    
    --widget = UIHelper:instance():createWidgetFromJsonFile("cocosgui/UITest/UITest.json")


    --local layer = ccs.layer()
    --self:addChild(layer)
    local widget = CCSWidgetExtend.extend(GUIReader:shareReader():widgetFromJsonFile("DemoLogin/DemoLogin.json"))
    --local node = SceneReader:sharedSceneReader():createNodeWithSceneFile("Resources/loginScenes.json")
    --self:addChild(node)
    --local scene = CCScene:create()
    --local node = SceneReader:sharedSceneReader():createNodeWithSceneFile("Resources/loginScenes.json")
    --node:getChildByTag("")
    --print(node)
    --print(node:getChildrenCount())
    --print(node:getChildByTag(10007))
    --local widget = node:getChildByTag(10007)
    --local array = widget:getChildren()
    --for i = 0, array:count() - 1 do
       -- local childNode = tolua.cast(array:objectAtIndex(i), "CCNode")
        --print("asddddddddddd") -- 输出子对象的父对象，应该与 node 的值相同
    --end
    --print(widget.login_Button)
    --print(widget)
    --print(widget:getChildrenCount())
    --local loginBtn = widget:getChildByTag(15)
    --print(loginBtn)
    --loginBtn:setVisible(false)
    --self:addWidget(widget)
    --display.replaceScene(scene)
    --widget:setPosition(0,0)
    --layer:setPosition(display.cx,display.cy)
    --widget:setPosition(display.cx,display.cy)
    --layer:addWidget(widget)

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
