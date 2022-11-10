Text["nl"] = {
	title = "Muziek Orkest",
	hey = {
		[1] = "Welkom op het evenement!"
	},
	instruments = { -- In comments (text after two lines --) gender of the musician that plays the instrument
		["timpani"] 	    = {"Pauken", 		"Ik gebruik een pedaal om mijn instrument te stemmen."}, -- Male
		["cymbals"] 	    = {"Bekkens", 		"Mijn instrument hoeft niet echt gestemd te worden."}, -- Female
		["tubular_bells"] 		= {"Buisklokken", 			"Mijn instrument wordt ook gebruikt in staande klokken."}, -- Male
		["vibraphone"] 	    = {"Vibrafoon", 	"Mijn instrument is nog geen 100 jaar oud."}, -- Female
		["marimba"] 	    = {"Marimba", 		"Palissander wordt vaak gebruikt om mijn instrument te maken."}, -- Female
		
		["horn"] 		= {"Hoorn", 			"De Engelsen beweren dat mijn instrument Frans is."}, -- Male
		["trumpet"] 	= {"Trompet", 		"Mijn instrument kan de muren van Jericho doen beven.."}, -- Female
		["trombone"] 	= {"Trombone", 		"Don Drummond was de man met een groot instrument als de mijne."}, -- Neutral
		["tuba"] 		= {"Tuba", 			"Mijn instrument verving de ophicleïde in het orkest."}, -- Neutral
		["euphonium"] 	= {"Eufonium", 	"De naam van mijn instrument betekent \"goed klinkend\" in het Grieks."}, -- Male
		
		["flute"] 		= {"Fluit", 		"De mijne is een slank instrument dat in de muziek van Jethro Tull wordt gevonden."}, -- Neutral
		["oboe"] 		= {"Hobo", 			"De schalmei is de voorouder van mijn instrument."}, -- Female
		["clarinet"] 	= {"Klarinet", 		"Rhapsody in Blue opent met een solo voor mijn instrument."}, -- Female
		["bassoon"] 	= {"Fagot", 		"Het mondstuk van mijn instrument heet de bokaal."}, -- Male
		["saxophone"] 	= {"Saxofoon", 	"Mijn instrument is ideaal voor sensuele muziek."}, -- Male
		
		["violin"] 		= {"Viool", 		"Met mijn instrument zou ik de onderbevelhebber van het hele orkest kunnen zijn."}, -- Male
		["viola"] 		= {"Altviool", 		"Mijn snaarinstrument gebruikt de zeldzame altsleutel.."}, -- Female
		["cello"] 		= {"Cello", 		"Ik speel dit instrument tussen mijn benen."}, -- Female
		["bass"] 		= {"Bas", 			"Mijn snaarinstrument is groter dan jij."}, -- Male
		["harp"] 		= {"Harp", 			"Vermoedelijk bespelen engelen ook mijn instrument."} -- Neutral
	},
	npcDialogs = {
		-- YES. Some of the dialogues are duplicated. That's on purpose.
		conductor = { -- Male
			name = "Dirigent",
			[-1] = {"..."},
			[1] = {
				[1] = "Eindelijk, je bent er! Ik wil dit orkest zo snel mogelijk klaar hebben. Ik wil de Diva niet laten wachten en koning Fromagnus al helemaal niet!",
				[2] = "Vraag elke muzikant naar hun instrument en ga backstage om het te halen. Ze hebben ook hun muziekpartituren nodig, haal ze van die... stapel.",
				[3] = "Mijn arme, keurige stapels! Vandalen...",
				[4] = "Hoe dan ook, breng de partituur naar elke muzikant en stem hun instrument. Op elke partituur staan instructies daarover."
			},
			[2] = {
				[1] = "Vraag elke muzikant naar hun instrument en ga backstage om het te halen. Ze hebben ook hun muziekpartituren nodig, haal ze van die stapel.",
				[2] = "Breng de partituur naar elke muzikant en stem hun instrument. Op elke partituur staan instructies daarover."
			},
			[3] = {
				[1] = "Heb je iedereen klaar? Goede muis! Ik wist dat ik op je kon rekenen.",
				[2] = "Nu is het tijd om de Diva onder ogen te zien... Ik ben niet jaloers op je.",
				[3] = "Ze begint nerveus te worden en het is besmettelijk. Ga, ze zal je vertellen wat je moet doen. Dat is haar tweede favoriete bezigheid, na zingen.",
				[4] = "Ik regel de rest. Veel succes!"
			},
			[4] = {
				[1] = "Uitstekend werk! Nu kan je plaatsnemen en van de show genieten.",
				[2] = "Vergeet je smartphone niet te dempen, toch?",
				[3] = "Ennn 1, 2, 3, 4..."
			}
		},
		diva = { -- Female
			name = "Diva",
			[-1] = {"..."},
			[1] = { -- Start of the event
				[1] = "Waar sta je naar te staren, wil je mijn handtekening?",
				[2] = "Ik zie het orkest niet klaar staan! Laat een dame niet wachten.",
				[3] = "Waar heb ik mijn zakspiegel gelaten..."
			},
			[2] = { -- Microphone phase (instruments deliver finished)
				[1] = "Nou, dat heeft je even geduurd, ik begon te wanhopen.",
				[2] = "Ok, ten eerste, kun je de kabel van mijn microfoon ontwarren? In deze jurk kan ik dat niet."
			},
			[3] = {
				[1] = "Kun je de kabel van mijn microfoon ontwarren? In deze jurk kan ik dat niet."
			},
			[4] = { -- Last phase (performing on piano)
                [1] = "Ik zweer het, ik ben omringd door amateurs... Hoe dan ook, goed werk. Laten we wat kunst maken!",
				[2] = "Concentreer je. Ik zing mijn deel en jij vergezelt me op de piano.",
				[3] = "Maak geen fouten, begrijp je dat? Nou dan, laten we gaan!"
			},
			[5] = {
				[1] = "Concentreer je. Ik zing mijn deel en jij vergezelt me op de piano.",
				[2] = "Maak geen fouten, begrijp je dat? Nou dan, laten we gaan!"
			},
			[6] = { -- Event finished (player will get rewards from here)
				[1] = "Goed gedaan! Je verdient een deel van het applaus dat we hebben gekregen, zonder jou hadden we het niet gekund.",
				[2] = "Tot ziens op de afterparty!"
			}
		},
		musician = {
			name = "Musicus",
			[-2] = {"Met deze partituur kan ik mijn instrument niet stemmen."}, -- It's a musical sheet. Dialog said when the player gives the wrong sheet to the musician.
			[-1] = {"Ehm... Dit is niet mijn instrument."}, -- When the player tries to give the instrument to the wrong musician
			[0] = {"..."},
			[2] = {"Ik ben klaar voor het concert!"}, -- When the player gives the correct instrument to the musician
			[3] = {"Uhm... Ik heb mijn instrument al."}, -- When the player tries to give an instrument to a musician that already has theirs
			[4] = {"Daar is onze held!"}
		}
	},
	instruct = {
		microphone = "Ontwar de microfoonkabel door de blokken te verplaatsen.",
		insboard = "Kies het juiste muziekinstrument, haal vervolgens de bijbehorende muziekpartituur.",
		scorepile = "Kies de juiste partituur en onthoud de opeenvolging van gebaren om het instrument te stemmen.",
		piano = "Herhaal het deuntje dat de Diva zojuist heeft gezongen.",
		
		accept = "Aanvaarden",
		reject = "Afwijzen",
		continue = "Doorgaan",
		cancel = "Annuleren",
		search = "Zoeken",
		discard = "Weggooien",
		start = "Beginnen", -- As verb 'to start'
		finish = "Beëindigen", -- As verb 'to finish'
		riddle = "Raadsel" -- Clue or guess
	}
}