local dl = require("daraiLib")
local sd = require("sides")
local ic = dl.getInventoryController()

local configFileName = "assembler.config"

local default = {
    recipes={
        {
            name={"wood plank"},
            group={1},
            craftType={1},
            input={
                {name="minecraft:log", damage=0, label="wood log"}
            },
            receipt={"1nnnnnnnn"},
            output={name="minecraft:planks", damage=0, label="wood plank"},
            size={4}
        },
        {
            name={"stick"},
            group={1},
            craftType={1},
            input={
                {name="minecraft:planks", damage=0, label="wood plank"}
            },
            receipt={"1nn1nnnnn"},
            output={name="minecraft:stick", damage=0, label="stick"},
            size={4}
        }
    },
    types={
        {
            name={"crafting"},
            item={name="minecraft:stick", damage=0, label="stick"},
            position={""},
            shortcut={"x"}
        }
    },
    groups={
        {"Basic"}
    },
    sourceSide={"down"},
    readSide={"up"}
}

local texts = {
    type="table",
    text="Assembler robot setting",
    recipes={
        type="list",
        text="List of recipes",
        object={
            type="table",
            text="One assembling receipt",
            name={
                type="str",
                text="Name of this receipt"
            },
            group={
                type="int",
                text="Representing the group this receipt is placed into"
            },
            craftType={
                type="int",
                text="Representing the type of this receipt"
            },
            input={
                type="list",
                text="List of needed items",
                object={
                    type="item",
                    text="One needed resource"
                }
            },
            receipt={
                type="str",
                text="Representation of the receipt, 9 chars [n1-9], or comma separated list of counts for individual items"
            },
            output={
                    type="item",
                    text="Expected output item"
            },
            size={
                type="int",
                text="expected output count"
            }
        }
    },
    types={
        type="list",
        text="List of recipes",
        object={
            type="table",
            text="One assembler machine",
            name={
                type="str",
                text="assembling type name"
            },
            item={
                type="item",
                text="crafting automat identificator item"
            },
            position={
                type="str",
                text="Navigation to input box, 0L means go 0 and turn left"
            },
            shortcut={
                type="str",
                text="shortcut for quick referrence"
            }
        }
    },
    groups={
        type="list",
        text="List of assembling groups",
        object={
            type="str",
            text="One assembling group name"
        }
    },
    sourceSide={
        type="side",
        text="Side with inventory used as a resource bin"
    },
    readSide={
        type="side",
        text="Side with inventory used as a receipt input"
    }
}

-- #################
-- ##  Code Parts
-- #################
function doChecks(ic)
  if ic[2] == nil then
      dl.printFmt('e', "This program is for ROBOTS only. Sorry.")
      return 1
  end
  if ic[1] == nil then
      dl.printFmt('e', "No Inventory Controller is Available. Program cannot run without inventory controller card.")
      return 1
  end
  if ic[2].inventorySize() < 16 then
      dl.printFmt('e', "The robot needs internal inventory.")
      return 1
  end
  ic[3] = dl.getComponent("crafting")
  if ic[3] == nil then
      dl.printFmt('e', "The robot needs a crafting upgrade.")
      return 1
  end
  return 0
end

function readRecChest(ic, config, slot, verbose)
    local size = dl.getInventorySize(ic, config["readSide"][1])
    if size == nil and verbose then
        dl.printFmt('e', "There is no Receipt inventory " .. config["readSide"][1])
        return nil
    end
    local item = dl.stackInSlot(ic, config["readSide"][1], slot)
    if item == nil and verbose then
        dl.printFmt('e', "There is no item in the Receipt inventory " .. config["readSide"][1] .. " slot " .. slot .. ".")
    end
    return item
end

function moveRobot(ic, order, isBack)
    if not isBack then
        if order == "L" then ic[2].turnLeft()
        elseif order == "R" then ic[2].turnRight()
        elseif order == "U" then ic[2].up()
        elseif order == "D" then ic[2].down()
        else for i=1,tonumber(order) do ic[2].forward() end
        end
    else
        if order == "L" then ic[2].turnRight()
        elseif order == "R" then ic[2].turnLeft()
        elseif order == "U" then ic[2].down()
        elseif order == "D" then ic[2].up()
        else for i=1,tonumber(order) do ic[2].back() end
        end
    end
end

function modifyGroup(config, idx, i2)
    if i2 == "r" then -- Rename
        local new = dl.stringInput()
        if new ~= "" then
            config["groups"][idx][1] = new
        end
    elseif i2 == "t" then -- To Top
        for _,r in pairs(config["recipes"]) do
            if r["group"][1] < idx then r["group"][1] = r["group"][1] + 1
            elseif r["group"][1] == idx then r["group"][1] = 1
            end
        end
        local lastName = config["groups"][idx][1]
        local nextName = ""
        for i,g in pairs(config["groups"]) do
            nextName = g[1]
            g[1] = lastName
            lastName = nextName
            if i == idx then break end
        end
    elseif i2 == "b" then -- To Bottom
        local maxCount = #config["groups"]
        for _,r in pairs(config["recipes"]) do
            if r["group"][1] > idx then r["group"][1] = r["group"][1] - 1
            elseif r["group"][1] == idx then r["group"][1] = maxCount
            end
        end
        local newLastName = config["groups"][idx][1]
        for i=idx,maxCount-1 do
            config["groups"][i][1] = config["groups"][i+1][1]
        end
        config["groups"][maxCount][1] = newLastName
    elseif i2 == "d" then -- Delete
        if dl.input("Really?", "Yn", false) == "Y" then
            for idx2,i in pairs(info) do if idx2 ~= idx then printGroupsInfo(idx2, i, "i") end end
            local idx2 = dl.inputIndex("Where to move the recipes?", 1, #info, false)
            if idx2 ~=idx then
                local maxCount = #config["groups"]
                for _,r in pairs(config["recipes"]) do
                    if r["group"][1] == idx then r["group"][1] = idx2 end
                    if r["group"][1] > idx then r["group"][1] = r["group"][1] - 1 end
                end
                for i=idx,maxCount-1 do
                    config["groups"][i][1] = config["groups"][i+1][1]
                end
                table.remove(config["groups"], maxCount)
            end
        end
    elseif i2 == "n" then -- New
        local new = dl.stringInput()
        if new ~= "" then
            config["groups"][#config["groups"]+1] = {new}
        end
    end
    return config
end

function modifyTool(ic, config, idx, i2)
    local allowedCommands = "LRUD123456789"
    if i2 == "r" then -- Rename the tool
        local new = dl.stringInput()
        if new ~= "" then
            config["types"][idx]["name"][1] = new
        end
        dl.printFmt("i", "And new shortcut?")
        local new2 = dl.stringInput()
        if new2 ~= "" then
            config["types"][idx]["shortcut"][1] = new2
        end
    elseif i2 == "i" then -- Change the tool item
        local item = readRecChest(ic, config, 1, true)
        if item ~= nil then
            local msg = "Replace " .. config["tools"][idx]["item"]["label"] .. " with " .. item["label"]
            if dl.input(msg, "Yn", false) == "Y" then
                config["types"][idx]["item"] = dl.copyItem(item, false)
            end
        end
    elseif i2 == "p" then -- Change the tool Place
        dl.printFmt("i", "Give robot instructions, how to get to the machines input inventory.")
        dl.printFmt("i", "use (" .. allowedCommands .. ") to navigate")
        local new = dl.stringInput()
        local test = true
        for i=1,string.len(new) do
            local ch = string.sub(new, i, i)
            local index = string.find(allowedCommands, ch)
            if index == nil then
                dl.printFmt('e', "The " .. i .. " char " .. ch .. " is not allowed.")
                test = false
            end
        end
        if test then
            config["types"][idx]["position"][1] = new
        end
    elseif i2 == "d" then -- Delete the tool
        if dl.input("Are you sure?", "Yn", false) == "Y" then
            local maxCount = #config["types"]
            for _,r in pairs(config["recipes"]) do
                if r["craftType"][1] > idx then r["craftType"][1] = r["craftType"][1] - 1 end
            end
            for i=idx,maxCount-1 do
                config["types"][i] = config["types"][i+1]
            end
            table.remove(config["types"], maxCount)
        end
    elseif i2 == "n" then -- Create new tool
        local item = readRecChest(ic, config, 1, true)
        local name = "machine"
        local shortcut = "m"
        local place = ""
        if item == nil then
            dl.printFmt('i', "No Item, using default.")
            item = default["types"][1]["item"]
        end
        dl.printFmt("i", "Tool Name:")
        local newName = dl.stringInput()
        dl.printFmt("i", "Tool Shortcut:")
        local newShortcut = dl.stringInput()
        dl.printFmt("i", "Tool Place (" .. allowedCommands .. "):")
        local newPlace = dl.stringInput()
        if newName ~= "" then name = newName end
        if newShortcut ~= "" then shortcut = newShortcut end
        local test = true
        for i=1,string.len(newPlace) do
            local ch = string.sub(newPlace, i, i)
            local index = string.find(allowedCommands, ch)
            if index == nil then test = false end
        end
        if test then place = newPlace end
        dl.printFmt('i', "New tool: " .. name .. "[" .. shortcut .. "] = " .. place)
        dl.printFmt('i', "  -" .. item["label"])
        if dl.input("Proceed?", "Yn", false) == "Y" then
            local new = {name={name}, item=dl.copyItem(item,false), shortcut={shortcut}, position={place}}
            config["types"][#config["types"]+1] = new
        end
    end
    return config
end

function listNeededResources(oldList, rec, n)
    local theList = oldList
    if theList == nil then theList = {{},{},0} end
    local cnt = n
    local map = {0,0,0,0,0,0,0,0,0}
    if rec["craftType"][1] == 1 then
        for i=1,9 do
            local ch = string.sub(rec["receipt"][1], i, i)
            if ch ~="n" then
                ch = tonumber(ch)
                map[ch] = map[ch] + n
            end
        end
    end
    for idx,item in pairs(rec["input"]) do
        if rec["craftType"][1] ~= 1 then
            cnt = tonumber(string.sub(rec["receipt"][1], idx, idx)) * n
        else
            cnt = map[idx]
        end
        theList[3] = theList[3] + cnt
        local itIdx = dl.itemIndex(theList[1], item)
        if itIdx > 0 then
            theList[2][itIdx] = theList[2][itIdx] + cnt
        else            
            itIdx = #theList[1]+1
            theList[1][itIdx] = dl.copyItem(item, false)
            theList[2][itIdx] = cnt
        end
    end
    return theList
end

function findNonzero(list)
    for idx,val in pairs(list) do
        if val > 0 then return idx end
    end
    return -1
end

function calculateTask(ic, config, idx, n)
    dl.printFmt('i', "Calculating task")
    local divisor = config["recipes"][idx]["size"][1]
    local need1 = math.ceil(n/divisor)
    local side = config["sourceSide"][1]
    local ans = {tasks={{idx, need1}}, need=listNeededResources(nil, config["recipes"][idx], need1), res={{},{},{}}}
    local canDo = dl.addElements({}, config["recipes"], {"output"})
    dl.printFmt('i', "Checking resources")
    local have = {{},{}}
    for slot=1,dl.getInventorySize(ic, side) do
        local item = dl.stackInSlot(ic, side, slot)
        if item ~= nil then
            local idx = dl.itemIndex(have[1], item)
            if idx < 0 then                
                idx = #have[1]+1
                have[1][idx] = dl.copyItem(item, false)
                have[2][idx] = 0
            end
            have[2][idx] = have[2][idx] + item.size
        end
    end
    dl.printFmt('i', "Extrapolating needs")
    while ans["need"][3] > 0 do
        -- get nonzero need
        local idx1 = findNonzero(ans["need"][2])
        local item = ans["need"][1][idx1]
        local need0 = ans["need"][2][idx1]
        local need = need0
        ans["need"][2][idx1] = 0
        ans["need"][3] = ans["need"][3] - need
        
        -- substract if we have some supply
        local idx2 = dl.itemIndex(have[1], item)
        if idx2 > 0 then            
            local supply = have[2][idx2]
            if supply > 0 then
                if supply < need then
                    need = need - supply
                    have[2][idx2] = 0
                else
                    have[2][idx2] = have[2][idx2] - need
                    need = 0
                end
            end
            local idx4 = dl.itemIndex(ans["res"][1], item)
            if idx4 < 0 then
                idx4 = #ans["res"][1] + 1
                ans["res"][1][idx4] = dl.copyItem(item, false)
                ans["res"][2][idx4] = 0
                ans["res"][3][idx4] = 0
            end
            ans["res"][2][idx4] = ans["res"][2][idx4] + need0 - need
        end
        
        if need > 0 then -- still need some
            local idx3 = dl.itemIndex(canDo, item)
            if idx3 > 0 then -- craft the rest if we can
                divisor = config["recipes"][idx3]["size"][1]
                need1 = math.ceil(need/divisor)
                ans["tasks"][#ans["tasks"]+1] = {idx3, need1}
                ans["need"] = listNeededResources(ans["need"], config["recipes"][idx3], need1)
            else -- or add to missing
                idx3 = dl.itemIndex(ans["res"][1], item)
                if idx3 < 0 then
                    idx3 = #ans["res"][1] + 1
                    ans["res"][1][idx3] = dl.copyItem(item, false)
                    ans["res"][2][idx3] = 0
                    ans["res"][3][idx3] = 0
                end
                ans["res"][3][idx3] = ans["res"][3][idx3] + need
            end
        end
    end
    
    local res = {}
    local totalMissing = 0
    for i=1,#ans["res"][1] do
        res[#res+1] = {item=ans["res"][1][i], used=ans["res"][2][i], missing=ans["res"][3][i]}
        totalMissing = totalMissing + ans["res"][3][i]
    end
    ans["res"] = res
    ans["missing"] = totalMissing
    return ans
end

function loadReceipt(ic, config, receipt)
    local item = readRecChest(ic, config, 1, true)
    if item == nil then return nil end

    local typeIdx = 0
    for i,t in pairs(config["types"]) do
        if dl.compareItem(item, t["item"]) then typeIdx = i end
    end
    if typeIdx == 0 then
        dl.printFmt('e', "The item in Receipt inventory slot 1 is none of designed machines.")
        return nil
    end

    dl.printFmt('i', "Reading '" .. config["types"][typeIdx]["name"][1] .. "' receipt.")
    local res = {}
    local rec = ""
    local slot = 2
    local it2 = readRecChest(ic, config, slot, false)
    local enough = (it2 == nil and typeIdx ~= 1) or (slot == 11)
    while not enough do
        if typeIdx == 1 then
            if it2 == nil then
                rec = rec .. "n"                
            else
                local idx = dl.itemIndex(res, it2)
                if idx == -1 then
                    res[#res+1] = dl.copyItem(it2, false)
                    idx = #res
                end
                rec = rec .. idx
            end
        else
            res[#res+1] = dl.copyItem(it2, false)
            rec = rec .. math.floor(it2.size)
        end        
        slot = slot + 1
        it2 = readRecChest(ic, config, slot, false)
        enough = (it2 == nil and typeIdx ~= 1) or (slot == 11)
    end
    if #res == 0 then
        dl.printFmt('e', "Receipt must have at least one input item.")
        return nil
    end
    receipt["craftType"] = {typeIdx}
    receipt["input"] = res
    receipt["receipt"] = {rec}
    return receipt
end

function getRequiredItems(ic, receipt, side, n)
    local theList = listNeededResources(nil, receipt, n)
    for idx=1,#theList[1] do
        local item = theList[1][idx]
        local cnt = theList[2][idx]
        local targetCnt = dl.countItems(ic, nil, item) + cnt
        local tgtSlot = dl.itemSlotNotFull(ic, nil, item)
        local slot = dl.itemSlotIndex(ic, side, item)
        local missing = cnt
        while (missing > 0)do
            if slot == -1 then
                dl.printFmt('e', "Not enough '" .. item["label"] .. "', " .. missing .. " missing.")
                dl.moveAllItems(ic, nil, nil, side, nil)
                return idx
            end
            dl.moveItems(ic, side, slot, nil, tgtSlot[1], missing)
            missing = targetCnt - dl.countItems(ic, nil, item)
            slot = dl.itemSlotIndex(ic, side, item)
        end
    end
    return 0
end

function feedMachine(ic, config, receipt, n)
    local test = 0
    local craftTypeIdx = receipt["craftType"][1]
    local craftType = config["types"][craftTypeIdx]
    if craftTypeIdx == 1 then -- Craft
        local slots = {1,2,3,5,6,7,9,10,11}
        local side = config["readSide"][1]
        local dumpSide = config["sourceSide"][1]
        test = dl.moveAllItems(ic, nil, nil, side, nil)
        if test > 0 then
            dl.printFmt('e', "Not enough space in receipt inventory.")
            return test
        end
        for i1=1,n do 
            for i2=1,9 do -- one crafting
                local ch = string.sub(receipt["receipt"][1], i2, i2)
                if ch ~= "n" then
                    local slot = dl.itemSlotIndex(ic, side, receipt["input"][tonumber(ch)])
                    dl.moveItems(ic, side, slot, nil, slots[i2], 1)
                end
            end
            if ic[3].craft() == false then
                dl.printFmt('e', "Crafting #" .. i1 .. " failed.")
                return i1
            end
            test = dl.moveAllItems(ic, nil, nil, dumpSide, nil)
            if test > 0 then
                dl.printFmt('e', "Not enough space in receipt inventory.")
                return test
            end
        end
    else -- Feed
        local maxI1 = string.len(craftType["position"][1])
        if maxI1 > 0 then
            for i1=1,maxI1 do
                moveRobot(ic, string.sub(craftType["position"][1], i1, i1), false)
            end
            test = dl.moveAllItems(ic, nil, nil, "front", nil)
            for i1=1,maxI1 do
                moveRobot(ic, string.sub(craftType["position"][1], maxI1-i1+1, maxI1-i1+1), true)
            end
        else
            test = dl.moveAllItems(ic, nil, nil, "front", nil)
        end
    end
    if test > 0 then
        dl.printFmt('e', "Could not feed the machine.")
    end
    return test
end

function printTaskResources(task)
    dl.printFmt('i', "Item use/missing")
    local counter = 0
    for _,r in pairs(task["res"]) do
        counter = counter + 1
        dl.printFmt('i', r["item"]["label"] .. " " .. r["used"] .. "/" .. r["missing"])
        if counter == 8 then
            dl.enterToContinue()
            counter = 0
        end
    end
    dl.printFmt('i', "Missing " .. task["missing"] .. " items, need " .. #task["tasks"] .. " processing steps.")
end
            
function modifyReceipt(ic, config, idx, i2, groupIdx)
    -- check, build,       -  - Rename, move, load, delete, new and exit
    if i2 == "r" then -- Rename the receipt
        local new = dl.stringInput()
        if new ~= "" then
            config["recipes"][idx]["name"][1] = new
        end
        
    elseif i2 == "m" then -- Change the receipts group
        local info = getGroupsInfo(config)
        for idx,i in pairs(info) do printGroupsInfo(idx, i, "i") end
        local idx2 = dl.inputIndex("Pick group", 1, #info, false)
        config["recipes"][idx]["group"][1] = idx2
        
    elseif i2 == "l" then -- Re-Load the receipt from the input inventory
        local rec = config["recipes"][idx]
        local newR = loadReceipt(ic, config, rec)
        if newR == nil then return config end
        local i3 = dl.input("What about output? Keep, Craft or Read", "kcr", false)
        
        if i3 == "r" then -- Read from receipt chest
            item = readRecChest(ic, config, 1, true)
            if item ~= nil then
                dl.printFmt('i', "  -" .. item["label"] .. " " .. item["size"] .. "x")
                rec["output"] = dl.copyItem(item, false)
                rec["size"] = {item.size}
            end
            
        elseif i3 == "c" then -- Craft and then read from the receipt chest
            local test = 0
            test = getRequiredItems(ic, rec, config["readSide"][1], 1)
            if test > 0 then return config end
            test = feedMachine(ic, config, rec, 1)
            if test > 0 then return config end
            dl.printFmt('i', "Place finished output into the read inventory slot 1.")
            dl.enterToContinue()
            item = readRecChest(ic, config, 1, true)
            if item ~= nil then
                dl.printFmt('i', "  -" .. item["label"] .. " " .. item["size"] .. "x")
                rec["output"] = dl.copyItem(item, false)
                rec["size"] = {item.size}
            end            
        end
    
    elseif i2 == "d" then -- Delete
        if dl.input("Really?", "Yn", false) == "Y" then
            local maxCount = #config["recipes"]
            for i=idx,maxCount-1 do
                config["recipes"][i] = config["recipes"][i+1]
            end
            table.remove(config["recipes"], maxCount)
        end

    elseif i2 == "n" then -- New
        local rec = {}
        local newR = loadReceipt(ic, config, rec)
        if newR == nil then return config end
        dl.printFmt('i', "Receipt name:")
        local name = dl.stringInput()        
        if name == "" then
            dl.printFmt('e', "Receipt name cannot be empty.")
            return config
        end
        rec["name"] = {name}
        rec["group"] = {groupIdx}
        
        local i3 = dl.input("What about output? Craft or Read", "cr", false)
        if i3 == "r" then -- Read from receipt chest
            item = readRecChest(ic, config, 1, true)
            if item ~= nil then
                dl.printFmt('i', item["label"] .. " " .. math.floor(item["size"]) .. "x")
                rec["output"] = dl.copyItem(item, false)
                rec["size"] = {math.floor(item.size)}
            else
                dl.printFmt('e', "Receipt output cannot be empty.")
                return config
            end
            
        elseif i3 == "c" then -- Craft and then read from the receipt chest
            local test = 0
            test = getRequiredItems(ic, rec, config["readSide"][1], 1)
            if test > 0 then return config end
            test = feedMachine(ic, config, rec, 1)
            if test > 0 then return config end
            dl.printFmt('i', "Place finished output into the read inventory slot 1.")
            dl.enterToContinue()
            item = readRecChest(ic, config, 1, true)
            if item ~= nil then
                dl.printFmt('i', "  -" .. item["label"] .. " " .. item["size"] .. "x")
                rec["output"] = dl.copyItem(item, false)
                rec["size"] = {math.floor(item.size)}
            else
                dl.printFmt('e', "Receipt output cannot be empty.")
                return config
            end
        end
        
        config["recipes"][#config["recipes"]+1] = rec
        dl.printFmt('i', "Receipt " .. #config["recipes"] .. " created.")
        
    elseif i2 == "c" then -- Check
        local count = dl.inputIndex("How many", 1, 99, false)
        local task = calculateTask(ic, config, idx, count)
        dl.printFmt('t', "Check results")
        printTaskResources(task)
        dl.enterToContinue()
    elseif i2 == "b" then -- Build
        local count = dl.inputIndex("How many", 1, 99, false)
        local task = calculateTask(ic, config, idx, count)
        if task["missing"] > 0 then
            dl.printFmt('t', "Check results")
            printTaskResources(task)
            dl.printFmt('e', "Some resources are missing")            
            dl.enterToContinue()
            return config
        end
        dl.printFmt('t', "Ok, starting work")
        local maxI = #task["tasks"]
        local side = config["sourceSide"][1]
        for i = 1,maxI do
            local t = task["tasks"][maxI+1-i]
            local rec = config["recipes"][t[1]]
            dl.printFmt('i', "Task " .. i .. "/" .. maxI .. " " .. t[2] .. " x " .. rec["name"][1])
            local test = 0
            local targetCnt = dl.countItems(ic, side, rec["output"]) + (t[2] * rec["size"][1])
            test = getRequiredItems(ic, rec, side, t[2])
            if test > 0 then return config end
            test = feedMachine(ic, config, rec, t[2])
            if test > 0 then return config end
            while dl.countItems(ic, side, rec["output"]) < targetCnt do
                dl.printFmt('i', "Waiting for " .. rec["output"]["label"] .. " ...")
                os.sleep(10)
            end
        end
    end
    return config    
end

-- #################
-- ##  Info Printers
-- #################
function getGroupsInfo(setting)
    local info = {}
    for _,g in pairs(setting["groups"]) do info[#info+1] = { name=g[1], count=0 } end
    for _,r in pairs(setting["recipes"]) do
        info[r["group"][1]]["count"] = info[r["group"][1]]["count"] + 1
    end
    return info
end

function printGroupsInfo(idx, i, printType)
    dl.printFmt(printType, idx .. ") " .. i["name"] .. " [" .. i["count"] .. "]")
end

function printReceiptInfo(rec, grpIdx, types, lineIdx)
    if rec["group"][1] ~= grpIdx and grpIdx > 0 then return false end    
    dl.printFmt("i", lineIdx .. ") " .. rec["name"][1] .. " [" .. types[rec["craftType"][1]]["name"][1] .. "]")
    return true
end

function getToolsInfo(setting)
    local info = {}
    for _,t in pairs(setting["types"]) do info[#info+1] = { name=t["name"][1], count=0, default=(#info == 0), itemL=t["item"]["label"]} end
    for _,r in pairs(setting["recipes"]) do info[r["craftType"][1]]["count"] = info[r["craftType"][1]]["count"] + 1 end
    return info
end

function printToolsInfo(idx, i, printType)
    if i["default"] then dl.printFmt(printType, idx .. ") " .. i["name"] .. " [" .. i["count"] .. "] crafting - " .. i["itemL"])
    else dl.printFmt(printType, idx .. ") " .. i["name"] .. " [" .. i["count"] .. "] machine - " .. i["itemL"])
    end
end

-- #################
-- ##  MAIN CODE
-- #################
dl.printFmt('T', "Assembler Program")
local config = dl.config(configFileName, texts, default, true)
if doChecks(ic) == 1 then return 1 end
dl.printFmt("t", "Main Menu (1)")
local i1 = ""
while i1 ~= "x" do
    i1 = dl.input("Recipes, Groups, Tools, Full or Exit", "rgtfx", false)
    if i1 == "g" then -- Edit Groups
        dl.printFmt("t", "Groups menu (2)")
        local info = getGroupsInfo(config)
        for idx,i in pairs(info) do printGroupsInfo(idx, i, "i") end
        local idx = dl.inputIndex("Pick group (0 for new)", 0, #info, false)
        local i2 = ""
        if idx == 0 then -- new group
            i2 = "n"
        else
            for i,r in pairs(config["recipes"]) do printReceiptInfo(r, idx, config["types"], i) end
            printGroupsInfo(idx, info[idx], "t")
            local i2 = dl.input("Rename, top, bottom, delete, new, exit", "rtbdnx", false)
        end
        config = modifyGroup(config, idx, i2)
        dl.saveConfigFile(configFileName, config)
    elseif i1 == "t" then -- Edit Tools
        dl.printFmt("t", "Tools menu (2)")
        local info = getToolsInfo(config)
        for idx,i in pairs(info) do printToolsInfo(idx, i, "i") end
        local idx = dl.inputIndex("Pick tool (0 for new)", 0, #info, false)
        local i2 = ""
        if idx == 0 then -- new tool
            i2 = "n"
        elseif idx == 1 then -- crafting
            i2 = dl.input("Rename, item, exit", "rix", false)
        elseif info[idx]["count"] > 0 then -- have some recipes
            i2 = dl.input("Rename, item, place, new, exit", "ripnx", false)
        else -- have no recipes
            i2 = dl.input("Rename, item, place, delete, new, exit", "ripdnx", false)
        end
        config = modifyTool(ic, config, idx, i2)
        dl.saveConfigFile(configFileName, config)
    elseif i1 == "f" then -- Run full config editor
        config = dl.editTableKey(config, texts, default, {})
        if dl.input("Save the new configuration", "Yn", false) == "Y" then
            dl.saveConfigFile(configFileName, config)
        end
    elseif i1 == "r" then -- Recipes
        dl.printFmt("t", "Recipes (2)")
        local info = getGroupsInfo(config)
        for idx,i in pairs(info) do printGroupsInfo(idx, i, "i") end
        local idxg = dl.inputIndex("Pick group (0 for all)", 0, #info, false)
        local counter = 0
        for i,r in pairs(config["recipes"]) do
            if printReceiptInfo(r, idxg, config["types"], i) then
                counter = counter + 1
            end
            if counter == 8 then
                dl.enterToContinue()
                counter = 0
            end
        end
        local idx = dl.inputIndex("Pick receipt (0 for new)", 0, #config["recipes"], false)
        i2 = ""
        if idx == 0 then -- new tool
            i2 = "n"
        else -- receipt selected
            printReceiptInfo(config["recipes"][idx], 0, config["types"], idx)
            i2 = dl.input("Rename, move, load, check, build, delete, exit", "rmlcbdx", false)
        end
        
        if idxg == 0 then idxg = 1 end
        config = modifyReceipt(ic, config, idx, i2, idxg)
        dl.saveConfigFile(configFileName, config)
    elseif i1 == "x" then -- Exit
        dl.printFmt('t', "Thank you for using assembler program.")
    end
end
