Text["lt"] = {
	title = "Muzikos orkestras",
	hey = {
		[1] = "Sveiki atvykę į renginį!"
	},
	instruments = { -- In comments (text after two lines --) gender of the musician that plays the instrument
		["būgnas"] 	= {"Būgnas", 		"Aš naudoju pedalą instrumento derinimuiAš naudoju pedalą instrumento derinimui"}, -- Male
		["cimbolai"] 	= {"Cimbolai", 		"Mano instrumentui derinti tikrai nereikia."}, -- Female
		["vamzdiniai varpai"] 		= {"Vamzdiniai Varpai", 			"Mano instrumentas naudojamas ir senelių laikrodžiuose"}, -- Male
		["vibrofonas"] 	= {"Vibrofonas", 	"Mano instrumentui dar nėra 100 metų."}, -- Female
		["marimba"] 	= {"Marimba", 		"Mano instrumentui gaminti naudojamas geležies medis."}, -- Female
		
		["ragas"] 		= {"Ragas", 			"Anglai teigia, kad mano instrumentas yra prancūziškas."}, -- Male
		["trimitas"] 	= {"Trimitas", 		"Mano instrumentas gali priversti Jericho sienas drebėti."}, -- Female
		["trombonas"] 	= {"Trombonas", 		"Donas Drumondas buvo žmogus su dideliu instrumentu, kaip ir mano."}, -- Neutral
		["vamzdis"] 		= {"Vamzdis", 			"Mano instrumentas orkestre pakeitė ofikleidą."}, -- Neutral
		["eufonija"] 	= {"Eufonija", 	"Mano instrumento pavadinimas reiškia \"gerai skambantis\" iš graikų kalbos."}, -- Male
		
		["fleita"] 		= {"Fleita", 		"Manasis yra plonas instrumentas. Rasta Jethro Tull viduje."}, -- Neutral
		["obojus"] 		= {"Obojus", 			"Birbynė yra mano protėvis."}, -- Female
		["klarnetas"] 	= {"Klarnetas", 		"Rhapsody in Blue prasideda solo mano instrumentui."}, -- Female
		["fagotas"] 	= {"Fagotas", 		"Mano instrumento kandiklis vadinamas bocal."}, -- Male
		["saksofonas"] 	= {"Saksofonas", 	"Mano instrumentas idealiai tinka jausmingai muzikai."}, -- Male
		
		["smuikas"] 		= {"Smuikas", 		"Su savo instrumentu galėčiau būti viso orkestro antrininkas."}, -- Malequartet."}, -- Female
		["violončelė"] 		= {"Violončelė", 		"Groju savo instrumentu tarp kojų."}, -- Female
		["bosas"] 		= {"Bosas", 			"Mano styginis instrumentas aukštesnis už tave."}, -- Male
		["arfa "] 		= {"Arfa ", 			"Neva angelai groja ir mano instrumentu."} -- Neutral
	},
	npcDialogs = {
		-- YES. Some of the dialogues are duplicated. That's on purpose.
		conductor = { -- Male
			name = "Dirigentas",
			[-1] = {"..."},
			[1] = {
				[1] = "Pagaliau tu čia! Man reikia kuo greičiau paruošti šį orkestrą. Nenoriu, kad Diva lauktų ir tikrai ne karalius Fromagnus!",
				[2] = "Na, paklauskite kiekvieno muzikanto apie jo instrumentą ir eikite į užkulisius jo pasiimti. Jiems irgi reikia savo natų, gaukite jas iš tos... krūvos.",
				[3] = "Mano vargana tvarkinga krūva. Vandalai...",
				[4] = "Bet kokiu atveju... Paimkite balą kiekvienam žmogui. Ir suderinti jų instrumentą. Kiekviename bale yra nurodymai apie tai."
			},
			[2] = {
				[1] = "Paklauskite kiekvieno muzikanto apie jo instrumentą ir eikite į užkulisius jo pasiimti. Jiems taip pat reikia savo natų, gaukite jas iš krūvos.",
				[2] = "Atneškite lapą kiekvienam asmeniui ir sureguliuokite jo instrumentą. Kiekviename bale yra nurodymai apie tai."
			},
			[3] = {
				[1] = "Ar visus pasiruošei? Gera pelė! Žinojau, kad galiu tavimi pasikliauti.",
				[2] = "Dabar atėjo laikas susidurti su Diva... Aš tau nepavydžiu.",
				[3] = "Ji nervinasi ir tai užkrečiama. Eik, ji tau pasakys, ką daryti. Tai antras jos mėgstamiausias dalykas po dainavimo.",
				[4] = "Likusią dalį susitvarkysiu aš. Sėkmės!"
			},
			[4] = {
				[1] = "Puikus darbas! Dabar galite atsisėsti ir mėgautis pasirodymu.",
				[2] = "Nepamirškite nutildyti savo išmaniojo telefono, tiesa?",
				[3] = "Ir... 1, 2, 3, 4..."
			}
		},
		diva = { -- Female
			name = "Diva",
			[-1] = {"..."},
			[1] = { -- Start of the event
				[1] = "Į ką tu žiūri, ar nori mano autografo?",
				[2] = "Nematau, kad orkestras būtų pasiruošęs! Neverskite ponios laukti.",
				[3] = "Dabar, kur aš padėjau kišeninį veidrodį..."
			},
			[2] = { -- Microphone phase (instruments deliver finished)
				[1] = "Na, tai užtruko, aš pradėjau nevilti.",
				[2] = "Gerai, pirma, ar galite atpainioti mano mikrofono laidą? Aš negaliu to padaryti su šia suknele."
			},
			[3] = {
				[1] = "Ar galite atpainioti mano mikrofono laidą? Aš negaliu to padaryti su šia suknele."
			},
			[4] = { -- Last phase (performing on piano)
                [1] = "Prisiekiu, mane supa mėgėjai... Šiaip ar taip, geras darbas. Kurkime meną!",
				[2] = "Susikoncentruok dabar. Aš dainuosiu savo partiją, o tu palydėsi mane pianinu.",
				[3] = "Nedaryk klaidų, ar supranti? Na, tada eime!"
			},
			[5] = {
				[1] = "Susikoncentruok dabar. Aš dainuosiu savo partiją, o tu palydėsi mane pianinu.",
				[2] = "Nedaryk klaidų, ar supranti? Na, tada eime!"
			},
			[6] = { -- Event finished (player will get rewards from here)
				[1] = "Šauniai padirbėta! Jūs nusipelnėte kai kurių plojimų, kurių sulaukėme, be jūsų to nebūtų galėję padaryti.",
				[2] = "Iki pasimatymo after party!"
			}
		},
		musician = {
			name = "Muzikantas",
			[-2] = {"Negaliu suderinti savo instrumento pagal šią partitūrą."}, -- It's a musical sheet. Dialog said when the player gives the wrong sheet to the musician.
			[-1] = {"Err... Tai ne mano instrumentas."}, -- When the player tries to give the instrument to the wrong musician
			[0] = {"..."},
			[2] = {"Aš pasiruošęs koncertui!"}, -- When the player gives the correct instrument to the musician
			[3] = {"Um... Aš jau turiu savo instrumentą."}, -- When the player tries to give an instrument to a musician that already has theirs
			[4] = {"Čia yra mūsų herojus!"}
		}
	},
	instruct = {
		microphone = "Išpainiokite mikrofono laidą judindami blokelius.",
		insboard = "Pasirinkite tinkamą muzikos instrumentą. Tada gaukite muzikos partitūrą.",
		scorepile = "Norėdami sureguliuoti instrumentą, pasirinkite atitinkamą muzikinę partitūrą ir įsiminkite instrumento seką",
		piano = "Pakartokite melodiją, kurią ką tik dainavo Diva.",
		
		accept = "Priimti",
		reject = "Atmesti",
		continue = "Tęsti",
		cancel = "Atšaukti",
		search = "Paieška",
		discard = "išmesti",
		start = "Pradėti", -- As verb 'to start'
		finish = "Baigti", -- As verb 'to finish'
		riddle = "Mįslė" -- Clue or guess
	}
}