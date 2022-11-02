local Text = {}
local translate
translate = function(resource, language, _format)
    language = Text[language] and language or "xx"
    
    local obj = table.unreference(Text[language])
    for key in resource:gmatch("%S+") do
        if type(obj) == "table" then
            obj = obj[tonumber(key) or key]
            if not obj then
                break
            end
        else
            break
        end
    end
    
    if obj then
		if type(obj) == "table" then
			return table.unreference(obj)
		else
			if type(_format) == "table" then
				for key, value in next, _format do
					obj = obj:gsub("%$"..key.."%$", tostring(value))
				end
			else
				return tostring(obj)
			end
		end
    else
        if language ~= "xx" then
            translate(resource, "xx", _format)
        else
            obj = resource:gsub(" ", "%.")
        end
    end
    
    return type(obj) == "table" and table.unreference(obj) or obj
end

Text["en"] = {
	instruments = {
		["Timpani"] 	= {"Timpani", 		"I use a pedal to tune my instrument."},
		["Cymbals"] 	= {"Cymbals", 		"My instrument doesn't really need tuning."},
		["Gong"] 		= {"Gong", 			"My instrument originates in southeast Asia."},
		["Vibraphone"] 	= {"Vibraphone", 	"My instrument is not even 100 years old."},
		["Marimba"] 	= {"Marimba", 		"Rosewood is often used to make my instrument."},
		
		["Horn"] 		= {"Horn", 			"The english claim my instrument is french."},
		["Trumpet"] 	= {"Trumpet", 		"My instrument can make the walls of Jericho tremble."},
		["Trombone"] 	= {"Trombone", 		"Don Drummond was the man with a big instrument like mine."},
		["Tuba"] 		= {"Tuba", 			"My instrument replaced the ophicleide in the orchestra."},
		["Euphonium"] 	= {"Euphonium", 	"The name of my instrument means \"well-sounding\" in greek."},
		
		["Flute"] 		= {"Flute", 		"Mine is a slender instrument found in Jethro Tull music."},
		["Oboe"] 		= {"Oboe", 			"The shawm is my instrument's ancestor."},
		["Clarinet"] 	= {"Clarinet", 		"Rhapsody in Blue opens with a solo for my instrument."},
		["Bassoon"] 	= {"Bassoon", 		"My instrument's mouthpiece is called the bocal."},
		["Saxophone"] 	= {"Saxophone", 	"My instrument is ideal for sensual music."},
		
		["Violin"] 		= {"Violin", 		"With my instrument, I could be the second-in-command of the whole orchestra."},
		["Viola"] 		= {"Viola", 		"My instrument is the female member of a string quartet."},
		["Cello"] 		= {"Cello", 		"I play my instrument between my legs."},
		["Bass"] 		= {"Bass", 			"My stringed instrument is taller than you."},
		["Harp"] 		= {"Harp", 			"Supposedly, angels also play my instrument."}
	},
	npcDialogs = {
		conductor = {
			[-1] = {"..."},
			[1] = {
				[1] = "Finally, you're here! I need this orchestra ready as soon as possible. I don't want to keep the Diva waiting and certainly not King Fromagnus either!",
				[2] = "Well, ask each musician about their instrument and go backstage to fetch it. They also need their music scores, get them from that... pile.",
				[3] = "My poor neat stacks! Vandals...",
				[4] = "Anyway, bring the music score to each musician and tune their instrument. Each score has instructions on it about that."
			},
			[2] = {
				[1] = "You got everyone ready? Good mouse!",
				[2] = "Now, go to the Diva already, she is getting cranky and it's contagious. Don't worry, she'll tell you exactly what to do. That's her second favorite thing to do, after singing.",
				[3] = "Don't worry, I'll handle the rest. Good luck!"
			}
		},
		diva = {
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
			[3] = { -- Last phase (performing on piano)
                [1] = "I swear, I am surrounded by amateurs... Anyway, good work. Let's make some art!",
				[2] = "Focus, now. I’ll sing my part and you’ll accompany me on the piano.",
				[3] = "Make no mistakes, do you understand? Well then, let’s go!"
			},
			[4] = { -- Event finished (player will get rewards from here)
				[1] = "Well done! You deserve some of the applause we received, we could not have done it without you.",
				[2] = "See you at the after-party!"
			}
		},
		musician = {
			[-1] = {"Err... This is not my instrument."}, -- When the player tries to give the instrument to the wrong musician
			[0] = {"..."}
			[2] = {"I am ready for the concert!"}, -- When the player gives the correct instrument to the musician
			[3] = {"Uhm... I already have my instrument."} -- When the player tries to give an instrument to a musician that already has theirs
		}
	}
}


Text["xx"] = Text["en"]
Text["pt"] = Text["br"]