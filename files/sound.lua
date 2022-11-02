function Player:playSound(sound,volume,soundPosX,soundPosY)
    tfm.exec.playSound(sound,volume,soundPosX,soundPosY,self.name)
end



local loopLength=23275

function Player:addSoundLoop(soundName,volume) -- Add an instrument to the loop
    volume=volume or 100
	printfd("Adding sound %s (volume: %d)", soundName, volume)
    self.loopSounds[soundName]={volume=volume}
end
function Player:removeSoundLoop(soundName) -- Remove an instrument from the loop
    printfd("Removing sound %s", soundName)
    self.loopSounds[soundName]=nil
end

function Player:soundLoop() -- Loop of instrument sounds
    local startTime = os.time()
	local sound
	for i,v in pairs(self.loopSounds) do
		self:playSound(i, v.volume or 100, nil, nil)
		printfd('Playing sound %s', i)
	end
end
function Player:playSoundLoop(play) -- Play or stop the loop of instrument sounds
    play=(not not play)

    if self.loopTimer then
        system.removeTimer(self.loopTimer)
        self.loopTimer=nil

        --[[
        for i,v in pairs(self.loopSounds) do
			tfm.exec.stopSound(('lua/music_event/individual/%s.mp3'):format(i),self.name)
			print('Stopping sound '..('lua/music_event/individual/%s.mp3'):format(i))
		end
		]]
    end

    if play then
        self.loopTimer=system.newTimer(function() self:soundLoop() end,loopLength,true)
        self:soundLoop()
    end

    print(self.name..': '..(play and 'play' or 'pause'))
end


function Player:pauseMusic(paused,displayOnly)
    print(('pauseMusic(%s,%s)'):format(tostring(paused),tostring(displayOnly)))
    if self.pauseImg then
       -- ui.removeTextArea(-1,self.name)
        --tfm.exec.removeImage(self.pauseImg,true)
        ui.removeClickableImage(self.pauseImg,true)
        self.pauseImg=nil
    end
    local sprite = (paused and '184360be1e4.png' or '1843612f382.png')
    --self.pauseButtonID = tfm.exec.addImage(sprite,'~1',0,25,self.name,1,1,0,1,0,0,true)
    --ui.addTextArea(-1,'<a href="event:toggle_pause">    \n    </a>',self.name,0,25,35,35,nil,nil,0.5,true)
    self.pauseImg=ui.addClickableImage(sprite,'~1',self.name,35,35,'toggle_pause',0,25,1,1,1,true)


    if not displayOnly then
		self.loopPaused=paused
		self:playSoundLoop(not paused)
		self:playSound('tfmadv/click.mp3',20)
	end
end



--[[
function soundLoop()
    for playerName,player in pairs(playerList) do
        for i,v in pairs(player.loopSounds) do
            tfm.exec.playSound(('lua/music_event/individual/%s.mp3'):format(i:lower()),(v.volume or 100))
            print('Playing sound '..('lua/music_event/individual/%s.mp3'):format(i:lower()))
        end
    end
end

system.newTimer(soundLoop,loopLength,true)
]]