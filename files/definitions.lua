local setInstrument = function(instrumentName, sprite, height, width, scaleX, scaleY)
	local Instrument = {}
	local tpath = ("instruments %s"):format(instrumentName)
	Instrument.localeName = translate(tpath .. " 1", room.language) or "Placeholder"
	Instrument.keyName = instrumentName
	
	Instrument.dialog = translate(tpath .. " 2", room.language) or Instrument.localeName
	
	Instrument.sprite = sprite or "1825ffbe04a.png"
	Instrument.height = height or 576
	Instrument.width = width or 553
	
	Instrument.scaleX = scaleX or 1.0
	Instrument.scaleY = scaleY or 1.0
	
	return Instrument
end

instrumentList = {
    ["Timpani"] = setInstrument("Timpani"),
    ["Cymbals"] = setInstrument("Cymbals"),
    ["Gong"] = setInstrument("Gong"),
    ["Vibraphone"] = setInstrument("Vibraphone"),
    ["Marimba"] = setInstrument("Marimba"),
	
    ["Horn"] = setInstrument("Horn"),
    ["Trumpet"] = setInstrument("Trumpet"),
    ["Trombone"] = setInstrument("Trombone"),
    ["Tuba"] = setInstrument("Tuba"),
    ["Euphonium"] = setInstrument("Euphonium"),
	
    ["Flute"] = setInstrument("Flute"),
    ["Oboe"] = setInstrument("Oboe"),
    ["Clarinet"] = setInstrument("Clarinet"),
    ["Bassoon"] = setInstrument("Bassoon"),
    ["Saxophone"] = setInstrument("Saxophone"),
	
    ["Violin"] = setInstrument("Violin"),
    ["Viola"] = setInstrument("Viola"),
    ["Cello"] = setInstrument("Cello"),
    ["Bass"] = setInstrument("Bass"),
    ["Harp"] = setInstrument("Harp")
}


npcList = {}
    do
		npcList["m1"] = Character.new("Musician", 230, 640, "Timpani")
		npcList["m2"] = Character.new("Musician", 325, 595, "Cymbals")
		npcList["m3"] = Character.new("Musician", 410, 570, "Gong")
		npcList["m4"] = Character.new("Musician", 505, 555, "Vibraphone")
		npcList["m5"] = Character.new("Musician", 585, 550, "Marimba")
		
		npcList["m6"] = Character.new("Musician", 700, 560, "Horn")
		npcList["m7"] = Character.new("Musician", 800, 580, "Trumpet")
		npcList["m8"] = Character.new("Musician", 890, 600, "Trombone")
		npcList["m9"] = Character.new("Musician", 970, 635, "Tuba")
		npcList["m10"] = Character.new("Musician", 315, 700, "Euphonium")
        
		npcList["m11"] = Character.new("Musician", 405, 665, "Flute")
		npcList["m12"] = Character.new("Musician", 485, 655, "Oboe")
		npcList["m13"] = Character.new("Musician", 580, 650, "Clarinet")
		npcList["m14"] = Character.new("Musician", 705, 650, "Basson")
		npcList["m15"] = Character.new("Musician", 800, 665, "Saxophone")
		
		npcList["m16"] = Character.new("Musician", 895, 700, "Violin")
		npcList["m17"] = Character.new("Musician", 395, 755, "Viola")
		npcList["m18"] = Character.new("Musician", 395, 745, "Cello")
		npcList["m19"] = Character.new("Musician", 695, 750, "Bass")
		npcList["m20"] = Character.new("Musician", 790, 755, "Harp")
        
        npcList["Conductor"] = Character.new("Conductor", 575, 845, _, "18334202aeb.png")
        
        npcList["Diva"] = Character.new("Diva", 705, 860, _, "1833e58ced9.png")
    end