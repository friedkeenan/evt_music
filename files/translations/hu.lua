Text["hu"] = {
	title = "Zenekar",
	hey = {
		[1] = "Üdvözöllek az eventen!"
	},
	instruments = { -- In comments (text after two lines --) gender of the musician that plays the instrument
		["timpani"] 	= {"Üstdob", 		"Én pedált használok a hangszerem hangolásához."}, -- Male
		["cymbals"] 	= {"Cintányér", 		"Az én hangszerem nem igazán igényel hangolást."}, -- Female
		["tubular_bells"] 		= {"Csőharangok", 			"Az enyém álló órákban is használják."}, -- Male
		["vibraphone"] 	= {"Vibrafon", 	"Az én hangszerem még csak 100 éves sincs."}, -- Female
		["marimba"] 	= {"Marimba", 		"Az én hangszerem elkészítéséhez gyakran használnak rózsafát."}, -- Female
		
		["horn"] 		= {"Kürt", 			"Az angolok azt állítják, hogy a hangszerem francia."}, -- Male
		["trumpet"] 	= {"Trombita", 		"Az enyémtől megremegnek Jerikó falai."}, -- Female
		["trombone"] 	= {"Harsona", 		"Don Drummondnak is olyan nagy hangszere volt mint nekem."}, -- Neutral
		["tuba"] 		= {"Tuba", 			"Az én hangszerem helyettesítette az ophikleidet a zenekarban."}, -- Neutral
		["euphonium"] 	= {"eufónium", 	"Az én hangszerem \"jól hnagzót\" jelent Görögül."}, -- Male
		
		["flute"] 		= {"Fuvola", 		"Az enyém egy karcsú hangszer, amely a Jethro Tull zenéjében is megtalálható."}, -- Neutral
		["oboe"] 		= {"Oboa", 			"A schalmei a hangszerem őse."}, -- Female
		["clarinet"] 	= {"Klarinét", 		"A Rhapsody in Blue az én hangszerem szólójával kezdődik."}, -- Female
		["bassoon"] 	= {"Fagott", 		"A hangszerem fúvókáját bütykösnek hívják."}, -- Male
		["saxophone"] 	= {"Szaxofon", 	"A hangszerem ideális az érzéki zenéhez."}, -- Male
		
		["violin"] 		= {"Hegedű", 		"Én a hangszeremmel az egész zenekar másodparancsnoka lehetnék."}, -- Male
		["viola"] 		= {"Brácsa", 		"Az én hangszerem a vonósnégyes női tagja."}, -- Female
		["cello"] 		= {"Cselló", 		"A hangszeremet a lábaim között fogva játszom."}, -- Female
		["bass"] 		= {"Basszusgitár", 			"Az én húros hangszerem magasabb, mint te."}, -- Male
		["harp"] 		= {"Hárfa", 			"Állítólag az angyalok is az én hangszeremet játszák."} -- Neutral
	},
	npcDialogs = {
		-- YES. Some of the dialogues are duplicated. That's on purpose.
		conductor = { -- Male
			name = "Karmester",
			[-1] = {"..."},
			[1] = {
				[1] = "Áh végre, itt vagy! A lehető leghamarabb készen kell állnia a zenekarnak. Nem akarom megvárakoztatni a Dívát, Fromagnus királyt pedig végképp nem!",
				[2] = "Na, menj, kérdezd meg a zenészeket a hangszereikről és keresd meg azokat a színfalak mögött. Szükségük lesz a kottáikra is, vidd oda nekik abból a... halomból.",
				[3] = "Jaj, a gondosan rendezett papírjaim! Vandálok...",
				[4] = "Mindegy, vidd a kottákat a zenészeknek és hangold be a hangszereiket. Mindegyik kottán raja van hogy hogyan kell."
			},
			[2] = {
				[1] = "Na, menj, kérdezd meg a zenészeket a hangszereikről és keresd meg azokat a színfalak mögött. Szükségük lesz a kottáikra is, vidd oda nekik abból a... halomból.",
				[2] = "Mindegy, vidd a kottákat a zenészeknek és hangold be a hangszereiket. Mindegyik kottán raja van hogy hogyan kell."
			},
			[3] = {
				[1] = "Előkészítettél mindenki? Jó kisegér! Tudtam én, hogy megbízhatok benned.",
				[2] = "És most itt az ideje hogy szembenézz a Dívával... nem irigyellek.",
				[3] = "Kezd ideges lenni és ez ragályos. Menj, ő majd megmondja mit kell tenned. Úgy is az a második kedvenc dolga az éneklés után.",
				[4] = "A többit majd én elintézem. Sok szerencsét!"
			},
			[4] = {
				[1] = "Kiváló munka! Most már helyet foglalhatsz és élvezheted a műsort.",
				[2] = "Ne felejtsd el lenémítani a telefonodat, oké?",
				[3] = "Ééés 1, 2, 3, 4..."
			}
		},
		diva = { -- Female
			name = "Diva",
			[-1] = {"..."},
			[1] = { -- Start of the event
				[1] = "Mit bámulsz, szeretnél egy autogrammot?",
				[2] = "Nem úgy látom mintha a zenekar készen állna! Ne várasd meg a hölgyet.",
				[3] = "Na, hova is tettem a zseb tükrömet..."
			},
			[2] = { -- Microphone phase (instruments deliver finished)
				[1] = "Nos, ez eltartott egy ideig, már kezdtem kétségbeesni.",
				[2] = "Rendben, először is, ki tudnád bogozni a mikrofon kábelét? Én nem tudom ebben a ruhában."
			},
			[3] = {
				[1] = "Rendben, ki tudnád bogozni a mikrofon kábelét? Én nem tudom ebben a ruhában."
			},
			[4] = { -- Last phase (performing on piano)
                [1] = "Esküszöm, amatőrökkel vagyok körülvéve... mindegy, jó munka. És most, csináljunk művészetet!",
				[2] = "Koncentrálj. Én éneklem a részemet, te pedig kísérsz engem majd a zongorán.",
				[3] = "Ne hogy hibázz, megértetted? Nos akkor, kezdjük!"
			},
			[5] = {
				[1] = "Koncentrálj. Én éneklem a részemet, te pedig kísérsz engem majd a zongorán.",
				[2] = "Ne hogy hibázz, megértetted? Nos akkor, kezdjük!"
			},
			[6] = { -- Event finished (player will get rewards from here)
				[1] = "Szép munka! Megérdemelsz valamennyit a tapsból, nélküled nem hoztuk volna össze.",
				[2] = "Találkozunk az afterpartin!"
			}
		},
		musician = {
			name = "Zenész",
			[-2] = {"Ezekkel a kottákkal nem tudom behangolni a hangszeremet."}, -- It's a musical sheet. Dialog said when the player gives the wrong sheet to the musician.
			[-1] = {"Öhm... ez nem az én hangszerem."}, -- When the player tries to give the instrument to the wrong musician
			[0] = {"..."},
			[2] = {"Készen állok a koncertre!"}, -- When the player gives the correct instrument to the musician
			[3] = {"Ööö... nekem már itt van a hangszerem."}, -- When the player tries to give an instrument to a musician that already has theirs
			[4] = {"Itt a mi hősünk!"}
		}
	},
	instruct = {
		microphone = "Bogozd ki a mikrofon kábelét a blokkok mozgatásával.",
		insboard = "Válaszd ki a megfelelő hangszert, majd szerezd meg a hozzá tartozó kottát.",
		scorepile = "Válaszd ki a megfelelő kottát, és memorizáld a gesztusok sorrendjét a hangszer behangolásához.",
		piano = "Ismételd meg a dallamot, amelyet a Diva most énekelt.",
		
		accept = "Elfogad",
		reject = "Elutasít",
		continue = "Folytatás",
		cancel = "Mégse",
		search = "Keresés",
		discard = "Eldobás",
		start = "Kezdés", -- As verb 'to start'
		finish = "Befejezés", -- As verb 'to finish'
		riddle = "Tippelj" -- Clue or guess
	}
}