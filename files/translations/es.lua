Text["es"] = {
	title = "Orquesta Musical",
	hey = {
		[1] = "¡(Bienvenido|Bienvenida) al evento!"
	},
	instruments = { -- In comments (text after two lines --) gender of the musician that plays the instrument
		["timpani"] 	= {"Timbales", 		"Uso un pedal para afinar mi instrumento."}, -- Male
		["cymbals"] 	= {"Platillos", 		"Mi instrumento realmente no necesita afinación."}, -- Female
		["tubular_bells"] 		= {"Campanas Tubulares", 			"Mi instrumento también es utilizado en relojes de pie."}, -- Male
		["vibraphone"] 	= {"Vibráfono", 	"Mi instrumento no tiene ni 100 años."}, -- Female
		["marimba"] 	= {"Marimba", 		"El palisandro se usa a menudo para crear mi instrumento."}, -- Female
		
		["horn"] 		= {"Trompa", 			"Los ingleses afirman que mi instrumento es francés."}, -- Male
		["trumpet"] 	= {"Trompeta", 		"Mi instrumento puede hacer temblar los muros de Jericó."}, -- Female
		["trombone"] 	= {"Trombón", 		"Don Drummond era un hombre con un gran instrumento como el mío."}, -- Neutral
		["tuba"] 		= {"Tuba", 			"Mi instrumento reemplazó al oficleido en la orquesta."}, -- Neutral
		["euphonium"] 	= {"Eufonio", 	"El nombre de mi instrumento significa \"bien-sonante\" en griego."}, -- Male
		
		["flute"] 		= {"Flauta", 		"El mío es un instrumento esbelto encontrado en la música de Jethro Tull."}, -- Neutral
		["oboe"] 		= {"Oboe", 			"El shawm es el antepasado de mi instrumento."}, -- Female
		["clarinet"] 	= {"Clarinete", 		"Rhapsody in Blue abre con un solo de mi instrumento."}, -- Female
		["bassoon"] 	= {"Fagot", 		"La boquilla de mi instrumento se llama tudel."}, -- Male
		["saxophone"] 	= {"Saxofón", 	"Mi instrumento es ideal para música sensual."}, -- Male
		
		["violin"] 		= {"Violín", 		"Con mi instrumento, podría ser el segundo al mando de toda la orquesta."}, -- Male
		["viola"] 		= {"Viola", 		"Mi instrumento es el miembro femenino de un cuarteto de cuerdas."}, -- Female
		["cello"] 		= {"Cello", 		"Toco mi instrumento entre mis piernas."}, -- Female
		["bass"] 		= {"Bajo", 			"Mi instrumento de cuerda es más alto que tú."}, -- Male
		["harp"] 		= {"Arpa", 			"Supuestamente, los ángeles también tocan mi instrumento."} -- Neutral
	},
	npcDialogs = {
		-- YES. Some of the dialogues are duplicated. That's on purpose.
		conductor = { -- Male
			name = "Director",
			[-1] = {"..."},
			[1] = {
				[1] = "¡Finalmente, estás aquí! Necesito esta orquesta lista lo antes posible. ¡No quiero hacer esperar a la Diva y ciertamente al Rey Fromagus tampoco!",
				[2] = "Bueno, pregúntale a cada músico sobre sus instrumentos y ve tras bambalinas a buscarlos. Ellos también necesitan sus partituras musicales, consíguelas de esa... pila.",
				[3] = "¡Mis pobres pilas ordenadas! Vándalos...",
				[4] = "De todos modos, lleva las partitura musicales a cada músico y afina sus instrumentos. Cada partitura tiene intrucciones sobre eso."
			},
			[2] = {
				[1] = "Pregúntale a cada músico sobre sus instrumentos y ve tras bambalinas a buscarlos. Ellos también necesitan sus partituras musicales, consíguelas de la pila.",
				[2] = "Lleva las partitura musicales a cada músico y afina sus instrumentos. Cada partitura tiene intrucciones sobre eso."
			},
			[3] = {
				[1] = "¿Tienes a todos listos? ¡(Buen|Buena) (ratón|ratona)! Sabía que podía contar contigo.",
				[2] = "Ahora es momento de enfrentar a la Diva... no te envidio.",
				[3] = "Ella se está poniendo nerviosa y es contagioso. Ve, ella te dirá qué hacer. Esa es su segunda cosa favorita por hacer, después de cantar.",
				[4] = "Yo me encargaré del resto. ¡Buena suerte!"
			},
			[4] = {
				[1] = "¡Excelente trabajo! Ahora puedes tomar asiento y disfrutar el espectáculo.",
				[2] = "No olvides silenciar tu móvil, ¿verdad?",
				[3] = "Yyyyy 1, 2, 3, 4..."
			}
		},
		diva = { -- Female
			name = "Diva",
			[-1] = {"..."},
			[1] = { -- Start of the event
				[1] = "¿Qué estás mirando, quieres mi autógrafo?",
				[2] = "¡No veo la orquesta lista! No hagas esperar a una dama.",
				[3] = "Ahora, ¿dónde dejé mi espejo de bolsillo?..."
			},
			[2] = { -- Microphone phase (instruments deliver finished)
				[1] = "Bueno, eso te tomó un tiempo, me estaba empezando a desesperar.",
				[2] = "Ok, en primer lugar, ¿puedes desenredar el cable de mi micrófono? No puedo hacerlo con este vestido."
			},
			[3] = {
				[1] = "¿Puedes desenredar el cable de mi micrófono? No puedo hacerlo con este vestido."
			},
			[4] = { -- Last phase (performing on piano)
                [1] = "Lo juro, estoy rodeada de aficionados... De todos modos, buen trabajo. ¡Hagamos algo de arte!",
				[2] = "Concéntrate, ahora. Voy a cantar mi parte y tú me acompañarás con el piano.",
				[3] = "No cometas errores, ¿entendido? Bien entonces, ¡vamos!"
			},
			[5] = {
				[1] = "Concéntrate, ahora. Voy a cantar mi parte y tú me acompañarás con el piano.",
				[2] = "No cometas errores, ¿entendido? Bien entonces, ¡vamos!"
			},
			[6] = { -- Event finished (player will get rewards from here)
				[1] = "¡Bien hecho! Te mereces algunos de los aplausos que recibimos, no podríamos haberlo hecho sin ti.",
				[2] = "¡Nos vemos en la fiesta posterior!"
			}
		},
		musician = {
			name = "Músic(o|a)",
			[-2] = {"No puedo afinar mi instrumento con esta partitura."}, -- It's a musical sheet. Dialog said when the player gives the wrong sheet to the musician.
			[-1] = {"Ehh... Este no es mi instrumento."}, -- When the player tries to give the instrument to the wrong musician
			[0] = {"..."},
			[2] = {"¡Estoy list(o|a) para el concierto!"}, -- When the player gives the correct instrument to the musician
			[3] = {"Uhm... Ya tengo mi instrumento."}, -- When the player tries to give an instrument to a musician that already has theirs
			[4] = {"¡Ahí está nuestr(o|a) h(éroe|eroína)!"}
		}
	},
	instruct = {
		microphone = "Desenreda el cable del micrófono moviendo los bloques.",
		insboard = "Elige el instrumento musical correcto, luego encuentra su partitura musical correspondiente.",
		scorepile = "Elige el instrumento musical correcto y memoriza la secuencia de gestos, para afinar el instrumento.",
		piano = "Repite la melodía que la Diva acaba de cantar.",
		
		accept = "Aceptar",
		reject = "Rechazar",
		continue = "Continuar",
		cancel = "Cancelar",
		search = "Buscar",
		discard = "Descartar",
		start = "Comenzar", -- As verb 'to start'
		finish = "Finalizar", -- As verb 'to finish'
		riddle = "Pista" -- Clue or guess
	}
}