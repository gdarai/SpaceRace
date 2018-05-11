local dl = require("daraiLib")
local sz = require("serialization")
local sd = require("sides")
local ic = dl.getInventoryController()
local ev = require("event")

local default = {
    filters={
    {
        item={name="minecraft:stone", damage=0, label="stone"},
        target={"north"}
    }},
    defaultOut={"down"},
    ignoredSides={{"up"}}
}

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
}

function oneFilterRun(inputSides, filteredItems, filteredSides, defaultOut)    
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
                dl.printFmt('i', "Moving " .. item["label"] .. " - " .. target))
                -- Find free slot
                local freeSlot = dl.getFreeSlot(ic, target, nil)
                local check = dl.moveItems(ic, side["side"], slot, target, freeSlot, item["maxSize"])
                -- Print error
                if not check then
                    dl.printFmt('e', "Failed to move to " .. target))
                end
            end
        end
    end
end



dl.printFmt('T', "Filter Program"))
dl.printFmt('t', "Configuration"))
local config = dl.config("filter.config", texts, default, false)

if ic[1] == nil then
    dl.printFmt('e', "No Inventory Controller is Available. Program cannot run without transposer or inventory controller card."))
    return 1
end

if dl.input("Run program or Terminate", "rt", false) == "r" then
    -- Construct list of inputs and outputs
    local filteredItems = dl.addElements({}, config["filters"], {"item"})
    local filteredSides = dl.addElements({}, config["filters"], {"target", 1})
    
    local ignoredSides = {config["defaultOut"][1]}        
    ignoredSides = dl.addElements(ignoredSides, config["ignoredSides"], {1})
    ignoredSides = dl.addElements(ignoredSides, filteredSides, nil)
    
    local inputSides = {}    
    for _, side in pairs({"north", "south", "east", "west", "up", "down"}) do
        local ignored = dl.checkForKey(ignoredSides, side)
        local slotCount = dl.getInventorySize(ic, side)
        if (not ignored) and slotCount ~= nil and slotCount>0 then
                inputSides[#inputSides+1] = {side=side, slots=slotCount}
        end
    end

    -- Print inputs on the screen
    dl.printFmt('t', "Input Sides:"))
    for _, side in pairs(inputSides) do
        dl.printFmt('i', side["side"] .. " - " .. side["slots"] .. " slots"))
    end
    
    -- Filter cycle
    while true do
        dl.printFmt('n', "CTRL+C to terminate"))
        local id, _ = ev.pull(1,"interrupted")
        if id == "interrupted" then
            print("soft interrupt, closing")
            break
        else
            oneFilterRun(inputSides, filteredItems, filteredSides, config["defaultOut"][1])
        end
    end    
end

dl.printFmt('t', "Thank you for using filter program."))
