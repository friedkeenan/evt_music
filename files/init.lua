local isEventLoaded = false

if tfm.get.room.uniquePlayers < 1 or tfm.get.room.uniquePlayers > 60 then
	return system.exit()
end

tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disableMinimalistMode(true)
tfm.exec.disableMortCommand(true)
tfm.exec.disableAutoNewGame(true)
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

local playerKeys = {
	[0] = true,
	[1] = true,
	[2] = true,
	[3] = true, -- Down
	[32] = true -- Space
}