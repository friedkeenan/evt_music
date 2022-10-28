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
			player:updateDialog(3)
		end
	end
end

function eventLoop(elapsed, remaining)
	--eventFastLoop()
	
	for playerName, player in next, playerList do
		local obj = tfm.get.room.playerList[playerName]
		player:updatePosition(obj.x, obj.y, obj.vx, obj.vy)
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
			player:npcInteraction(eventCommand)			
		elseif eventCommand == "instrumentWindow" then
			player:showInstruments()
		elseif eventCommand == "sheetsWindow" then
			tfm.exec.chatMessage("sheets", playerName)
		elseif eventCommand == "ins" then
			player:setInstrument(npcList[args[1]].instrument.keyName, true, true)
		end
	end
end

function eventWindowCallback(windowId, playerName, eventName)
	local player = playerList[playerName]
	if eventName == "close" then
		if windowId == 1 then
			player:showInstruments(false)
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
		player:setInstrument(args[1], true, false)
		answer(("Setting '%s' as your instrument"):format(args[1] or""))
	elseif command == "allIns" then
		for npcName, Npc in next, npcList do
			if Npc.instrument then
				player:setInstrument(Npc.instrument.keyName, false, false, true)
				player:giveNpcInstrument(npcName, false)
			end
		end
		answer("Giving all instruments to Musicians")
	elseif command == "save" then
		player:saveData()
		answer("Your data has been saved")
	end
end