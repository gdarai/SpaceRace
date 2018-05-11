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
    }
    sideNames={
        type="list",
        text="List of names for individual sides, just descriptive for better understanding",
        object = {
            type="str",
            text="One side name"
        }
    }
}

function configureTool(setting)
    dl.printFmt("t", "Setting configurator")
    local i1 = ""
    while i1 ~= "x" do
        i1 = dl.input("Filters, Sides, Detailed or Exit", "fsdx", false)
        if i1 == "d" then -- Do thorrough edit
            dl.printFmt("t", "Full Configuration Editor")
            setting = dl.editTableKey(setting, texts, default, {})

        elseif i1 == "f" then -- Edit Filters
            

        elseif i1 == "s" then -- Edit Sides
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
                if info[idx]["count"] > 0 then info[i]["role"] = "output" end
                if setting["defaultOut"][1] == side then info[i]["role"] = "primary output" end
            end

            local i2 = 0
            while i2 ~= -1 do
                dl.printFmt("t", "Sides description")
                for idx,i in pairs(info) do dl.printFmt("i", idx .. ") " .. i["side"] .. "'" .. i["name"] .. "' " .. i["role"] .. "/" .. i["count"])
                i2 = dl.listInput("Edit", availableSides, true, true)
                if i2 > 0 then
                    local i3 = ""
                    while i3 ~= "b" do
                        local i = info[i2]
                        dl.printFmt("i", i2 .. ") " .. i["side"] .. "'" .. i["name"] .. "' " .. i["role"] .. "/" .. i["count"])
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
                            info[i2]["role"] = "primary output"
                            setting["defaultOut"] = {info[i2]["side"]}

                        elseif i3 == "l" then -- List filters
                            local side = info[i2]["side"]
                            for _,f in pairs(setting["filters"]) do
                                if f["target"][1] == side then dl.printFmt("i", f["item"]["label"] .. "(max ".. f["max"] ..")") end
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
                if idx ~= -1 then target = filteredSides[idx] end
                dl.printFmt('i', "Moving " .. item["label"] .. " - " .. target)
                -- Check if max reached
                local mntToMove = item["maxSize"]
                if filteredMax[idx] > 0 then
                    local curCount = dl.countItems(ic, target, item)
                    mntToMove = filteredMax[idx] - curCount
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
                    dl.printFmt('e', "Requested # "..filteredMax[idx].." reached")
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
