local setInstrument = function(instrumentName, sprite, width, height, xw, yw)
	local self = {}
	local tpath = ("instruments %s"):format(instrumentName)
	self.localeName = translate(tpath .. " 1", room.language) or "Placeholder"
	self.keyName = instrumentName
	
	self.dialog = translate(tpath .. " 2", room.language) or self.localeName
	
	self.sprite = sprite or "1825ffbe04a.png"
	self.height = height or 576
	self.width = width or 553
	
	self.scale = scale or 1.0
	self.tscale = 0.8
	
	self.txs = self.tscale * self.width
	self.tys = self.tscale * self.height
	
	self.tdx = xw or 0
	self.tdy = yw or 0
	
	return self
end

instrumentList = {
    ["Timpani"] = setInstrument("Timpani", "184058f9b56.png", 225, 77, 516, 203),
    ["Cymbals"] = setInstrument("Cymbals", "184058f4f5b.png", 81, 88, 233, 99),
    ["Gong"] = setInstrument("Gong", "18405907f5a.png", 100, 108, 353, 259),
    ["Vibraphone"] = setInstrument("Vibraphone", "1840592df5f.png", 147, 90, 602, 279),
    ["Marimba"] = setInstrument("Marimba", "18405932b5c.png", 171, 76, 446, 284),
	
    ["Horn"] = setInstrument("Horn", "1840590335b.png", 93, 78, 326, 101),
    ["Trumpet"] = setInstrument("Trumpet", "1840591fb5b.png", 175, 55, 224, 50),
    ["Trombone"] = setInstrument("Trombone", "1840591af5b.png", 140, 41, 464, 71),
    ["Tuba"] = setInstrument("Tuba", "1840592935c.png", 69, 125, 80, 65),
    ["Euphonium"] = setInstrument("Euphonium", "1840592475b.png", 59, 108, 148, 76),
	
    ["Flute"] = setInstrument("Flute", "184058fe758.png", 163, 23, 80, 195),
    ["Oboe"] = setInstrument("Oboe", "184058dd358.png", 180, 33, 268, 185),
    ["Clarinet"] = setInstrument("Clarinet", "1840591175d.png", 167, 30, 510, 133),
    ["Bassoon"] = setInstrument("Bassoon", "184058d86df.png", 94, 133, 426, 137),
    ["Saxophone"] = setInstrument("Saxophone", "1840591635b.png", 92, 116, 391, 59),
	
    ["Violin"] = setInstrument("Violin", "184058f0358.png", 35, 90, 82, 269),
    ["Viola"] = setInstrument("Viola", "184058eb758.png", 49, 134, 296, 233),
    ["Cello"] = setInstrument("Cello", "184058e6b59.png", 55, 158, 133, 231),
    ["Bass"] = setInstrument("Bass", "184058e1f5c.png", 79, 199, 203, 196),
    ["Harp"] = setInstrument("Harp", "1840590cb58.png", 91, 136, 647, 60)
}


npcList = {}
    do
		npcList["m1"] = Character.new("Musician", "m1", 230, 640, "Timpani")
		npcList["m2"] = Character.new("Musician", "m2", 325, 595, "Cymbals")
		npcList["m3"] = Character.new("Musician", "m3", 410, 570, "Gong")
		npcList["m4"] = Character.new("Musician", "m4", 505, 555, "Vibraphone")
		npcList["m5"] = Character.new("Musician", "m5", 585, 550, "Marimba")
		
		npcList["m6"] = Character.new("Musician", "m6", 700, 560, "Horn")
		npcList["m7"] = Character.new("Musician", "m7", 800, 580, "Trumpet")
		npcList["m8"] = Character.new("Musician", "m8", 890, 600, "Trombone")
		npcList["m9"] = Character.new("Musician", "m9", 970, 635, "Tuba")
		npcList["m10"] = Character.new("Musician", "m10", 315, 700, "Euphonium")
        
		npcList["m11"] = Character.new("Musician", "m11", 405, 665, "Flute")
		npcList["m12"] = Character.new("Musician", "m12", 485, 655, "Oboe")
		npcList["m13"] = Character.new("Musician", "m13", 580, 650, "Clarinet")
		npcList["m14"] = Character.new("Musician", "m14", 705, 650, "Bassoon")
		npcList["m15"] = Character.new("Musician", "m15", 800, 665, "Saxophone")
		
		npcList["m16"] = Character.new("Musician", "m16", 895, 700, "Violin")
		npcList["m17"] = Character.new("Musician", "m17", 395, 755, "Viola")
		npcList["m18"] = Character.new("Musician", "m18", 500, 745, "Cello")
		npcList["m19"] = Character.new("Musician", "m19", 695, 750, "Bass")
		npcList["m20"] = Character.new("Musician", "m20", 790, 755, "Harp")
        
        npcList["Conductor"] = Character.new("Conductor", "Conductor", 575, 845, _, "18334202aeb.png")
        
        npcList["Diva"] = Character.new("Diva", "Diva", 705, 860, _, "1833e58ced9.png")
    end