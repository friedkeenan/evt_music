local dataHan = {}

do
	local xCHAR = string.char(17)
	dataHan.getModuleData = function(str, MODULE)
		
		local data = str:match(("%s (.-)%s"):format(MODULE or "", xCHAR))
		if data and data ~= ("") then
			return data
		else
			print(("Could not find data for module '%s'"):format(MODULE))
		end
		
		return ""
	end

	dataHan.setModuleData = function(str, MODULE, data)
		local pattern = ("%s (.-)%s"):format(MODULE or "", xCHAR)
		local oldModuleData = str:match(pattern)
		local newData
		
		local newstr = ("%s %s%s"):format(MODULE, data, xCHAR)
		
		if oldModuleData then
			newData = str:gsub(pattern, newstr)
		else
			if MODULE then
				newData = ("%s%s"):format(str, newstr)
			end
		end
		
		print(table.concat({newData, data, str, oldModuleData}, "\n"))
		
		return newData, data, str, oldModuleData
	end
end

dataHan.decodeData = function(str, depth)
	depth = depth or 1
	local data = {}
	local count = 1

	local pattern = "[^" .. string.char(17 + depth) .. "]+"
	
	local key, value
	for INFO in str:gmatch(pattern) do
		key, value = INFO:match("(%w+)=(.+)")
		if not key then
			key = count
			value = INFO
			count = count + 1
		end
		data[key] = dataHan.convert(value or "", depth)
	end
	
	return data
end

dataHan.convert = function(str, depth)
	local booleans = {
		["+"] = true,
		["-"] = false
	}
	if booleans[str] ~= nil then
		return booleans[str]
	end
	
	local retval = str:match('^"(.-)"$')
	if retval then
		return retval
	else
		retval = str:match("^{(.-)}$")
		if retval then
			return dataHan.decodeData(retval, depth + 1)
		else
			return tonumber(str) or str
		end
	end
end

dataHan.reconvert = function(data, depth)
	local str = ""
	depth = depth or 0
	if type(data) == "table" then
		local concat = {}
		for k, v in next, data do
			concat[#concat + 1] = dataHan.reconvert(v, depth + 1)
		end
		str = ("{%s}"):format(table.concat(concat, string.char(17 + depth)))
	else
		if type(data) == "number" then
			str = tostring(data)
		elseif type(data) == "boolean" then
			str = data and "+" or "-"
		elseif type(data) == "string" then
			str = ('"%s"'):format(data)
		end
	end
	
	return str
end

dataHan.encodeData = function(data, depth)
	depth = depth or 1
	local separator = string.char(17 + depth)
	local str = {}
	for key, value in next, data do
		local kk, vv = key, dataHan.reconvert(value, depth + 1)
		str[#str + 1] = ("%s=%s"):format(kk, vv)
	end
	
	return table.concat(str, separator)
end


--[[
function _Player:saveData(onDatabase)
    local Data = {
        inv = self:serializeInventory(),
        lng = self.language,
        pos = {self.x, self.y},
        hlt = self.healthHandle.max
    }
        
    local data = string.saveData(Data)
    self.dataFile = string.saveModuleData(self.dataFile, "MCC", data)
    if onDatabase then
        system.savePlayerData(self.name, self.dataFile)
    else
        room.tempData[self.name] = self.dataFile
    end
    
    self.dataSaveTimestamp = currentTime()
end

function _Player:loadData(playerData)
    if type(playerData) == "table" then
        self:loadInventory(playerData.inv or "")
        self.language = playerData.lng or tfm.get.room.playerList[self.name].language
        
        local x, y = table.unpack(playerData.pos or {})

        self:move(map.spawnPoint.x, map.spawnPoint.y)
        
        self.healthHandle.points = playerData.hlt or 20
    end
    
    self.awaitingData = false
end


onEvent("PlayerDataLoaded", function(playerName, playerData)
	local Player = room.player[playerName]
	if Player then
		if Player.awaitingData then
			local moduleData = string.getModuleData(playerData, "MCC")
			Player.dataFile = playerData
			Player:loadData(string.readData(moduleData))
			
			if not modulo.loading then
				setUserInterface(playerName)
			end
			
			tfm.exec.chatMessage(translate("help chattip", Player.language), playerName)
		end
	else
		if modulo.dataHandlers[playerName] then
			modulo:readStatus(playerData)
		end
	end
end)

]]
