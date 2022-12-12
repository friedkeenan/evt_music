local characterId = 0

Character.new = function(name, keyName, x, y, instrumentName, dialogSprite, gender)
    local self = setmetatable({}, Character)

    self.keyName = keyName or "m1"
    self.name = name or "Musician"

    self.gender = gender
    
    self.xPosition = x or -400
    self.yPosition = y or 1024

    
    self.instrument = instrumentList[instrumentName]

    self.dialog = ("npcDialogs %s %%d"):format(name:lower())
    
    
    characterId = characterId + 1
    self.uniqueId = characterId
    
    if self.instrument then
        local tpath = ("instruments %s %%d"):format(instrumentName)
        self.instrument.localeName = tpath:format(1)
        self.instrument.dialog = tpath:format(2)
        
        instrumentList[instrumentName].Npc = self.keyName
        self.instrument.Npc = self.keyName
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
        return self:getDialog(action, Player.language, Player.gender)
    end
end

function Character:getDialog(dialogId, language, gender)
    dialogId = dialogId or 0
    local object
    printfd("Dialog ID: %s\tLanguage: %s\tKeyName: %s", dialogId, language, self.keyName)
    
    local dialog = {}
    
    if self.keyName:find("m%d+") and dialogId == 1 then
        dialog = { translate(self.instrument.dialog, language, gender) or "NULL" }
    else
        dialog = translate(self.dialog:format(dialogId), language, gender) or "..."
    end

    return dialog
end

function Character:giveInstrument(instrumentName)
    printfd("Ins name: %s - self instrument: %s", instrumentName, self.instrument.keyName)
    return instrumentName == self.instrument.keyName
end

function Character:displayInstrument(playerName)
    local ins = self.instrument
    local scale = 0.4

    tfm.exec.addImage(
        ins.sprite, "_100",
        self.xPosition + ins.cx, self.yPosition + ins.cy,
        playerName,
        scale * (ins.mir and -1 or 1), scale,
        ins.rr, 1.0,
        0.5 * (ins.mir and -1 or 1), 0.5,
        true
    )
    
    local player = playerList[playerName]
    
    if player then
        if player.scoreTablesId then
            tfm.exec.removeImage(player.scoreTablesId, false)
        end
        
        player.scoreTablesId = tfm.exec.addImage("1846cc561de.png", "_101", 258, 530, playerName, 1.0, 1.0, 0, 1.0, 0, 0, false)
    end
end