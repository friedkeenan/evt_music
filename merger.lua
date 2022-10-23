local fileList = {
    "xml",
    "init",
    "utilities",
    "interface",
    "translations",
    "player",
    "character",
    "definitions",
    "events",
    "start"
}


local fileTable = {}
local File

for _, fileName in next, fileList do
    File = io.open(("./files/%s.lua"):format(fileName), "r+")
    if File then
        fileTable[#fileTable + 1] = ("-- >> %s.lua\n%s\n-- %s.lua << --"):format(fileName, File:read("*all"), fileName)
        File:close()
        print((">>> [success] %s.lua"):format(fileName))
    else
        print(("/!\\ [failure] %s.lua"):format(fileName))
    end
end

local evt_music = table.concat(fileTable, "\n")

File = io.open("evt_music.lua", "w+")
File:write(evt_music)
File:close()

do
    local ok, result
    local Test 
    Test, result = loadstring(("%s%s\n%s%s"):format("-- evt_music", (' '):rep(20), 'require("tfmenv")\n', evt_music))
    
    if Test then
        ok, result = pcall(Test)
        if ok then
            print("Event cooked successfully.")
        else
            print(result)
        end
    else
        print(result)
    end
end