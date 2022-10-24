function eventNewGame()
	if not isEventLoaded then
		isEventLoaded = true

        ui.setMapName("Music Orchesta !")
		ui.setBackgroundColor("#201200")
        tfm.exec.setGameTime(150)
		ui.addClickable(1, 50, 937, 190, 98, nil, "instrumentWindow", false)
	else
		return system.exit()
	end
end

function eventNewPlayer(playerName)
	if not isEventLoaded then
		system.loadPlayerData(playerName)
	end
end

function eventPlayerDataLoaded(playerName, playerData)
	playerList[playerName] = Player.new(playerName, playerData)
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
end

function eventKeyboard(playerName, key, down, x, y, vx, vy)
	local player = playerList[playerName]

	if player then
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
	if Window then
		eventWindowCallback(Window, playerName, eventName)
	else
		if eventName == "instrumentWindow" then
			uiAddWindow(1, 2, {title = "", default="w"}, nil, 0, 0, 1.0, false)
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
