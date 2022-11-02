instruments={
	'basses',
	'bassoon',
	'cellos',
	'clarinet',
	'cymbals',
	'euphonium',
	'flute',
	'french_horn',
	'harp',
	'marimba',
	'oboe',
	'piano',
	'saxophone',
	'timpani',
	'trombones',
	'trumpets',
	'tuba',
	'tubular_bells',
	'vibraphone',
	'violas',
	'violins'
}


function loop()
	startTime=os.time()
	for i,v in ipairs(instruments) do
		tfm.exec.playSound(('lua/music_event/individual/%s.mp3'):format(v),100)
		tfm.exec.chatMessage(('Played sound %s, delay: %s'):format(v,os.time()-startTime))
	end
end

c=1
function loop2()
	startTime=os.time()
	for i=1,c do
		tfm.exec.playSound(('lua/music_event/individual/%s.mp3'):format(instruments[i]),200)
		tfm.exec.chatMessage(('Played sound %s, delay: %s'):format(instruments[i],os.time()-startTime))
	end

	c=c+1
end

function loop3()
	startTime=os.time()
	for i,v in ipairs(instruments) do
	    system.newTimer(function()
			tfm.exec.playSound(('lua/music_event/individual/%s.mp3'):format(v),200)
			tfm.exec.chatMessage(('Played sound %s, delay: %s'):format(v,os.time()-startTime))
		end,1000-(os.time()-startTime))
	end

	c=c+1
end
loop3()


--system.newTimer(loop2,23275,true)