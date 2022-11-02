local setInstrument = function(instrumentName, sprite, width, height, xw, yw)
	local self = {}
	self.keyName = instrumentName:lower()
	local tpath = ("instruments %s %%d"):format(self.keyName)
	self.localeName = translate(tpath:format(1), room.language) or "Placeholder"
	
	self.dialog = translate(tpath:format(2), room.language) or self.localeName
	
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
    ["timpani"] = setInstrument("Timpani", "184058f9b56.png", 225, 77, 516, 203),
    ["cymbals"] = setInstrument("Cymbals", "184058f4f5b.png", 81, 88, 233, 99),
    ["gong"] = setInstrument("Gong", "18405907f5a.png", 100, 108, 353, 259),
    ["vibraphone"] = setInstrument("Vibraphone", "1840592df5f.png", 147, 90, 602, 279),
    ["marimba"] = setInstrument("Marimba", "18405932b5c.png", 171, 76, 446, 284),
	
    ["horn"] = setInstrument("Horn", "1840590335b.png", 93, 78, 326, 101),
    ["trumpet"] = setInstrument("Trumpet", "1840591fb5b.png", 175, 55, 224, 50),
    ["trombone"] = setInstrument("Trombone", "1840591af5b.png", 140, 41, 464, 71),
    ["tuba"] = setInstrument("Tuba", "1840592935c.png", 69, 125, 80, 65),
    ["euphonium"] = setInstrument("Euphonium", "1840592475b.png", 59, 108, 148, 76),
	
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
		npcList["m1"] = Character.new("Musician", "m1", 230, 640, "cymbals", "184166d665e.png")
		npcList["m2"] = Character.new("Musician", "m2", 325, 595, "timpani", "184166a175d.png")
		npcList["m3"] = Character.new("Musician", "m3", 410, 570, "vibraphone", "1841669ca58.png")
		
		npcList["m4"] = Character.new("Musician", "m4", 505, 555, "horn", "18416697d5c.png")
		npcList["m5"] = Character.new("Musician", "m5", 585, 550, "trumpet", "184166db35d.png")
		npcList["m6"] = Character.new("Musician", "m6", 700, 560, "trombone", "184166afe5b.png")
		npcList["m7"] = Character.new("Musician", "m7", 800, 580, "euphonium", "184166b4b5c.png")
		
		npcList["m8"] = Character.new("Musician", "m8", 890, 600, "marimba", "18416684958.png")
		npcList["m9"] = Character.new("Musician", "m9", 970, 635, "gong", "184166d195a.png")
		
		npcList["m10"] = Character.new("Musician", "m10", 315, 700, "harp", "184166a645c.png")
        
		npcList["m11"] = Character.new("Musician", "m11", 405, 665, "flute", "1841669305b.png")
		npcList["m12"] = Character.new("Musician", "m12", 485, 655, "oboe", "1841668e35a.png")
		npcList["m13"] = Character.new("Musician", "m13", 580, 650, "clarinet", "184166e0059.png")
		npcList["m14"] = Character.new("Musician", "m14", 705, 650, "bassoon", "184166ccc5b.png")
		npcList["m15"] = Character.new("Musician", "m15", 800, 665, "saxophone", "184166b985c.png")
		
		npcList["m16"] = Character.new("Musician", "m16", 895, 700, "tuba", "184166ab15d.png")
		
		npcList["m17"] = Character.new("Musician", "m17", 395, 755, "violin", "1841668965c.png")
		npcList["m18"] = Character.new("Musician", "m18", 500, 745, "viola", "184166e4d5b.png")
		npcList["m19"] = Character.new("Musician", "m19", 695, 750, "cello", "184166c3275.png")
		npcList["m20"] = Character.new("Musician", "m20", 790, 755, "bass", "184166be55e.png")
        
        npcList["cond"] = Character.new("Conductor", "cond", 575, 845, nil, "184166c7f5b.png")
        
        npcList["diva"] = Character.new("Diva", "diva", 705, 860, nil, "1841667fc98.png")
    end