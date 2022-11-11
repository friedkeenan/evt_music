Text["fr"] = {
	title = "Music Orchestra",
	hey = {
		[1] = "Bienvenue à l'événement ! "
	},
	instruments = { -- In comments (text after two lines --) gender of the musician that plays the instrument
		["timpani"] 	= {"Timbales", 		"J'utilise une pédale pour accorder mon instrument."}, -- Male
		["cymbals"] 	= {"Cymbales", 		"Mon instrument n'a pas vraiment besoin d'être accordé."}, -- Female
		["tubular_bells"] 		= {"Cloches tubulaires", 			"Mon instrument est aussi utilisé dans les horloges à pendule."}, -- Male
		["vibraphone"] 	= {"Vibraphone", 	"Mon instrument n'a même pas 100 ans."}, -- Female
		["marimba"] 	= {"Marimba", 		"Le bois de rose est souvent utilisé pour produire mon instrument."}, -- Female
		
		["horn"] 		= {"Cor d'harmonie", 			"Les anglais prétendent que mon instrument est français."}, -- Male
		["trumpet"] 	= {"Trompette", 		"Mon instrument peut faire trembler les murs de Jericho."}, -- Female
		["trombone"] 	= {"Trombone", 		"Don Drummond était l'homme avec un grand instrument comme le mien."}, -- Neutral
		["tuba"] 		= {"Tuba", 			"Mon instrument a remplacé l'ophicléide dans l'orchestre."}, -- Neutral
		["euphonium"] 	= {"Euphonium", 	"Le nom de mon instrument signifie \"bonne sonorité\" en grecque."}, -- Male
		
		["flute"] 		= {"Flûte", 		"Le mien est un instrument que l'on trouve dans la musique de Jethro Tull."}, -- Neutral
		["oboe"] 		= {"Hautbois", 			"La flûte médiévale est l'ancêtre de mon instrument."}, -- Female
		["clarinet"] 	= {"Clarinette", 		"Rhapsody in Blue commence avec un solo de mon instrument."}, -- Female
		["basson"] 	= {"Basson", 		"Le bec de mon instrument s'appelle le bocal."}, -- Male
		["saxophone"] 	= {"Saxophone", 	"Mon instrument est idéal pour de la musique sensuelle."}, -- Male
		
		["violin"] 		= {"Violon", 		"Avec mon instrument, je pouvais être le second de tout l'orchestre."}, -- Male
		["viola"] 		= {"Alto", 		"Mon instrument est le féminin d'un quatuor à cordes."}, -- Female
		["cello"] 		= {"Violoncelle", 		"Je joue de mon instrument entre mes jambes."}, -- Female
		["bass"] 		= {"Guitare basse", 			"Mon instrument à cordes est plus grand que vous."}, -- Male
		["harp"] 		= {"Harpe", 			"Il paraît que les anges jouent aussi de mon instrument."} -- Neutral
	},
	npcDialogs = {
		-- YES. Some of the dialogues are duplicated. That's on purpose.
		conductor = { -- Male
			name = "Conductor",
			[-1] = {"..."},
			[1] = {
				[1] = "Enfin, vous êtes là ! J'ai besoin que cet orchestre soit prêt le plus vite possible. Je ne veux pas faire attendre la Diva et surtout pas le roi Fromagnus.",
				[2] = "Bien, demandez à chaque musicien quel est son instrument et allez le chercher dans les coulisses. Ils ont également besoin de leurs partitions, allez les chercher dans cette… pile.",
				[3] = "Mes pauvres piles bien rangées ! Vandales…",
				[4] = "Peu importe, apportez la partition à chaque musicien et accordez leur instrument. Chaque partition contient des informations précises à ce sujet."
			},
			[2] = {
				[1] = "Demandez à chaque musicien quel est son instrument et allez le chercher dans les coulisses. Ils ont aussi besoin de leurs partitions, allez les chercher sur la pile.",
				[2] = "Apportez la partition à chaque musicien et accordez leur instrument. Chaque partition contient des informations précises à ce sujet."
			},
			[3] = {
				[1] = "Tout le monde est prêt ? Bien joué ! Je savais que je pouvais compter sur toi.",
				[2] = "Maintenant, il est temps d'affronter la Diva... Je ne vous envie pas.",
				[3] = "Elle devient à chaque fois nerveuse, c'est contagieux. Vas-y, elle te dira quoi faire. C'est ce qu'elle aime le plus faire, après le chant.",
				[4] = "Je m'occupe du reste. Bonne chance !"
			},
			[4] = {
				[1] = "Très bon travail ! Maintenant, vous pouvez prendre place et profiter du show.",
				[2] = "N'oubliez pas de couper le son de votre téléphone, d'accord ?",
				[3] = "Eeeeeet 1, 2, 3, 4..."
			}
		},
		diva = { -- Female
			name = "Diva",
			[-1] = {"..."},
			[1] = { -- Start of the event
				[1] = "Que regardez-vous ? Vous voulez mon autographe ?",
				[2] = "Je ne vois pas l'orchestre prêt ! Ne faites pas attendre une dame.",
				[3] = "Mais, où ai-je mis mon miroir de poche…"
			},
			[2] = { -- Microphone phase (instruments deliver finished)
				[1] = "Eh bien, ça vous en a pris du temps, je commençais à désespérer.",
				[2] = "Ok, d'abord, peux-tu démêler le câble de mon micro ? Je ne peux pas le faire dans cette robe."
			},
			[3] = {
				[1] = "Peux-tu démêler le câble de mon micro ? Je ne peux pas le faire dans cette robe."
			},
			[4] = { -- Last phase (performing on piano)
                [1] = "Je vous jure, je suis entouré par des amateurs… Quoi qu'il en soit, bon travail. Faisons de l'art !",
				[2] = "Maintenant concentrez-vous. Je vais chanter ma partie et vous allez m'accompagner au piano.",
				[3] = "Ne faites pas d'erreur, vous comprenez ? Bien, alors, allons-y !"
			},
			[5] = {
				[1] = "Maintenant concentrez-vous. Je vais chanter ma partie et vous allez m'accompagner au piano.",
				[2] = "Ne faites pas d'erreur, vous comprenez ? Bien, alors, allons-y !"
			},
			[6] = { -- Event finished (player will get rewards from here)
				[1] = "Bien joué ! Vous méritez tous les applaudissements que nous avons reçus, nous n'aurions pas pu le faire sans vous.",
				[2] = "On se voit à l'after !"
			}
		},
		musician = {
			name = "Musician",
			[-2] = {"Je ne peux pas accorder mon instrument avec cette partition."}, -- It's a musical sheet. Dialog said when the player gives the wrong sheet to the musician.
			[-1] = {"Err... Ce n'est pas mon instrument."}, -- When the player tries to give the instrument to the wrong musician
			[0] = {"..."},
			[2] = {"Je suis prêt pour le concert."}, -- When the player gives the correct instrument to the musician
			[3] = {"Uhm... J'ai déjà mon instrument."}, -- When the player tries to give an instrument to a musician that already has theirs
			[4] = {"Voilà notre héros !"}
		}
	},
	instruct = {
		microphone = "Démêlez le cable du microphone en déplacant les blocs tout autour.",
		insboard = "Choisissez le bon instrument de musique, puis récupérez la partition correspondante.",
		scorepile = "Choisissez la bonne partition de musique et mémorisez la séquence de gestes pour accorder l'instrument.",
		piano = "Répétez la mélodie que la Diva vient de chanter.",
		
		accept = "Accepter",
		reject = "Rejeter",
		continue = "Continuer",
		cancel = "Annuler",
		search = "Rechercher",
		discard = "Jeter",
		start = "Commencer", -- As verb 'to start'
		finish = "Finir", -- As verb 'to finish'
		riddle = "Devinette" -- Clue or guess
	}
}