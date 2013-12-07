-- for CCLuaEngine traceback
--[[function __G__TRACKBACK__(msg)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(msg) .. "\n")
    print(debug.traceback())
    print("----------------------------------------")
end

local function main()
	require "kode.init"		-- framework
	require "app.init"			-- app
	require "app.appfacade"		-- application
    require "app.register"      -- register controllers

	appFacade:startup()		-- startup
end

xpcall(main, __G__TRACKBACK__)
--]]

function __G__TRACKBACK__(errorMessage)
    print("----------------------------------------")
    print("LUA ERROR: " .. tostring(errorMessage) .. "\n")
    print(debug.traceback("", 2))
    print("----------------------------------------")
end

require("app.MyApp").new():run()
