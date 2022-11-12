styles = {
	dialogue = "<font face='Century Schoolbook,Baskerville,Baskerville Old Face,Hoefler Text,Garamond,Times New Roman,serif' size='13.5' color='#1A0E00'><b>%s",
	chat = "<font color='#F8C090'>%s</font>",
	href = "<a href='event:%s'>%s</a>"
}

styles.refdlg = styles.dialogue:format(styles.href)

iconList = { -- Size: 120 x 120 px
	["def"] = {
		image = "184622eecbf.png",
		callback = false
	},
	["instrument"] = {
		image = "184622eecbf.png",
		callback = function(player)
			local seeking = player.seekingInstrument

			if seeking.onIt then
				uiAddWindow(100, 4, {title = translate("instruct riddle", player.language), default=('<i>"%s"</i>'):format(translate("instruments " .. seeking.searchingName .. " 2", player.language))}, player.name, 0, 0, 1.0, false)--tfm.exec.chatMessage(('<i>"%s"</i>'):format(translate("instruments " .. seeking.instrumentName .. " 2")), player.name)
			end
		end
	},
	["sheet"] = {
		image = "1846236bbc6.png",
		callback = function(player)
			local seeking = player.seekingInstrument

			if seeking.sheet then
				uiAddWindow(100, 4, {title = translate("instruct riddle", player.language), default=("<font size='14'><i>\"%s\"</i></font>"):format(translate("instruments " .. seeking.sheet .. " 1", player.language))}, player.name, 0, 0, 1.0, false)
			end
		end
	},
	["tune"] = {
		image = "184622f6a5d.png", -- piano
		callback = false
	},
	["puzzle"] = {
		image = "1846236bbc6.png", -- sheet
		callback = false
	},
	["piano"] = {
		image = "184622f6a5d.png",
		callback = function(player)
			if player.isTuning then
				uiAddWindow(100, 4, {title = translate("instruct riddle", player.language), default = translate("instruct piano")}, player.name, 0, 0, 1.0, false)
			end
		end
	},
	["end"] = {
		image = "184622f6a5d.png", -- piano
		callback = false
	}
}


beatLength=484 -- in MS
noteColors = {
	{0xE4FAFE,0x4C4544}, -- E
	{0xFEFF00,0x0100FF}, -- D
	{0xFF0100,0x00FEFF}, -- C
	{0x1600FE,0xE8FE00}, -- B
	{0x2FCD2E,0xCC2ECD}, -- A
	{0xFF6500,0x009AFF}, -- G
	{0xBE01BE,0x0199AE}  -- F -- Changed first color (original: 0xAE1601) because it's too similar to the 3rd one
}
--[[ Notes:

0 - Rest
1 - E
2 - D
3 - C
4 - B
5 - A
6 - G
7 - F
]]
-- {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
-- {1,2,3,4,5,6,7,6,5,4,3,2,1,0,1,0,2,2,0,0,2,3,2,1},
tuningList = {
    ["timpani"] = {3,0,0,0,0,4,4,0,0,0,0,5,5,0,0,0,0,7,7,0,0,6,0,0},
    ["cymbals"] = {3,0,0,0,0,0,2,0,0,0,0,0,2,0,0,0,0,0,0,0,0,6,0,0},
    ["tubular_bells"] = {6,0,0,0,0,0,5,0,0,0,0,0,4,0,0,0,0,0,5,0,0,4,0,0},
    ["vibraphone"] = {0,3,1,3,6,3,0,4,1,4,6,4,0,5,2,5,7,5,0,7,3,5,3,2},
    ["marimba"] = {0,1,2,0,3,3,0,1,2,0,2,2,0,7,1,0,2,2,0,1,2,0,3,3},

    ["horn"] = {3,0,0,0,0,2,4,0,0,0,0,2,5,0,0,0,0,3,5,0,0,6,0,0},
    ["trumpet"] = {6,0,0,0,0,0,5,0,0,0,0,0,4,0,0,0,0,0,5,0,0,6,0,0},
    ["trombone"] = {0,6,6,0,5,5,0,4,4,0,4,4,0,4,4,0,4,4,0,5,5,0,6,6},
    ["tuba"] = {3,0,0,3,0,0,4,0,0,4,0,0,5,0,0,5,0,0,7,0,0,7,0,0},
    ["euphonium"] = {0,1,0,0,0,0,0,0,0,1,0,2,3,0,0,0,0,2,3,0,0,2,0,0},

    ["flute"] = {0,6,0,0,0,0,0,5,0,0,0,0,0,5,0,0,0,0,0,6,0,0,7,0},
    ["oboe"] = {2,0,0,3,0,6,2,0,0,1,0,5,7,0,1,2,0,1,3,0,0,0,0,0},
    ["clarinet"] = {0,0,0,6,0,0,0,0,0,5,0,0,6,0,0,7,0,0,0,0,0,6,0,0},
    ["bassoon"] = {0,0,6,1,0,0,0,0,5,2,0,0,0,0,6,4,0,2,3,0,0,6,0,0},
    ["saxophone"] = {0,0,6,2,3,0,0,0,5,2,1,0,0,0,6,1,2,1,3,0,0,2,0,0},

    ["violin"] = {6,0,0,0,0,5,6,0,0,0,7,1,7,0,0,0,1,2,3,0,0,2,0,0},
    ["viola"] = {3,6,6,3,6,6,4,6,6,4,6,6,5,6,6,5,6,6,7,3,3,5,7,7},
    ["cello"] = {3,0,0,0,0,0,4,0,0,0,0,0,4,0,0,0,0,0,5,0,0,6,0,0},
    ["bass"] = {3,0,0,0,0,0,4,0,0,1,0,0,5,0,0,0,0,0,7,0,0,0,0,0},
    ["harp"] = {3,4,3,1,6,3,4,6,4,2,6,4,5,5,2,7,5,2,7,7,5,3,6,2},

    ["voice"] = {7,0,0,1,0,6,7,0,0,1,0,2,1,2,3,2,0,4,3,0,0,2,0,0}
}

local setInstrument = function(instrumentName, sprite, width, height, xw, yw, sound, xc, yc, mirrored, rotation)
	local self = {}
	self.keyName = instrumentName

	self.sprite = sprite or "1825ffbe04a.png"
	self.sound = sound and ("lua/music_event/individual/%s.mp3"):format(sound) or "deadmaze/voiture.mp3"
	self.height = height or 576
	self.width = width or 553

	self.tuning = tuningList[self.keyName]

	self.scale = 1.0
	self.tscale = 0.8

	self.txs = self.tscale * self.width
	self.tys = self.tscale * self.height

	self.tdx = xw or 0
	self.tdy = yw or 0
	
	self.cx = xc or 0
	self.cy = yc or 0
	self.rr = math.rad(rotation or 0)
	self.mir = not not mirrored

	return self
end

instrumentList = {
    ["timpani"] = setInstrument("timpani", "184058f9b56.png", 225, 77, 516, 203, "timpani", 20, -2, false),
    ["cymbals"] = setInstrument("cymbals", "184058f4f5b.png", 81, 88, 233, 99, "cymbals", 31, -25, true),
    ["tubular_bells"] = setInstrument("tubular_bells", "1844edc325a.png", 100, 108, 353, 259, "tubular_bells", -15, -5, false),
    ["vibraphone"] = setInstrument("vibraphone", "1840592df5f.png", 147, 90, 602, 279, "vibraphone", 20, -3, false),
    ["marimba"] = setInstrument("marimba", "18405932b5c.png", 171, 76, 446, 284, "marimba", 0, 0, false),

    ["horn"] = setInstrument("horn", "1840590335b.png", 93, 78, 326, 101, "french_horn", 20, -10, true, 270),
    ["trumpet"] = setInstrument("trumpet", "1840591fb5b.png", 175, 55, 224, 50, "trumpets", 60, -23, false, 12),
    ["trombone"] = setInstrument("trombone", "1840591af5b.png", 140, 41, 464, 71, "trombones", -5, -28, true, -12),
    ["tuba"] = setInstrument("tuba", "1840592935c.png", 69, 125, 80, 65, "tuba", -15, -30, false, -15),
    ["euphonium"] = setInstrument("euphonium", "1840592475b.png", 59, 108, 148, 76, "euphonium", -10, -28, false, -15),

    ["flute"] = setInstrument("flute", "184058fe758.png", 163, 23, 80, 195, "flute", 0, -20, false, -15),
    ["oboe"] = setInstrument("oboe", "1840591175d.png", 167, 30, 510, 133, "oboe", 37, 0, false, 70),
    ["clarinet"] = setInstrument("clarinet", "184058dd358.png", 180, 33, 268, 185, "clarinet", 36, 3, false, 70),
    ["bassoon"] = setInstrument("bassoon", "184058d86df.png", 94, 133, 426, 137, "bassoon", -8, -17, true),
    ["saxophone"] = setInstrument("saxophone", "1840591635b.png", 92, 116, 391, 59, "saxophone", -20, -3, true),

    ["violin"] = setInstrument("violin", "184058f0358.png", 35, 90, 82, 269, "violins", 38, -25, false, 100),
    ["viola"] = setInstrument("viola", "184058eb758.png", 49, 134, 296, 233, "violas", 38, -25, false, 100),
    ["cello"] = setInstrument("cello", "184058e6b59.png", 55, 158, 133, 231, "cellos", 0, -22, false, 10),
    ["bass"] = setInstrument("bass", "184058e1f5c.png", 79, 199, 203, 196, "basses", -10, -20, false, 10),
    ["harp"] = setInstrument("harp", "1840590cb58.png", 91, 136, 647, 60, "harp", 31, -17),

    ["voice"] = setInstrument("voice", nil, nil, nil, nil, nil, "voice"),
    ["piano"] = setInstrument("piano", nil, nil, nil, nil, nil, "piano")
}


-- genders: 2=male, 1=female, 0=none
npcList = {}
    do
		npcList["m1"] = Character.new("Musician", "m1", 230, 640, "cymbals", "184166d665e.png", 1)
		npcList["m2"] = Character.new("Musician", "m2", 325, 595, "timpani", "184166a175d.png", 2)
		npcList["m3"] = Character.new("Musician", "m3", 410, 570, "vibraphone", "1841669ca58.png", 1)

		npcList["m4"] = Character.new("Musician", "m4", 505, 555, "horn", "18416697d5c.png", 2)
		npcList["m5"] = Character.new("Musician", "m5", 585, 550, "trumpet", "184166db35d.png", 1)
		npcList["m6"] = Character.new("Musician", "m6", 700, 560, "trombone", "184166afe5b.png", 0)
		npcList["m7"] = Character.new("Musician", "m7", 800, 580, "euphonium", "184166b4b5c.png", 2)

		npcList["m8"] = Character.new("Musician", "m8", 890, 600, "marimba", "18416684958.png", 1)
		npcList["m9"] = Character.new("Musician", "m9", 970, 635, "tubular_bells", "184166d195a.png", 2)

		npcList["m10"] = Character.new("Musician", "m10", 315, 700, "harp", "184166a645c.png", 0)

		npcList["m11"] = Character.new("Musician", "m11", 405, 665, "flute", "1841669305b.png", 0)
		npcList["m12"] = Character.new("Musician", "m12", 485, 655, "oboe", "1841668e35a.png", 1)
		npcList["m13"] = Character.new("Musician", "m13", 580, 650, "clarinet", "184166e0059.png", 1)
		npcList["m14"] = Character.new("Musician", "m14", 705, 650, "bassoon", "184166ccc5b.png", 2)
		npcList["m15"] = Character.new("Musician", "m15", 800, 665, "saxophone", "184166b985c.png", 2)

		npcList["m16"] = Character.new("Musician", "m16", 895, 700, "tuba", "184166ab15d.png", 0)

		npcList["m17"] = Character.new("Musician", "m17", 395, 755, "violin", "1841668965c.png", 2)
		npcList["m18"] = Character.new("Musician", "m18", 500, 745, "viola", "184166e4d5b.png", 1)
		npcList["m19"] = Character.new("Musician", "m19", 695, 750, "cello", "184166c3275.png", 1)
		npcList["m20"] = Character.new("Musician", "m20", 790, 755, "bass", "184166be55e.png", 2)

        npcList["cond"] = Character.new("Conductor", "cond", 575, 845, nil, "184166c7f5b.png", 2)

        npcList["diva"] = Character.new("Diva", "diva", 705, 860, nil, "1841667fc98.png", 1)
    end



local getInstrumentBySoundName = function(soundName)
    for i,v in pairs(instrumentList) do
        if v.sound==soundName then
            return v
        end
    end
end
local getCharacterByInstrumentName = function(instrumentName)
    if instrumentList[instrumentName] and instrumentList[instrumentName].Npc then
        return npcList[instrumentList[instrumentName].Npc]
    end
end