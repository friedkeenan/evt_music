if (tfm.get.room.uniquePlayers < 5 or tfm.get.room.uniquePlayers > 60) and (not tfm.get.room.playerList["Indexinel#5948"] and not tfm.get.room.playerList["Drgenius#0000"]) then
	return system.exit()
end

local debugMode = false
local isEventLoaded = false

system.disableChatCommandDisplay(nil)

system.luaEventLaunchInterval(45, 10)

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
	local p = function(a) tfm.exec.chatMessage(a, nil) end
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
		print(".")--("[Debug] %s"):format(str:format(...)))
	end

	if debugMode then
		system.giveEventGift = function(playerName, giftCode)
			tfm.exec.chatMessage(("%s has received '%s'"):format(playerName, giftCode))
		end
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
	[32] = true, -- Space

	[49] = true, -- 1
	[50] = true, -- 2
	[51] = true, -- 3
	[52] = true, -- 4
	[53] = true, -- 5
	[54] = true, -- 6
	[55] = true, -- 7

	[97] = true, -- N1
	[98] = true, -- N2
	[99] = true, -- N3
	[100] = true, -- N4
	[101] = true, -- N5
	[102] = true, -- N6
	[103] = true, -- N7
}