math.distance = function(ax, ay, bx, by)
	return math.sqrt((bx-ax)^2 + (by-ay)^2)
end

dump = function(Val, depth)
	depth = depth or 1
	if depth > 8 then return end
	local tval = type(Val)
	local retval = ""
	
	if tval == "string" then
		retval = ('"%s"'):format(Val)
	elseif tval == "table" then
		local kv = {}
		for key, value in next, Val do
			if not tostring(key):match("^__") then
				kv[#kv + 1] = ("%s[%s] = %s"):format(
					('\t'):rep(depth),
					dump(key),
					dump(value, depth + 1)
				)
			end
		end
		retval = ("{\n%s\n%s}"):format(table.concat(kv, ",\n"), ('\t'):rep(depth - 1))
	else
		retval = tostring(Val) or tval
	end
        
	return retval or "nil"
end
    
printt = function(...)
	local str = {}
	local args  = {...}
	
	for index, object in next, args do
		str[#str + 1] = dump(object, 1)
	end
	print(table.concat(str, "\n"))
end

table.randomize = function(tbl)
    local newTable = {}
    
    for index, element in ipairs(tbl) do
        table.insert(newTable, math.random(1, index), element)
    end
    
    return newTable
end

table.unreference = function(tbl)
	local retvl

	if type(tbl) == "table" then
		retvl = {}
		for k, v in next, tbl do
			retvl[table.unreference(k)] = table.unreference(v)
		end
		setmetatable(retvl, getmetatable(tbl))
	else
		retvl = tbl
	end
	
	return retvl
end

table.inherit = function(tbl, ex)
	local obj

	if type(tbl) ~= "table" then
		obj = {}
	else
        obj = table.unreference(tbl) 
    end
	
	for k, v in next, ex do
		if type(v) == "table" then
			obj[k] = inherit(obj[k], v)
		else
			obj[k] = table.unreference(v)
		end
	end
	
	return obj
end