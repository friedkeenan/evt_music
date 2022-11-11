ui.addClickableImage = function(imageId, imgTarget, targetPlayer, height, width, event, x, y, xScale, yScale, alpha, fadeIn)
	imgTarget = imgtarget or "~1"
	local tHeight = height * yScale
	local tWidth = width * xScale
	local id = tfm.exec.addImage(imageId, imgTarget, x, y, targetPlayer, xScale, yScale, 0.0, alpha, 0, 0, fadeIn)

	ui.addClickable(10000 + id, x, y, tWidth, tHeight, targetPlayer, event, true)

	return id
end

ui.removeClickable = function(id, targetPlayer)
	ui.removeTextArea(id + 25000, targetPlayer)
end

ui.addClickable = function(id, xPosition, yPosition, width, height, targetPlayer, event, fixedPos)
	id = (id or 0) + 25000
	ui.addTextArea(
		id,
		("<textformat leftmargin='1' rightmargin='1'><a href='event:%s'>%s</a></textformat>"):format(event or "clickable", ("\n"):rep(20)),
		targetPlayer,
		xPosition, yPosition,
		width, height,
		0x0, 0x0,
		0.0, fixedPos
	)

	return id
end

ui.removeClickableImage = function(id, fadeOut)
	tfm.exec.removeImage(id, fadeOut)
	ui.removeClickable(10000 + id)
end


local setElement = function(type, identifier, height, width, yoff, xoff, ex)
	local obj = {}

	obj.type = type
	obj.identifier = identifier

	obj.height = height
	obj.width = width

	obj.xcent = 400 - (width / 2) + (xoff or 0)
	obj.ycent = 205 - (height / 2) + (yoff or 0)

	if type == "image" then
		obj.remove = tfm_exec_removeImage
		obj.update = dummyFunc
	elseif type == "textArea" then
		obj.remove = ui_removeTextArea
		obj.update = ui_updateTextArea
	else
		obj.remove = dummyFunc
		obj.update = dummyFunc
	end

	ex = ex or {}

	for k, v in next, ex do
		if not obj[k] then
			obj[k] = v
		end
	end

	return obj
end
-- (type, identifier, height, width, yoff, xoff, ex)
uiResources[0] = {
	[1] = setElement(
		"image", "baseWin", 356, 500, 0, 0,
		{image = "1825fee4f3c.png"}
	),
	[2] = setElement(
		"textArea", "default", 305, 469, 0, 0,
		{container = true,
		format = {
			start = "<font face='Consolas' color='#000000'>",
			enclose = "</font>"
		}}
	),
	[3] = setElement(
		"image", "closeBox", 20, 20, 0, 0,
		{image = "1825fee8763.png"}
	),
	[4] = setElement(
		"textArea", "close", 25, 25, 0, 0,
		{text = "<textformat leftmargin='1' rightmargin='1'><a href='event:%s'>" .. ('\n'):rep(20), event="close"}
	)
}

uiResources[2] = {
	[1] = setElement(
		"image", "baseWin", 354, 689, 0, 0,
		{image = "18463fb570f.png"}
	),
	[2] = setElement(
		"image", "closeBox", 20, 20, -160, 325,
		{image = "1825fee8763.png"}
	),
	[3] = setElement(
		"textArea", "close", 25, 25, -160, 325,
		{text = "<textformat leftmargin='1' rightmargin='1'><a href='event:%s'>" .. ('\n'):rep(20), event="close"}
	)
}

uiResources[3] = {
	[1] = setElement(
		"image", "baseWin", 356, 500, 0, 0,
		{image = "1825fee4f3c.png"}
	),
	[2] = setElement(
		"image", "closeBox", 20, 20, -145, 210,
		{image = "1825fee8763.png"}
	),
	[3] = setElement(
		"textArea", "close", 25, 25, -145, 210,
		{text = "<textformat leftmargin='1' rightmargin='1'><a href='event:%s'>" .. ('\n'):rep(20), event="close"}
	)
}

uiResources[4] = {
	[1] = setElement(
		"image", "baseWin", 135, 291, 0, 0,
		{image = "184641eb74c.png"}
	),
	[2] = setElement(
		"textArea", "title", 125, 281, 0, 0,
		{container = true,
		format = {
			start = "<font face='Century Schoolbook,Baskerville,Baskerville Old Face,Hoefler Text,Garamond,Times New Roman,serif' size='13.5' color='#f5e1ba' size='14'><b><p align='center'>",
			enclose = "</p></b></font>"
		}}
	),
	[3] = setElement(
		"textArea", "default", 105, 275, 35, 0,
		{container = true,
		format = {
			start = "<font face='Century Schoolbook,Baskerville,Baskerville Old Face,Hoefler Text,Garamond,Times New Roman,serif' size='13.5' color='#f5e1ba' size='12'><p align='center'>",
			enclose = "</p></font>"
		}}
	),
	[4] = setElement(
		"image", "closeBox", 20, 20, -60, 130,
		{image = "1825fee8763.png"}
	),
	[5] = setElement(
		"textArea", "close", 25, 25, -60, 130,
		{text = "<textformat leftmargin='1' rightmargin='1'><a href='event:%s'>" .. ('\n'):rep(20), event="close"}
	)
}
--[[
uiResources[2] = {
	[1] = setElement(
		"image", "baseWin", h, w, xo, yo,
		{image = "imagecode"}
	),
	[2] = setElement("textArea", "default", h, w, xo, yo,
		{container = true,
		format = {
			start = "<font face='Century Schoolbook' size='12'><p align='left'>",
			enclose = "</p></font>"
		}}
	)
}]]
--[[
uiResources[0.5] = {
	[1] = setElement(
		"image", "baseWin", 335, 501, 22, 0,
		{image = "1804def6229.png"}
	),
	[2] = setElement(
		"textArea", "default", 305, 469, 22, 0,
		{container = true,
		format = {
			start = "<font face='Consolas' color='#ffffff'>",
			enclose = "</font>"
		}}
	),
	[4] = setElement(
        "image", "titleWin", 32, 501, -150, 0,
        {image = "1804df01146.png"}
    ),
    [5] = setElement(
        "textArea", "title", 22, 455, -152, -10,
        {container = true,
		format = {
			start = "<font face='Consolas' color='#000000' size='18'><p align='center'>",
			enclose = "</p></font>"
		}}
    ),
	[10] = setElement(
		"textArea", "close", 25, 25, -150, 235,
		{text = "<font size='24' face='Consolas' color='#000000'><a href='event:%s'>X</font>", event="close"}
	)
}
]]

uiCreateElement = function(id, order, target, element, text, xoff, yoff, alpha)
    local lhandle = {}
    lhandle.type = element.type
    if element.type == "image" then
        local imgTarget = (element.foreground and '&' or '~') .. (5000 + id)
        lhandle.id = tfm_exec_addImage(
            element.image, imgTarget,
            element.xcent + xoff, element.ycent + yoff,
            target,
            1.0, 1.0,
            0, alpha,
            0, 0
        )
    elseif element.type == "textArea" then
        if element.container then
            local access = text[element.identifier]
            if element.multiplecont then
                lhandle.texts = {}

                if type(access) == "table" then
                    for i=1, #access  do
                        lhandle.texts[i] = access[i] or ""
                    end
                end
                lhandle.index = 1
                lhandle.text = lhandle.texts[1]
            else
                lhandle.text = access or ""
            end

            if element.format then
                lhandle.text = element.format.start .. lhandle.text .. element.format.enclose
            end
        else
            if element.text then
                lhandle.text = element.text:format(element.event)
            end
        end

        if lhandle.text:len() > 2000 then
            lhandle.text = lhandle.text:sub(1, 1995) .. " ..."
        end

        textAreaNum = textAreaNum + 1
        lhandle.id = 5000 + textAreaNum
        ui_addTextArea(
            lhandle.id,
            lhandle.text,
            target,
            element.xcent + xoff, element.ycent + yoff,
            element.width, element.height,
            0x000000, 0x000000,
            alpha, true
        )

        textAreaHandle[lhandle.id] = id
    end

    return lhandle
end

uiCreateWindow = function(id, _type, target, text, xoff, yoff, alpha)
    if not target then
        print("Warning ! uiCreateWindow target is not optional.")
        return
    end

    _type = _type or 0
    text = type(text) == "string" and {default=text} or (text or {})

    xoff = xoff or 0
    yoff = yoff or 0
    alpha = alpha or 1.0

    local resources = uiResources[_type] or uiResources[0]

    local texts = 0
    local height, width = 0, 0
    local handle = {}
    local lhandle
    for order, element in next, resources do
        lhandle = {}

        lhandle = uiCreateElement(id, order, target, element, text, xoff, yoff, alpha)
        lhandle.remove = element.remove
        lhandle.update = element.update

        if (element.height or 0) > height then
            height = element.height
        end

        if (element.width or 0) > width then
            width = element.width
        end

        handle[#handle + 1] = lhandle
        lhandle = nil
    end

    handle.height = height
    handle.width = width

    return handle
end

uiGivePlayerList = function(targetPlayer)
    local playerList = {}

    local typeList = type(targetPlayer)
    if typeList == "string" then
        playerList = {targetPlayer}
    else
        if typeList == "table" then
            playerList = targetPlayer
        else
            for playerName, _ in next, tfm.get.room.playerList do
                playerList[#playerList + 1] = playerName
            end
        end
    end

    return playerList
end

uiAddWindow = function(id, type, text, targetPlayer, xoffset, yoffset, alpha, reload)
    local playerList = uiGivePlayerList(targetPlayer)

    if not uiHandle[id] then
        uiHandle[id] = {
            reload = reload or false
        }
    end

    for _, playerName in next, playerList do
        if uiHandle[id][playerName] then
            uiRemoveWindow(id, playerName)
        end
        local success = uiCreateWindow(id, type, playerName, text, xoffset, yoffset, alpha)
        if success then
            uiHandle[id][playerName] = success
            eventWindowDisplay(id, playerName, success)
        end
    end
end

uiHideWindow = function(id, targetPlayer)
    local object = uiHandle[id][targetPlayer]

    if object then
        eventWindowHide(id, targetPlayer, object)
        for key, element in next, object do
            if type(element) == "table" then
                element.remove(element.id,
                    element.type ~= "image" and targetPlayer or false
                )
            end
        end
    end
end

uiRemoveWindow = function(id, targetPlayer)
    local localeWindow = uiHandle[id]
    local playerList = uiGivePlayerList(targetPlayer)

    if localeWindow then
        for _, playerName in next, playerList do
            uiHideWindow(id, playerName)

            if localeWindow[playerName] then
                localeWindow[playerName] = nil
            end
        end
    end

    if not targetPlayer then
        localeWindow = nil
    end

    return true
end