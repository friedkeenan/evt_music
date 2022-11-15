local leftStop = false

function eventNewGame()
	if not isEventLoaded then
		isEventLoaded = true

        ui.setMapName(styles.chat:format(translate("title", tfm.get.room.community)))
		ui.setBackgroundColor("#201200")
        tfm.exec.setGameTime(213) -- 3:30 (+ 3s)

		tfm.exec.addNPC("Dulce", {
			title = 126,
			look = "235;10_A38980,36_39322F+E9D1BC,0,0,65_E9D1BC+E9D1BC+E9D1BC+E9D1BC+D5A397+D5A397+E9D1BC+E9D1BC,99_53433D+53433D+53433D+53433D+53433D+E9D1BC+53433D,20_B99D8E+53433D,34,0",
			x = 240,
			y = 870,
			female = true,
			lookAtPlayer = true,
			interactive = true
		})

		--tfm.exec.playMusic("transformice/musique/m4.mp3", "background", 35, true, true, nil)
		tfm.exec.stopMusic('musique')
		Timer.new(1000, false, function() -- Stop existing background music
		    tfm.exec.stopMusic('musique')
		end)
	else
		return system.exit()
	end
end

function eventTalkToNPC(playerName, npcName)
	if leftStop then return end
	system.openEventShop("evt_music", playerName)
end

function eventNewPlayer(playerName)
	if not isEventLoaded then
		playerList[playerName] = Player.new(playerName)
		system.loadPlayerData(playerName)
	end
end

function eventPlayerDataLoaded(playerName, playerData)
	local player = playerList[playerName]
	if player then
		player:init(playerData)
	end
end

function eventFastLoop(dif) -- To do
	for _, player in next, playerList do
		if player.onDialog then
			player:updateDialog(2)
		end
	end
end

function eventLoop(elapsed, remaining)
	--eventFastLoop()

	Timer.handle()

	for playerName, player in next, playerList do
		local obj = tfm.get.room.playerList[playerName]
		if obj then
			player:updatePosition(obj.x, obj.y, obj.vx, obj.vy)


			if not player.loopPaused then
				for i,v in pairs(player.loopSounds) do
					local ins=getInstrumentBySoundName(v.sound)
					if ins then
						local npc=getCharacterByInstrumentName(ins.keyName)
						if npc then
							tfm.exec.displayParticle(33,npc.xPosition,(npc.yPosition-55),-player.vx/5,-player.vy/5,0,0,player.name)
						end
					end
				end
			end
			if player.finalePlaying then
				for i,npc in pairs(npcList) do
					tfm.exec.displayParticle(33,npc.xPosition,(npc.yPosition-55),-player.vx/5,-player.vy/5,0,0,player.name)
				end
			end
			if player.sheetMusicPlaying then
			    local startY=0
			    local count=9
			    local distance=(350/count)
			    local coords=player:screenSpaceToWorld(400,startY)
			    for i=1,count do
				    tfm.exec.displayParticle(33,(coords.x-215),coords.y+(distance*i),0,0,0,0,player.name)
				    tfm.exec.displayParticle(33,(coords.x+205),coords.y+(distance*i),0,0,0,0,player.name)
				end
			end
		end
	end
	local timeMargin = 5000
	if remaining < timeMargin and isEventLoaded then
		if not debugMode then
			if not leftStop then
				for playerName, player in next, playerList do
					tfm.exec.freezePlayer(playerName, true, true)

					--[[if player:getData("ins") == 9 then
						player:setInstance(10)
					end]]
				end
			end
			leftStop = true

			if remaining <= 0 then
				-- Kill event
				system.exit()
			end
		else
			if remaining > (timeMargin - 1000) then
				tfm.exec.chatMessage("<R>WARNING !</R> <J>The event is on <r><b>debugMode</b></R>!!</J>")
			end
		end
	else
		if not debugMode then
			if leftStop then
				for playerName, player in next, playerList do
					tfm.exec.freezePlayer(playerName, false, false)
				end
				leftStop = false
			end
		end
	end
end

function eventKeyboard(playerName, key, down, x, y, vx, vy)
	if leftStop then return end
	local player = playerList[playerName]

	if player then
		player.keys[key] = down

		local facing, moving
		if key < 4 then
			if key % 2 == 0 then
				moving = down
				facing = (key == 2)
			end

			if key == 1 then
				moving = down
			end
		end

		player:updatePosition(x, y, vx, vy, facing, moving)

		if down then
			if player.onDialog then
				if key == 32 then
					player:updateDialog(0)
				end
			else
				if key == 3 or key == 32 then
					player:interactWithNpc(x, y)

				elseif ((key>=49 and key<=55) or (key >= 97 and key <= 103)) and player.isTuning and not player.sheetMusicPlaying then -- Tuning
					local noteID= key - (key < 60 and 48 or 96)
					if player.selectedNote<=#player.notesList then
						local newNote=player.notesList[player.selectedNote+1]
						--if newNote then print(('%s==%s: %s'):format(tostring(newNote.id),tostring(noteID),tostring(newNote.id==noteID))) end

						if newNote and newNote.id==noteID then -- Correct note
						    local isFirstNote=(player.selectedNote==0)
							player:selectNote(player.selectedNote+1,isFirstNote) -- Select next note

							player:playSound('deadmaze/journal_ouverture.mp3')

							if newNote.pos==player.finalNote then -- Finished tuning stage
								player.sheetMusicPlaying=true
								Timer.new(500,false,function(playerName)
								    local _player = playerList[playerName]
								    if _player then
										_player:selectNote() -- Deselect note
										--tfm.exec.chatMessage(('Tuning stage %s complete'):format(player.tuningStage),player.name)
										local length=beatLength*(6*_player.tuningStage)
										_player:playMusicLength(length,_player.tuningIns.sound,100,100,false,false)

										if _player.tuningIns.keyName=='voice' then -- If voice, accompany with piano
											_player:playMusicLength(length,instrumentList['piano'].sound,101,100,false,false)
										end
										Timer.new(length + 300, false, function()
											if _player.tuningStage<4 then
												_player.tuningStage=_player.tuningStage+1
												_player:showTuning(_player.tuningIns)
											else -- Finished tuning
												_player:hideTuning()
												_player:onCorrectTuning()
											end

											_player.sheetMusicPlaying=false
										end)
									end
								end, player.name)
							end
						else -- Wrong note
							player:playSound('cite18/boule-acier.mp3')
							player:playSound('x_impact_joueur_2.mp3',50)
							player:selectNote(1,true) -- Hide notes except first
							player:selectNote() -- Deselect first note
						end
					end
				end
		    end
		end
	end
end

function eventPlayerLeft(playerName)
	playerList[playerName] = nil
end

function eventMouse(playerName, x, y)
	local player = playerList[playerName]
	if leftStop then return end

	if player then
		if player.viewingInstruments then
			player:showInstrumets(false)
		elseif player.isTuning then
			player:hideTuning()
		end
	end
end

function eventTextAreaCallback(textAreaId, playerName, eventName)
	if leftStop then return end
	local Window = textAreaHandle[textAreaId]
	local player = playerList[playerName]

	print(eventName)
	local args = {}
	for arg in eventName:gmatch("[^%-]+") do
		args[#args + 1] = tonumber(arg) or arg
	end
	printt(args)

	local eventCommand = table.remove(args, 1)

	if not player then return end
	if Window then
		eventWindowCallback(Window, playerName, eventCommand)
	else

		if npcList[eventCommand] then
			local Npc = npcList[eventCommand]
			local interaction = player:npcInteraction(eventCommand, nil, nil, args)

			if not interaction and not player.loopPaused and player:isMusicianCompleted(eventCommand) then
				player:setInstrumentSound(eventCommand, nil)
			end
		elseif eventCommand == "instrumentWindow" then
			if player:getData("ins") == 3 then
				do -- if player.seekingInstrument.onIt then
					player:showInstruments()
				end
			end
		elseif eventCommand == "sheetsWindow" then
			if player.seekingInstrument.holdingIt and player:getData("ins") == 3 then
				player:showSheets()
			end
		elseif eventCommand == "ins" then
			player:setInstrument(npcList[args[1]].instrument.keyName, true, true)
		elseif eventCommand == "toggle_pause" then
		    player:pauseMusic(not player.loopPaused)
		elseif eventCommand == "puzzle" then
			if tonumber(args[1]) then
				player:selectPuzzleTile(args[1])
			end
		elseif eventCommand == "icon" then
			iconList[args[1]].callback(player)
		elseif eventCommand == "hideTuning" then
			player:hideTuning()
		end
	end
end

function eventWindowCallback(windowId, playerName, eventName)
	if leftStop then return end
	local player = playerList[playerName]
	if eventName == "close" then
		if windowId == 1 then
			player:showInstruments(false)
		elseif windowId == 11 then
			player:showSheets(false)
		elseif windowId == 12 then
			player:deletePuzzle()
		else
			uiRemoveWindow(windowId, playerName)
		end
	end
	-- ...
end

function eventWindowDisplay(windowId, playerName, Window)
	local Player = playerList[playerName]

	if Player then
		Player:newWindowDisplay(windowId)

		Player.windowHandle.timestamp = currentTime() + 500
	end
end


function eventWindowHide(windowId, playerName, Window)
	local Player = playerList[playerName]

	if Player then
		Player:deleteWindowDisplay(windowId)
	end
end

function eventChatCommand(playerName, message)
	if leftStop then return end
	--if not admins[playerName] then return end
	local player = playerList[playerName]
	if not player and not admins[playerName] then return end -- If player doesn't exist and the player isn't on admin list (just so we can use !join)

	local args = {}
	local val
	local command

	for arg in message:gmatch("%S+") do
		if (arg == "true" or arg == "false") then
			val = (arg == "true")
		else
			val = tonumber(arg) or arg
		end
		args[#args + 1] = val
	end

	command = table.remove(args, 1)

	local answer = function(msg)
		tfm.exec.chatMessage(tostring(msg), playerName)
	end

	if admins[playerName] then
		if command == "admin" then
			for i=1, #args do
				admins[args[i]] = true
				answer(args[i] .. "has been set as admin.")
			end
		elseif command == "join" then
			if not player then
				playerList[playerName] = Player.new(playerName)
				system.loadPlayerData(playerName)
				tfm.exec.respawnPlayer(playerName)

				answer("Joining to the event...")
			else
				answer("You already exist")
			end
		elseif command == "setIns" then
			player:releaseInstrument()
			player:setInstrument(args[1], true, true)
			answer(("Setting '%s' as your instrument"):format(args[1] or""))
			answer(("%s exists? %s"):format(args[1] or "!", tostring(not not instrumentList[args[1]])))
			if args[2] then
				player:setSheet(instrumentList[args[1]] and instrumentList[args[1]].Npc or false)
			end
		elseif command == "allIns" then
			for npcName, Npc in next, npcList do
				if npcName:match("m%d+") then
					player:setData(npcName, 3)
				end
				player:getInstrumentsLeft()
			end
			answer("Giving all instruments to Musicians")
		elseif command == "showtuning" then
			if #args==1 and instrumentList[args[1]] then
				player:showTuning(instrumentList[args[1]])
			else
				player:hideTuning()
			end
		elseif command == "particles" then
			player.sheetMusicPlaying=not player.sheetMusicPlaying
		elseif command == "selectnote" then
			if #args==1 and tonumber(args[1]) then
				player:selectNote(args[1])
			else
				player:selectNote()
			end
		elseif command == "save" then
			player:saveData()
			answer("Your data has been saved")
		elseif command == "get" then
			local p
			if #args == 2 then
				p = playerList[args[2]] or player
			else
				p = player
			end
			answer(p:getData(args[1]))
		elseif command == "set" then
			local p
			if #args == 3 then
				p = playerList[args[3]] or player
			else
				p = player
			end
			player:setData(args[1], args[2])
		elseif command == "removealldata" then
			player:resetAllData()
			answer("Data removed")
		elseif command == "instance" then
		    if args[1]~=nil then
				player:setInstance(args[1])
				answer("Instance set as " ..  (args[1] or "?"))
			else
			    answer("Instance: "..tostring(player:getData("ins") or "?"))
			end
		elseif command == "ping" then
			answer(tostring(tfm.get.room.playerList[player.name].averageLatency))
		elseif command == "sheets" then
			player:showSheets()
		elseif command == "lang" then
			player.language = args[1] or "en"
			answer("Language changed to " .. player.language:upper())
		elseif command == "dialog" then
			if #args >= 2 then
				player:newDialog(args[1], args[2])
			end
		elseif command == "playbutton" then
		    player:pauseMusic(player.loopPaused,true) -- Display play/pause button
		elseif command == "goto" then
			local Npc = npcList[args[1]]
			if Npc then
				tfm.exec.movePlayer(playerName, Npc.xPosition, Npc.yPosition, false)
			end
		elseif command == "time" then
			tfm.exec.setGameTime(args[1], true)
			answer("Time set to " .. args[1] .. " seconds.")
		end
	end

	if command == "colorblind" or command == "cb" then
		player.colorBlindMode=(not player.colorBlindMode)
		answer('Colorblind mode '..(player.colorBlindMode and 'on' or 'off'))
	end
end

--[[
function eventPlayerBonusGrabbed(playerName,id)
    local player = playerList[playerName]
    if player then
        if id==-1 then
			player.currentPing=(os.time()-player.pingTime)-30
			--print('Ping: '..tostring(player.currentPing))
		end
    end
end
]]