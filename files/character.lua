Character.new = function(name, x, y, instrumentName, dialogSprite)
    local self = setmetatable({}, Character)
    
    self.name = name or "Musician"
    
    self.xPosition = x or -400
    self.yPosition = y or 1024
    
    self.instrument = table.unreference(instrumentList[instrumentName])
    
    self.dialog = {}
    
    self.dialog = translate("npcDialogs " .. name:lower(), room.language)
    
    if self.instrument then
        self.dialog[1] = {self.instrument.dialog}
    end
    
    self.dialogSprite = dialogSprite or "18334202aeb.png" -- Should go musician
    return self
end

function Character:interact(Player, action)
    if distance(self.xPosition, self.yPosition, Player.x, Player.y) < 45 then
        return self:getDialog(action)
    end
end

function Character:getDialog(dialog)
    dialog = tostring(dialog)
    local object
    
    local obj = table.unreference(self.dialog)
    for key in dialog:gmatch("%S+") do
        if type(obj) == "table" then
            obj = obj[tonumber(key)] or obj[key]
            if not obj then
                break
            end
        else
            break
        end
    end
    
    if obj then
        if type(_format) == "table" then
            for key, value in next, _format do
                obj = obj:gsub("%$"..key.."%$", tostring(value))
            end
        else
            return type(obj) == "table" and obj or tostring(obj)
        end
    else
        obj = dialog:gsub(" ", "%.")
    end
    
    return type(obj) == "table" and table.unreference(obj) or obj
end

function Character:giveInstrument(instrumentName)
    if instrumentName == self.instrument then
        return true
    end
    
    return false
end