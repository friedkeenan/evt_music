function eventNewGame()
	if not isEventLoaded then
		isEventLoaded = true

        ui.setMapName("Music Orchestra !")
		ui.setBackgroundColor("#201200")
        tfm.exec.setGameTime(150)

		tfm.exec.addNPC("Dulce", {
			title = 126,
			look = "235;10_A38980,36_39322F+E9D1BC,0,0,65_E9D1BC+E9D1BC+E9D1BC+E9D1BC+D5A397+D5A397+E9D1BC+E9D1BC,99_53433D+53433D+53433D+53433D+53433D+E9D1BC+53433D,20_B99D8E+53433D,34,0",
			x = 240,
			y = 870,
			female = true,
			lookAtPlayer = true,
			interactive = true
		})
	else
		return system.exit()
	end
end

function eventTalkToNPC(playerName, npcName)
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
		player:updatePosition(obj.x, obj.y, obj.vx, obj.vy)


		if not player.loopPaused then
			for i,v in pairs(player.loopSounds) do
				local ins=getInstrumentBySoundName(i)
				if ins then
					local npc=getCharacterByInstrumentName(ins.keyName)
					if npc then
						tfm.exec.displayParticle(33,npc.xPosition,(npc.yPosition-55),-player.vx/5,-player.vy/5,0,0,player.name)
					end
				end
			end
		end
	end

	if remaining < 0 then
		--tfm.exec.chatMessage("system.exit()")
	end
end

function eventKeyboard(playerName, key, down, x, y, vx, vy)
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
				end
			end
		end
	end
end

function eventMouse(playerName, x, y)
	local player = playerList[playerName]

	if player then
		if player.viewingInstruments then
			player:showInstrumets(false)
		end
	end
end

function eventTextAreaCallback(textAreaId, playerName, eventName)
	local Window = textAreaHandle[textAreaId]
	local player = playerList[playerName]

	local args = {}
	for arg in eventName:gmatch("[^%-]+") do
		args[#args + 1] = tonumber(arg) or arg
	end

	local eventCommand = table.remove(args, 1)

	if not player then return end
	if Window then
		eventWindowCallback(Window, playerName, eventCommand)
	else

		if npcList[eventCommand] then
			local Npc = npcList[eventCommand]
			local interaction = player:npcInteraction(eventCommand, nil, nil, args)

			if not interaction then
				player:setInstrumentSound(eventCommand, nil)
			end
		elseif eventCommand == "instrumentWindow" then
			if player:getData("lev") <= 1 then
				player:showInstruments()
			end
		elseif eventCommand == "sheetsWindow" then
			if player.seekingInstrument.holdingIt then
				player:showSheets()
			end
		elseif eventCommand == "ins" then
			player:setInstrument(npcList[args[1]].instrument.keyName, true, true)
		elseif eventCommand == "toggle_pause" then
		    player:pauseMusic(not player.loopPaused)
		end
	end
end

function eventWindowCallback(windowId, playerName, eventName)
	local player = playerList[playerName]
	if eventName == "close" then
		if windowId == 1 then
			player:showInstruments(false)
		elseif windowId == 11 then
			player:showSheets(false)
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
	if not admins[playerName] then return end
	local player = playerList[playerName]

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
		tfm.exec.chatMessage(msg, playerName)
	end

	if command == "setIns" then
		player:releaseInstrument()
		player:setInstrument(args[1], true, true)
		answer(("Setting '%s' as your instrument"):format(args[1] or""))
		answer(("%s exists? %s"):format(args[1] or "!", tostring(not not instrumentList[args[1]])))
	elseif command == "allIns" then
		for npcName, Npc in next, npcList do
			if Npc.instrument then
				player:setInstrument(Npc.instrument.keyName, false, false, true)
				player:setSheet(Npc.instrument.keyName)
				player:giveNpcInstrument(npcName, false)
			end
		end
		answer("Giving all instruments to Musicians")
	elseif command == "save" then
		player:saveData()
		answer("Your data has been saved")
	elseif command == "removealldata" then
		player:resetAllData()
		answer("Data restored")
	elseif command == "instance" then
		player:setInstance(args[1])
		answer("Instance set as " ..  (args[1] or "?"))
	elseif command == "ping" then
		player:updatePing()
	elseif command == "sheets" then
		player:showSheets()
	end
end

function eventPlayerBonusGrabbed(playerName,id)
    local player = playerList[playerName]
    if player then
        if id==-1 then
			player.currentPing=(os.time()-player.pingTime)-30
			--print('Ping: '..tostring(player.currentPing))
		end
    end
end