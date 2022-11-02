local Text = {}
local translate
translate = function(resource, language, gender, _format)
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
			if obj:find("%(.-%)") then
				gender = gender or 2
				obj = obj:gsub("%b()", function(gcase)				
					local gopts = {}
					local count = 0
					
					if gcase:match("%(|") then
						if gcase:match("%(||") then
							gopts[1] = ""
						else
							count = -1
						end
					end
					
					for gopt in gcase:gmatch("[^|()]*") do
						count = count + 1
						if count%2 == 0 then
							gopts[#gopts + 1] = gopt
						end
					end
					
					return gopts[3 - gender] or gopts[1] or gcase
				end)
			end
			
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
            translate(resource, "xx", gender, _format)
        else
            obj = resource:gsub(" ", "%.")
        end
    end

    return type(obj) == "table" and table.unreference(obj) or obj
end


Text["pt"] = Text["br"]