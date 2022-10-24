local characterId = 0
Character.new = function(name, keyName, x, y, instrumentName, dialogSprite)
    local self = setmetatable({}, Character)
    
    self.keyName = keyName or "m1"
    self.name = name or "Musician"
    
    self.xPosition = x or -400
    self.yPosition = y or 1024
    
    self.instrument = table.unreference(instrumentList[instrumentName])
    
    self.dialog = {}
    characterId = characterId + 1
    self.uniqueId = characterId
    self.dialog = translate("npcDialogs " .. name:lower(), room.language)
    
    if self.instrument then
        self.dialog[1] = {self.instrument.dialog}
    end
    
    self.dialogSprite = dialogSprite or "18334202aeb.png" -- Should go musician
    local xpos, ypos, xsize, ysize
    
    if self.keyName:match("m%d+") then
        xpos = self.xPosition - 8
        ypos = self.yPosition - 50
        xsize = 46
        ysize = 55
    else
        xpos = self.xPosition - 18
        ypos = self.yPosition - 18
        xsize, ysize = 35, 35
    end
    
    ui.addClickable(self.uniqueId + 200, xpos, ypos, xsize, ysize, nil, self.keyName, false)
    
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