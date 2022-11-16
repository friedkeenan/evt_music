Text["pl"] = {
	title = "Orkiestra muzyczna",
	hey = {
		[1] = "Witamy w evencie!"
	},
	instruments = { -- In comments (text after two lines --) gender of the musician that plays the instrument
		["timpani"] 	= {"Kotły", 		"Używam pedału do strojenia mojego instrumentu."}, -- Male
		["cymbals"] 	= {"Cymbałki", 		"Mój instrument tak naprawdę nie potrzebuje strojenia."}, -- Female
		["tubular_bells"] 		= {"Dzwony rurowe", 			"Mój instrument jest również używany w zegarach dziadków."}, -- Male
		["vibraphone"] 	= {"Wibrafon", 	"Mój instrument nie ma nawet stu lat."}, -- Female
		["marimba"] 	= {"Marimba", 		"Palisander jest często używany do produkcji mojego instrumentu."}, -- Female

		["horn"] 		= {"Róg", 			"Anglicy twierdzą, że mój instrument jest francuski."}, -- Male
		["trumpet"] 	= {"Trąbka", 		"Mój instrument może sprawić, że mury Jerycha zadrżą."}, -- Female
		["trombone"] 	= {"Puzon", 		"Don Drummond był człowiekiem z tak dużym instrumentem jak mój."}, -- Neutral
		["tuba"] 		= {"Tuba", 			"Mój instrument zastąpił ofiklejdę w orkiestrze."}, -- Neutral
		["euphonium"] 	= {"Eufonium", 	"Nazwa mojego instrumentu oznacza po grecku \"dobrze brzmiący\"."}, -- Male

		["flute"] 		= {"Flet", 		"Mój to, smukły instrument występujący w muzyce Jethro Tull."}, -- Neutral
		["oboe"] 		= {"Obój", 			"Szałamaja to przodkini mojego instrumentu."}, -- Female
		["clarinet"] 	= {"Klarnet", 		"Błękitna rapsodia otwiera solówkę na mój instrument."}, -- Female
		["bassoon"] 	= {"Fagot", 		"Ustnik mojego instrumentu nazywa się bocal."}, -- Male
		["saxophone"] 	= {"Saksofon", 	"Mój instrument jest idealny do zmysłowej muzyki."}, -- Male

		["violin"] 		= {"Skrzypce", 		"Z moim instrumentem, mógłbym być drugim dowódcą całej orkiestry."}, -- Male
		["viola"] 		= {"Altówka", 		"Mój instrument jest żeńską członkinią kwartetu smyczkowego."}, -- Female
		["cello"] 		= {"Wiolonczela", 		"Gram na swoim instrumencie między nogami."}, -- Female
		["bass"] 		= {"Gitara basowa", 			"Mój instrument strunowy jest wyższy od ciebie."}, -- Male
		["harp"] 		= {"Harfa", 			"Podobno, anioły grają też na moim instrumencie."} -- Neutral
	},
	npcDialogs = {
		-- YES. Some of the dialogues are duplicated. That's on purpose.
		conductor = { -- Male
			name = "Dyrygent",
			[-1] = {"..."},
			[1] = {
				[1] = "Nareszcie jesteś! Potrzebuję tej orkiestry gotowej, najszybciej jak to możliwe. Nie chcę, aby Diva czekała, a już na pewno nie Król Fromagnus!",
				[2] = "Cóż, zapytaj każdego muzyka o jego instrument i udaj się za kulisy po niego. Potrzebują oni również swoich partytur, weź je z tego... stosu.",
				[3] = "Moje biedne schludne stosy! Wandale...",
				[4] = "W każdym razie, przynieś partyturę każdemu muzykowi i nastrój jego instrument. Każda partytura ma instrukcje na ten temat."
			},
			[2] = {
				[1] = "Zapytaj każdego muzyka o jego instrument i udaj się za kulisy po niego. Potrzebują oni również swoich partytur, weź je ze stosu.",
				[2] = "Przynieś każdemu muzykowi partyturę i nastrój jego instrument. Każda partytura ma instrukcje na ten temat."
			},
			[3] = {
				[1] = "Masz wszystkich gotowych? Dobra myszka! Wiedziałem, że mogę na ciebie liczyć.",
				[2] = "Teraz nadszedł czas, aby zmierzyć się z Divą... Nie zadroszczę ci.",
				[3] = "Staje się nerwowa i to jest zaraźliwe. Idź, ona ci powie, co robić. To jej druga ulubiona rzecz, po śpiewaniu.",
				[4] = "Zajmę się resztą. Powodzenia!"
			},
			[4] = {
				[1] = "Świetna robota! Teraz możesz zająć swoje miejsce i cieszyć się pokazem.",
				[2] = "Nie zapomnij wyciszyć swojego telefonu, prawda?",
				[3] = "Iiii 1, 2, 3, 4..."
			}
		},
		diva = { -- Female
			name = "Diva",
			[-1] = {"..."},
			[1] = { -- Start of the event
				[1] = "Co się tak gapisz, chcesz mój autograf?",
				[2] = "Nie widzę, aby orkiestra była gotowa! Nie każ damie czekać.",
				[3] = "Gdzie ja położyłam swoje kieszonkowe lusterko..."
			},
			[2] = { -- Microphone phase (instruments deliver finished)
				[1] = "No, zajęło ci to trochę czasu, zaczynałam już rozpaczać.",
				[2] = "Okej, po pierwsze, czy możesz rozplątać kabel od mojego mikrofonu? Nie mogę tego zrobić w tej sukience."
			},
			[3] = {
				[1] = "Czy możesz rozplątać kabel od mojego mikrofonu? Nie mogę tego zrobić w tej sukience."
			},
			[4] = { -- Last phase (performing on piano)
                [1] = "Przysięgam, jestem otoczona przez amatorów... Tak czy siak, dobra robota. Zróbmy trochę sztuki!",
				[2] = "Skup się teraz. Ja zaśpiewam swoją część, a ty będziesz mi akompaniował na fortepianie.",
				[3] = "Nie popełniaj błędów, rozumiesz? Cóż, zaczynajmy!"
			},
			[5] = {
				[1] = "Skup się teraz. Ja zaśpiewam swoją część, a ty będziesz mi akompaniował na fortepianie.",
				[2] = "Nie popełniaj błędów, rozumiesz? Cóż, zaczynajmy!"
			},
			[6] = { -- Event finished (player will get rewards from here)
				[1] = "Brawo! Zasługujesz na część oklasków, które otrzymaliśmy, bez ciebie nie moglibyśmy tego zrobić.",
				[2] = "Do zobaczenia na afterparty!"
			}
		},
		musician = {
			name = "Muzyk",
			[-2] = {"Nie mogę nastroić mojego instrumentu z tą partyturą."}, -- It's a musical sheet. Dialog said when the player gives the wrong sheet to the musician.
			[-1] = {"Ehh... To nie jest mój instrument."}, -- When the player tries to give the instrument to the wrong musician
			[0] = {"..."},
			[2] = {"Jestem gotów na koncert!"}, -- When the player gives the correct instrument to the musician
			[3] = {"Uhm... Mam już swój instrument."}, -- When the player tries to give an instrument to a musician that already has theirs
			[4] = {"Oto nasz bohater!"}
		}
	},
	instruct = {
		microphone = "Rozplątaj kabel od mikrofonu poprzez przesunięcie bloków.",
		insboard = "Wybierz odpowiedni instrument muzyczny, a następnie przynieś pasującą partyturę.",
		scorepile = "Wybierz odpowiednią partyturę i zapamiętaj sekwencje gestów, aby nastroić instrument.",
		piano = "Powtórz melodię, którą Diva właśnie zaśpiewała.",

		accept = "Accept",
		reject = "Odrzuć",
		continue = "Kontynuuj",
		cancel = "Anuluj",
		search = "Szukaj",
		discard = "Odrzuć",
		start = "Rozpocznij", -- As verb 'to start'
		finish = "Zakończ", -- As verb 'to finish'
		riddle = "Wskazówka" -- Clue or guess
	}
}