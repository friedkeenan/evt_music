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

	-- Sound
	self.loopSounds={}
	self.loopPaused=true
	self.pauseImg=nil


	self.isFacingRight = true
	self.isMoving = false

	self.currentPing = 0 -- Player's latest ping
	self.pingTime = 0 -- os.time of last ping


	self.vignetteId = -1

	self.keys = {}

	tfm.exec.lowerSyncDelay(self.name)
	for keyId, _ in next, playerKeys do
		system.bindKeyboard(self.name, keyId, true, true)
		system.bindKeyboard(self.name, keyId, false, true)
		self.keys[keyId] = false
	end

	return self
end

function Player:init(data, reset)
    reset = reset or false
	if data then
		local moduleData = dataHan.getModuleData(data, "MUS")
		self.progress = dataHan.decodeData(moduleData)
		self.dataFile = data
	end

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
		ins = -1,
		times = 0,
		le1 = false,
		le2 = false,
		le3 = false
	}, self.progress)
	
	if self.progress.ins == -1 then
		self:setInstance(1)
	end
	
	if not reset then
	    self:pauseMusic(self.loopPaused,true)
	end
end

function Player:saveData()
	local data = dataHan.encodeData(self.progress)
	self.dataFile = dataHan.setModuleData(self.dataFile, "MUS", data)

	system.savePlayerData(self.name, self.dataFile)
end

function Player:setData(key, value, write)
	self.progress[key] = value
	if write then
		self:saveData()
	end
end

function Player:getData(key)
	return self.progress[key]
end

function Player:setVignette(coverage, adjustment, fadeIn)
	coverage = coverage or 1
	adjustment = adjustment or 0

	local old = self.vignetteId or -1

	local xscale = 1 -- 4
	local yscale = xscale + (xscale * adjustment)

	local xanchor = xscale / 2
	local yanchor = (yscale / 2) - adjustment

	-- local pulse = false  (self.currentMap == 1 and (math.random(1,4) == 1) or false)

	self.vignetteId = tfm.exec.addImage("183b987c56f.png", "~1", 400, 200, self.name, xscale, yscale, 0, coverage, xanchor, yanchor, fadeIn)

	tfm.exec.removeImage(old, fadeIn)
end

function Player:removeVignette(fadeOut)
	if self.vignetteId then
		self.vignetteId = tfm.exec.removeImage(self.vignetteId, fadeOut)
	end
end

function Player:hideOffscreen(hide, color)
	if hide == false then
		for i=1901, 1904 do
			ui.removeTextArea(i, self.name)
		end
	else
		color = color or 0x010101

		ui.addTextArea(1901, "", self.name, -1205, -400, 1200, 1200, color, color, 1.0, true)
		ui.addTextArea(1902, "", self.name, 805, -400, 1200, 1200, color, color, 1.0, true)

		ui.addTextArea(1903, "", self.name, -400, -1200, 1200, 1200, color, color, 1.0, true)
		ui.addTextArea(1904, "", self.name, -400, 405, 1200, 1200, color, color, 1.0, true)

		--self:setMute(self.ambienceMuted,true)
	end
end

function Player:setForeground(display, color, alpha, uiLayer)
	if display then
		local x, y, w, h
		if uiLayer then
			x, y, w, h = -1200, -1200, 3200, 2800
		else
			x, y, w, h = -1200, -1200, 20000, 19800
		end
		
		ui.addTextArea(9696, "", self.name, x, y, w, h, color, color, alpha, uiLayer)
		--self:setMute(self.ambienceMuted,true)
	else
		ui.removeTextArea(9696, self.name)
	end
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

	local instance = self:getData("ins") == 3
	do
		if (self.x > 0 and self.x < 275) and (self.y > 940) and instance then
			ui.addClickable(1, 50, 937, 190, 98, self.name, "instrumentWindow", false)
		else
			self:showInstruments(false)
			ui.removeClickable(1, self.name)
		end

		local cond = self.seekingInstrument.holdingIt and instance
		if (self.x > 700 and self.x < 975) and (self.y > 1050) and cond then
			ui.addClickable(2, 730, 1030, 215, 80, self.name, "sheetsWindow", false)
		else
			ui.removeClickable(2, self.name)
		end
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
				--self:removeVignette(true)
				self:setForeground(false)
				self:setOverlay(true)
			end
		elseif self.y > 930 then
			if self.overlayId then
				--self:setVignette(0.45, nil, true)
				self:setForeground(true, 0x804800, 0.15, false) -- 0xCC8166
				self:setOverlay(false)
			end
		end
	end
end

function Player:setInstrument(instrumentName, hold, hideShow, holdOv)
	local seeking = self.seekingInstrument
	local instrument = instrumentList[instrumentName]

	
	-- self:releaseInstrument()

	if instrument then
		if not seeking.onIt then
			seeking.onIt = true
			seeking.instrumentName = instrumentName
			seeking.holdingIt = holdOv or false
			seeking.npcName = instrument.Npc
			seeking.sprite = instrument.sprite
			seeking.tries = 3
			seeking.spriteId = -1
		end

		if hold then
			self:holdInstrument()
		end

		if hideShow then
			self:showInstruments(false)
		end
	end
end

function Player:giveNpcInstrument(npcName, showDialog)
	local Musician = npcList[npcName]
	if not Musician.instrument then return end

	local seeking = self.seekingInstrument
	local wrongAttempt = nil

	printfd("Giving instrument to %s", npcName)

	if self.progress[npcName] == 3 then
		if showDialog then
			self:newDialog(npcName, 3)
		end

		wrongAttempt = true
	elseif seeking.onIt then
		printfd("on it")
		if seeking.holdingIt then
			printfd("holding it")
			local success = Musician:giveInstrument(seeking.instrumentName)

			if success then
				self:releaseInstrument()

				if showDialog then
					printfd("Dialog 2")
					self:newDialog(npcName, 2)
				end

				self:setData(npcName, 3, false)
				wrongAttempt = false
			else
				if showDialog then
					printfd("Dialog -1")
					self:newDialog(npcName, -1)
				end
				wrongAttempt = true
			end
		end
	end

	local retval = nil
	if wrongAttempt ~= nil then
		if wrongAttempt then
			seeking.tries = seeking.tries - 1

			if seeking.tries <= 0 then
				self:releaseInstrument()
				tfm.exec.chatMessage("Oops you dropped it", self.name)
			end
		end

		retval = not wrongAttempt
	end

	self.instrumentsLeft = self:getInstrumentsLeft()

	if self.instrumentsLeft <= 0 then
		self:setInstance(4)
	end
	
	return retval
end

function Player:getInstrumentsLeft()
	local count = 20

	local pat = "m%d"
	for i=1, 20 do
		if self.progress[pat:format(i)] >= 2 then
			count = count - 1
		end
	end

	return count
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
		pInf = dialog,
		Npc = {key = npcName, x = Npc.xPosition, y = Npc.yPosition},
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
			
			tfm.exec.playSound("transformice/son/fleche.mp3", 80, nil, nil, self.name) -- tfmadv/sel.mp3

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
		
		self:onDialogClosed(self.onDialog.Npc.key, self.onDialog.pInf)
    end

	self.onDialog = false
end

function Player:onDialogClosed(npcName, pid)
	if npcName == "cond" then
		if pid == 1 then
			self:setInstance(2)
		elseif pid == 3 then
			self:finishLevel(1)
			self:setData("diva", 2)
		elseif pid == 4 then
			self:finishLevel(3)
			self:setInstance(9)
		end
	elseif npcName == "diva" then
		if pid == 2 then
			self:setInstance(5)
		elseif pid == 4 then
			self:finishLevel(3)
			self:setInstance(7)
		elseif pid == 5 then
			-- Activates Piano Quest (display board)
		end
	else
		if pid == 1 then
			if self:getData("ins") < 3 then
				self:setInstance(3)
			end
			
			-- Search instrument
		end
	end
end

function Player:npcInteraction(npcName, x, y)
	local Npc = npcList[npcName]
	x = x or self.x
	y = y or self.y

	if Npc then
		if math.distance(x, y, Npc.xPosition, Npc.yPosition) < npcTalkDist then
			local success
			if self.seekingInstrument.onIt and Npc.instrument then
				success = self:giveNpcInstrument(npcName, true)
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

function Player:initPuzzle(display)
	if self.puzzle then
		self:deletePuzzle()
	end

	local pz = {
		imageId = -1,
		sprite = "",
		dx = 273, -- (273 - 15)
		dy = 63, -- "",
		scale = 1.0,
		selected = nil -- Index Id
	}

	local images = {
		"18428f8b41c.png",	"18428f928d6.png",	"18428f9acdf.png",
		"18428fa65e5.png",	"18428fb1459.png",	"18428fba384.png",
		"18428fd5736.png",	"18428fe522f.png",	"18428ff2a9d.png"
	}

	local rand = {}
	for i=1, 9 do
		table.insert(rand, math.random(1, i), i)
	end

	local scale = 0.125
	local x, y
	for i = 1, 9 do
		x = ((i-1) % 3) + 1
		y = math.ceil(i / 3)
		pz[i] = {
			id = rand[i],
			imageId = -1,
			sprite = images[rand[i]],
			dx = 288 + ((x - 1) * (597 * scale)),
			dy = 78 + ((y - 1) * (594 * scale)),
			size = 595.5 * scale,
			scale = scale
		}
	end

	self.puzzle = pz

	if display then
		self:showPuzzle(true)
	end
end

function Player:deletePuzzle()
	if self.puzzle then
		self:showPuzzle(false)

		self.puzzle = false
	end
end

function Player:showPuzzle(show)
	local pz = self.puzzle
	if not pz then return end

	if not show then
		pz.imageId = tfm.exec.removeImage(pz.imageId, false)
		for i = 1, 9 do
			self:displayPuzzleTile(i, false)
		end
	end

	if show then
		pz.imageId = tfm.exec.addImage(pz.sprite, ":1", 400, 210, self.name, pz.scale, pz.scale, 0, 1.0, 0.5, 0.5, false)

		local tl
		for i=1, 9 do
			self:displayPuzzleTile(i, true)
		end
	end

	self.showingPuzzle = not not show
end

function Player:displayPuzzleTile(id, display)
	local tl = self.puzzle[id]
	if display and tl.id ~= 9 then
		tl.imageId = tfm.exec.addImage(tl.sprite, ":2", tl.dx, tl.dy, self.name, tl.scale, tl.scale, 0, 1.0, 0, 0, false)
		ui.addClickable(500 + id, tl.dx, tl.dy, tl.size, tl.size, self.name, "puzzle-" .. id, true)
	else
		tfm.exec.removeImage(tl.imageId, false)
		tl.imageId = nil
		ui.removeClickable(500 + id)
	end
end

function Player:selectPuzzleTile(id)
	local pz = self.puzzle
	local old = pz.selected

	if old ~= id then
		pz.selected = id

		if pz[id].id == 9 then -- Empty tile (movement)
			self:movePuzzleTile(old, id)
		end
	end
end

function Player:movePuzzleTile(from, to)
	if to == 9 and from ~= 9 then
		local pz = self.puzzle
		local fr = pz[from]
		local t = pz[to]

		local aux = {}

		aux.id = fr.id
		aux.imageId = fr.imageId
		aux.sprite = fr.sprite

		fr.id = t.id
		fr.imageId = t.imageId
		fr.sprite = t.sprite

		t.id = aux.id
		t.imageId = aux.imageId
		t.sprite = aux.sprite

		self:displayPuzzleTile(from, true)
		self:displayPuzzleTile(to, true)

		if self:assertPuzzle() then
			self:finishLevel(2)
		end
	end
end

function Player:assertPuzzle()
	local pz = self.puzzle
	local assembled = true
	if pz then
		for i=1, 9 do
			if pz[i].id ~= i then
				assembled = false
				break
			end
		end

		print(assembled)
		return assembled
	end
end

function Player:setInstrumentSound(npcName, add)
	local Npc = npcList[npcName]
	if not Npc then return end

	local soundName = Npc.instrument and Npc.instrument.sound or nil
	if not soundName then return end

	if add == nil then
		self:setInstrumentSound(npcName, not self.loopSounds[soundName])
	else
		if add then
			self:addSoundLoop(soundName)
		else
			self:removeSoundLoop(soundName)
		end
	end
end

function Player:setInstance(id)
	
	-- pls dont laugh at me im learning from yanderedev
	
	if id == 1 then -- Module Start
		for i=1, 20 do
			self:setData("m" .. i, 0) -- "..."
		end
		
		self:setData("cond", 1)
		self:setData("diva", 1)
	elseif id == 2 then -- Instrument quest starts
		for i=1, 20 do
			self:setData("m" .. i, 1) -- riddle
		end
		self:setData("cond", 2)
	elseif id == 3 then -- Instrument quest active
	elseif id == 4 then -- Instrument quest finished
		for i=1, 20 do
			self:setData("m" .. i, 2) -- "ready"
		end
		self:setData("cond", 3) -- This dialogue activates Diva's one
	elseif id == 5 then -- Microphone quest starts
		self:setData("diva", 3)
	elseif id == 6 then -- Microphone quest finished
		self:setData("diva", 4)
	elseif id == 7 then -- Piano quest starts
		self:setData("diva", 5)
	elseif id == 8 then -- Piano quest finished
		for i=1, 20 do
			self:setData("m" .. i, 4) -- "hero"
		end
		self:setData("diva", 6)
		self:setData("cond", 4)
	elseif id == 9 then -- Event finished (spectating orchestra)
		for i=1, 20 do
			self:setData("m" .. i, 0) -- "hero"
		end
		self:setData("diva", 0)
		self:setData("cond", 0)
	elseif id == 10 then -- Orcestra finished
		self:finishLevel(4)
	end
	
	self:setData("ins", id, true)
end

function Player:finishLevel(levelId)
	levelId = levelId or self:getData("lev")
	
	local pl = "le" .. levelId
	if not self:getData(pl) then
		if levelId == 1 then -- Instruments delivering & tunning
			-- Rewards
		elseif levelId == 2 then -- Diva's microphone fixing (puzzle)
			-- ...
			-- Reward
		elseif levelId == 3 then -- Diva's performance (piano)
			-- ...
			-- Reward
		end
		
		self:setData(pl, true)
		
			-- Always save to database when a level gets completed unless last one
		self:setData("lev", levelId + 1, levelId < 3)

	end

	if self:getData("lev") > 4 then -- Event has been completed
		local times = self:getData("times") + 1

		self:setData("times", times, false)

		self:resetAllData()
	end
end

function Player:resetAllData()
	local times = self:getData("times")
	self.progress = {}
	self:init(nil, true)
	self:setData("times", times, true)
end

function Player:updatePing()
    self.pingTime = os.time()
    tfm.exec.addBonus(0, self.x, self.y, -1, 0, false, self.name)
end