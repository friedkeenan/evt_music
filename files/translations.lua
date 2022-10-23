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
			[1] = {
				[1] = "Finally, you're here! I need this orchestra ready as soon as possible.",
				[2] = "There is no time to waste, so listen carefully:",
				[3] = "Go to each musician and ask them what their instrument is. Then go backstage and fetch their instrument and its music score. Lastly, return to the musician and help them tune their instrument.",
				[4] = "Now, hurry up, we need to get this concert started, I don't want to keep the Diva waiting and certainly not King Fromagnus! Oh, he'll never forget this birthday..."
			},
			[2] = {
				[1] = "You got everyone ready? Good mouse!",
				[2] = "Now, go to the Diva already, she is getting cranky and it's contagious. Don't worry, she'll tell you exactly what to do. That's her second favorite thing to do, after singing.",
				[3] = "Don't worry, I'll handle the rest. Good luck!"
			}
		},
		diva = {
			[1] = {
				[1] = "What are you staring at, do you want my autograph?",
				[2] = "I don't see the orchestra ready! Make yourself useful already, we don't have all the time in the world.",
				[3] = "Now, where did I put my pocket mirror..."
			},
			[2] = {
                [1] = "Well, that took you a while, didn't it? I was beginning to despair.",
				[2] = "Alright, you have one final task, don't mess this up.",
				[3] = "I'll sing a few tunes and you'll repeat them on the piano. But make no mistakes, or we'll have to start all over again.",
				[4] = "Do you understand? Well then, let's go!"
			}
		},
		musician = {
			[-1] = {"Err... This is not my instrument."},
			[2] = {"I already have my instrument."}
		}
	}
}

Text["xx"] = Text["en"]
Text["pt"] = Text["br"]