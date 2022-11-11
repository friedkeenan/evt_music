function Player.new(name)
    local self = setmetatable({}, Player)
    self.name = name
    self.progress = {}

	local tfmd = tfm.get.room.playerList[name]

	self.language = tfmd.language or tfmd.community
	self.gender = tfmd.gender

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
	self.viewingSheets = nil

	self.colorBlindMode=false

	-- Tuning
	self.isTuning=false
	self.tuningIns=nil
	self.tuningStage=1
	self.finalNote=0
	self.currentTuning=nil
	self.selectedNote=0
	self.notesList={}
	self.restImgs={}

	-- Sound
	self.loopSounds={}
	self.loopSoundsChanged=false
	self.loopPaused=true
	self.pauseImg=nil


	self.isFacingRight = true
	self.isMoving = false

	--self.currentPing = 0 -- Player's latest ping
	--self.pingTime = 0 -- os.time of last ping


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
		printt(self.progress)
		self.dataFile = data
	end

	do -- Sets musicias to default
		local index
		for i=1, 20 do
			index = ("m%d"):format(i)
			self.progress[index] = self.progress[index] or 1
		end
	end

	local def = {
		diva = 1,
		cond = 1,
		lev = 1,
		ins = -1,
		times = 0,
		le1 = false,
		le2 = false,
		le3 = false
	}

	for key, value in next, def do
		if not self.progress[key] then
			self.progress[key] = value
		end
	end

	self:setInstance(math.abs(self.progress.ins))

	-- Init UI
	if not reset then
	    if #self:getCompletedMusicians()>0 then -- If player has completed any musicians
			self:pauseMusic(self.loopPaused,true) -- Display play/pause button
		end
		uiAddWindow(-1,5,{title="",default=""},nil,0,0,1.0,false) -- Show "music on" notice
	end
end

function Player:saveData()
	local data = dataHan.encodeData(self.progress)
	self.dataFile = dataHan.setModuleData(self.dataFile, "MUS", data)

	print(self.dataFile)
	printt(self.progress)

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

	self:handleNear(self.x, self.y, self.vx, self.vy)
end

function Player:handleNear(x, y, vx, vy)
	self:setOverlay()

	if self.onDialog then
		local npc = self.onDialog.Npc
		if self.onDialog.distHide and math.distance(x, y, npc.x, npc.y) > 75 then
			self:closeDialog()
		end
	end


	do
		local ins3rd = (self:getData("ins") == 3)

		if ins3rd and ((x > 0 and x < 275) and (y > 940)) then
			ui.addClickable(1, 50, 937, 190, 98, self.name, "instrumentWindow", false)
		else
			self:showInstruments(false)
			ui.removeClickable(1, self.name)
		end

		local cond = ins3rd and self.seekingInstrument.holdingIt
		if cond and ((x > 700 and x < 975) and (y > 1050)) then
			ui.addClickable(2, 730, 1030, 215, 80, self.name, "sheetsWindow", false)
		else
			ui.removeClickable(2, self.name)
			self:showSheets(false)
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
			seeking.instrumentName = nil
			seeking.searchingName = instrumentName
			seeking.holdingIt = holdOv or false
			seeking.npcName = instrument.Npc

			seeking.tries = 3
			seeking.spriteId = -1
		else
			seeking.sprite = instrument.sprite
			seeking.instrumentName = instrumentName
		end

		self:setIconDisplay({
			[1] = {
				type = "instrument",
				active = not not hold
			},
			[2] = {
				type = "sheet",
				active = false
			},
			[3] = {
				type = "tune",
				active = false
			}
		})

		if hold then
			self:holdInstrument(instrumentName)
		end

		if hideShow then
			self:showInstruments(false)
		end
	end
end

function Player:setSheet(npcName)
	local seeking = self.seekingInstrument

	if seeking.holdingIt then
		if npcName == false then
			seeking.sheet = nil
		elseif npcName then
			seeking.sheet = npcList[npcName].instrument.keyName
			self:showSheets(false)
		end

		self:setIconDisplay({
			[1] = {
				type = "instrument",
				active = true
			},
			[2] = {
				type = "sheet",
				active = not not npcName
			},
			[3] = {
				type = "tune",
				active = false
			}
		})

		return seeking.sheet == seeking.searchingName
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
				if self:setSheet() then
					-- This was causing a crash so I changed it to pass the table
					self:showTuning(Musician.instrument)
					-- Call onCorrectTuning() if the player tunes correctly

					wrongAttempt = false
				else
					if showDialog then
						printfd("Dialog -2")
						self:newDialog(npcName, -2)
					end

					wrongAttempt = true
				end

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
				tfm.exec.chatMessage(styles.chat:format("(╯°□°)╯︵ ┻━┻"), self.name)
			end
		end

		retval = not wrongAttempt
	end

	self:getInstrumentsLeft()

	return retval
end

function Player:hideTuning()
    ui.removeTextArea(101,self.name)
    for i=1,#noteColors do
		ui.removeTextArea(200+i,self.name)
	end
	for i,v in ipairs(self.notesList) do
	    ui.removeTextArea(v.tid,self.name)
	end
	self.notesList={}
	if self.tuningImg then
	    tfm.exec.removeImage(self.tuningImg)
	    self.tuningImg=nil
	end
	for i,v in ipairs(self.restImgs) do
	    tfm.exec.removeImage(v)
	end
	self.restImgs={}
	self.currentTuning=nil
	self.tuningIns=nil
	self.selectedNote=0
	self.isTuning=false
	self.finalNote=0

	tfm.exec.freezePlayer(self.name, false, false)
	tfm.exec.setPlayerGravityScale(self.name, 1.0, 0)
end
function Player:showTuning(ins)
    if ins then
        self:hideTuning()

        if not self.loopPaused then
            self:pauseMusic(true)
        end

		self.tuningImg=tfm.exec.addImage('1845bf63716.png','~100',400,225,self.name,1,1,0,1,0.5,0.5)
		local insName=getFormattedKey(ins.keyName)
		ui.addTextArea(101,('<p align="center"><font face="Baskerville,Baskerville Old Face,Hoefler Text,Garamond,Times New Roman,serif" color="#948C86" size="50"><U>%s</U></font></p>'):format(insName),self.name,400-(335/2),30,335,60,nil,nil,0,true)
		self.tuningIns=ins

		-- Bottom bar
		local bMargin=10
		local bx=bMargin/2
		local bCount=#noteColors
		local bWidth=800/(bCount)-bMargin
		local bHeight=(bWidth/4)
		for i,v in ipairs(noteColors) do
		    ui.addTextArea(200+i,('<p align="center"><font face="Baskerville,Baskerville Old Face,Hoefler Text,Garamond,Times New Roman,serif" color="#000000" size="20"><B>%s</B></font></p>'):format(tostring(i)),self.name,bx,(400-bHeight),bWidth,bHeight,v[1],(self.colorBlindMode and v[2] or 0x000001),1,true)
		    bx=bx+(bWidth+bMargin)
		end

		local tuning=ins.tuning

		if tuning then
		    local skip=0

			local x=252
			local topY=130
			local xDistance=14
			local yDistance=7.5
			for i,note in ipairs(tuning) do
			    if i>(6*self.tuningStage) then
			        break
			    end

			    if note>0 then
			        local y=topY+(yDistance*(note-1))
					local c=noteColors[note]
					ui.addTextArea(102+i,'',self.name,x,y,0,0,c[1],(self.colorBlindMode and v[2] or 0x000001),1,true)
					-- This line ^ crashes the module if the colorblind mode is enabled
					--self.notesList[i]={id=102+i,x=x,y=y,color=c}
					table.insert(self.notesList,{id=note,pos=i,tid=102+i,x=x,y=y,color=c})
					self.finalNote=i
				else
				    -- Rest
				    local y=topY+(yDistance*3)
				    local rx=x
					if skip==0 then
						local img
						if tuning[i+1] and tuning[i+1]==0 then -- If there's one rest after this one
						    if tuning[i+2] and tuning[i+2]==0 then -- If there's two rests after this one
						        img='1845f719acd.png' -- Dotted half rest (3 beats)
								skip=2
								rx=rx+xDistance
						    else
								img='1845f4fe106.png' -- Half rest (2 beats)
								skip=1
								rx=rx+(xDistance/2)
							end
						else -- If there's 0 rests after this one
						    img='1845f3cf78c.png' -- Quarter rest (1 beat)
							rx=rx+3
						end
						if img then
							local imgid=tfm.exec.addImage(img,'~101',rx,y,self.name,0.9,0.9,0,1,0.5,0.5)
							table.insert(self.restImgs,imgid)
						end
					else
						skip=skip-1
					end
				end
				x=x+xDistance
			end

			self.currentTuning=tuning
			self.isTuning=true

			tfm.exec.freezePlayer(self.name, true, false)
			tfm.exec.setPlayerGravityScale(self.name, 0, 0)
			local npcName = ins.keyName == "voice" and "diva" or ins.Npc
			tfm.exec.movePlayer(self.name, npcList[npcName].xPosition, self.y, false, 0, 0, false)
		else
		    print(('Error: Add tuning for instrument %s'):format(ins.keyName))
		    return
		end
	end
end

function Player:selectNote(noteID,hideOthers)
    hideOthers=(not not hideOthers)
    if self.selectedNote>0 then -- Deselect current note
        local note=self.notesList[self.selectedNote]
        if note then
			ui.addTextArea(note.tid,'',self.name,note.x,note.y,0,0,note.color[1],note.color[2],1,true)
			self.selectedNote=0

		else
		    print(('Error: self.selectedNote is invalid (%s)'):format(tostring(noteID)))
		end
    end

    if noteID then
		local note=self.notesList[noteID]
		if note then
			ui.addTextArea(note.tid,'',self.name,note.x,note.y,0,0,0xFFFFFF,0x000001,1,true)
			self.selectedNote=noteID

			if hideOthers then
			    for i,v in ipairs(self.notesList) do
			        if i~=noteID then
						ui.removeTextArea(v.tid,self.name)
					end
				end
			end

		else
		    print(('Error: Invalid note passed to selectNote (%s)'):format(tostring(noteID)))
		end
	end
end

function Player:onCorrectTuning()
	local npcName = self.seekingInstrument.npcName
	local instrumentName = self.seekingInstrument.instrumentName
	if self:getData("ins") == 7 then
		self:setInstance(8)
	else
		self:setData(npcName, 3, true)
		self:newDialog(npcName, 2)
		self:releaseInstrument()
		self:getInstrumentsLeft()
		self:setInstrumentSound(npcName,true) -- Add new sound to loop
		self:pauseMusic(self.loopPaused,true) -- Display play/pause button
	end
end

function Player:isMusicianCompleted(npc)
    if npc and self.progress[npc.keyName] then
        if self.progress[npc.keyName]>1 then
            return true
        end
    end
    return false
end
function Player:isInstrumentCompleted(insName)
    local npc=getCharacterByInstrumentName(insName)
    return self:isMusicianCompleted(npc)
end
function Player:getCompletedMusicians()
    print('getCompletedMusicians')
    local t={}
    for i,v in pairs(npcList) do
        if self:isMusicianCompleted(i) then
            table.insert(t,i)
        end
    end
    print(t)
    return t
end

function Player:getInstrumentsLeft()
	local count = 20

	local pat = "m%d"
	for i=1, 20 do
		if self.progress[pat:format(i)] >= 2 then
			count = count - 1
		end
	end

	self.instrumentsLeft = count

	if self.instrumentsLeft <= 0 then
		self:setInstance(4)
	end

	return count
end

function Player:holdInstrument(instrumentName)
	local seeking = self.seekingInstrument

	if seeking.holdingIt then
		self:releaseInstrument(true)
	end

	local Ins = instrumentList[instrumentName]

	seeking.sprite = Ins.sprite
	seeking.instrumentName = instrumentName

	self:setInstrumentHolding(true, self.isFacingRight, self.isMoving)

	seeking.holdingIt = true
end

function Player:setInstrumentHolding(display, isFacingRight, isMoving)
	local seeking = self.seekingInstrument

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
			seeking.sprite,
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

function Player:releaseInstrument(onlyHold)
	local seeking = self.seekingInstrument
	onlyHold = not not onlyHold

	self:setInstrumentHolding(false)

	seeking.holdingIt = false
	seeking.instrumentName = nil
	seeking.sprite = nil
	seeking.spriteId = -1

	if not onlyHold then
		seeking.onIt = false
		seeking.searchingName = nil
		seeking.npcName = nil
	end

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
				if instrumentName ~= "voice" then
					counter = counter + 1
					self.viewingInstruments[counter] = counter
					ui.addClickable(counter, Ins.tdx, Ins.tdy, Ins.txs, Ins.tys, self.name, "ins-".. (Ins.Npc or "m1"), true)
					print(Ins.Npc)
				end
			end
		else
			if self.viewingInstruments then
				uiRemoveWindow(1, self.name)
				for index, id in next, (self.viewingInstruments or {}) do
					ui.removeClickable(id, self.name)
				end

				self.viewingInstruments = nil
			end
		end
	end

	if show == nil then
		if not self.viewingInstruments then
			self:showInstruments(true)
		end

		-- update
	end
end

function Player:showSheets(show)
	if show ~= nil then
		if show then
			if self.viewingSheets then
				self:showSheets(false)
			end

			self.viewingSheets = {}
			uiAddWindow(11, 3, {title = "", default=""}, self.name, 0, 0, 1.0, false)

			ui.addTextArea(
				750,
				styles.dialogue:format(("<p align='center'>%s</p>"):format(translate("instruct scorepile"))),
				self.name,
				220, 55,
				360, 50,
				0x0, 0x0,
				1.0, true
			)
			if not self.sheetCoords then
				self.sheetCoords = {}
			end
			local ta
			local counter = 0
			local instruments = translate("instruments", self.language, nil)
			for instrumentName, Ins in next, instrumentList do
				if instrumentName ~= "voice" then
					counter = counter + 1
					self.viewingSheets[counter] = counter
					if not self.sheetCoords[instrumentName] then
						ta = {}
						ta.x = 228 + (((counter - 1)%4) * 115) - 75
						ta.y = 125 + ((math.ceil(counter / 4) - 1) * 45)

						self.sheetCoords[instrumentName] = ta
					else
						ta = self.sheetCoords[instrumentName]
					end

					ui.addTextArea(
						750 + counter,
						styles.refdlg:format(Ins.Npc .. "-sheet", ("<font size='14'><p align='center'>%s</p></font>"):format(instruments[instrumentName][1])),
						self.name,
						ta.x, ta.y,
						150, 0,
						0x0, 0x0,
						1.0, true
					)
					--ui.addClickable(counter, Ins.tdx, Ins.tdy, Ins.txs, Ins.tys, self.name, "ins-".. (Ins.Npc or "m1"), true)
					--print(Ins.Npc)
				end
			end
		else
			if self.viewingSheets then
				uiRemoveWindow(11, self.name)

				for index, _ in next, (self.viewingSheets or {}) do
					ui.removeTextArea(750 + index, self.name)
				end

				ui.removeTextArea(750, self.name)

				self.viewingSheets = nil
			end
		end
	end

	if show == nil then
		if not self.viewingSheets then
			self:showSheets(true)
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


function Player:newDialog(npcName, dialogId, noDist)
	if self.onDialog then
		self:closeDialog()
	end

	if self.showingPuzzle or self.isTuning then return end

    local Npc = npcList[npcName]
	if not Npc then return end
    local dialog = dialogId or self:getData(npcName) or 1

	printfd("Dialog ID: %d\tLanguage: %s", dialog, self.language:upper())
	local textInfo = Npc:getDialog(dialog, self.language, self.gender)

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
		sprite = Npc.dialogSprite,
		distHide = not noDist
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
			local text
			if self.language == "ar" or self.language == "he" then
				text = styles.dialogue:format(("<p align='right'>%s"):format(Dialog.displayText or Dialog.currentText))
			else
				text = styles.dialogue:format(Dialog.displayText or Dialog.currentText)
			end

			ui.updateTextArea(
				Dialog.directAccess,
				text,
				self.name
			) -- Update text

			tfm.exec.playSound("transformice/son/fleche.mp3", 80, nil, nil, self.name) -- tfmadv/sel.mp3

			if Dialog.finished then
				self:onDialogFinished()
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

					self:onDialogFinished()
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

function Player:onDialogFinished()
	local Dialog = self.onDialog

	if Dialog then
		Dialog.finished = true
		local x, y, ts = 600, 357, 0x0
		local o1, o2
		local showOpts = false
		if (Dialog.Npc.key:match("m%d+") and Dialog.pInf == 1) then
			o1 = "search"
			o2 = "discard"

			showOpts = true
		elseif Dialog.Npc.key == "diva" then
			if Dialog.pInf >= 2 and Dialog.pInf <= 5 then
				o1 = "continue"
				o2 = "cancel"

				if Dialog.pointer == #Dialog.Text then
					showOpts = true
				end
			end
		end

		if showOpts then
			if not self.seekingInstrument.onIt then
				ui.addTextArea(
					Dialog.directAccess + 1,
					styles.refdlg:format(Dialog.Npc.key .. "-" .. o1, translate("instruct " .. o1, self.language, self.gender)),
					self.name,
					x - 50, y,
					100, 0,
					ts, ts,
					0.4, true
				)
			end

			ui.addTextArea(
				Dialog.directAccess + 2,
				styles.refdlg:format(Dialog.Npc.key .. "-" .. o2, translate("instruct " .. o2, self.language, self.gender)),
				self.name,
				x + 50, y,
				100, 0,
				ts, ts,
				0.4, true
			)
		else
			if Dialog.timerId then
				Timer.remove(Dialog.timerId)
			end
			Dialog.timerId = Timer.new(5000, false, function()
				self:setDialogDisplay("next")
			end)
		end
	end
end

function Player:closeDialog()
	local Dialog = self.onDialog
    if Dialog then
		for i=0, 2 do
			ui.removeTextArea(Dialog.directAccess + i, self.name)
        end
		tfm.exec.removeImage(Dialog.directAccess - 2000, true)

		self:onDialogClosed(Dialog.Npc.key, Dialog.pInf)
    end

	self.onDialog = false
end

function Player:onDialogClosed(npcName, pid)
	if npcName == "cond" then
		if pid == 1 then
			self:setInstance(2)
		elseif pid == 3 then
			if self:getData("ins") == 4 then
				self:finishLevel(1)
				self:setData("diva", 2)
			end
		elseif pid == 4 then
			if self:getData("ins") == 8 then
				self:finishLevel(3)
				self:setInstance(9)
			end
		end
	elseif npcName == "diva" then
		if pid == 2 then
			self:setInstance(5)
		elseif pid == 4 then
			if self:getData("ins") == 6 then
				self:finishLevel(2)
				self:setInstance(7)
			end
		end
	else
		if pid == 1 then
			if self:getData("ins") < 3 then
				self:setInstance(3)
			end
		end
	end
end

function Player:npcInteraction(npcName, x, y, args)
	local Npc = npcList[npcName]

	if Npc then
		if args and #args > 0 then
			if npcName == "diva" then
				if self.onDialog then
					local pid = self.onDialog.pInf
					if args[1] == "continue" then
						if pid >= 2 and pid <= 3 then -- Microphone
							self:initPuzzle(true)
						elseif pid >= 4 and pid <= 5 then -- Piano
							-- Is this the right place to start the puzzle?
							-- To start the performing, yes
							self:showTuning(instrumentList["voice"])
						end
					end

					self:closeDialog()
				end
			else
				if args[1] == "search" then
					self:setInstrument(Npc.instrument.keyName)
					self:closeDialog()
				elseif args[1] == "discard" then
					self:releaseInstrument()
					self:closeDialog()
				elseif args[1] == "sheet" then
					self:setSheet(npcName)
				end
			end
		else
			x = x or self.x
			y = y or self.y
			if math.distance(x, y, Npc.xPosition, Npc.yPosition) < npcTalkDist then
				local seeking = self.seekingInstrument
				local success
				if seeking.holdingIt and Npc.instrument then
					success = self:giveNpcInstrument(npcName, true)
				end

				if success == nil then
					if seeking.onIt and Npc.instrument then
						if seeking.instrumentName == Npc.instrument.keyName then
							self:newDialog(npcName, 1)
						else
							self:newDialog(npcName, 0)
						end
					else
						self:newDialog(npcName)
					end
				end

				return true
			end
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
		dy = 95, -- "",
		scale = 1.0,
		selected = nil -- Index Id
	}

	local images = {
		"18428f8b41c.png",	"18428f928d6.png",	"18428f9acdf.png",
		"18428fa65e5.png",	"18428fb1459.png",	"18428fba384.png",
		"18428fd5736.png",	"18428fe522f.png",	"18428ff2a9d.png"
	}

	local rand
	local isValidPuzzle = false
	repeat
		rand = {}
		for i=1, 9 do
			table.insert(rand, math.random(i), i)
		end

		do
			local inversions = 0
			local a, b
			for i=1, 9 do
				for j = i + 1, 9 do
					a = rand[i]
					b = rand[j]
					if (a ~= 9 and b ~= 9) and a > b then
						inversions = inversions + 1
					end
				end
			end

			isValidPuzzle = ((inversions % 2) == 0)

			printfd("Inversions: %d, valid?: %s", inversions, tostring(isValidPuzzle))
		end


	until isValidPuzzle

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
			dy = 120 + ((y - 1) * (594 * scale)),
			size = 595.5 * scale,
			scale = scale
		}
	end

	self.puzzle = pz

	if display then
		self:showPuzzle(true)
	end

	tfm.exec.freezePlayer(self.name, true, false)
	tfm.exec.movePlayer(self.name, npcList.diva.xPosition + 20, self.y, false, 0, 0, true)
end

function Player:deletePuzzle()
	if self.puzzle then
		self:showPuzzle(false)

		self.puzzle = false
	end

	tfm.exec.freezePlayer(self.name, false, false)
end

function Player:showPuzzle(show)
	local pz = self.puzzle
	if not pz then return end

	if not show then
		uiRemoveWindow(12, self.name)
		ui.removeTextArea(82, self.name)
		--pz.imageId = tfm.exec.removeImage(pz.imageId, false)
		for i = 1, 9 do
			self:displayPuzzleTile(i, false)
		end
	end

	if show then
		uiAddWindow(12, 3, {title = "", default=""}, self.name, 0, 0, 1.0, false)
		ui.addTextArea(
			82,
			styles.dialogue:format(("<p align='center'>%s</p>"):format(translate("instruct microphone", self.language, self.gender))),
			self.name,
			220, 55,
			360, 50,
			0x0, 0x0,
			1.0, true
		)
		--pz.imageId = tfm.exec.addImage(pz.sprite, ":1", 400, 210, self.name, pz.scale, pz.scale, 0, 1.0, 0.5, 0.5, false)

		local tl
		for i=1, 9 do
			self:displayPuzzleTile(i, true)
		end
	end

	self.showingPuzzle = not not show
end

function Player:displayPuzzleTile(id, display)
	local tl = self.puzzle[id]

	do
		if tl.imageId then
			tl.imageId = tfm.exec.removeImage(tl.imageId, not self.puzzle.completed)
		end
		ui.removeClickable(500 + id, self.name)
	end

	if display then
		do--if tl.id ~= 9 or self.puzzle.completed then
			tl.imageId = tfm.exec.addImage(tl.sprite, "~2", tl.dx, tl.dy, self.name, tl.scale, tl.scale, 0, tl.id == 9 and 0.33 or 1.0, 0, 0, false)
		end
		ui.addClickable(500 + id, tl.dx, tl.dy, tl.size, tl.size, self.name, "puzzle-" .. id, true)
	end
end

function Player:selectPuzzleTile(id)
	local pz = self.puzzle
	local old = pz.selected
	local okMove = false



	if old ~= id and (old and id) then
		printfd("old: %d, id: %d", old, id)

		if pz[id].id == 9 then -- Empty tile (movement)
			local dif = id - old

			if (math.abs(dif) == 1) then -- X
				if math.ceil((old + dif) / 3) == math.ceil(old / 3) then
					okMove = true
				end
			elseif math.abs(dif) == 3 then
				okMove = true
			end

			printfd("dif: %d, okMove: %s", dif, tostring(okMove))

			if okMove then
				if self:movePuzzleTile(old, id) then
					tfm.exec.playSound("cite18/bouton1.mp3", 80, nil, nil, self.name)
					self.puzzle.selected = nil
				else
					tfm.exec.playSound("transformice/son/dash.mp3", 80, nil, nil, self.name)
				end
			end
		end
	end

	pz.selected = id
end

function Player:movePuzzleTile(from, to)
	do
		local pz = self.puzzle
		local fr = pz[from]
		local t = pz[to]

		local aux = {}

		if t.id == 9 and fr.id ~= 9 then

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
				pz.completed = true

				self:displayPuzzleTile(9, true)
				self:setInstance(6)
				Timer.new(2000, false, function()
					self:deletePuzzle()
					self:newDialog("diva", 4, true)
				end)

				tfm.exec.playSound("deadmaze/niveau/gain_niveau.mp3", 80, nil, nil, self.name)
			end

			return true
		end
	end

	return false
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

function Player:setInstrumentSound(npcName, add) -- Add: true=add,false=remove,nil=toggle
	local Npc = npcList[npcName]
	if not Npc then return end

	local soundName = Npc.instrument and Npc.instrument.sound or nil
	if not soundName then return end

	if add == nil then
		self:setInstrumentSound(npcName, not self:isPlayingSound(soundName))
	else
		if add then
			self:addSoundLoop(soundName)
		else
			self:removeSoundLoop(soundName)
		end
	end
end

function Player:setIconDisplay(icons)
	-- remove
	if self.icons then
		for index, iconId in ipairs(self.icons) do
			tfm.exec.removeImage(iconId, false)
			ui.removeClickable(250 + index)
		end
	end

	self.icons = {}

	if icons then
		local scale = 0.25
		local x = 765
		local y
		local Icon
		for index, iconInfo in ipairs(icons) do
			y = 25 + ((index - 1) * 35)
			Icon = iconList[iconInfo.type]
			self.icons[index] = tfm.exec.addImage(
				Icon.image, ":6",
				x, y,
				self.name,
				scale, scale,
				0, iconInfo.active and 1.0 or 0.67,
				0.0, 0.0,
				false
			)
			if Icon.callback then
				ui.addClickable(250 + index, x, y, 30, 30, self.name, "icon-" .. iconInfo.type, true)
			end
		end
	end
end

function Player:setInstance(id)

	-- pls dont laugh at me im learning from yanderedev
	    -- LMAO absolutely unreadable

	if id == 1 then -- Module Start
		for i=1, 20 do
			self:setData("m" .. i, 0) -- "..."
		end

		self:setData("cond", 1)
		self:setData("diva", 1)
		self:setIconDisplay({{type = "def", active = false}})
	elseif id == 2 then -- Instrument quest starts
		for i=1, 20 do
			self:setData("m" .. i, 1) -- riddle
		end
		self:setData("diva", 1)
		self:setData("cond", 2)

		self:setIconDisplay({
			[1] = {
				type = "instrument",
				active = false
			}
		})
		self:setIconDisplay({{type = "def", active = false}})
	elseif id == 3 then -- Instrument quest active
		local mn
		for i=1, 20 do
			mn = "m" .. i
			if self:getData(mn) ~= 3 then
				self:setData(mn, 1) -- riddle
			end
		end

		self:setData("diva", 1)
		self:setData("cond", 2)
		self:setIconDisplay({{type = "def", active = false}})
	elseif id == 4 then -- Instrument quest finished
		for i=1, 20 do
			self:setData("m" .. i, 2) -- "ready"
		end
		self:setData("diva", 1)
		self:setData("cond", 3) -- This dialogue activates Diva's one
		self:setIconDisplay({{type = "puzzle", active = false}})
	elseif id == 5 then -- Microphone quest starts
		for i=1, 20 do
			self:setData("m" .. i, 2) -- "ready"
		end
		self:setData("diva", 3)
		self:setData("cond", 3)
		self:setIconDisplay({{type = "puzzle", active = true}})
	elseif id == 6 then -- Microphone quest finished
		self:finishLevel(2)
		for i=1, 20 do
			self:setData("m" .. i, 2) -- "ready"
		end
		self:setData("diva", 4)
		self:setData("cond", 3)
		self:setIconDisplay({{type = "piano", active = false}})
	elseif id == 7 then -- Piano quest starts
		for i=1, 20 do
			self:setData("m" .. i, 2) -- "ready"
		end
		self:setData("diva", 5)
		self:setData("cond", 3)
		self:setIconDisplay({{type = "piano", active = true}})
	elseif id == 8 then -- Piano quest finished
		for i=1, 20 do
			self:setData("m" .. i, 4) -- "hero"
		end
		self:setData("diva", 6)
		self:setData("cond", 4)
		self:setIconDisplay(false)
	elseif id == 9 then -- Event finished (spectating orchestra)
		for i=1, 20 do
			self:setData("m" .. i, 0) -- "..."
		end
		self:setData("diva", 0)
		self:setData("cond", 0)
		self:setIconDisplay({{type = "end", active = true}})
		tfm.exec.playMusic("lua/music_event/final_track.mp3", "main", 80, false, true, self.name)
		Timer.new(134000, false, function() -- For some reason this isn't working and it's not throwing any error
			local player = playerList[self.name] -- There's a workaround in eventLoop, however it would be nice to work here too
			if player then
				player:setInstance(10)
			end
		end)
	end


	if id ~= 10 then -- Orchestra finished
		self:setData("ins", id, true)
	else
		self:finishLevel(4)
	end
end

function Player:finishLevel(levelId)
	levelId = levelId or self:getData("lev")
	--[[
	evt_music_orb
evt_music_item
evt_music_title_553
evt_music_golden_ticket_5 x5
evt_music_golden_ticket_25 x1
evt_music_golden_ticket_50 x1
shop: evt_music
	]]
	local pl = "le" .. levelId
	if not self:getData(pl) then
		if levelId == 1 then -- Instruments delivering & tuning
			system.giveEventGift(self.name, "evt_music_orb")
			system.giveEventGift(self.name, "evt_music_golden_ticket_50")
		elseif levelId == 2 then -- Diva's microphone fixing (puzzle)
			system.giveEventGift(self.name, "evt_music_item")
			system.giveEventGift(self.name, "evt_music_golden_ticket_5")
			system.giveEventGift(self.name, "evt_music_golden_ticket_5")
		elseif levelId == 3 then -- Diva's performance (piano)
			system.giveEventGift(self.name, "evt_music_title")
			system.giveEventGift(self.name, "evt_music_golden_ticket_25")
		end

		self:setData(pl, true)

			-- Always save to database when a level gets completed unless last one
		self:setData("lev", levelId + 1, levelId <= 3)

	end

	if self:getData("lev") >= 4 then -- Event has been completed
		local times = self:getData("times")
		if times >= 1 then
			for i=1, 3 do
				system.giveEventGift(self.name, "evt_music_golden_ticket_5")
			end
		end
		self:setData("times", times + 1, false)

		self:resetAllData()
	end
end

function Player:resetAllData()
	local times = self:getData("times")
	self.progress = {}
	self:init(nil, true)
	self:setData("times", times, true)
end

--[[
function Player:updatePing()
    self.pingTime = os.time()
    tfm.exec.addBonus(0, self.x, self.y, -1, 0, false, self.name)
end
]]