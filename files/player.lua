function Player.new(name)
    local self = setmetatable({}, Player)
    self.name = name
    self.progress = {}
	do
		for npcName in next, npcList do
			self.progress[npcName] = 1
		end
	end
    
    
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
	self.viewingInstruments = nil
	
	self.isFacingRight = true
	self.isMoving = false
	
	self.keys = {}
	
	tfm.exec.lowerSyncDelay(self.name)
	for keyId, _ in next, playerKeys do
		system.bindKeyboard(self.name, keyId, true, true)
		system.bindKeyboard(self.name, keyId, false, true)
		self.keys[keyId] = false
	end
	
	return self
end

function Player:init(data)
	local moduleData = dataHan.getModuleData(data, "MUS")
	self.progress = dataHan.decodeData(moduleData)
	self.dataFile = data
	
	do -- Sets musicias to default
		local index
		for i=1, 20 do
			index = ("m%d"):format(i)
			self.progress[index] = self.progress[index] or 1
		end
	end
	
	self.progress = table.inherit({
		diva = 1,
		cond = 1,
		lev = 1,
		times = 0
	}, self.progress)
	
		--[[load player data
		instruments = {
			viola = true
		},
		diva = true
		level = 1, 2, 3, ...
		hasFinished = true
	]]
end

function Player:saveData()
	local data = dataHan.encodeData(self.progress)
	self.dataFile = dataHan.setModuleData(self.dataFile, "MUS", data)
	
	system.savePlayerData(self.name, self.dataFile)
end

function Player:setData(key, value)
	self.progress[key] = value
	self:saveData()
end

function Player:getData(key)
	return self.progress[key]
end

function Player:updatePosition(x, y, vx, vy, facingRight, isMoving)
	local f, m
	self.x = x or self.x
	self.y = y or self.y
	self.vx = vx or self.vx
	self.vy = vy or self.vy
	
	if facingRight ~= nil then
		self.isFacingRight = facingRight
		f = true
	end
	
	if isMoving ~= nil then
		local k = self.keys
		self.isMoving = isMoving or k[0] or k[1] or k[2]
		m = true
	end
	
	if f or m then
		if self.seekingInstrument.holdingIt then
			self:setInstrumentHolding(true, self.isFacingRight, self.isMoving)
		end
	end
	
	self:setOverlay()
	
	if self.onDialog then
		local npc = self.onDialog.Npc
		if math.distance(self.x, self.y, npc.x, npc.y) > 75 then
			self:closeDialog()
		end
	end
	
	if (self.x > 0 and self.x < 275) and (self.y > 940) then
		ui.addClickable(1, 50, 937, 190, 98, self.name, "instrumentWindow", false)
	else
		self:showInstruments(false)
		ui.removeClickable(1, self.name)
	end
	
	if (self.x > 700 and self.x < 975) and (self.y > 1050) then
		ui.addClickable(2, 730, 1030, 215, 80, self.name, "sheetsWindow", false)
	else
		ui.removeClickable(2, self.name)
	end
end

function Player:setOverlay(show)
	if show ~= nil then	
		if show then
			self.overlayId = tfm.exec.addImage("18405b309b5.png", "!420", -1, 927, self.name, 1.0, 1.0, 0, 1.0, 0, 0, true)
		else
			if self.overlayId then
				self.overlayId = tfm.exec.removeImage(self.overlayId, true)
			end
		end
	else
		if self.y < 905 then
			if not self.overlayId then
				self:setOverlay(true)
			end
		elseif self.y > 930 then
			if self.overlayId then
				self:setOverlay(false)
			end
		end
	end
end

function Player:setInstrument(instrumentName, hold, hideShow)
	local seeking = self.seekingInstrument
	local instrument = instrumentList[instrumentName]
	
	self:releaseInstrument()
	
	if instrument then
		seeking.onIt = true
		seeking.instrumentName = instrumentName
		seeking.holdingIt = false
		seeking.npcName = instrument.Npc
		seeking.sprite = instrument.sprite
		seeking.tries = 3
		seeking.spriteId = -1
		
		if hold then
			self:holdInstrument()
		end
		
		if hideShow then
			self:showInstruments(false)
		end
	end
end

function Player:giveNpcInstrument(npcName)
	local Musician = npcList[npcName]
	local seeking = self.seekingInstrument
	local wrongAttempt = nil
	
	printfd("Giving instrument to %s", npcName)
	
	if self.progress[npcName] == 3 then
		self:newDialog(npcName, 3)
		
		wrongAttempt = true
	elseif seeking.onIt then
		printfd("on it")
		if seeking.holdingIt then
			printfd("holding it")
			local success = Musician:giveInstrument(seeking.instrumentName)
			
			if success then
				printfd("Dialog 2")
				-- Do stuff
				self:releaseInstrument()
				self:newDialog(npcName, 2)
				self:setData(npcName, 3)
				wrongAttempt = false
			else
				printfd("Dialog -1")
				self:newDialog(npcName, -1)
				wrongAttempt = true
			end
		end
	end
	
	if wrongAttempt ~= nil then
		if wrongAttempt then
			seeking.tries = seeking.tries - 1
			
			if seeking.tries <= 0 then
				self:releaseInstrument()
				tfm.exec.chatMessage("Oops you dropped it", self.name)
			end
		end
		
		return not wrongAttempt
	end
	
	return nil
end

function Player:holdInstrument()
	local seeking = self.seekingInstrument
	
	if seeking.holdingIt then
		self:releaseInstrument()
	end

	self:setInstrumentHolding(true, self.isFacingRight, self.isMoving)
	
	seeking.holdingIt = true
end

function Player:setInstrumentHolding(display, isFacingRight, isMoving)
	local seeking = self.seekingInstrument
	local instrument = instrumentList[seeking.instrumentName]
	
	if seeking.spriteId then
		tfm.exec.removeImage(seeking.spriteId, false)
		seeking.spriteId = nil
	end
	
	if display then
		local xf = isFacingRight and 1 or -1
		local rot = math.rad(isMoving and 10 or 60)
		local scale = 0.4
		local xpos = isMoving and 4 or 24
		local ypos = isMoving and 20 or 10
		seeking.spriteId = tfm.exec.addImage(
			instrument.sprite,
			"$" .. self.name,
			-xpos * xf, -ypos,
			nil,
			scale * xf, scale,
			-rot * xf, 1.0,
			0.5 * xf, 0.5,
			false
		)
	end
end

function Player:releaseInstrument()
	local seeking = self.seekingInstrument
	self:setInstrumentHolding(false)
	
	seeking.holdingIt = false
	seeking.onIt = false
	seeking.instrumentName = nil
	seeking.holdingIt = false
	seeking.npcName = nil
	seeking.sprite = nil
	seeking.spriteId = -1
	seeking.tries = 0
end


function Player:showInstruments(show)
	if show ~= nil then
		if show then
			if self.viewingInstruments then
				self:showInstruments(false)
			end
			
			self.viewingInstruments = {}
			uiAddWindow(1, 2, {title = "", default=""}, self.name, 0, 0, 1.0, false)
			
			local counter = 100
			for instrumentName, Ins in next, instrumentList do
				counter = counter + 1
				self.viewingInstruments[counter] = counter
				ui.addClickable(counter, Ins.tdx, Ins.tdy, Ins.txs, Ins.tys, self.name, "ins-".. (Ins.Npc or "m1"), true)
				print(Ins.Npc)
			end
		else
			uiRemoveWindow(1, self.name)
			for index, id in next, (self.viewingInstruments or {}) do
				ui.removeClickable(id, self.name)
			end
			
			self.viewingInstruments = nil
		end
	end
	
	if show == nil then
		if not self.viewingInstruments then
			self:showInstruments(true)
		end
		
		-- update 
	end
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


function Player:newDialog(npcName, dialogId)
	if self.onDialog then
		self:closeDialog()
	end
	
    local Npc = npcList[npcName]
    local dialog = dialogId or self.progress[npcName] or 1
	print(dialog)
	local textInfo = Npc:getDialog(dialog)
	
    self.onDialog = {
		oldCursor = 1,
		cursor = 1,
		Text = textInfo,
		Npc = {x = Npc.xPosition, y = Npc.yPosition},
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
			Dialog.directAccess = 2000 + (tfm.exec.addImage(Dialog.sprite, ":1", 25, 394, self.name, 0.25, 0.25, 0, 1.0, 0, 1.0, true) or 0)
			ui.addTextArea(Dialog.directAccess, "", self.name, 50, 335, 685, 38, 0x000000, 0x000000, 1.0, true)
			self:setDialogDisplay("next")
		elseif instruction == "update" then
			ui.updateTextArea(
				Dialog.directAccess,
				("<font face='Century Schoolbook' size='13.5' color='#1A0E00'><b>%s</b></font>"):format(Dialog.displayText or Dialog.currentText),
				self.name
			) -- Update text
			
			if Dialog.finished then
				Dialog.timerId = Timer.new(2000, false, function()
					self:setDialogDisplay("next")
				end)
			end
		elseif instruction == "next" then
			if Dialog.timerId then
				Timer.remove(Dialog.timerId)
				Dialog.timerId = nil
			end
			
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

function Player:npcInteraction(npcName, x, y)
	local Npc = npcList[npcName]
	x = x or self.x
	y = y or self.y
	
	if Npc then
		if math.distance(x, y, Npc.xPosition, Npc.yPosition) < 45 then
			local success
			if self.seekingInstrument.onIt and Npc.instrument then
				success = self:giveNpcInstrument(npcName)
			end
			
			if success == nil then
				self:newDialog(npcName)
			end
			
			return true
		end
	end
	
	return false
end

function Player:interactWithNpc(x, y)
	x = x or self.x
	y = y or self.y
	for npcName, Npc in next, npcList do
		if self:npcInteraction(npcName, x, y) then
			break
		end
	end
end