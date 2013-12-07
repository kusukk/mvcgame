if kode == nil then return end

local LoginPane = class("LoginPane", function()
    return display.newScene("LoginPane")
end)

--function LoginPane:new()
	-- body
--end

function LoginPane:ctor()
    ui.newTTFLabel({text = "Hello, World", size = 64, align = ui.TEXT_ALIGN_CENTER})
        :pos(display.cx, display.cy)
        :addTo(self)
end

function LoginPane:onEnter()
    if device.platform == "android" then
        -- avoid unmeant back
        self:performWithDelay(function()
            -- keypad layer, for android
            local layer = display.newLayer()
            layer:addKeypadEventListener(function(event)
                if event == "back" then app.exit() end
            end)
            self:addChild(layer)

            layer:setKeypadEnabled(true)
        end, 0.5)
    end
end

function LoginPane:onExit()
end

function LoginPane.testPrint()
	-- body
	print("hello Loginpane")
	--display.replaceScene(self)
end

return LoginPane
