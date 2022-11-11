--[[
tfm.exec.playMusic(music, Channel, volume, loop, fade, targetPlayer)
Play a music. A music can be stopped. Musics list can be found here : http://audio.atelier801.com/sounds.html
  music (String) URL of the music.
  Channel (String) Channel of the music. Only one music can be played per channel. If a music is playing, it will be stopped.
  volume (Int) Volume of the sound (0-100). (default 70)
  loop (Boolean) If the music should be looping. (default false)
  fade (Boolean) If the music should start with a fading. (default true)
  targetPlayer (Int) Send only to this specific player (if nil, applies to all players). (default nil)

tfm.exec.stopMusic(Channel, targetPlayer)
Stop a playing music.
  Channel (String) Music channel to stop.
  targetPlayer (Int) Send only to this specific player (if nil, applies to all players). (default nil)
]]

function Player:playMusic(music,channel,volume,loop,fade)
    tfm.exec.playMusic(music,channel,volume,loop,fade,self.name)
end
function Player:playMusicDelay(delay,music,channel,volume,loop,fade)
    system.newTimer(function()
		self:playMusic(music,channel,volume,loop,fade)
	end,delay)
end

function Player:stopMusic(channel)
    tfm.exec.stopMusic(channel,self.name)
    --tfm.exec.chatMessage('Stopped sound '..tostring(sound),self.name)
end
function Player:stopMusicDelay(delay,channel)
    system.newTimer(function()
        self:stopMusic(channel)
    end,delay)
end

function Player:playMusicLength(length,music,channel,volume,loop,fade)
    self:playMusic(music,channel,volume,loop,fade)
    self:stopMusicDelay(length,music)
end


function Player:playSound(sound,volume,soundPosX,soundPosY)
    tfm.exec.playSound(sound,volume,soundPosX,soundPosY,self.name)
end
function Player:playSoundDelay(delay,sound,volume,soundPosX,soundPosY)
    system.newTimer(function()
        self:playSound(sound,volume,soundPosX,soundPosY)
    end,delay)
end

function Player:playSoundLength(length,sound,volume,soundPosX,soundPosY)
    self:playSound(sound,volume,soundPosX,soundPosY)
    self:stopSoundDelay(length,sound)
end



local loopLength=23275
--local overlap=100

function Player:addSoundLoop(soundName,volume) -- Add an instrument to the loop
    volume=volume or 100
	printfd("Adding sound %s (volume: %d)", soundName, volume)
    table.insert(self.loopSounds,{sound=soundName,volume=volume})
end
function Player:removeSoundLoop(soundName,stop) -- Remove an instrument from the loop
    printfd("Removing sound %s", soundName)
    local removeKeys={}
    for i,v in pairs(self.loopSounds) do
        if v.sound==soundName then
            table.insert(removeKeys,i)
        end
    end
    for i,v in ipairs(removeKeys) do
        if stop then
            self:stopMusic(v)
        end
        --table.remove(self.loopSounds,v)
        self.loopSounds[v]=nil
    end
end

function Player:soundLoop() -- Loop of instrument sounds
    --self:updatePing()
    --local ping=self.currentPing
    local ping=tfm.get.room.playerList[self.name].averageLatency
    local startTime = os.time()
	local sound
	for i,v in pairs(self.loopSounds) do
	    system.newTimer(function()
			--self:playSound(i, v.volume or 100, nil, nil)
			self:playMusic(v.sound,i,(v.volume or 100),true,false)
			printfd('Playing sound %s', i)
		end,1000-(os.time()-startTime)-ping)
	end
end
function Player:playSoundLoop(play) -- Play or stop the loop of instrument sounds
    play=(not not play)

    if self.loopTimer then
        system.removeTimer(self.loopTimer)
        self.loopTimer=nil

        for i,v in pairs(self.loopSounds) do
			self:stopMusic(i)
			--print('Stopping sound '..('lua/music_event/individual/%s.mp3'):format(i))
		end
    end

    if play then
        --self:updatePing()
        self:soundLoop()
        local ping=tfm.get.room.playerList[self.name].averageLatency
        local loopTime=(loopLength-math.min(ping,5000))
        self.loopTimer=system.newTimer(function() self:soundLoop() end,loopTime,true)
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


function Player:isPlayingSound(soundName)
    for i,v in pairs(self.loopSounds) do
        if v.sound==soundName then
            return true
        end
    end
    return false
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