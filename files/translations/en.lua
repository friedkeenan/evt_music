-- Remember: Text after two lines ( -- ) doesn't have to be translated, it just means it's a note or comment for extra context.

--- You can define genders in a translation
-- Use syntax: (male|female|neutral) or (male|female) [1st field is mandatory]
-- For example: "(King|Queen|Royalty) of Transformice", outputs: "Queen of Transformice" for female gender
-- It accepts long sentences and multiple options in a same sentence:
--	"The (man|woman|person) was playing (Jazz|Videogames|with their friends) at the station"
-- Output (for neutral/none: "The person was playing with their friends at the station"

Text["en"] = {
	title = "Music Orchestra",
	hey = {
		[1] = "Welcome to the event!"
	},
	instruments = { -- In comments (text after two lines --) gender of the musician that plays the instrument
		["timpani"] 	= {"Timpani", 		"I use a pedal to tune my instrument."}, -- Male
		["cymbals"] 	= {"Cymbals", 		"My instrument doesn't really need tuning."}, -- Female
		["tubular_bells"] 		= {"Tubular Bells", 			"My instrument is also used in grandfather clocks."}, -- Male
		["vibraphone"] 	= {"Vibraphone", 	"My instrument is not even 100 years old."}, -- Female
		["marimba"] 	= {"Marimba", 		"Rosewood is often used to make my instrument."}, -- Female
		
		["horn"] 		= {"Horn", 			"The english claim my instrument is french."}, -- Male
		["trumpet"] 	= {"Trumpet", 		"My instrument can make the walls of Jericho tremble."}, -- Female
		["trombone"] 	= {"Trombone", 		"Don Drummond was the man with a big instrument like mine."}, -- Neutral
		["tuba"] 		= {"Tuba", 			"My instrument replaced the ophicleide in the orchestra."}, -- Neutral
		["euphonium"] 	= {"Euphonium", 	"The name of my instrument means \"well-sounding\" in greek."}, -- Male
		
		["flute"] 		= {"Flute", 		"Mine is a slender instrument found in Jethro Tull music."}, -- Neutral
		["oboe"] 		= {"Oboe", 			"The shawm is my instrument's ancestor."}, -- Female
		["clarinet"] 	= {"Clarinet", 		"Rhapsody in Blue opens with a solo for my instrument."}, -- Female
		["bassoon"] 	= {"Bassoon", 		"My instrument's mouthpiece is called the bocal."}, -- Male
		["saxophone"] 	= {"Saxophone", 	"My instrument is ideal for sensual music."}, -- Male
		
		["violin"] 		= {"Violin", 		"With my instrument, I could be the second-in-command of the whole orchestra."}, -- Male
		["viola"] 		= {"Viola", 		"My instrument is the female member of a string quartet."}, -- Female
		["cello"] 		= {"Cello", 		"I play my instrument between my legs."}, -- Female
		["bass"] 		= {"Bass", 			"My stringed instrument is taller than you."}, -- Male
		["harp"] 		= {"Harp", 			"Supposedly, angels also play my instrument."} -- Neutral
	},
	npcDialogs = {
		-- YES. Some of the dialogues are duplicated. That's on purpose.
		conductor = { -- Male
			name = "Conductor",
			[-1] = {"..."},
			[1] = {
				[1] = "Finally, you're here! I need this orchestra ready as soon as possible. I don't want to keep the Diva waiting and certainly not King Fromagnus either!",
				[2] = "Well, ask each musician about their instrument and go backstage to fetch it. They also need their music scores, get them from that... pile.",
				[3] = "My poor neat stacks! Vandals...",
				[4] = "Anyway, bring the music score to each musician and tune their instrument. Each score has instructions on it about that."
			},
			[2] = {
				[1] = "Ask each musician about their instrument and go backstage to fetch it. They also need their music scores, get them from the pile.",
				[2] = "Bring the music score to each musician and tune their instrument. Each score has instructions on it about that."
			},
			[3] = {
				[1] = "You got everyone ready? Good mouse! I knew I could count on you.",
				[2] = "Now, it's time to face the Diva... I don't envy you.",
				[3] = "She is getting nervous and it's contagious. Go, she'll tell you what to do. That's her second favorite thing to do, after singing.",
				[4] = "I'll handle the rest. Good luck!"
			},
			[4] = {
				[1] = "Excellent work! Now you can take your seat and enjoy the show.",
				[2] = "Don't forget to mute your smartphone, right?",
				[3] = "Aaand 1, 2, 3, 4..."
			}
		},
		diva = { -- Female
			name = "Diva",
			[-1] = {"..."},
			[1] = { -- Start of the event
				[1] = "What are you staring at, do you want my autograph?",
				[2] = "I don't see the orchestra ready! Don't keep a lady waiting.",
				[3] = "Now, where did I put my pocket mirror..."
			},
			[2] = { -- Microphone phase (instruments deliver finished)
				[1] = "Well, that took you a while, I was beginning to despair.",
				[2] = "Ok, firstly, can you untangle my microphone's cable? I can't do it in this dress."
			},
			[3] = {
				[1] = "Can you untangle my microphone's cable? I can't do it in this dress."
			},
			[4] = { -- Last phase (performing on piano)
                [1] = "I swear, I am surrounded by amateurs... Anyway, good work. Let's make some art!",
				[2] = "Focus, now. I'll sing my part and you'll accompany me on the piano.",
				[3] = "Make no mistakes, do you understand? Well then, let's go!"
			},
			[5] = {
				[1] = "Focus, now. I'll sing my part and you'll accompany me on the piano.",
				[2] = "Make no mistakes, do you understand? Well then, let's go!"
			},
			[6] = { -- Event finished (player will get rewards from here)
				[1] = "Well done! You deserve some of the applause we received, we could not have done it without you.",
				[2] = "See you at the after-party!"
			}
		},
		musician = {
			name = "Musician",
			[-2] = {"I can't tune my instrument with this score."}, -- It's a musical sheet. Dialog said when the player gives the wrong sheet to the musician.
			[-1] = {"Err... This is not my instrument."}, -- When the player tries to give the instrument to the wrong musician
			[0] = {"..."},
			[2] = {"I am ready for the concert!"}, -- When the player gives the correct instrument to the musician
			[3] = {"Uhm... I already have my instrument."}, -- When the player tries to give an instrument to a musician that already has theirs
			[4] = {"There is our hero!"}
		}
	},
	instruct = {
		microphone = "Untangle the microphone's cable by moving the blocks around.",
		insboard = "Choose the right musical instrument, then fetch its matching music score.",
		scorepile = "Choose the right music score and memorize the sequence of gestures, to tune the instrument.",
		piano = "Repeat the tune the Diva has just sung.",
		
		accept = "Accept",
		reject = "Reject",
		continue = "Continue",
		cancel = "Cancel",
		search = "Search",
		discard = "Discard",
		start = "Start", -- As verb 'to start'
		finish = "Finish", -- As verb 'to finish'
		riddle = "Riddle" -- Clue or guess
	}
}

-- Don't include the text after this line
Text["xx"] = Text["en"]
Text["int"] = Text["xx"]