do
	for playerName, playerData in next, tfm.get.room.playerList do
		eventNewPlayer(playerName)
	end
	
	-- Fast loop
	local interval = 500
	local SUBCYCLES = interval / 50
	local diftime = interval / SUBCYCLES
	for i=0, SUBCYCLES-1 do
		system.newTimer(function(id)
			system.newTimer(function(id)
					eventFastLoop(diftime)
			end, interval, true)
		end, interval + (diftime * i), false)
	end
	
	tfm.exec.chatMessage(translate("hey 1", tfm.get.room.language, 0))
end

tfm.exec.newGame(xml, false)