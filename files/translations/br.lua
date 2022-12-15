Text["br"] = {
	title = "A Orquestra",
	hey = {
		[1] = "Bem-vind(o|a) ao evento!"
	},
	instruments = { -- In comments (text after two lines --) gender of the musician that plays the instrument
		["timpani"] 	= {"Tímpano", 		"Eu uso um pedal para afinar meu instrumento."}, -- Male
		["cymbals"] 	= {"Pratos", 		"Meu instrumento não precisa de afinação."}, -- Female
		["tubular_bells"] 		= {"Sinos Tubulares", 			"O meu instrumento também é usado em relógios de pêndulo."}, -- Male
		["vibraphone"] 	= {"Vibrafone", 	"Meu instrumento não tem nem 100 anos."}, -- Female
		["marimba"] 	= {"Marimba", 		"A madeira de jacarandá é bastante utilizada para fabricar meu instrumento."}, -- Female

		["horn"] 		= {"Trompa", 		"Os ingleses dizem que meu instrumento é francês."}, -- Male
		["trumpet"] 	= {"Trompete", 		"Meu instrumento pode fazer as paredes de Jericó tremerem."}, -- Female
		["trombone"] 	= {"Trombone", 		"Don Drummond foi um homem com um grande instrumento igual ao meu."}, -- Neutral
		["tuba"] 		= {"Tuba", 			"Meu instrumento substituiu o oficlide na orquestra."}, -- Neutral
		["euphonium"] 	= {"Eufônio", 		"O nome do meu instrumento significa \"de bom som\" em grego."}, -- Male

		["flute"] 		= {"Flauta", 		"O meu é um instrumento fino presente nas músicas de Jethro Tull."}, -- Neutral
		["oboe"] 		= {"Oboé", 			"A charamela é a precursora do meu instrumento."}, -- Female
		["clarinet"] 	= {"Clarinete", 	"Rhapsody in Blue começa com um solo do meu instrumento."}, -- Female
		["bassoon"] 	= {"Fagote", 		"A peça do meu instrumento que se coloca na boca se chama bocal."}, -- Male
		["saxophone"] 	= {"Saxofone", 		"O meu instrumento é ideal para músicas sensuais."}, -- Male

		["violin"] 		= {"Violino", 		"Com o meu instrumento, eu poderia ser o segundo no comando de toda a orquestra."}, -- Male
		["viola"] 		= {"Viola", 		"O meu instrumento é o membro feminino em um quarteto de cordas."}, -- Female
		["cello"] 		= {"Violoncelo", 	"Toco meu instrumento com ele entre minhas pernas."}, -- Female
		["bass"] 		= {"Baixo", 		"Meu instrumento de corda é mais alto que você."}, -- Male
		["harp"] 		= {"Harpa", 		"Supostamente, anjos também tocam meu instrumento."} -- Neutral
	},
	npcDialogs = {
		-- YES. Some of the dialogues are duplicated. That's on purpose.
		conductor = { -- Male
			name = "Condutor",
			[-1] = {"..."},
			[1] = {
				[1] = "Finalmente você está aqui! Eu preciso que essa orquestra esteja pronta o mais rápido possível. Não quero deixar a Diva esperando, e muito menos o Rei Fromagnus!",
				[2] = "Bem, pergunte a cada músico sobre seu instrumento e vá aos bastidores buscá-lo. Eles também precisarão de suas partituras, pegue-as daquela... pilha.",
				[3] = "Minhas pobres pilhas arrumadas! Vândalos...",
				[4] = "De qualquer forma, traga as partituras para cada músico e afine seu instrumento. Cada partitura possui instruções sobre isso."
			},
			[2] = {
				[1] = "Pergunte a cada músico sobre seu instrumento e vá aos bastidores buscá-lo. Eles também precisarão de suas partituras, pegue-as daquela pilha.",
				[2] = "Traga as partituras para cada músico e afine seu instrumento. Cada partitura possui instruções sobre isso."
			},
			[3] = {
				[1] = "Você deixou todos prontos? Bo(m|a) ratinh(o|a)! Eu sabia que podia contar contigo.",
				[2] = "Agora, é hora de enfrentar a Diva... Eu não te invejo.",
				[3] = "Ela está ficando nervosa e é contagioso. Vá, ela vai te dizer o que fazer. Essa é a segunda coisa favorita que ela gosta de fazer, depois de cantar.",
				[4] = "Eu cuido do resto. Boa sorte!"
			},
			[4] = {
				[1] = "Excelente trabalho! Agora você pode ir para seu assento e apreciar o espetáculo.",
				[2] = "Não se esqueça de silenciar o seu celular, certo?",
				[3] = "Eeee 1, 2, 3, 4..."
			}
		},
		diva = { -- Female
			name = "Diva",
			[-1] = {"..."},
			[1] = { -- Start of the event
				[1] = "O que você está olhando? Quer um autógrafo meu?",
				[2] = "Eu não estou vendo a orquestra pronta! Não deixe uma dama esperando.",
				[3] = "Agora, onde eu coloquei meu espelhinho..."
			},
			[2] = { -- Microphone phase (instruments deliver finished)
				[1] = "Bem, você demorou um pouco, eu estava começando a me desesperar.",
				[2] = "Certo, primeiramente, você pode desembaraçar os cabos do meu microfone? Eu não consigo fazer isso nesse vestido."
			},
			[3] = {
				[1] = "Você pode desembaraçar os cabos do meu microfone? Eu não consigo fazer isso neste vestido."
			},
			[4] = { -- Last phase (performing on piano)
                [1] = "Eu juro, estou cercada por amadores... Enfim, bom trabalho. Vamos fazer um pouco de arte!",
				[2] = "Foco, agora. Eu irei cantar minha parte e você me acompanhará no piano.",
				[3] = "Não faça nem um errinho, você me entendeu? Bem, então vamos lá!"
			},
			[5] = {
				[1] = "Foco, agora. Eu irei cantar minha parte e você me acompanhará no piano.",
				[2] = "Não faça nem um errinho, você me entendeu? Bem, então vamos lá!"
			},
			[6] = { -- Event finished (player will get rewards from here)
				[1] = "Muito bem feito! Você merece alguns aplausos que recebemos, não poderíamos ter feito isso sem você.",
				[2] = "Te vejo na festa!"
			}
		},
		musician = {
			name = "Músico",
			[-2] = {"Eu não posso afinar meu instrumento sem a partitura certa."}, -- It's a musical sheet. Dialog said when the player gives the wrong sheet to the musician.
			[-1] = {"Ehh... Esse não é meu instrumento."}, -- When the player tries to give the instrument to the wrong musician
			[0] = {"..."},
			[2] = {"Estou pronto para o concerto!"}, -- When the player gives the correct instrument to the musician
			[3] = {"Uhm... Eu já tenho meu instrumento."}, -- When the player tries to give an instrument to a musician that already has theirs
			[4] = {"Aí está noss(o|a) her(ói|oína)!"}
		}
	},
	instruct = {
		microphone = "Desembarace o cabo do microfone movendo os blocos ao redor.",
		insboard = "Escolha o instrumento certo, e então encontre sua partitura correspondente.",
		scorepile = "Escolha a partitura certa e memorize a sequência de gestos para afinar o instrumento.",
		piano = "Repita a melodia que Diva acabou de cantar.",

		accept = "Aceitar",
		reject = "Rejeitar",
		continue = "Continuar",
		cancel = "Cancelar",
		search = "Procurar",
		discard = "Descartar",
		start = "Começar", -- As verb 'to start'
		finish = "Finalizar", -- As verb 'to finish'
		riddle = "Dica" -- Clue or guess
	}
}

Text["pt"] = Text["br"]
