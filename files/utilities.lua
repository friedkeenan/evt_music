local stringutils = {}
stringutils.split = function(s, delimiter)
	result = {}
	for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
		table.insert(result, match)
	end
	return result
end
stringutils.isin = function(s,t)
    local r=false
    if type(t)=='table' then
        for i,v in pairs(t) do
            if v==s then
                r=true
                break
            end
        end
    end
    return r
end

function stringutils.getGendered(str, gender)	
	return str:gsub("%(.-%)", function(gcase)
		local male, female, neutral = gcase:match("%((.-)|(.-)|(.-)%)") or gcase:match("%((.-)|(.-)%)")

		return ({male, female, neutral})[3 - gender] or male or gcase
	end)
end

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
			obj[k] = table.inherit(obj[k], v)
		else
			obj[k] = table.unreference(v)
		end
	end

	return obj
end

local Timer = {
    uniqueId = -1,
    list = {},
    counter = 0
}
Timer.__index = Timer

function Timer.handle()
    local currentTime = os.time
    local unpack = table.unpack
    local removeList = {}
    local setRemoved = function(t)
        removeList[#removeList + 1] = t.uniqueId
    end
    local ok, result
    local List = table.unreference(Timer.list)
    for index, timer in pairs(List) do
        if Timer.list[index] then
			if currentTime() >= timer.expireTime then
				local ok, result = pcall(timer.callback, unpack(timer.arguments))

				if ok then
					if timer.isLooping and Timer.list[index] then
						Timer.list[index]:renew()
					else
						setRemoved(timer)
					end
				else
					printf("[Timer #%d] %s", timer.uniqueId, result)

					setRemoved(timer)
				end
			end
		end
    end

    for _, timerId in ipairs(removeList) do
        Timer.remove(timerId)
    end
end

function Timer.get(timerId)
    return Timer.list[timerId]
end

function Timer.remove(timerId)
    local timer = Timer.list[timerId]

    if timer then
        timer:kill()
        Timer.list[timerId] = nil
    end

    return nil
end

function Timer.new(awaitTime, loop, callback, ...)
    local self = setmetatable({}, Timer)
    Timer.counter = Timer.counter  + 1

    self.uniqueId = Timer.counter

    self.awaitTime = math.max(awaitTime, 500)
    self.expireTime = os.time() + self.awaitTime

    self.isLooping = (not not loop)
    self.callback = callback
    self.arguments = {...}

    Timer.list[self.uniqueId] = self

    return self.uniqueId--timersList[self.uniqueId]
end

function Timer:renew()
    if self.isLooping then
        self.expireTime = os.time() + self.awaitTime
    end
end

function Timer:kill()
    Timer.list[self.uniqueId] = nil
end