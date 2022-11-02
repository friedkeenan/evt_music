local fileList = {
    [1] = "xml",
    [2] = "init",
    [3] = "utilities",
    [4] = "dataHandling",
    [5] = "interface",
    [6] = {
        path = "translations",
        files = {
            "main",
            "en", "es", "br", "fr" -- ...
        }
    },
    [7] = "player",
    [8] = "sound",
    [9] = "character",
    [10] = "definitions",
    [11] = "events",
    [12] = "start"
}


local fileTable = {}
local File

local readPath
readPath = function(pathName, subPath)
    subPath = subPath or "./files"
    local ft = {}
    if type(pathName) == "table" then
        subPath = pathName.path and ("./files/%s"):format(pathName.path) or "./files"
        for fileIndex, fileName in next, pathName.files do
            ft[fileIndex] = readPath(fileName, subPath)
        end

        return table.concat(ft, '\n')
    else
        local p = ("%s/%s.lua"):format(subPath, pathName)
        print(p)
        local File = io.open(p, "r")
        if File then
            local f = File:read("*all")
            File:close()
            print((">>> [success] %s.lua"):format(pathName))
            return ("-- >> %s.lua\n%s\n-- %s.lua << --"):format(pathName, f, pathName)
        else
            print(("/!\\ [failure] %s.lua"):format(pathName))
        end
    end
end

local evt_music = readPath({files=fileList})

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