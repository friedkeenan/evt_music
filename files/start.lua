do
	local welcome = styles.chat:format(translate("hey 1", room.language))
	
	for playerName, playerData in next, tfm.get.room.playerList do
		eventNewPlayer(playerName)
		tfm.exec.chatMessage(stringutils.getGendered(welcome, playerData.gender), playerName)
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
end

tfm.exec.newGame(xml, false)