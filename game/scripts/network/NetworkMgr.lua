--
-- Author: 吴晔
-- Date: 2013-12-06 15:23:20
--
require("pack")
require("bit")
local SocketTCP = require("network.net.SocketTCP")

local NetworkMgr = class("NetworkMgr")

function NetworkMgr:ctor()
	self.socketObj = nil
end

-----------------------------------------------------------------------------------------
--网络API
--网络连接
function NetworkMgr:connect_server(ServerIp,ServerPort)
	if not self.socketObjsocketObj then
        self.socketObj = SocketTCP.new(ServerIp, ServerPort, false)
        self.socketObj:addEventListener(SocketTCP.EVENT_CONNECTED, handler(self, self.onStatus))
        self.socketObj:addEventListener(SocketTCP.EVENT_CLOSE, handler(self,self.onStatus))
        self.socketObj:addEventListener(SocketTCP.EVENT_CLOSED, handler(self,self.onStatus))
        self.socketObj:addEventListener(SocketTCP.EVENT_CONNECT_FAILURE, handler(self,self.onStatus))
        self.socketObj:addEventListener(SocketTCP.EVENT_DATA, handler(self,self.onData))
    end
    self.socketObj:connect()
end

--网络发送数据
function NetworkMgr:send_message(msg)
	self.socketObj:send(msg)
end

--关闭网络
function NetworkMgr:close()
	self.socketObj:disconnect()
end

-----------------------------------------------------------------------------------------

return NetworkMgr