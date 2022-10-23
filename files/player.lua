function Player.new(name, data)
    local self = setmetatable({}, Player)
    self.name = name
    self.progress = {}
	do
		for npcName in next, npcList do
			self.progress[npcName] = 1
		end
	end
	--[[load player data
		instruments = {
			viola = true
		},
		diva = true
		level = 1, 2, 3, ...
		hasFinished = true
	]]
    
    
	self.onWindow = {}
	self.windowHandle = {
		count = 0,
		timestamp = 0
	}
	
	self.seekingInstrument = {
		onIt = false,
		timestamp = 0,
		instrumentName = "",
		npcName = "",
		holdingIt = false,
		sprite = "",
		id = 0
	}
	
	self.performingMusic = {
		onIt = false,
		timestamp = 0,
		npcName = "",
		instrumentName = ""
		
		
	}
    self.onDialog = false
	
	for keyId, _ in next, playerKeys do
		system.bindKeyboard(self.name, keyId, true, true)
		system.bindKeyboard(self.name, keyId, false, true)
	end
	
	return self
end

function Player:setInstrument(instrumentName)
	local seeking = self.seekingInstrument
	
	seeking.onIt = true
	seeking.instrumentName = instrumentName
	seeking.holdingIt = false
end

function Player:giveNpcInstrument(npcName)
	local Musician = npcList[npcName]
	local seeking = self.seekingInstrument
	local success = false
	
	if seeking.onIt then
		if seeking.holdingIt then
			success = Musician:giveInstrument(seeking.instrumentName)
			
			if success then
				
				-- Do stuff
				self:releaseInstrument()
				return true
			end
		end
	end
	
	return false
end

function Player:releaseInstrument()
	local Instrument = self.seekingInstrument

	Instrument.holdginIt = false
	
	if Instrument.id then
		tfm.exec.removeImage(Instrument.id, false)
	end
	Instrument.id = nil
end

function Player:newWindowDisplay(windowId)
	self.onWindow[windowId] = true
	self.windowHandle.count = self.windowHandle.count + 1
end

function Player:deleteWindowDisplay(windowId)
	self.onWindow[windowId] = nil
	self.windowHandle.count = self.windowHandle.count - 1
end

function Player:closeAllWindows()
	local HNDL = table.unreference(self.onWindow)
	for windowId, _ in next, HNDL do
		uiRemoveWindow(windowId, self.name)
	end
end


function Player:newDialog(npcName)
	if self.onDialog then
		self:closeDialog()
	end
	
    local Npc = npcList[npcName]
    local dialog = self.progress[npcName] or 1
	local textInfo = Npc:getDialog(dialog)
    
    self.onDialog = {
		oldCursor = 1,
		cursor = 1,
		Text = textInfo,
		currentText = "",
		displayText = "",
		directAccess = 0,
		windowId = 0,
		displayInfo = {},
		finished = false,
		completed = false,
		pointer = 0,
		sprite = Npc.dialogSprite
    }
	
	self:setDialogDisplay("new")
end

function Player:setDialogDisplay(instruction)
	local Dialog = self.onDialog
	
	if Dialog then
		if instruction == "new" then
			Dialog.directAccess = 2000 + (tfm.exec.addImage(Dialog.sprite, ":1", 25, 240, self.name, 0.25, 0.25, 0, 1.0, 0, 0, true) or 0)
			ui.addTextArea(Dialog.directAccess, "", self.name, 50, 340, 685, 35, 0x000000, 0x000000, 1.0, true)
			self:setDialogDisplay("next")
		elseif instruction == "update" then
			ui.updateTextArea(
				Dialog.directAccess,
				("<font face='Century Schoolbook' size='13' color='#1A0E00'><p align='left'>%s</p></font>"):format(Dialog.displayText or Dialog.currentText),
				self.name
			) -- Update text
		elseif instruction == "next" then
			local Text = Dialog.Text
			Dialog.pointer = Dialog.pointer + 1
			if Dialog.pointer <= #Text then
				Dialog.currentText = Text[Dialog.pointer] or "..."
				Dialog.displayText = "..."
				Dialog.lenght = Dialog.currentText:len()
				Dialog.cursor = 1
				Dialog.oldCursor = 1
				
				Dialog.finished = false
			else
				Dialog.completed = true
				self:closeDialog()
			end
		end
	end
end

function Player:updateDialog(increment)
	increment = increment or 0

	local Dialog = self.onDialog
    if Dialog then
		if not Dialog.completed then
			if increment == 0 then
				if Dialog.finished then
					return self:setDialogDisplay("next")
				else
					Dialog.oldCursor = Dialog.cursor
					Dialog.cursor = Dialog.currentText:len()
					Dialog.displayText = Dialog.currentText
					
					Dialog.finished = true
					
					return self:setDialogDisplay("update")
				end
			elseif not Dialog.finished then
				Dialog.lenght = Dialog.currentText:len()
				Dialog.oldCursor = Dialog.cursor
				Dialog.cursor = math.min(Dialog.cursor + increment, Dialog.lenght)
				
				if Dialog.cursor >= Dialog.lenght then
					Dialog.displayText = Dialog.currentText
					Dialog.finished = true
				else
					Dialog.displayText = Dialog.currentText:sub(1, Dialog.cursor)
				end
				
				return self:setDialogDisplay("update")
			end
		else
			if increment == 0 then
				self:closeDialog()
			end
		end
    end
end

function Player:closeDialog()
    if self.onDialog then
        ui.removeTextArea(self.onDialog.directAccess, self.name)
		tfm.exec.removeImage(self.onDialog.directAccess - 2000, true)
    end
	
	self.onDialog = false
end

function Player:interactWithNpc(x, y)
	for npcName, Npc in next, npcList do
		if math.distance(x, y, Npc.xPosition, Npc.yPosition) < 45 then
			self:newDialog(npcName)
			break
		end
	end
end