function eventNewGame()
	if not isEventLoaded then
		isEventLoaded = true
        
        ui.setMapName("Music Orchesta !")
		ui.setBackgroundColor("#201200")
        tfm.exec.setGameTime(150)
	else
		return system.exit()
	end
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
		--player:setData(playerData)
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
		local facing
		if key < 4 then
			if key % 2 == 0 then
				facing = (key == 2)
			end
		end
		
		player:updatePosition(x, y, vx, vy, facing)
		
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

function eventTextAreaCallback(textAreaId, playerName, eventName)
	local Window = textAreaHandle[textAreaId]
	local player = playerList[playerName]
	if not player then return end
	if Window then
		eventWindowCallback(Window, playerName, eventName)
	else
		if npcList[eventName] then
			local Npc = npcList[eventName]
			
			if math.distance(player.x, player.y, Npc.xPosition, Npc.yPosition) < 45 then
				player:newDialog(eventName)
			end
			
		elseif eventName == "instrumentWindow" then
			uiAddWindow(1, 2, {title = "", default="w"}, playerName, 0, 0, 1.0, false)
		elseif eventName == "sheetsWindow" then
			tfm.exec.chatMessage("sheets", playerName)
		end
	end
end

function eventWindowCallback(windowId, playerName, eventName)
	if eventName == "close" then
		uiRemoveWindow(windowId, playerName)
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
