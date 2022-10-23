-- >> xml.lua
local xml = [[<C><P L="1200" H="1200" MEDATA=";;;;-0;0::0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22:1-"/><Z><S><S T="12" X="5" Y="5" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" i="0,0,18333ae4685.png"/><S T="12" X="599" Y="1169" L="1198" H="64" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="678" Y="832" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" i="0,0,1828eef9d5a.png"/><S T="12" X="555" Y="1037" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" i="0,0,1828eef515a.png"/><S T="12" X="555" Y="810" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" i="0,0,1828ef0cd58.png"/><S T="12" X="573" Y="1134" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" N="" i="0,0,1828eeca458.png"/><S T="12" X="731" Y="834" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" i="0,0,1831d514006.png"/><S T="12" X="652" Y="379" L="52" H="24" P="0,0,0.3,0.2,0,0,0,0" i="-600,0,1828eec085a.png"/><S T="12" X="891" Y="861" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" i="0,0,1828eebbc5a.png"/><S T="12" X="556" Y="868" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" i="0,0,1828eeb6fe2.png"/><S T="12" X="56" Y="943" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" i="0,0,182f576fc59.png"/><S T="12" X="-35" Y="923" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" i="0,0,1828eeeb959.png"/><S T="12" X="906" Y="863" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" N="" i="0,0,1828f00c8df.png"/><S T="12" X="553" Y="816" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" i="0,0,1828eefe959.png"/><S T="12" X="873" Y="951" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" N="" i="0,0,1828eed895c.png"/><S T="12" X="430" Y="923" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" i="0,0,1828eeeb959.png"/><S T="12" X="934" Y="885" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" i="0,0,1828eed3d5a.png"/><S T="12" X="862" Y="928" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" N="" i="0,0,18296b25566.png"/><S T="12" X="1017" Y="944" L="132" H="17" P="0,0,0.3,0.2,-40,0,0,0"/><S T="12" X="959" Y="1053" L="128" H="29" P="0,0,0.3,0.2,41,0,0,0" N=""/><S T="12" X="461" Y="898" L="932" H="41" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="898" Y="1009" L="44" H="18" P="0,0,0.3,0.2,0,0,0,0" N=""/><S T="12" X="1129" Y="912" L="137" H="29" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="389" Y="790" L="155" H="15" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="621" Y="785" L="166" H="15" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="768" Y="790" L="133" H="15" P="0,0,0.3,0.2,4,0,0,0"/><S T="12" X="-10" Y="490" L="20" H="977" P="0,0,0,0.2,0,0,0,0"/><S T="12" X="482" Y="811" L="63" H="15" P="0,0,0.3,0.2,70,0,0,0"/><S T="12" X="524" Y="719" L="41" H="10" P="0,0,0.3,0.2,70,0,0,0"/><S T="12" X="444" Y="713" L="156" H="15" P="0,0,0.3,0.2,-10,0,0,0"/><S T="12" X="649" Y="701" L="127" H="15" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="543" Y="625" L="53" H="15" P="0,0,0.3,0.2,70,0,0,0"/><S T="12" X="448" Y="622" L="170" H="15" P="0,0,0.3,0.2,-10,0,0,0"/><S T="12" X="640" Y="604" L="66" H="15" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="733" Y="615" L="130" H="15" P="0,0,0.3,0.2,10,0,0,0"/><S T="12" X="861" Y="649" L="130" H="15" P="0,0,0.3,0.2,20,0,0,0"/><S T="12" X="943" Y="684" L="68" H="15" P="0,0,0.3,0.2,30,0,0,0"/><S T="12" X="768" Y="711" L="122" H="15" P="0,0,0.3,0.2,10,0,0,0"/><S T="12" X="871" Y="738" L="100" H="15" P="0,0,0.3,0.2,20,0,0,0"/><S T="12" X="331" Y="649" L="77" H="15" P="0,0,0.3,0.2,-20,0,0,0"/><S T="12" X="264" Y="680" L="77" H="16" P="0,0,0.3,0.2,-30,0,0,0"/><S T="12" X="200" Y="698" L="68" H="16" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="1004" Y="699" L="72" H="16" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="340" Y="736" L="72" H="15" P="0,0,0.3,0.2,-20,0,0,0"/><S T="12" X="270" Y="746" L="80" H="15" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="1210" Y="490" L="20" H="980" P="0,0,0,0.2,0,0,0,0"/><S T="12" X="600" Y="-2" L="20" H="1240" P="0,0,0,0.2,-90,0,0,0"/><S T="12" X="315" Y="765" L="10" H="33" P="0,0,0,0.2,0,0,0,0"/><S T="12" X="224" Y="726" L="10" H="45" P="0,0,0,0.2,0,0,0,0"/><S T="12" X="832" Y="761" L="10" H="64" P="0,0,0,0.2,0,0,0,0"/><S T="12" X="918" Y="716" L="10" H="85" P="0,0,0,0.2,0,0,0,0"/><S T="12" X="1087" Y="549" L="109" H="315" P="0,0,0,0.2,0,0,0,0"/><S T="12" X="167" Y="551" L="10" H="299" P="0,0,0,0.2,0,0,0,0"/><S T="12" X="445" Y="977" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" i="0,0,18333987b6e.png"/><S T="12" X="5" Y="155" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" i="0,0,18314ade9de.png"/><S T="12" X="327" Y="786" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" i="0,0,183240e55f6.png"/><S T="12" X="11" Y="1054" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" i="0,0,182f57402ad.png"/><S T="12" X="564" Y="368" L="1152" H="10" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="564" Y="184" L="1151" H="62" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="1013" Y="1094" L="33" H="26" P="0,0,5,0.2,0,0,0,0" N=""/><S T="12" X="424" Y="1070" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" i="0,0,1833388f2fa.png"/><S T="12" X="876" Y="981" L="10" H="62" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="474" Y="1080" L="55" H="24" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="523" Y="1090" L="49" H="10" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="436" Y="1080" L="26" H="15" P="0,0,0.3,0.2,-20,0,0,0"/><S T="12" X="487" Y="1089" L="119" H="10" P="0,0,0.3,0.2,7,0,0,0"/><S T="12" X="376" Y="862" L="31" H="10" P="0,0,0.3,0.2,0,0,0,0" i="0,0,183338472d5.png"/><S T="12" X="397" Y="977" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" N="" i="0,0,183337f98c4.png"/><S T="12" X="289" Y="1054" L="88" H="14" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="241" Y="1059" L="10" H="15" P="0,0,0.3,0.2,30,0,0,0"/><S T="12" X="334" Y="1055" L="10" H="13" P="0,0,0.3,0.2,-20,0,0,0"/><S T="12" X="289" Y="1059" L="97" H="12" P="0,0,0.3,0.2,-3,0,0,0"/><S T="12" X="415" Y="1087" L="10" H="22" P="0,0,0.3,0.2,15,0,0,0"/><S T="12" X="431" Y="1018" L="10" H="42" P="0,0,0.3,0.2,16,0,0,0"/><S T="12" X="459" Y="995" L="31" H="10" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="0" Y="911" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" N="" i="0,0,18333b539da.png"/><S T="12" X="578" Y="881" L="51" H="34" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="935" Y="882" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" N="" i="0,0,18333c1f181.png"/><S T="12" X="1077" Y="742" L="96" H="113" P="0,0,0,0.2,20,0,0,0"/><S T="12" X="970" Y="781" L="266" H="50" P="0,0,0.3,0.2,3,0,0,0"/><S T="12" X="1195" Y="530" L="25" H="736" P="1,99999,50,0.2,0,1,0,0" c="3" nosync=""/><S T="12" X="1196" Y="157" L="27" H="11" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="163" Y="320" L="20" H="20" P="1,0,0.3,0.2,0,1,0,0" o="324650" c="4" nosync="" i="-45,50,1835b4f5a8b.png"/><S T="12" X="704" Y="320" L="20" H="20" P="1,0,0.3,0.2,0,1,0,0" o="324650" c="4" nosync="" i="-45,50,1835b4f5a8b.png"/><S T="12" X="814" Y="320" L="20" H="20" P="1,0,0.3,0.2,0,1,0,0" o="324650" c="4" nosync="" i="-45,50,1835b4f5a8b.png"/><S T="12" X="924" Y="320" L="20" H="20" P="1,0,0.3,0.2,0,1,0,0" o="324650" c="4" nosync="" i="-45,50,1835b4f5a8b.png"/><S T="12" X="1034" Y="320" L="20" H="20" P="1,0,0.3,0.2,0,1,0,0" o="324650" c="4" nosync="" i="-45,50,1835b4f5a8b.png"/><S T="12" X="274" Y="320" L="20" H="20" P="1,0,0.3,0.2,0,1,0,0" o="324650" c="4" nosync="" i="-45,50,1835b4f5a8b.png"/><S T="12" X="384" Y="320" L="20" H="20" P="1,0,0.3,0.2,0,1,0,0" o="324650" c="4" nosync="" i="-45,50,1835b4f5a8b.png"/><S T="12" X="484" Y="320" L="20" H="20" P="1,0,0.3,0.2,0,1,0,0" o="324650" c="4" nosync="" i="-45,50,1835b4f5a8b.png"/><S T="12" X="54" Y="320" L="20" H="20" P="0,0,0.3,0.2,0,1,0,0" o="324650" c="4" i="-45,50,1835b4fbb5c.png"/><S T="12" X="1138" Y="320" L="20" H="20" P="0,0,0.3,0.2,0,1,0,0" c="4" nosync="" i="-45,50,18356b29d5d.png"/><S T="12" X="599" Y="320" L="20" H="20" P="1,0,0.3,0.2,0,1,0,0" o="324650" c="4" i="-45,50,1835b4f397a.png"/><S T="12" X="570" Y="320" L="20" H="20" P="1,0,0.3,0.2,0,1,0,0" o="324650" c="4" nosync="" i="-140,50,18356b2e95d.png"/><S T="12" X="478" Y="385" L="20" H="20" P="0,0,0.3,0.2,0,0,0,0" o="324650" c="4" i="-400,0,18356b25161.png"/><S T="12" X="509" Y="367" L="20" H="20" P="0,0,0.3,0.2,0,0,0,0" o="324650" c="4" i="-500,0,18356b2054a.png"/><S T="12" X="1147" Y="207" L="10" H="10" P="0,0,0.3,0.2,0,0,0,0" c="4" i="0,0,1828eee2157.png"/><S T="12" X="564" Y="270" L="50" H="37" P="1,999999,0.3,0.2,0,1,0,0" c="4" v="5000" nosync=""/><S T="12" X="53" Y="1097" L="38" H="10" P="0,0,0.3,0.2,0,0,0,0"/><S T="12" X="42" Y="1074" L="38" H="10" P="0,0,0.3,0.2,80,0,0,0"/><S T="12" X="38" Y="1074" L="38" H="10" P="0,0,0.3,0.2,90,0,0,0"/><S T="12" X="930" Y="898" L="10" H="42" P="0,0,5,0.2,0,0,0,0"/><S T="0" X="-10" Y="1090" L="20" H="220" P="0,0,0.3,0.2,0,0,0,0" m=""/><S T="0" X="1210" Y="1090" L="20" H="220" P="0,0,0.3,0.2,0,0,0,0" m=""/></S><D><DS X="1114" Y="1117"/></D><O/><L><JP M1="80" M2="1" AXIS="0,1" MV="Infinity,3.3333333333333335"/><JR M1="80" M2="1"/><JP M1="93" M2="1" AXIS="1,0" LIM1="-Infinity" LIM2="14.26370023953142" MV="99999,1.6666666666666667"/><JP M1="92" M2="1" AXIS="1,0" LIM1="-14.093921856992297" LIM2="Infinity" MV="99999,-1.6666666666666667"/><JP M1="83" M2="1" AXIS="1,0" LIM1="-14.2178917833084" LIM2="Infinity" MV="99999,-1.6666666666666667"/><JP M1="84" M2="1" AXIS="1,0" LIM1="-10.537891783308396" LIM2="Infinity" MV="99999,-1.6666666666666667"/><JP M1="85" M2="1" AXIS="1,0" LIM1="-6.871225116641729" LIM2="Infinity" MV="99999,-1.6666666666666667"/><JP M1="86" M2="1" AXIS="1,0" LIM1="-3.2445584499750644" LIM2="Infinity" MV="99999,-1.6666666666666667"/><JP M1="88" M2="1" AXIS="1,0" LIM1="-Infinity" LIM2="11" MV="99999,1.6666666666666667"/><JP M1="89" M2="1" AXIS="1,0" LIM1="-Infinity" LIM2="14.345401006197228" MV="99999,1.6666666666666667"/><JP M1="87" M2="1" AXIS="1,0" LIM1="-Infinity" LIM2="7.333333333333333" MV="99999,1.6666666666666667"/><JP M1="82" M2="1" AXIS="1,0" LIM1="-Infinity" LIM2="3.6666666666666665" MV="99999,1.6666666666666667"/><JR M1="1" M2="97"/><JR M1="97" M2="93"/><JR M1="97" M2="88"/><JR M1="97" M2="87"/><JR M1="97" M2="82"/><JR M1="97" M2="89"/><JR M1="97" M2="92"/><JR M1="97" M2="83"/><JR M1="97" M2="84"/><JR M1="97" M2="85"/><JR M1="97" M2="86"/></L></Z></C>]]
-- xml.lua << --
-- >> init.lua
local isEventLoaded = false

if tfm.get.room.uniquePlayers < 1 or tfm.get.room.uniquePlayers > 60 then
	return system.exit()
end

tfm.exec.disableAfkDeath(true)
tfm.exec.disableAutoShaman(true)
tfm.exec.disableAutoTimeLeft(true)
tfm.exec.disableMinimalistMode(true)
tfm.exec.disableMortCommand(true)
tfm.exec.disableAutoNewGame(true)
tfm.exec.disablePhysicalConsumables(true)

local currentTime = os.time

local tfm_exec_removeImage = tfm.exec.removeImage
local tfm_exec_addImage = tfm.exec.addImage

local ui_removeTextArea = ui.removeTextArea
local ui_addTextArea = ui.addTextArea
local ui_updateTextArea = ui.updateTextArea

local playerList = {}
local npcList = {}
local room = {}
local instrumentList = {}

local Player = {}
Player.__index = Player

local Character = {}
Character.__index = Character

local uiHandle = {}
local uiResources = {}
local textAreaHandle = {}
local textAreaNum = 0

local playerKeys = {
	[0] = true,
	[1] = true,
	[2] = true,
	[3] = true, -- Down
	[32] = true -- Space
}
-- init.lua << --
-- >> utilities.lua
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
-- utilities.lua << --
-- >> interface.lua
ui.addClickableImage = function(imageId, targetPlayer, height, width, event, x, y, xScale, yScale, alpha, fadeIn)
	local tHeight = height * yScale
	local tWidth = width * xScale
	local id = tfm.exec.addImage(imageId, ":1", x, y, targetPlayer, xScale, yScale, 1.0, alpha, 0, 0, fadeIn)
	
	
	ui.addTextArea(
		25000 + id,
		("<textformat leftmargin='1' rightmargin='1'><a href='event:%s'>%s</a></textformat>"):format(event, ("\n"):rep(20)),
		targetPlayer,
		x, y,
		tWidth, tHeight,
		0x000000, 0x000000,
		0, true
	)
	
	return id
end

ui.removeClickable = function(id, targetPlayer)
	ui.removeTextArea(id + 25000, targetPlayer)
end

ui.addClickable = function(id, xPosition, yPosition, height, width, targetPlayer, event, fixedPos)
	id = (id or 0) + 25000
	ui.addTextArea(
		id,
		("<textformat leftmargin='1' rightmargin='1'><a href='event:%s'>%s</a></textformat>"):format(event or "clickable", ("\n"):rep(20)),
		targetPlayer,
		xPosition, yPosition,
		height, width,
		0xFFAA00, 0xFFAA00,--0x0, 0x0,
		0.4, fixedPos--0.0, fixedPos
	)
	
	return id
end

ui.removeClickableImage = function(id, fadeOut)
	tfm.exec.removeImage(id, fadeOut)
	ui.removeTextArea(25000 + id, nil)
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
		{image = "1833e5c95c7.png"}
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
        local imgTarget = (element.foreground and '&' or ':') .. (5000 + id)
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

-- interface.lua << --
-- >> translations.lua
local Text = {}
local translate
translate = function(resource, language, _format)
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
			return table.unreference(obj)
		else
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
            translate(resource, "xx", _format)
        else
            obj = resource:gsub(" ", "%.")
        end
    end
    
    return type(obj) == "table" and table.unreference(obj) or obj
end

Text["en"] = {
	instruments = {
		["Timpani"] 	= {"Timpani", 		"I use a pedal to tune my instrument."},
		["Cymbals"] 	= {"Cymbals", 		"My instrument doesn't really need tuning."},
		["Gong"] 		= {"Gong", 			"My instrument originates in southeast Asia."},
		["Vibraphone"] 	= {"Vibraphone", 	"My instrument is not even 100 years old."},
		["Marimba"] 	= {"Marimba", 		"Rosewood is often used to make my instrument."},
		
		["Horn"] 		= {"Horn", 			"The english claim my instrument is french."},
		["Trumpet"] 	= {"Trumpet", 		"My instrument can make the walls of Jericho tremble."},
		["Trombone"] 	= {"Trombone", 		"Don Drummond was the man with a big instrument like mine."},
		["Tuba"] 		= {"Tuba", 			"My instrument replaced the ophicleide in the orchestra."},
		["Euphonium"] 	= {"Euphonium", 	"The name of my instrument means \"well-sounding\" in greek."},
		
		["Flute"] 		= {"Flute", 		"Mine is a slender instrument found in Jethro Tull music."},
		["Oboe"] 		= {"Oboe", 			"The shawm is my instrument's ancestor."},
		["Clarinet"] 	= {"Clarinet", 		"Rhapsody in Blue opens with a solo for my instrument."},
		["Bassoon"] 	= {"Bassoon", 		"My instrument's mouthpiece is called the bocal."},
		["Saxophone"] 	= {"Saxophone", 	"My instrument is ideal for sensual music."},
		
		["Violin"] 		= {"Violin", 		"With my instrument, I could be the second-in-command of the whole orchestra."},
		["Viola"] 		= {"Viola", 		"My instrument is the female member of a string quartet."},
		["Cello"] 		= {"Cello", 		"I play my instrument between my legs."},
		["Bass"] 		= {"Bass", 			"My stringed instrument is taller than you."},
		["Harp"] 		= {"Harp", 			"Supposedly, angels also play my instrument."}
	},
	npcDialogs = {
		conductor = {
			[1] = {
				[1] = "Finally, you're here! I need this orchestra ready as soon as possible.",
				[2] = "There is no time to waste, so listen carefully:",
				[3] = "Go to each musician and ask them what their instrument is. Then go backstage and fetch their instrument and its music score. Lastly, return to the musician and help them tune their instrument.",
				[4] = "Now, hurry up, we need to get this concert started, I don't want to keep the Diva waiting and certainly not King Fromagnus! Oh, he'll never forget this birthday..."
			},
			[2] = {
				[1] = "You got everyone ready? Good mouse!",
				[2] = "Now, go to the Diva already, she is getting cranky and it's contagious. Don't worry, she'll tell you exactly what to do. That's her second favorite thing to do, after singing.",
				[3] = "Don't worry, I'll handle the rest. Good luck!"
			}
		},
		diva = {
			[1] = {
				[1] = "What are you staring at, do you want my autograph?",
				[2] = "I don't see the orchestra ready! Make yourself useful already, we don't have all the time in the world.",
				[3] = "Now, where did I put my pocket mirror..."
			},
			[2] = {
                [1] = "Well, that took you a while, didn't it? I was beginning to despair.",
				[2] = "Alright, you have one final task, don't mess this up.",
				[3] = "I'll sing a few tunes and you'll repeat them on the piano. But make no mistakes, or we'll have to start all over again.",
				[4] = "Do you understand? Well then, let's go!"
			}
		},
		musician = {
			[-1] = {"Err... This is not my instrument."},
			[2] = {"I already have my instrument."}
		}
	}
}

Text["xx"] = Text["en"]
Text["pt"] = Text["br"]
-- translations.lua << --
-- >> player.lua
function Player.new(name)
    local self = setmetatable({}, Player)
    self.name = name
    self.progress = {}
	do
		for npcName in next, npcList do
			self.progress[npcName] = 1
		end
	end
	--[[load player data
		instruments = {
			viola = true
		},
		diva = true
		level = 1, 2, 3, ...
		hasFinished = true
	]]
    
    
	self.onWindow = {}
	self.windowHandle = {
		count = 0,
		timestamp = 0
	}
	
	self.seekingInstrument = {
		onIt = false,
		timestamp = 0,
		instrumentName = "",
		npcName = "",
		holdingIt = false,
		sprite = "",
		id = 0
	}
	
	self.performingMusic = {
		onIt = false,
		timestamp = 0,
		npcName = "",
		instrumentName = ""
		
		
	}
    self.onDialog = false
	
	tfm.exec.lowerSyncDelay(self.name)
	for keyId, _ in next, playerKeys do
		system.bindKeyboard(self.name, keyId, true, true)
		system.bindKeyboard(self.name, keyId, false, true)
	end
	
	return self
end

function Player:setData(dataString)
	
end

function Player:updatePosition(x, y, vx, vy, facingRight)
	self.x = x or self.x
	self.y = y or self.y
	self.vx = vx or self.vx
	self.vy = vy or self.vy
	
	if facingRight ~= nil then
		self.isFacingRight = facingRight
	end
	
	self:setOverlay()
	
	if self.onDialog then
		local npc = self.onDialog.Npc
		if math.distance(self.x, self.y, npc.x, npc.y) > 75 then
			self:closeDialog()
		end
	end
	
	if (self.x > 0 and self.x < 275) and (self.y > 940) then
		ui.addClickable(1, 50, 937, 190, 98, self.name, "instrumentWindow", false)
	else
		uiRemoveWindow(1, self.name)
		ui.removeClickable(1, self.name)
	end
	
	if (self.x > 700 and self.x < 975) and (self.y > 1050) then
		ui.addClickable(2, 730, 1030, 215, 80, self.name, "sheetsWindow", false)
	else
		ui.removeClickable(2, self.name)
	end
end

function Player:setOverlay(show)
	if show ~= nil then	
		if show then
			self.overlayId = tfm.exec.addImage("18405b309b5.png", "!420", -1, 927, self.name, 1.0, 1.0, 0, 1.0, 0, 0, true)
		else
			if self.overlayId then
				self.overlayId = tfm.exec.removeImage(self.overlayId, true)
			end
		end
	else
		if self.y < 905 then
			if not self.overlayId then
				self:setOverlay(true)
			end
		elseif self.y > 930 then
			if self.overlayId then
				self:setOverlay(false)
			end
		end
	end
end

function Player:setInstrument(instrumentName)
	local seeking = self.seekingInstrument
	
	seeking.onIt = true
	seeking.instrumentName = instrumentName
	seeking.holdingIt = false
end

function Player:giveNpcInstrument(npcName)
	local Musician = npcList[npcName]
	local seeking = self.seekingInstrument
	local success = false
	
	if seeking.onIt then
		if seeking.holdingIt then
			success = Musician:giveInstrument(seeking.instrumentName)
			
			if success then
				
				-- Do stuff
				self:releaseInstrument()
				return true
			end
		end
	end
	
	return false
end

function Player:releaseInstrument()
	local Instrument = self.seekingInstrument

	Instrument.holdginIt = false
	
	if Instrument.id then
		tfm.exec.removeImage(Instrument.id, false)
	end
	Instrument.id = nil
end

function Player:newWindowDisplay(windowId)
	self.onWindow[windowId] = true
	self.windowHandle.count = self.windowHandle.count + 1
end

function Player:deleteWindowDisplay(windowId)
	self.onWindow[windowId] = nil
	self.windowHandle.count = self.windowHandle.count - 1
end

function Player:closeAllWindows()
	local HNDL = table.unreference(self.onWindow)
	for windowId, _ in next, HNDL do
		uiRemoveWindow(windowId, self.name)
	end
end


function Player:newDialog(npcName)
	if self.onDialog then
		self:closeDialog()
	end
	
    local Npc = npcList[npcName]
    local dialog = self.progress[npcName] or 1
	local textInfo = Npc:getDialog(dialog)
    
    self.onDialog = {
		oldCursor = 1,
		cursor = 1,
		Text = textInfo,
		Npc = {x = Npc.xPosition, y = Npc.yPosition},
		currentText = "",
		displayText = "",
		directAccess = 0,
		windowId = 0,
		displayInfo = {},
		finished = false,
		completed = false,
		pointer = 0,
		sprite = Npc.dialogSprite
    }
	
	self:setDialogDisplay("new")
end

function Player:setDialogDisplay(instruction)
	local Dialog = self.onDialog
	
	if Dialog then
		if instruction == "new" then
			Dialog.directAccess = 2000 + (tfm.exec.addImage(Dialog.sprite, ":1", 25, 240, self.name, 0.25, 0.25, 0, 1.0, 0, 0, true) or 0)
			ui.addTextArea(Dialog.directAccess, "", self.name, 50, 335, 685, 38, 0x000000, 0x000000, 1.0, true)
			self:setDialogDisplay("next")
		elseif instruction == "update" then
			ui.updateTextArea(
				Dialog.directAccess,
				("<font face='Century Schoolbook' size='13.5' color='#1A0E00'><b>%s</b></font>"):format(Dialog.displayText or Dialog.currentText),
				self.name
			) -- Update text
			
			if Dialog.finished then
				Dialog.timerId = Timer.new(2000, false, function()
					self:setDialogDisplay("next")
				end)
			end
		elseif instruction == "next" then
			if Dialog.timerId then
				Timer.remove(Dialog.timerId)
				Dialog.timerId = nil
			end
			
			local Text = Dialog.Text
			Dialog.pointer = Dialog.pointer + 1
			if Dialog.pointer <= #Text then
				Dialog.currentText = Text[Dialog.pointer] or "..."
				Dialog.displayText = "..."
				Dialog.lenght = Dialog.currentText:len()
				Dialog.cursor = 1
				Dialog.oldCursor = 1
				
				Dialog.finished = false
			else
				Dialog.completed = true
				self:closeDialog()
			end
		end
	end
end

function Player:updateDialog(increment)
	increment = increment or 0

	local Dialog = self.onDialog
    if Dialog then
		if not Dialog.completed then
			if increment == 0 then
				if Dialog.finished then
					return self:setDialogDisplay("next")
				else
					Dialog.oldCursor = Dialog.cursor
					Dialog.cursor = Dialog.currentText:len()
					Dialog.displayText = Dialog.currentText
					
					Dialog.finished = true
					
					return self:setDialogDisplay("update")
				end
			elseif not Dialog.finished then
				Dialog.lenght = Dialog.currentText:len()
				Dialog.oldCursor = Dialog.cursor
				Dialog.cursor = math.min(Dialog.cursor + increment, Dialog.lenght)
				
				if Dialog.cursor >= Dialog.lenght then
					Dialog.displayText = Dialog.currentText
					Dialog.finished = true
				else
					Dialog.displayText = Dialog.currentText:sub(1, Dialog.cursor)
				end
				
				return self:setDialogDisplay("update")
			end
		else
			if increment == 0 then
				self:closeDialog()
			end
		end
    end
end

function Player:closeDialog()
    if self.onDialog then
        ui.removeTextArea(self.onDialog.directAccess, self.name)
		tfm.exec.removeImage(self.onDialog.directAccess - 2000, true)
    end
	
	self.onDialog = false
end

function Player:interactWithNpc(x, y)
	for npcName, Npc in next, npcList do
		if math.distance(x, y, Npc.xPosition, Npc.yPosition) < 45 then
			self:newDialog(npcName)
			break
		end
	end
end
-- player.lua << --
-- >> character.lua
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
-- character.lua << --
-- >> definitions.lua
local setInstrument = function(instrumentName, sprite, height, width, scaleX, scaleY)
	local Instrument = {}
	local tpath = ("instruments %s"):format(instrumentName)
	Instrument.localeName = translate(tpath .. " 1", room.language) or "Placeholder"
	Instrument.keyName = instrumentName
	
	Instrument.dialog = translate(tpath .. " 2", room.language) or Instrument.localeName
	
	Instrument.sprite = sprite or "1825ffbe04a.png"
	Instrument.height = height or 576
	Instrument.width = width or 553
	
	Instrument.scaleX = scaleX or 1.0
	Instrument.scaleY = scaleY or 1.0
	
	return Instrument
end

instrumentList = {
    ["Timpani"] = setInstrument("Timpani"),
    ["Cymbals"] = setInstrument("Cymbals"),
    ["Gong"] = setInstrument("Gong"),
    ["Vibraphone"] = setInstrument("Vibraphone"),
    ["Marimba"] = setInstrument("Marimba"),
	
    ["Horn"] = setInstrument("Horn"),
    ["Trumpet"] = setInstrument("Trumpet"),
    ["Trombone"] = setInstrument("Trombone"),
    ["Tuba"] = setInstrument("Tuba"),
    ["Euphonium"] = setInstrument("Euphonium"),
	
    ["Flute"] = setInstrument("Flute"),
    ["Oboe"] = setInstrument("Oboe"),
    ["Clarinet"] = setInstrument("Clarinet"),
    ["Bassoon"] = setInstrument("Bassoon"),
    ["Saxophone"] = setInstrument("Saxophone"),
	
    ["Violin"] = setInstrument("Violin"),
    ["Viola"] = setInstrument("Viola"),
    ["Cello"] = setInstrument("Cello"),
    ["Bass"] = setInstrument("Bass"),
    ["Harp"] = setInstrument("Harp")
}


npcList = {}
    do
		npcList["m1"] = Character.new("Musician", "m1", 230, 640, "Timpani")
		npcList["m2"] = Character.new("Musician", "m2", 325, 595, "Cymbals")
		npcList["m3"] = Character.new("Musician", "m3", 410, 570, "Gong")
		npcList["m4"] = Character.new("Musician", "m4", 505, 555, "Vibraphone")
		npcList["m5"] = Character.new("Musician", "m5", 585, 550, "Marimba")
		
		npcList["m6"] = Character.new("Musician", "m6", 700, 560, "Horn")
		npcList["m7"] = Character.new("Musician", "m7", 800, 580, "Trumpet")
		npcList["m8"] = Character.new("Musician", "m8", 890, 600, "Trombone")
		npcList["m9"] = Character.new("Musician", "m9", 970, 635, "Tuba")
		npcList["m10"] = Character.new("Musician", "m10", 315, 700, "Euphonium")
        
		npcList["m11"] = Character.new("Musician", "m11", 405, 665, "Flute")
		npcList["m12"] = Character.new("Musician", "m12", 485, 655, "Oboe")
		npcList["m13"] = Character.new("Musician", "m13", 580, 650, "Clarinet")
		npcList["m14"] = Character.new("Musician", "m14", 705, 650, "Basson")
		npcList["m15"] = Character.new("Musician", "m15", 800, 665, "Saxophone")
		
		npcList["m16"] = Character.new("Musician", "m16", 895, 700, "Violin")
		npcList["m17"] = Character.new("Musician", "m17", 395, 755, "Viola")
		npcList["m18"] = Character.new("Musician", "m18", 500, 745, "Cello")
		npcList["m19"] = Character.new("Musician", "m19", 695, 750, "Bass")
		npcList["m20"] = Character.new("Musician", "m20", 790, 755, "Harp")
        
        npcList["Conductor"] = Character.new("Conductor", "Conductor", 575, 845, _, "18334202aeb.png")
        
        npcList["Diva"] = Character.new("Diva", "Diva", 705, 860, _, "1833e58ced9.png")
    end
-- definitions.lua << --
-- >> events.lua
function eventNewGame()
	if not isEventLoaded then
		isEventLoaded = true
        
        ui.setMapName("Music Orchesta !")
		ui.setBackgroundColor("#201200")
        tfm.exec.setGameTime(150)
	else
		return system.exit()
	end
end

function eventNewPlayer(playerName)
	if not isEventLoaded then
		playerList[playerName] = Player.new(playerName)
		system.loadPlayerData(playerName)
	end
end

function eventPlayerDataLoaded(playerName, playerData)
	local player = playerList[playerName]
	if player then
		--player:setData(playerData)
	end
end

function eventFastLoop(dif) -- To do
	for _, player in next, playerList do
		if player.onDialog then
			player:updateDialog(3)
		end
	end
end

function eventLoop(elapsed, remaining)
	--eventFastLoop()
	
	for playerName, player in next, playerList do
		local obj = tfm.get.room.playerList[playerName]
		player:updatePosition(obj.x, obj.y, obj.vx, obj.vy)
	end
	
	if remaining < 0 then
		--tfm.exec.chatMessage("system.exit()")
	end
end

function eventKeyboard(playerName, key, down, x, y, vx, vy)
	local player = playerList[playerName]
	
	if player then
		local facing
		if key < 4 then
			if key % 2 == 0 then
				facing = (key == 2)
			end
		end
		
		player:updatePosition(x, y, vx, vy, facing)
		
		if down then
			if player.onDialog then
				if key == 32 then
					player:updateDialog(0)
				end
			else
				if key == 3 or key == 32 then
					player:interactWithNpc(x, y)
				end
			end
		end
	end
end

function eventTextAreaCallback(textAreaId, playerName, eventName)
	local Window = textAreaHandle[textAreaId]
	local player = playerList[playerName]
	if not player then return end
	if Window then
		eventWindowCallback(Window, playerName, eventName)
	else
		if npcList[eventName] then
			local Npc = npcList[eventName]
			
			if math.distance(player.x, player.y, Npc.xPosition, Npc.yPosition) < 45 then
				player:newDialog(eventName)
			end
			
		elseif eventName == "instrumentWindow" then
			uiAddWindow(1, 2, {title = "", default="w"}, playerName, 0, 0, 1.0, false)
		elseif eventName == "sheetsWindow" then
			tfm.exec.chatMessage("sheets", playerName)
		end
	end
end

function eventWindowCallback(windowId, playerName, eventName)
	if eventName == "close" then
		uiRemoveWindow(windowId, playerName)
	end
	-- ...
end

function eventWindowDisplay(windowId, playerName, Window)
	local Player = playerList[playerName]
	
	if Player then
		Player:newWindowDisplay(windowId)
		
		Player.windowHandle.timestamp = currentTime() + 500
	end
end


function eventWindowHide(windowId, playerName, Window)
	local Player = playerList[playerName]
		
	if Player then
		Player:deleteWindowDisplay(windowId)
	end
end

-- events.lua << --
-- >> start.lua
do
	for playerName, playerData in next, tfm.get.room.playerList do
		eventNewPlayer(playerName)
	end
	
	-- Fast loop
	local interval = 500
	local SUBCYCLES = interval / 50
	local diftime = interval / SUBCYCLES
	for i=0, SUBCYCLES-1 do
		system.newTimer(function(id)
			system.newTimer(function(id)
					eventFastLoop(diftime)
			end, interval, true)
		end, interval + (diftime * i), false)
	end
end

tfm.exec.newGame(xml, false)
-- start.lua << --