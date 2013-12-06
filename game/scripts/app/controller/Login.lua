if kode == nil then return end

local Event = require "app.config.events"

local LoginController = BaseController:extend{
	name = "LoginController2013-10-06";
}
local meta = LoginController

function meta:onRegister()
	-- body
end

function meta:listNotificationInterests()
	return {
		Event.EVENT_START_APP
	}
end

function meta:handleNotification(notification)
	if notification.name == Event.EVENT_START_APP then
		print("Controller get notice Event.EVENT_START_APP")
	end
end

-- private action method

function meta:actionFunction(param)
	-- body
end

return meta
