local Text = {}
local translate
translate = function(resource, language, gender, _format)
	gender = gender or 2
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
			local t = {}
			
			for index, val in next, obj do
				t[index] = (type(val) == "string" and stringutils.getGendered(val, gender) or val)
			end
			
			return t
		else
			if obj:find("%(.-%)") then
				obj = stringutils.getGendered(obj, gender)
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

    return obj
end


Text["pt"] = Text["br"]