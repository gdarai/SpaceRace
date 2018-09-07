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
                {name="minecraft:log", damage=-1, label="wood log"}
            },
            receipt={"1nnnnnnnn"},
            output={name="minecraft:planks", damage=-1, label="wood plank"},
            size={4}
        },
        {
            name={"stick"},
            group={1},
            craftType={1},
            input={
                {name="minecraft:planks", damage=-1, label="wood plank"}
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
        local item = dl.stackInSlot(ic, config["readSide"][1], 1)
        if item == nil then
            dl.printFmt('e', "There is no item in the Receipt inventory " .. config["readSide"][1] .. " slot 1.")
        else
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
            local index = string.find(allowedCommands, string.char(new, i))
            if index == nil then
                dl.printFmt('e', "The " .. i .. " char " .. string.char(new, i) .. " is not allowed.")
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
        local item = dl.stackInSlot(ic, config["readSide"][1], 1)
        local name = "machine"
        local shortcut = "m"
        local place = ""
        if item == nil then
            dl.printFmt('i', "There is no item in the Receipt inventory " .. config["readSide"][1] .. " slot 1, using default.")
            item = default["types"][1]["item"]
        end
        dl.printFmt("i", "Tool Name:")
        local newName = dl.stringInput()
        dl.printFmt("i", "Tool Shortcut:")
        local newShortcut = dl.stringInput()
        dl.printFmt("i", "Tool Place:")
        local newPlace = dl.stringInput()
        if newName ~= "" then name = newName end
        if newShortcut ~= "" then shortcut = newShortcut end
        local test = true
        for i=1,string.len(newPlace) do
            local index = string.find(allowedCommands, string.char(newPlace, i))
            if index == nil then test = false end
        end
        if test then place = newPlace end
        dl.printFmt('i', "New tool: " .. name .. "[" .. shortcut .. "] = " .. place)
        dl.printFmt('i', "  -" .. item["label"])
        if dl.input("Proceed?", "Yn", false) == "Y" then
            local new = {name=name, item=dl.copyItem(item,false), shortcut=shortcut, position=place}
            config["types"][#config["types"]+1] = new
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
    for _,r in pairs(setting["recipes"]) do info[r["group"][1]]["count"] = info[r["group"][1]]["count"] + 1 end
    return info
end

function printGroupsInfo(idx, i, printType)
    dl.printFmt(printType, idx .. ") " .. i["name"] .. " [" .. i["count"] .. "]")
end

function printReceiptInfo(rec, grpIdx, types)
    if rec["group"][1] ~= grpIdx and grpIdx > 0 then return end
    dl.printFmt("i", rec["name"][1] .. " [" .. types[rec["craftType"][1]]["name"][1] .. "]")
end

function getToolsInfo(setting)
    local info = {}
    for _,t in pairs(setting["types"]) do info[#info+1] = { name=t[1], count=0, default=(#info == 0)} end
    for _,r in pairs(setting["recipes"]) do info[r["craftType"][1]]["count"] = info[r["craftType"][1]]["count"] + 1 end
    return info
end

function printToolsInfo(idx, i, printType)
    if i["default"] then dl.printFmt(printType, idx .. ") " .. i["name"] .. " [" .. i["count"] .. "] crafting")
    else dl.printFmt(printType, idx .. ") " .. i["name"] .. " [" .. i["count"] .. "] machine")
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
        local idx = dl.inputIndex("Pick group", 1, #info, false)
        for _,r in pairs(config["recipes"]) do printReceiptInfo(r, idx, config["types"]) end
        printGroupsInfo(idx, info[idx], "t")
        local i2 = dl.input("Rename, top, bottom, delete, new, exit", "rtbdnx", false)
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
            i2 = dl.input("Rename, item, place, exit", "ripx", false)
        else -- have no recipes
            i2 = dl.input("Rename, item, place, delete, exit", "ripdx", false)
        end
        config = modifyTool(ic, config, idx, i2)
        dl.saveConfigFile(configFileName, config)
    elseif i1 == "f" then -- Run full config editor
        config = dl.editTableKey(config, texts, default, {})
        if dl.input("Save the new configuration", "Yn", false) == "Y" then
            dl.saveConfigFile(configFileName, config)
        end
    elseif i1 == "x" then -- Exit
        dl.printFmt('t', "Thank you for using assembler program.")
    end
end
