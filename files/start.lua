do
	room.lanugage = tfm.get.room.language
	
	for playerName, playerData in next, tfm.get.room.playerList do
		eventNewPlayer(playerName)
	end
	
	-- Fast loop
	local interval = 500
	local interpolation = 10
	local SUBCYCLES = interval / (interval / interpolation)
	local diftime = interval / SUBCYCLES
	for i=0, SUBCYCLES-1 do
		system.newTimer(function(id)
			system.newTimer(function(id)
					eventFastLoop(diftime)
			end, interval, true)
		end, interval + (diftime * i), false)
	end
	
	tfm.exec.chatMessage(styles.chat:format(translate("hey 1", room.language, 0)))
end

tfm.exec.newGame(xml, false)