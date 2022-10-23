
function Player:getData()


function _Player:getData(fromDatabase)
    if not fromDatabase then
        local data = room.tempData[self.name]
        if data then
            eventPlayerDataLoaded(self.name, data)
        else
            fromDatabase = true
        end
    end
    
    if fromDatabase then
        system.loadPlayerData(self.name)
    end
    
    self.awaitingData = true
end

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



do
	local xCHAR = string.char(17)
	string.getModuleData = function(str, MODULE)
		local Data = str:match((MODULE or "") .. " (.-)" .. xCHAR)
		if Data and Data ~= ("") then
			return Data
		else
			print(string.format("Could not find data for module '%s'", MODULE))
		end
		
		return ""
	end

	string.saveModuleData = function(str, MODULE, data)
		local oldModuleData = str:match((MODULE or " ") .. " (.-)" .. xCHAR)
		local newData
		local success = false
		
		if oldModuleData then
			newData = str:gsub(oldModuleData, data)
		else
			if MODULE then
				newData = str .. ("%s %s" .. xCHAR):format(MODULE, data)
			end
		end
		
		return newData, data, str, oldModuleData
	end
end

string.readData = function(str, depth)
	depth = depth or 1
	local Data = {}
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
		Data[key] = string.convert(value or "", depth)
	end
	
	return Data
end

string.convert = function(str, depth)
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
			return string.readData(retval, depth + 1)
		else
			return tonumber(str, 36) or str
		end
	end
end

string.reconvert = function(Data, depth)
	local str = ""
	depth = depth or 0
	if type(Data) == "table" then
		local concat = {}
		for k, v in next, Data do
			concat[#concat + 1] = string.reconvert(v, depth + 1)
		end
		str = ("{%s}"):format(table.concat(concat, string.char(17 + depth)))
	else
		if type(Data) == "number" then
			str = toBase(Data, 36)
		elseif type(Data) == "boolean" then
			if Data then
				str = "+"
			else
				str = "-"
			end
		elseif type(Data) == "string" then
			str = ('"%s"'):format(Data)
		end
	end
	
	return str
end

string.saveData = function(Data, depth)
	depth = depth or 1
	local separator = string.char(17 + depth)
	local str = {}
	for key, value in next, Data do
		str[#str + 1] = ("%s=%s"):format(key, string.reconvert(value, depth + 1))
	end
	
	return table.concat(str, separator)
end
