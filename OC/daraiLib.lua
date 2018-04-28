local fs = require("filesystem")
local io = require("io")
local sz = require("serialization")
local mm = require("math")
local cc = require("component")
local sd = require("sides")
local sh = require("shell")
local daraiLib = {}

-- returns formated string s based on formatChar (fmtCh)
function daraiLib.strFmt(fmtCh, s)
    local len = string.len(s)
    if fmtCh == "T" then
        local full = string.rep("=", len+4)
        local empty = "|" .. string.rep(" ", len+2) .. "|"
        return "\n" .. full .. "\n" .. empty .. "\n| " .. s .. " |\n" .. empty .. "\n" .. full
    elseif fmtCh == "t" then
        local full = string.rep("=", len+2)
        return "\n= " .. s .. "\n" .. full
    elseif fmtCh == "?" then
        return "?? " .. s
    elseif fmtCh == "r" then
        return ">> " .. s
    elseif fmtCh == "e" then
        return "!! " .. s
    elseif fmtCh == "i" then
        return " - " .. s
    elseif fmtCh == "n" then
        return "[" .. s .. "]"
    else
        return s
    end
end

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
--  - - - string general variable
--  - - - integer general variable
function daraiLib.config(fileName, texts, default, silent)
    local fullFileName = sh.getWorkingDirectory() .. "/" .. fileName
    local haveOne = fs.exists(fullFileName)
    if not haveOne then
        local f = io.open(fullFileName, "w")
        f:write(sz.serialize(default))
        io.close(f)
    end
    local f = io.open(fullFileName, "r")
    local setting = sz.unserialize(f:read())
    if not silent then
        print(daraiLib.strFmt('r', "Current setting:"))
        print(sz.serialize(setting))
        if daraiLib.input("Keep or Change", "kc", false) == "c" then
            setting = daraiLib.editTableKey(setting, texts, default, {})
            local f1 = io.open(fullFileName, "w")
            f1:write(sz.serialize(setting))
            io.close(f1)
        end
    end
    return setting
end

-- Recursive settings table editor
function daraiLib.editTableKey(input, texts, default, keys)
    local returnVal = "?"
    local address = "root"
    for _, val in pairs(keys) do address = address .. " - " .. val end
    while returnVal == "?" do
        local orElse = ""
        -- Print the current location
        print("Now in " .. texts.type .. ": " .. address)
        print(daraiLib.strFmt('r', texts.text))
        
        -- Print info and options based on the type of the current node
        local keysClone = sz.unserialize(sz.serialize(keys))
        if texts.type == "table" then
            print(daraiLib.strFmt('r', "Pick key to edit or ENTER:"));
            for keyName, val in pairs(input) do
                print(daraiLib.strFmt('i', keyName .. ": " .. daraiLib.getVarPrint(texts[keyName], input[keyName])))            
            end
            local now = daraiLib.listInput("Key to edit", daraiLib.tableKeys(input), false, true)
            if now ~= "" then
                keysClone[#keysClone+1] = now
                print()
                orElse = daraiLib.editTableKey(input[now], texts[now], default[now], keysClone)
            else
                orElse = daraiLib.input("Print, Back, Reset or Exit", "pbrx", false)
            end
        elseif texts.type == "list" then
            local now = daraiLib.input("Pick, New, List, Delete, Reset, Back or Exit", "pnldrbx", false)
            if now == "p" then
                local idx = daraiLib.inputIndex("Index ", 1, #input, true)
                if idx ~= nil then
                    keysClone[#keysClone+1] = now
                    print()
                    orElse = daraiLib.editTableKey(input[idx], texts.object, default[1], keysClone)
                else
                    print(daraiLib.strFmt('e', "Operation canceled."))
                end
            elseif now == "n" then
                local idx = daraiLib.inputIndex("Index ", 1, #input+1, true)
                if idx ~= nil then
                    table.insert(input, idx, default[1])
                else
                    print(daraiLib.strFmt('e', "Operation canceled."))
                end
            elseif now == "l" then
                local cnt = 5
                for i = 1, #input do
                    local t = i .. ", " .. daraiLib.getVarPrint(texts.object, input[i])
                    cnt = cnt - 1
                    if cnt == 0 then
                        io.write(t)
                        io.read()
                        cnt = 5
                    else
                        print(t)
                    end
                end
            elseif now == "d" then
                local idx = daraiLib.inputIndex("Index ", 1, #input, true)
                if idx ~= nil then
                    table.remove(input, idx)
                else
                    print(daraiLib.strFmt('e', "Operation canceled."))
                end
            else
                orElse = now
            end
        else -- str, num, side, item
            print("  " .. daraiLib.getVarPrint(texts, input))
            orElse = daraiLib.input("Edit, Back, Reset or Exit", "ebrx", false)
        end
        
        -- In case orElse was selected, evaluate
        if orElse ~= "" then
            if orElse == "p" then
                print(daraiLib.strFmt('i', sz.serialize(input)))
                io.write(daraiLib.strFmt('?', "<Press ENTER>"))
                io.read()
            elseif orElse == "b" then
                returnVal = ""
            elseif orElse == "r" then
                input = sz.unserialize(sz.serialize(default))
                print(sz.serialize(input))
                io.write(daraiLib.strFmt('?', "<Press ENTER>"))
                io.read()
            elseif orElse == "e" then
                if texts.type == "str" then
                    io.write("  :")
                    input[1] = io.read()
                elseif texts.type == "num" then
                    io.write("  :")
                    input[1] = tonumber(io.read())
                elseif texts.type == "int" then
                    io.write("  :")
                    input[1] = mm.floor(tonumber(io.read()))
                elseif texts.type == "side" then
                    input[1] = daraiLib.listInput("Side", {"north", "south", "east", "west", "up", "down"}, false, false)
                elseif texts.type == "item" then
                    if daraiLib.input("Pick or Write", "pw", false) == "p" then
                        local ic = daraiLib.getInventoryController()
                        if ic == nil then
                            print(daraiLib.strFmt('e', "No Inventory Controller is Available."))
                        else
                            local sel = {}
                            for _, side in pairs({"north", "south", "east", "west", "up", "down"}) do
                                local mx = ic.getInventorySize(sd[side])
                                if mx ~= nil then
                                    print(daraiLib.strFmt('i', side .. ": " .. mx .. " slots"))
                                    for slot = 1,mx do
                                        local item = ic.getStackInSlot(sd[side], slot)
                                        if item ~=nil then
                                            sel[#sel+1] = {name=item.name, label=item.label, damage=item.damage, side=side}
                                        end
                                    end
                                end
                            end
                            if #sel == 0 then
                                print(daraiLib.strFmt('e', "Sorry, no items in adjescent directories."))
                            else
                                local cnt = 5
                                for i = 1, #sel do
                                    local t = i .. ", " .. sel[i].label .. " (" .. sel[i].side .. ")"
                                    cnt = cnt - 1
                                    print(t)
                                    if cnt == 0 then
                                        io.write(daraiLib.strFmt('?', "<Press ENTER>"))
                                        io.read()
                                        cnt = 5
                                    end
                                end
                                local pick = daraiLib.inputIndex("Pick one (0 for cancel)", 0, #sel, false)
                                if pick ~= 0 then
                                    local fuzzy = daraiLib.input("Fuzzy or Precise", "fp", false)
                                    local selected = sel[pick]
                                    input.name = selected.name
                                    input.label = selected.label
                                    input.damage = -1
                                    if fuzzy == 'p' then input.damage = selected.damage end
                                end
                            end
                        end
                    else
                        io.write(daraiLib.strFmt('?', "New item name (mod:name):"))
                        input.name   = io.read()
                        io.write(daraiLib.strFmt('?', "New item label:"))
                        input.label   = io.read()
                        input.damage = daraiLib.inputIndex("Item Damage (-1 for Fuzzy)", -1, 32767, false)
                    end
                end
            else
                returnVal = "x"
            end
        end
        print()
    end
    if address == "root" then
        return input
    else
        return returnVal
    end
end

-- Function to get a printout of content of a variable based on it's type
function daraiLib.getVarPrint(varObj, data)
    if varObj.type == "table"     then return "<TABLE>"
    elseif varObj.type == "list"  then return "<LIST items " .. #data .. ">"
    elseif varObj.type == "item"  then return "<ITEM " .. data.name .. ":" .. data.damage .. " " .. data.label .. ">"
    elseif varObj.type == "side"  then return "<SIDE " .. data[1] .. ">"
    elseif varObj.type == "str"   then return "<STRING " .. data[1] .. ">"
    elseif varObj.type == "int"   then return "<INT " .. tostring(data[1]) .. ">"
    elseif varObj.type == "num"   then return "<NUM " .. tostring(data[1]) .. ">"
    end
    return "<UNKNOWN TYPE " .. varObj.type .. ">"
end

-- forces player to pick between char options
-- - text is the leading question text
-- - answers is a string of options: "Yn"
-- - getIndex is a bool if return should be selected char, or it's index
function daraiLib.input(text, answers, getIndex)
    local index = nil
    while index == nil do
        io.write(daraiLib.strFmt('?', text .. " [" .. answers .. "] "))
        index = string.find(answers, io.read())
    end
    if getIndex then return index end
    return string.sub(answers, index, index)    
end

-- forces player to pick a number or "nothing" given min and max
function daraiLib.inputIndex(text, minI, maxI, canNil)
    local i = nil
    local inp = nil
    local out = nil
    while inp == nil do
        io.write(daraiLib.strFmt('?', text .. " [" .. minI .. "-" .. maxI .. "] "))
        inp = io.read()
        if(inp == "")then
            out = nil
            if not canNil then inp = nil end
        else
            out = mm.floor(tonumber(inp))
            if (( out < minI ) or ( out > maxI )) then inp = nil end
        end
    end
    return out
end

-- forces player to pick between string options
-- - text is the leading question text
-- - answers is an array of options
-- - getIndex is a bool if return should be selected string, or it's index
-- - allowEmpty is a bool if possible option should be empty string aka -1
function daraiLib.listInput(text, answers, getIndex, allowEmpty)
    local index = nil
    while index == nil do
        io.write(daraiLib.strFmt('?', text .. " " .. sz.serialize(answers)))
        local input = io.read()
        if (input == "") and allowEmpty then
            index = -1
        else
            for i, opt in pairs(answers) do
                if opt == input then index = i end
            end
        end
    end
    if getIndex then return index end
    if index == -1 then return "" end
    return answers[index]    
end

-- Return table keys as an array
function daraiLib.tableKeys(input)
    local keyset={}
    local n=0

    for k,v in pairs(input) do
      n=n+1
      keyset[n]=k
    end
    return keyset
end

-- Check for key in a list or table
function daraiLib.checkForKey(tab, key)
    local res = false
    for k, l in pairs(tab) do
        if k == key then
            res = true
            return true
        end
        if l == key then
            res = true
            return true
        end
    end
    return res
end

-- Check if item is in list damage -1 = ignore
function daraiLib.itemIndex(list, item)
    for idx, itm in pairs(list) do
        if(itm["name"] == item["name"])then
            if( (itm["damage"] == item["damage"]) or (itm["name"] == -1) ) then
                return idx
            end
        end
    end
    return -1
end

-- Adds specific key from every object of source into the target list
-- - if keys = nil, adds whole source
-- - if keys is a list {"a", 1} it adds source["a"][1]
function daraiLib.addElements(target, source, keys)
    if keys == nil then
        for _,val in pairs(source) do target[#target+1] = val end
        return target
    end
    
    for _,item in pairs(source) do
        local tgtVal = item
        for _,key in pairs(keys) do tgtVal = tgtVal[key] end        
        target[#target+1] = tgtVal
    end
    return target    
end

-- check wether it is computer or robot
function daraiLib.isRobot()
    return cc.isAvailable("robot")
end

-- get inventory controller, returns both: [controller, robot]
function daraiLib.getInventoryController()
    local isRobot = daraiLib.isRobot()
    local rc = nil
    if isRobot then rc = require("robot") end
    local ic = nil
    if daraiLib.checkForKey(cc, "inventory_controller") then
        ic = cc.inventory_controller
    elseif daraiLib.checkForKey(cc, "transposer") then
        ic = cc.transposer
    end
    return {ic, rc}
end

-- returns the size of inventory independent on the type of IC
function daraiLib.getInventorySize(ic, side)
    if ic[1] == nil then return nil end
    return ic[1].getInventorySize(sd[side])
end

-- returns the stack information independent on the type of IC side nil = internal slot
function daraiLib.stackInSlot(ic, side, slot)
    if ic[1] == nil then return nil end
    if side == nil then
        if ic[2] ~= nil then return ic[1].getStackInInternalSlot(slot) end
        return nil
    end
    return ic[1].getStackInSlot(sd[side], slot)
end

-- Transfers items from internal to external in case of robot, curently selected slot is used
-- - in case of robot, partially filled means transfer from/to internal
-- - in case of robot, with no sides it switches the selected internal slot
function daraiLib.moveItems(ic, sideFrom, slotFrom, sideTo, slotTo, count)
    if ic[1] == nil then
        if ic[2] ~= nil then
            if slotFrom ~= nil then
                ic[2].select(slotFrom)
                return true
            end
            if slotTo ~= nil then
                return ic[2].transferTo(slotTo, count)
            end
        end
        return false
    end
    if ic[2] == nil then
        if sideFrom == nil or sideTo == nil then return false end
        ret = ic[1].transferItem(sd[sideFrom], sd[sideTo], count, slotFrom, slotTo)
        return ret
    else
        local ret = false
        if sideFrom ~= nil then
            ret = ic[1].suckFromSlot(sd[sideFrom], slotFrom, count)
        end        
        if sideTo ~= nil then
            ret = ic[1].dropIntoSlot(sd[sideTo], slotTo, count)
        end
        return ret
    end
    return false
end

-- Get first free slot in inventory
-- - if side = nil you want robots internal slot
-- - selection is nil or list of slots to check
function daraiLib.getFreeSlot(ic, side, selection)
    if side == nil then
        if ic[2] == nil then return nil end
        if selection == nil then
            for idx = 1,ic[2].inventorySize() do
                if ic[1].getStackInInternalSlot(idx) == nil then return idx end
            end
            return -1
        else
            for _,idx in pairs(selection) do
                if ic[1].getStackInInternalSlot(idx) == nil then return idx end
            end
            return -1
        end
    end

    if selection == nil then
        for idx = 1,ic[1].getInventorySize(sd[side]) do
            if ic[1].getStackInSlot(sd[side], idx) == nil then return idx end
        end
        return -1
    else
        for _,idx in pairs(selection) do
            if ic[1].getStackInSlot(sd[side], idx) == nil then return idx end
        end
        return -1
    end
end


return daraiLib