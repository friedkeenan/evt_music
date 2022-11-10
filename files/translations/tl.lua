Text["tl"] = {
	title = "Orkestra ng Musika",
	hey = {
		[1] = "Maligayang pagdating sa kaganapang ito!"
	},
	instruments = { -- In comments (text after two lines --) gender of the musician that plays the instrument
		["timpani"] 	= {"Timpani", 		"Gumagamit ako ng pedal upang i-tono ang aking instrumento."}, -- Male
		["cymbals"] 	= {"Pompyang", 		"Ang aking instrumento ay hindi na kinakailangang i-tono."}, -- Female
		["tubular_bells"] 		= {"Kampanang tubular", 			"Ang aking instrumento ay ginagamit din sa mga makalumang orasan"}, -- Male
		["vibraphone"] 	= {"Bibrapono", 	"Ang aking instrumento ay hindi nga 100 taong gulang."}, -- Female
		["marimba"] 	= {"Marimba", 		"Rosewood ay kadalasang ginagamit sa paggawa ng aking instrumento."}, -- Female
		
		["horn"] 		= {"Tambuling", 			"Ang ingles ay sinasabi na ang instrumento ko ay pranses."}, -- Male
		["trumpet"] 	= {"Trumpeta", 		"Ang aking instrumento ay kayang payanigin ang pader ng Jericho."}, -- Female
		["trombone"] 	= {"Trombon", 		"Si Don Drummond ay ang taong mayroong malaking instrumento katulad ng sa akin."}, -- Neutral
		["tuba"] 		= {"Pakakak", 			"Ang aking instrumento ang nagpalit sa ophicleide sa orkestra."}, -- Neutral
		["euphonium"] 	= {"Euponyum", 	"Ang pangalan ng aking instrumento ay nangangahulugang \"maganda-tumunog\" sa griyego."}, -- Male
		
		["flute"] 		= {"Plauta", 		"Ang akin ay isang payat na instrumentong matatagpuan sa musika ng Jethro Tull."}, -- Neutral
		["oboe"] 		= {"Oboe", 			"Ang shawm ay ang ninuno ng aking instrumento."}, -- Female
		["clarinet"] 	= {"Klarinete", 		"Rhapsody in Blue ay nagbukas na may solo para sa aking instrumento."}, -- Female
		["bassoon"] 	= {"Bahon", 		"Ang tawag sa nilalagay sa bibig sa aking instrumento ay bocal."}, -- Male
		["saxophone"] 	= {"Saksopon", 	"Ang instrumento ko ay maganda para sa senswal na musika"}, -- Male
		
		["violin"] 		= {"Byolin", 		"Sa aking instrumento, Maaari ako ang maging pangalawa sa taga-pamuno sa buong orkestra."}, -- Male
		["viola"] 		= {"Biyola", 		"Ang instrumento ko ay ang babaeng miyembro ng string kwartet."}, -- Female
		["cello"] 		= {"Tselo", 		"Tinutugtog ko ang aking instrumento sa pagitan ng aking mga paa."}, -- Female
		["bass"] 		= {"Baho", 			"Ang aking de-kwerdas na instrumento ay mas matangkad pa kaysa sa iyo."}, -- Male
		["harp"] 		= {"Alpa", 			"Sinasabing, mga anghel ay tinutugtog din ang aking instrumento."} -- Neutral
	},
	npcDialogs = {
		-- YES. Some of the dialogues are duplicated. That's on purpose.
		conductor = { -- Male
			name = "Konduktor",
			[-1] = {"..."},
			[1] = {
				[1] = "Sa wakas, nandito ka na! Kailangan ko ang orkestrang ito sa lalong madaling panahon. Ayaw kong paghintayin ang Diva at tiyak na hindi rin ang haring si Fromagnus!",
				[2] = "Kung ganon, tanungin ang bawat musikero tungol sa kanilang instrumento at pumunta sa likod ng entablado para makuha ito. Kailangan din nila ng kanilang talaawitan, kunin mo diyan sa... naka tambak.",
				[3] = "Ang aking nakakaawang maayos na stacks! Mga mapanira...",
				[4] = "Atsaka, dalhin mo ang talaawitan sa bawat musikero at i-tono mo ang kanilang instrumento. Bawat talaawitan ay mayroong gabay tungkol dito."
			},
			[2] = {
				[1] = "Kung ganon, tanungin ang bawat musikero tungol sa kanilang instrumento at pumunta sa likod ng entablado para makuha ito. Kailangan din nila ng kanilang talaawitan, kunin mo diyan sa... naka tambak.",
				[2] = "Atsaka, dalhin mo ang talaawitan sa bawat musikero at i-tono mo ang kanilang instrumento. Bawat talaawitan ay mayroong gabay tungkol dito."
			},
			[3] = {
				[1] = "Naihanda mo na ang lahat? Mabuting daga! Alam ko talagang maaasahan kita.",
				[2] = "Ngayon, oras nang harapin ang Diva... Hindi ako naiinggit sa iyo.",
				[3] = "Siya ay kinakabahan na at ito ay nakakahawa. Pumaroon, sasabihin niya kung ano ang dapat mong gawin. Iyan ang pangalawa niyang paboritong gawin, pagkatapos kumanta.",
				[4] = "Ako na ang bahala sa iba. Paralarin ka sana!"
			},
			[4] = {
				[1] = "Mahusay na trabaho! Ngayon maaari ka nang umupo at magsaya sa palabas.",
				[2] = "'Wag kalimutang i-mute ang iyong selpon, diba?",
				[3] = "Aaat 1, 2, 3, 4..."
			}
		},
		diva = { -- Female
			name = "Diva",
			[-1] = {"..."},
			[1] = { -- Start of the event
				[1] = "Ano ang tinititig mo diyan, gusto mo ba ng aking awtograp?",
				[2] = "Hindi ko makitang handa ang orkestra! Huwag hayaang maghintay ang ginang.",
				[3] = "Ngayon, saan ko ba inilagay ang aking salaming de-bulsa..."
			},
			[2] = { -- Microphone phase (instruments deliver finished)
				[1] = "Ahh, natagalan ka roon, Nagsisimula na akong mawalan ng pag-asa.",
				[2] = "Sige, una, maaari mo bang tanggalin sa pagkabuhol-buhol ang kable ng aking mikropono? Hindi ko kasi magawa sa damit na ito."
			},
			[3] = {
				[1] = "Maaari mo bang tanggalin sa pagkabuhol-buhol ang kable ng aking mikropono? Hindi ko kasi magawa sa damit na ito."
			},
			[4] = { -- Last phase (performing on piano)
                [1] = "Sa totoo lang, Ako ay napapaligiran ng mga amatyur... Gayon pa man, mahusay na trabaho. Tara at gumawa tayo ng mga sining!",
				[2] = "Magpokus, ngayon. Kakantahin ko ang parte ko at sasamahan mo ako sa piyano.",
				[3] = "Huwag magkakamali, naiintindihan mo ba? Kung ganon, tara na!"
			},
			[5] = {
				[1] = "Magpokus, ngayon. Kakantahin ko ang parte ko at sasamahan mo ako sa piyano.",
				[2] = "Huwag magkakamali, naiintindihan mo ba? Kung ganon, tara na!"
			},
			[6] = { -- Event finished (player will get rewards from here)
				[1] = "Mahusay! Nararapat na sa iyo ang ilang mga palakpak na aming natanggap, hindi namin magagawa ito kung wala ka.",
				[2] = "Kita-kita nalang sa after-party!"
			}
		},
		musician = {
			name = "Musikero",
			[-2] = {"Hindi ko ma i-tono ang instrumento ko sa talaawitan na ito."}, -- It's a musical sheet. Dialog said when the player gives the wrong sheet to the musician.
			[-1] = {"Eehh... Hindi ito ang aking instrumento."}, -- When the player tries to give the instrument to the wrong musician
			[0] = {"..."},
			[2] = {"Handa na ako para sa konsiyerto!"}, -- When the player gives the correct instrument to the musician
			[3] = {"Uhm... Mayroon na akong instrumento."}, -- When the player tries to give an instrument to a musician that already has theirs
			[4] = {"Ayun ang ating bayani!"}
		}
	},
	instruct = {
		microphone = "Tanggalin sa pagkabuhol-buhol ang kable ng mikropono sa pamamagitan ng paglipat ng mga bloke sa paligid.",
		insboard = "Piliin ang tamang instrumentong pangmusika, pagkatapos ay kunin ang katugmang talaawitan.",
		scorepile = "Piliin ang tamang talaawitan at kabisaduhin ang pagkakasunud-sunod ng mga galaw, para i-tono ang instrumento.",
		piano = "Ulitin ang pag-tono ang Diva ay kakakanta lang.",
		
		accept = "Tanggapin",
		reject = "Tanggihan",
		continue = "Magpatuloy",
		cancel = "Kanselahin",
		search = "Hanapin",
		discard = "ibasura",
		start = "Simulan", -- As verb 'to start'
		finish = "Tapusin", -- As verb 'to finish'
		riddle = "Bugtong" -- Clue or guess
	}
}