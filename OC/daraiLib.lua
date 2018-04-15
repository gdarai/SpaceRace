
local fs = require("filesystem")
local io = require("io")
local sz = require("serialization")

local daraiLib = {}

-- Config Setting function
--  - Saves default setting if none saved
--  - Gives option to tweak the setting
--  - Guides player through the tweaking
--  - - fileName is the config file
--  - - default is the default config table
--  - - texts table contains required seting file format
--  - - - in this table, every key has
--  - - - - text key giving the description 
--  - - - - type key giving the field type
--  - - Known key types:
--  - - - array requires extra key "object" containing whole subTable of keys
--  - - - table requires extra key "keys" containing whole subTable of keys
--  - - - item requires nothing it is a mincraft item
--  - - - side is a string enum describing item side
function daraiLib.config(fileName, texts, default)
    local haveOne = fs.exists(fileName)
    if not haveOne then
        local f = io.open(fileName, "w")
        f:write(sz.serialize(default))
        io.close(f)
    end
    local f = io.open(fileName, "r")
    local setting = sz.unserialize(f:read())
    print("Current setting:")
    print(sz.serialize(default))
    if daraiLib.input("Keep or Change", "kc") == "c" then
        setting = daraiLib.editTable(setting, texts, default, {})
        local f1 = io.open(fileName, "w")
        f1:write(sz.serialize(setting))
        io.close(f1)
    end
    return setting
end

-- Recursive settings table editor
function daraiLib.editTable(input, texts, default, keys)
    -- Print the current location
    local address = "root"
    for _, val in pairs(keys) do address = address .. " - " .. val end
    print("Now in " texts.type .. ": " .. address)
    print(texts.text)
    -- Print options based on the type of the current node
    if input.type = "table" then
    print("Following keys are available: ");
        for keyName, val in pairs(input) do
            if
        end        
    end
end


function daraiLib.input(text, answers, getIndex)
    local index = nil
    while index == nil do
        io.write(text .. " [" .. answers .. "] ")
        index = string.find(answers, io.read())
    end
    if getIndex then
        return index
    end
    return string.sub(answers, index, index)    
end

return daraiLib