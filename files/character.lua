local characterId = 0
Character.new = function(name, keyName, x, y, instrumentName, dialogSprite)
    local self = setmetatable({}, Character)

    self.keyName = keyName or "m1"
    self.name = name or "Musician"

    self.xPosition = x or -400
    self.yPosition = y or 1024

    self.instrument = instrumentList[instrumentName]
    if not self.instrument then
        printfd("InstrumentName: %s, NpcName: %s", instrumentName or "nil", keyName or "nil")
    end


    self.dialog = {}
    characterId = characterId + 1
    self.uniqueId = characterId
    self.dialog = translate("npcDialogs " .. name:lower(), room.language)

    if self.instrument then
        instrumentList[instrumentName].Npc = self.keyName
        self.instrument.Npc = self.keyName
        self.dialog[1] = {self.instrument.dialog}
    end

    self.dialogSprite = dialogSprite or "18334202aeb.png" -- Should go musician
    tfm.exec.removeImage(tfm.exec.addImage(self.dialogSprite, ":4", 0, 500, nil, 0.1, 0.1, 0, 0, 0, 0, false), false)
    local xpos, ypos, xsize, ysize

    if self.keyName:match("m%d+") then
        xpos = self.xPosition - 8
        ypos = self.yPosition - 50
        xsize = 46
        ysize = 55
    else
        xpos = self.xPosition - 20
        ypos = self.yPosition - 20
        xsize, ysize = 40, 40
    end

    ui.addClickable(self.uniqueId + 200, xpos, ypos, xsize, ysize, nil, self.keyName, false)

    return self
end

function Character:interact(Player, action)
    if distance(self.xPosition, self.yPosition, Player.x, Player.y) < npcTalkDist then
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
    printfd("Ins name: %s - self instrument: %s", instrumentName, self.instrument.keyName)
    return instrumentName == self.instrument.keyName
end