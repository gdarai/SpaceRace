local dl = require("daraiLib")
local sz = require("serialization")
local sd = require("sides")
local ic = dl.getInventoryController()
local ev = require("event")

local configFileName = "filter.config"

local default = {
    filters={
    {
        item={name="minecraft:stone", damage=0, label="stone"},
        target={"down"},
        max={0}
    }},
    defaultOut={"down"},
    ignoredSides={{"up"}},
    sideNames={{"a name"}}
}

for i,nm in pairs(dl.getAvailableSides()) do
    default["sideNames"][i] = {}
    default["sideNames"][i][1] = nm
end

local texts = {
    type="table",
    text="Filter computer setting",
    filters={
        type="list",
        text="List of filters",
        object = {
            type="table",
            text="One filter",
            item={
                type="item",
                text="Filtered item",
            },
            target={
                type="side",
                text="Output side for this item",
            },
            max={
                type="int",
                text="Max items in target, set 0 for 'all'",
            }
        }
    },
    defaultOut={
        type="side",
        text="Default side for all not filtered items",
    },
    ignoredSides={
        type="list",
        text="List of sides not used as an input",
        object = {
            type="side",
            text="One ignored side"
        }
    },
    sideNames={
        type="list",
        text="List of names for individual sides, just descriptive for better understanding",
        object = {
            type="str",
            text="One side name"
        }
    }
}

function getSidesInfo(setting)
    local info = {}
    local ignored = dl.addElements({}, setting["ignoredSides"], {1})
    local availableSides = dl.getAvailableSides()
    for i,side in pairs(availableSides) do info[i] = {count = 0} end

    for _,f in pairs(setting["filters"]) do
        local idx = dl.checkForKey(availableSides, f["target"][1], false)
        info[idx]["count"] = info[idx]["count"] + 1
    end

    for i,side in pairs(availableSides) do
        info[i]["side"] = side
        info[i]["name"] = setting["sideNames"][i][1]
        info[i]["role"] = "input"
        if dl.checkForKey(ignored, side, false) ~= false then info[i]["role"] = "ignored" end
        if info[i]["count"] > 0 then info[i]["role"] = "output" end
        if setting["defaultOut"][1] == side then info[i]["role"] = "primary output" end
    end
    return info
end

function getFilterIndexMap(filters, side)
    local indexMap = {}
    for i,f in pairs(filters) do
        if side == nil or f["target"][1] == side then indexMap[#indexMap+1] = i end
    end
    return indexMap
end

function listFilters(filters, indexMap)
    dl.printFmt("t", "Listing Filters (" .. #indexMap .. ")")
    dl.printFmt("i", "i) SIDE(MAX) ITEM")
    local cnt = 0
    for i,idx in pairs(indexMap) do
        cnt = cnt+1
        local f = filters[idx]
        dl.printFmt("i", i .. ") " .. f["target"][1] .. "(" .. f["max"][1] ..") " .. f["item"]["label"])
        if cnt == 5 then
            cnt = 0
            dl.enterToContinue()
        end
    end
end

function printSideInfo(idx, i)
    dl.printFmt("i", idx .. ") " .. i["side"] .. "'" .. i["name"] .. "' " .. i["role"] .. "/" .. i["count"])
end

function printFilterInfo(idx, f)
    if f["item"]["damage"] < 0 then
        dl.printFmt("i", idx .. ") " .. f["target"][1] .. "(" .. f["max"][1] ..") " .. f["item"]["label"] .. "FUZZY")
    else
        dl.printFmt("i", idx .. ") " .. f["target"][1] .. "(" .. f["max"][1] ..") " .. f["item"]["label"])
    end
end

function configureTool(setting)
    dl.printFmt("t", "Setting configurator")
    local i1 = ""
    while i1 ~= "x" do
        i1 = dl.input("Filters, Sides, Detailed or Exit", "fsdx", false)
        if i1 == "d" then -- Do thorrough edit
            dl.printFmt("t", "Full Configuration Editor")
            setting = dl.editTableKey(setting, texts, default, {})

        elseif i1 == "f" then -- Edit Filters
            local i2 = ""
            while i2 ~= "b" do
                local info = getSidesInfo(setting)
                dl.printFmt("i", "SIDE 'NAME' ROLE / COUNT")
                dl.printFmt("i", "Count = how many filters are directed there")
                for idx,i in pairs(info) do printSideInfo(idx, i) end
                i2 = dl.input("Edit, Delete, Load or Back", "edlb", false)
                if i2 == "e" then -- Edit Filter
                    local i3 = dl.inputIndex("Pick side (0 for all)", 0, #info, true)
                    if i3 ~= nil then
                        local side = nil
                        if i3 > 0 then side = info[i3]["side"] end
                        local indexMap = getFilterIndexMap(setting["filters"], side)
                        local i4 = nil
                        while i4 ~= 0 do
                            i4 = dl.inputIndex("Pick filter (0 for exit, ENTER for list)", 0, #indexMap, true)
                            if i4 == nil then -- Listing Filters
                                listFilters(setting["filters"], indexMap)
                            elseif i4 > 0 then -- Filter Picked
                                local f = setting["filters"][indexMap[i4]]
                                printFilterInfo(i4, f)
                                local i5 = dl.input("Delete, Max, IgnoreDmg, Back", "dmib", false)
                                if i5 == "d" then -- Delete Filter
                                    table.remove(setting["filters"], indexMap[i4])
                                    i4 = 0
                                elseif i5 == "m" then -- Change Max
                                    local newMax = dl.inputIndex("Pick requested maximum of items (0 for ALL, ENTER for no change)", 0, 9999, true)
                                    if newMax ~= nil then setting["filters"][indexMap[i4]]["max"][1] = newMax end
                                elseif i5 == "i" then -- Change Damage
                                    setting["filters"][indexMap[i4]]["item"]["damage"] = -1
                                end
                            end
                        end
                    end
                elseif i2 == "d" then -- Delete Filter(s)
                    local info = getSidesInfo(setting)
                    for idx,i in pairs(info) do printSideInfo(idx, i) end
                    local i3 = dl.inputIndex("Pick side (0 for all)", 0, #info, true)
                    local side = nil
                    if i3 > 0 then side = info[i3]["side"] end
                    if i3 ~= nil then
                        local indexMap = getFilterIndexMap(setting["filters"], side)
                        local i4 = nil
                        while i4 ~= 0 do
                            i4 = dl.inputIndex("Pick filter (0 for exit, ENTER for list, -1 for ALL)", -1, #indexMap, true)
                            if i4 == nil then -- Listing Filters
                                listFilters(setting["filters"], indexMap)
                            elseif i4 > 0 then -- Deleting one filter
                                table.remove(setting["filters"], indexMap[i4])
                                indexMap = getFilterIndexMap(setting["filters"], side)
                            elseif i4 < 0 then -- Deleting ALL filters
                                if dl.input("Realy delete ALL?", "Yn", false) == "Y" then
                                    if side == nil then
                                        setting["filters"] = {}
                                    else
                                        local idx = #indexMap
                                        for idx = #indexMap,1 do
                                            table.remove(setting["filters"], indexMap[idx])
                                        end
                                    end
                                    i4 = 0
                                end
                            end
                        end
                    end
                elseif i2 == "l" then -- Load Filter
                    dl.printFmt("i", "Loader is a powerfull tool. Place your items in their TARGET inventories.")
                    local useCount = dl.input("Use stack sizes for precise filtering?", "Yn", false) == "Y"
                    local clearFirst = dl.input("Clear ALL filters first?", "Yn", false) == "Y"
                    local resetIgnSides = dl.input("Reset list of ignored sides?", "Yn", false) == "Y"
                    if dl.input("Ready?", "Yn", false) == "Y" then
                        if clearFirst then
                            setting["filters"] = {}
                        end
                        if resetIgnSides then
                            setting["ignoredSides"] = {}
                        end

                        local ignored = dl.addElements({}, setting["ignoredSides"], {1})
                        local info = getSidesInfo(setting)
                        local items = dl.addElements({}, setting["filters"], {"item"})
                        local targets = dl.addElements({}, setting["filters"], {"target", 1})

                        for idx,i in pairs(info) do
                            local side = i["side"]
                            printSideInfo(idx, i)
                            local maxSlot = dl.getInventorySize(ic, side)
                            local sideNames = setting["sideNames"]
                            
                            if (i["role"] ~= "ignored") and (maxSlot ~= nil) then
                                for slot=1,maxSlot do
                                    local stack = dl.stackInSlot(ic, side, slot)
                                    if stack ~= nil then
                                        local currIdx = dl.itemIndex(items, stack)
                                        if currIdx < 0 then -- ADDING
                                            local maxSize = 0
                                            if useCount then maxSize = stack["size"] end
                                            dl.printFmt("r", "(" .. maxSize .. ")" .. stack["label"])
                                            setting["filters"][#setting["filters"]+1] = {
                                                item={name=stack["name"], damage=stack["damage"], label=stack["label"]},
                                                target={side},
                                                max={maxSize}
                                            }
                                            targets[#targets+1] = side
                                            items[#items+1] = {name=stack["name"], damage=stack["damage"], label=stack["label"]}
                                        else -- SKIPPING
                                            dl.printFmt("e", "Skipping duplicate (now " .. sideNames[targets[currIdx]][1] .. ")" .. stack["label"])
                                        end
                                    end
                                end
                            elseif i["role"] ~= "ignored" then
                                dl.printFmt("e", "No inventory on this side, adding to ignored")
                                setting["ignoredSides"][#setting["ignoredSides"]+1]={side}
                            end
                            dl.enterToContinue()
                        end
                    end
                end
            end

        elseif i1 == "s" then -- Edit Sides
            local info = getSidesInfo(setting)
            local ignored = dl.addElements({}, setting["ignoredSides"], {1})
            local availableSides = dl.getAvailableSides()
            local i2 = 0
            while i2 ~= -1 do
                dl.printFmt("t", "Sides description")
                for idx,i in pairs(info) do printSideInfo(idx, i) end
                i2 = dl.listInput("Edit", availableSides, true, true)
                if i2 > 0 then
                    local i3 = ""
                    while i3 ~= "b" do
                        local i = info[i2]
                        printSideInfo(i2, i)
                        i3 = dl.input("Rename, (un)Ignore(as input), Default(out), List(filters) or Back", "ridlb", false)
                        if i3 == "r" then -- Rename
                            local new = dl.stringInput()
                            info[i2]["name"] = new
                            setting["sideNames"][i2][1] = new

                        elseif i3 == "i" then -- Ignore
                            local role = info[i2]["role"]

                            if role == "input" then
                                info[i2]["role"] = "ignored"
                            elseif role == "ignored" then
                                info[i2]["role"] = "input"
                            end

                            local ignIdx = dl.checkForKey(ignored, i["side"], false)
                            if ignIdx ~= false then
                                table.remove(setting["ignoredSides"], ignIdx)
                                table.remove(ignored, ignIdx)
                            else
                                setting["ignoredSides"][#setting["ignoredSides"]+1] = {i["side"]}
                                ignored[#ignored+1] = i["side"]
                            end
                        elseif i3 == "d" then -- Default
                            setting["defaultOut"] = {info[i2]["side"]}
                            info = getSidesInfo(setting)
                        elseif i3 == "l" then -- List filters
                            local side = info[i2]["side"]
                            for idx,f in pairs(setting["filters"]) do
                                if f["target"][1] == side then printFilterInfo(idx, f) end
                                dl.enterToContinue()
                            end
                        end
                    end
                end
            end
        end
    end
    dl.saveConfigFile(configFileName, setting)
    return setting
end



function oneFilterRun(inputSides, filteredItems, filteredSides, filteredMax, defaultOut)
    -- For every side and slot
    for _, side in pairs(inputSides) do
        for slot = 1,side["slots"] do
            -- Get item
            local item = dl.stackInSlot(ic, side["side"], slot)
            -- If we have an item
            if item ~=nil then
                local target = defaultOut
                local idx = dl.itemIndex(filteredItems, item)
                local filteredMaxStack = 9999
                if idx ~= -1 then
                    target = filteredSides[idx]
                    filteredMaxStack = filteredMax[idx]
                end
                dl.printFmt('i', "Moving " .. item["label"] .. " - " .. target)
                -- Check if max reached
                local mntToMove = item["maxSize"]
                if filteredMaxStack > 0 then
                    local curCount = dl.countItems(ic, target, item)
                    mntToMove = filteredMaxStack - curCount
                end
                if mntToMove > 0 then
                    -- Find free slot
                    local freeSlot = dl.getFreeSlot(ic, target, nil)
                    local check = dl.moveItems(ic, side["side"], slot, target, freeSlot, mntToMove)
                    -- Print error
                    if not check then
                        dl.printFmt('e', "Failed to move to " .. target)
                    end
                else
                    dl.printFmt('e', "Requested # "..filteredMaxStack.." reached")
                end
            end
        end
    end
end



dl.printFmt('T', "Filter Program")
dl.printFmt('t', "Configuration")
local config = dl.config(configFileName, texts, default, true)

if ic[1] == nil then
    dl.printFmt('e', "No Inventory Controller is Available. Program cannot run without transposer or inventory controller card.")
    return 1
end

if ic[2] ~=nil and ic[2].inventorySize() < 16 then
    dl.printFmt('e', "The robot needs internal invenory.")
    return 1
end

if dl.input("Change the configuration", "Yn", false) == "Y" then
    config = configureTool(config)
end

if dl.input("Run program or Terminate", "rt", false) == "r" then
    -- Construct list of inputs and outputs
    local filteredItems = dl.addElements({}, config["filters"], {"item"})
    local filteredSides = dl.addElements({}, config["filters"], {"target", 1})
    local filteredMax   = dl.addElements({}, config["filters"], {"max", 1})

    local ignoredSides = {config["defaultOut"][1]}
    ignoredSides = dl.addElements(ignoredSides, config["ignoredSides"], {1})
    ignoredSides = dl.addElements(ignoredSides, filteredSides, nil)

    local inputSides = {}
    for _, side in pairs(dl.getAvailableSides()) do
        local ignored = dl.checkForKey(ignoredSides, side) ~= false
        local slotCount = dl.getInventorySize(ic, side)
        if (not ignored) and slotCount ~= nil and slotCount>0 then
                inputSides[#inputSides+1] = {side=side, slots=slotCount}
        end
    end

    -- Print inputs on the screen
    dl.printFmt('t', "Input Sides:")
    for _, side in pairs(inputSides) do
        dl.printFmt('i', side["side"] .. " - " .. side["slots"] .. " slots")
    end

    -- Filter cycle
    while true do
        dl.printFmt('n', "CTRL+C to terminate")
        local id, _ = ev.pull(1,"interrupted")
        if id == "interrupted" then
            print("soft interrupt, closing")
            break
        else
            oneFilterRun(inputSides, filteredItems, filteredSides, filteredMax, config["defaultOut"][1])
        end
    end
end

dl.printFmt('t', "Thank you for using filter program.")
