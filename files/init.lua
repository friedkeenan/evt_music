if (tfm.get.room.uniquePlayers < 5 or tfm.get.room.uniquePlayers > 60) and (not tfm.get.room.playerList["Indexinel#5948"] and not tfm.get.room.playerList["Drgenius#0000"]) then
	return system.exit()
end

local debugMode = true
local isEventLoaded = false

system.disableChatCommandDisplay(nil)

local admins = {
	["Indexinel#5948"] = true,
	["Ricardinhotv#0000"] = true,
	["Drgenius#0000"] = true,
	["Undermath#2907"] = true,
	["Zetdey#3845"] = true,
	["Magikmail#0000"] = true,
	["Nnaaaz#0000"] = true
}

local styles = {}

do
	local p = print--function(a) tfm.exec.chatMessage(a, nil) end
	local tc = table.concat
	local ts = tostring
	print = function(...) -- Fixed :+1:
		if debugMode then
			local args = {...}
			for i=1, #args do
				args[i] = ts(args[i])
			end
			p(tc(args, " "))
		end
	end

	printfd = function(str, ...)
		print(("[Debug] %s"):format(str:format(...)))
	end
end

tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disableMinimalistMode(true)
tfm.exec.disableMortCommand(true)
tfm.exec.disableAutoNewGame(debugMode)
tfm.exec.disablePhysicalConsumables(true)

local currentTime = os.time

local tfm_exec_removeImage = tfm.exec.removeImage
local tfm_exec_addImage = tfm.exec.addImage

local ui_removeTextArea = ui.removeTextArea
local ui_addTextArea = ui.addTextArea
local ui_updateTextArea = ui.updateTextArea

local playerList = {}
local npcList = {}
local room = {}
local instrumentList = {}

local Player = {}
Player.__index = Player

local Character = {}
Character.__index = Character

local uiHandle = {}
local uiResources = {}
local textAreaHandle = {}
local textAreaNum = 0

local npcTalkDist = 55

local playerKeys = {
	[0] = true,
	[1] = true,
	[2] = true,
	[3] = true, -- Down
	[32] = true -- Space
}