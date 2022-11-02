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


Text["pt"] = Text["br"]