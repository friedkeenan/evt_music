-- Remember: Text after two lines ( -- ) doesn't have to be translated, it just means it's a note or comment for extra context.

--- You can define genders in a translation
-- Use syntax: (male|female|neutral) or (male|female) [1st field is mandatory]
-- For example: "(King|Queen|Royalty) of Transformice", outputs: "Queen of Transformice" for female gender
-- It accepts long sentences and multiple options in a same sentence:
--	"The (man|woman|person) was playing (Jazz|Videogames|with their friends) at the station"
-- Output (for neutral/none: "The person was playing with their friends at the station"

Text["it"] = {
	title = "Orchestra",
	hey = {
		[1] = "(Benvenuto|Benvenuta|Benvenuti) all'evento!"
	},
	instruments = { -- In comments (text after two lines --) gender of the musician that plays the instrument
		["timpani"] 	= {"Timpani", 		"Uso un pedale per accordare il mio strumento."}, -- Male
		["cymbals"] 	= {"Piatti", 		"Il mio strumento non ha bisogno di essere accordato."}, -- Female
		["tubular_bells"] 		= {"Campane Tubolari", 			"Il mio strumento viene utilizzato anche negli orologi a pendolo."}, -- Male
		["vibraphone"] 	= {"Vibrafono", 	"Il mio strumento non ha nemmeno 100 anni."}, -- Female
		["marimba"] 	= {"Marimba", 		"Il palissandro è spesso usato per realizzare il mio strumento."}, -- Female
		
		["horn"] 		= {"Corno", 			"L'inglese afferma che il mio strumento è francese."}, -- Male
		["trumpet"] 	= {"Tromba", 		"Il mio strumento può far tremare le mura di Gerico."}, -- Female
		["trombone"] 	= {"Trombone", 		"Don Drummond era l'uomo con uno strumento grande come il mio."}, -- Neutral
		["tuba"] 		= {"Tuba", 			"Il mio strumento ha sostituito l'ophicleide nell'orchestra."}, -- Neutral
		["euphonium"] 	= {"Eufonio", 	"Il nome del mio strumento significa \"suonante\" in greco."}, -- Male
		
		["flute"] 		= {"Flauto", 		"Il mio è uno strumento sottile che si trova nella musica dei Jethro Tull."}, -- Neutral
		["oboe"] 		= {"Oboe", 			"La ciaramella è l'antenato del mio strumento."}, -- Female
		["clarinet"] 	= {"Clarinetto", 		"Rhapsody in Blue si apre con un assolo con il mio strumento."}, -- Female
		["bassoon"] 	= {"Fagotto", 		"L'imboccatura del mio strumento si chiama Bocal."}, -- Male
		["saxophone"] 	= {"Sassofono", 	"Il mio strumento è l'ideale per suonare musica sensuale."}, -- Male
		
		["violin"] 		= {"Violino", 		"Con il mio strumento potrei essere il secondo al comando dell'intera orchestra."}, -- Male
		["viola"] 		= {"Viola", 		"Il mio strumento è la componente femminile di un quartetto d'archi."}, -- Female
		["cello"] 		= {"Violoncello", 		"Suono il mio strumento tra le gambe."}, -- Female
		["bass"] 		= {"Basso", 			"Il mio strumento a corde è più alto di te."}, -- Male
		["harp"] 		= {"Arpa", 			"Presumibilmente, anche gli angeli suonano il mio strumento."} -- Neutral
	},
	npcDialogs = {
		-- YES. Some of the dialogues are duplicated. That's on purpose.
		conductor = { -- Male
			name = "Conduttore",
			[-1] = {"..."},
			[1] = {
				[1] = "Finalmente sei qui! Ho bisogno che questa orchestra sia pronta il prima possibile. Non voglio far aspettare la Diva e di certo nemmeno Re Fromagnus!",
				[2] = "Bene, chiedi a ogni musicista del loro strumento e vai nel backstage a prenderlo. Hanno anche bisogno dei loro spartiti musicali, prendili da quella... pila.",
				[3] = "Le mie povere pile ordinate! Vandali...",
				[4] = "Ad ogni modo, porta lo spartito musicale a ciascun musicista e accorda il suo strumento. Ogni spartito contiene istruzioni a riguardo."
			},
			[2] = {
				[1] = "Chiedi a ogni musicista del proprio strumento e vai nel backstage a prenderlo. Hanno anche bisogno dei loro spartiti musicali, prendili dalla pila.",
				[2] = "Porta gli spartiti musicali a ciascun musicista e accorda il suo strumento. Ogni spartito contiene istruzioni a riguardo."
			},
			[3] = {
				[1] = "Sono tutti pronti? Bravo topo! Sapevo di poter contare su di te.",
				[2] = "Adesso è il momento di affrontare la Diva... Non ti invidio.",
				[3] = "Sta diventando nervosa ed è contagiosa. Vai, ti dirà cosa fare. Questa è la sua seconda cosa preferita da fare, dopo cantare ovviamente.",
				[4] = "Mi occuperò io del resto. Buona fortuna!"
			},
			[4] = {
				[1] = "Lavoro eccellente! Ora puoi prendere posto e goderti lo spettacolo.",
				[2] = "Non dimenticare di disattivare il volume del tuo smartphone, no?",
				[3] = "Eeeee 1, 2, 3, 4..."
			}
		},
		diva = { -- Female
			name = "Diva",
			[-1] = {"..."},
			[1] = { -- Start of the event
				[1] = "Che ti guardi? Vuoi il mio autografo?",
				[2] = "Non vedo l'orchestra pronta! Non far aspettare una signora.",
				[3] = "Ma dove ho messo il mio specchietto tascabile..."
			},
			[2] = { -- Microphone phase (instruments deliver finished)
				[1] = "Beh, ci hai messo un po', stavo cominciando a disperarmi.",
				[2] = "Ok, per prima cosa puoi districare il cavo del mio microfono? Non riesco a farlo con questo vestito."
			},
			[3] = {
				[1] = "Puoi districare il cavo del mio microfono? Non riesco a farlo con questo vestito."
			},
			[4] = { -- Last phase (performing on piano)
                [1] = "Giuro, sono circondato da dilettanti... Comunque, buon lavoro. Creiamo un po' d'arte!",
				[2] = "Ora concentrati. Canterò la mia parte e tu mi accompagnerai al pianoforte.",
				[3] = "Non commettere errori, hai capito? Bene, allora andiamo!"
			},
			[5] = {
				[1] = "Concentrati, ora. Canterò la mia parte e tu mi accompagnerai al pianoforte.",
				[2] = "Non commettere errori, hai capito? Bene, allora andiamo!"
			},
			[6] = { -- Event finished (player will get rewards from here)
				[1] = "Ben fatto! Ti meriti un po' degli applausi che abbiamo ricevuto, non avremmo potuto farcela senza di te.",
				[2] = "Ci vediamo più tardi all'afterparty!"
			}
		},
		musician = {
			name = "Musicista",
			[-2] = {"Non riesco ad accordare il mio strumento con questo spartito musicale."}, -- It's a musical sheet. Dialog said when the player gives the wrong sheet to the musician.
			[-1] = {"Ehm... Questo non è il mio strumento."}, -- When the player tries to give the instrument to the wrong musician
			[0] = {"..."},
			[2] = {"Sono (pronto|pronta) per il concerto!"}, -- When the player gives the correct instrument to the musician
			[3] = {"Uhm... ho già il mio strumento."}, -- When the player tries to give an instrument to a musician that already has theirs
			[4] = {"Ecco il nostro eroe!"}
		}
	},
	instruct = {
		microphone = "Districa il cavo del microfono spostando i blocchi.",
		insboard = "Scegli lo strumento musicale giusto, poi recupera lo spartito musicale corrispondente.",
		scorepile = "Scegli il giusto spartito musicale e memorizza la sequenza dei gesti per accordare lo strumento.",
		piano = "Ripeti la melodia che la Diva ha appena cantato.",
		
		accept = "Accetta",
		reject = "Rifiuta",
		continue = "Continua",
		cancel = "Annulla",
		search = "Cerca",
		discard = "Scarta",
		start = "Inizia", -- As verb 'to start'
		finish = "Concludi", -- As verb 'to finish'
		riddle = "Indovinello" -- Clue or guess
	}
}