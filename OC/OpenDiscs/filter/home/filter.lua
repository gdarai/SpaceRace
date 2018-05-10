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
    print(dl.strFmt("t", "Setting configurator"))
    local i1 = ""
    while i1 ~= "x" do
        i1 = dl.input("Filters, Ouput(Def), Ignored, Sides, Detailed or Exit", "foisdx", false)
        if i1 == "d" then -- Do thorrough edit
            print(dl.strFmt("t", "Full Configuration Editor"))
            setting = dl.editTableKey(setting, texts, default, {})
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
                print(dl.strFmt('i', "Moving " .. item["label"] .. " - " .. target))
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
                        print(dl.strFmt('e', "Failed to move to " .. target))
                    end
                else
                    print(dl.strFmt('e', "Requested # "..filteredMax[idx].." reached"))
                end
            end
        end
    end
end



print(dl.strFmt('T', "Filter Program"))
print(dl.strFmt('t', "Configuration"))
local config = dl.config(configFileName, texts, default, true)

if ic[1] == nil then
    print(dl.strFmt('e', "No Inventory Controller is Available. Program cannot run without transposer or inventory controller card."))
    return 1
end

if ic[2] ~=nil and ic[2].inventorySize() < 16 then
    print(dl.strFmt('e', "The robot needs internal invenory."))
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
        local ignored = dl.checkForKey(ignoredSides, side)
        local slotCount = dl.getInventorySize(ic, side)
        if (not ignored) and slotCount ~= nil and slotCount>0 then
                inputSides[#inputSides+1] = {side=side, slots=slotCount}
        end
    end

    -- Print inputs on the screen
    print(dl.strFmt('t', "Input Sides:"))
    for _, side in pairs(inputSides) do
        print(dl.strFmt('i', side["side"] .. " - " .. side["slots"] .. " slots"))
    end
    
    -- Filter cycle
    while true do
        print(dl.strFmt('n', "CTRL+C to terminate"))
        local id, _ = ev.pull(1,"interrupted")
        if id == "interrupted" then
            print("soft interrupt, closing")
            break
        else
            oneFilterRun(inputSides, filteredItems, filteredSides, filteredMax, config["defaultOut"][1])
        end
    end    
end

print(dl.strFmt('t', "Thank you for using filter program."))
