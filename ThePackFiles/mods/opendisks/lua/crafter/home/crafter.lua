local dl = require("daraiLib")
local sz = require("serialization")
local sd = require("sides")
local ic = dl.getInventoryController()
local ev = require("event")
local io = require("io")
local mm = require("math")

local configFileName = "crafter.config"

local default = {
    recipes={
        {
            input={
                {name="minecraft:log", damage=-1, label="wood log"}
            },
            receipt={"1nnnnnnnn"},
            output={name="minecraft:planks", damage=-1, label="wood plank"},
            max={32},
            weight={2}
        },
        {
            input={
                {name="minecraft:planks", damage=-1, label="wood plank"}
            },
            receipt={"1nn1nnnnn"},
            output={name="minecraft:stick", damage=0, label="stick"},
            max={32},
            weight={1}
        },
    },
    useWeights={"n"}
}

local texts = {
    type="table",
    text="Crafter robot setting",
    recipes={
        type="list",
        text="List of recipes",
        object = {
            type="table",
            text="One crafting receipt",
            input = {
                type="list",
                text="List of needed items",
                object = {
                    type="item",
                    text="One needed resource"
                }
            },
            receipt = {
                type="str",
                text="Representation of the receipt, 9 chars [n1-9]"
            },
            output = {
                    type="item",
                    text="Expected output"
            },
            max = {
                type="int",
                text="max # of outputs wanted"
            },
            weight = {
                type="int",
                text="How many attempts before next"
            }
        }
    },
    useWeights={
        type="bool",
        text="if no, max of #1 receipt will be done first,then #2 etc."
    }
}

function configureTool(setting)
    dl.printFmt("t", "Setting configurator")
    local i1 = ""
    while i1 ~= "x" do
        i1 = dl.input("Recipes, UseWeights, Detailed or Exit", "rudx", false)
        if i1 == "r" then -- Edit Recipes
            local i2 = ""
            while i2 ~= "b" do
                dl.printFmt("t", "Recipes List")
                for idx, f in pairs(setting["recipes"]) do
                    dl.printFmt("i", idx .. ") " .. f["output"]["label"] .. " x " .. f["weight"][1] .. "(max ".. f["max"][1] ..")")
                end
                i2 = dl.input("Edit, Load, Clear, Delete or Back", "elcdb", false)
                if i2 == "e" then      -- Edit
                    local idx = dl.inputIndex("Receipt to edit", 1, #setting["recipes"], true)
                    if idx ~= nil then
                        local f = setting["receipts"][idx]
                        dl.printFmt("t", "Editting receipt " .. idx .. " " .. f["output"]["label"])
                        dl.printFmt("i", "Some core parameters, like used resources, cannot be editted, use Detailed editor in such case.")
                        dl.printFmt("t", "Resources:")
                        for idx2, it in pairs(f["input"]) do dl.printFmt("i", idx2 .. ") " .. it["label"]) end
                        local r = f["receipt"]
                        dl.printFmt("i", texts["recipes"]["object"]["receipt"]["text"])
                        dl.printFmt("i", "Receipt: " .. string.sub(r, 1, 3) .. " " .. string.sub(r, 4, 6) .. " " .. string.sub(r, 7, 9))
                        dl.printFmt("i", "Out: " .. f["output"]["label"])
                        if dl.input("Change the receipt", "Yn", false) == "Y" then
                            f["receipt"][1] = dl.stringInput()
                        end
                        dl.printFmt("i", texts["recipes"]["object"]["weight"]["text"])
                        local newWeight = dl.inputIndex("New Weight (now ".. f["weight"][1] ..")", 0, 32900, true)
                        if newWeight ~= nil then f["weight"][1] = newWeight end
                        dl.printFmt("i", texts["recipes"]["object"]["max"]["text"])
                        local newMax = dl.inputIndex("New Max (now ".. f["max"][1] ..")", 0, 32900, true)
                        if newMax ~= nil then f["max"][1] = newMax end
                    end
                elseif i2 == "l" then -- Load
                    dl.printFmt("t", "Receipt loader")
                    dl.printFmt("i", "This utility will add recipes you configured in adjescent inventory")
                    dl.printFmt("i", "You shape every receipt in 4x3 space, 3 rows, 4 slots each")
                    dl.printFmt("i", "the [2-4] columns (3x3 area) is the receipt")
                    dl.enterToContinue()
                    dl.printFmt("i", "the first column represents the other parameters, for max and weight only the number of items matters")
                    dl.printFmt("i", "Slot 1: Output")
                    dl.printFmt("i", "Slot 2: Max value (empty for max=0)")
                    dl.printFmt("i", "Slot 3: Weight value (empty for weight = 1)")
                    if dl.input("Ready to Load", "Yn", false) == "Y" then
                        dl.printFmt("i", "I need the # of slots on one line of the inventory, and I need to know where the inventory is (allowed is up, down or front of the robot)")
                        local maxi = dl.inputIndex("Slots on one row", 4, 20, false)
                        local side = dl.listInput("Robot Side", dl.getAvailableSides(), false, false)
                        local invSize = dl.getInventorySize(ic, side)
                        if invSize ~= nil then
                           local maxRLines = mm.floor(invSize / (maxi*3))
                           local maxROnLine = mm.floor(maxi / 4)
                           for j=1,maxRLines do
                           for i=1,maxROnLine do
                               dl.printFmt("t", "Receipt " .. j .. "x" .. i)
                               local startI = (maxi * 3 * (j - 1)) + (4 * (i-1)) + 1 -- TopLeft Index of this receipt
                               local idxs = {startI+1, startI+2, startI+3, startI+1+maxi, startI+2+maxi, startI+3+maxi, startI+1+maxi+maxi, startI+2+maxi+maxi, startI+3+maxi+maxi}
                               local slOutput = dl.stackInSlot(ic, side, startI)
                               local slMax = dl.stackInSlot(ic, side, startI + maxi)
                               local slWeight = dl.stackInSlot(ic, side, startI + maxi + maxi)
                               if slOutput ~= nil then
                                   local r = {}
                                   setting["recipes"][#setting["recipes"]+1] = r
                                   r["max"] = {0}
                                   r["weight"] = {1}
                                   r["receipt"] = {"nnnnnnnnn"}
                                   dl.printFmt("i", "Adding receipt for " .. slOutput["label"])
                                   r["output"] = {name=slOutput["name"], label=slOutput["label"], damage=slOutput["damage"]}
                                   if slMax ~= nil then r["max"][1] = slMax["size"] end
                                   if slWeight ~= nil then r["weight"][1] = slWeight["size"] end
                                   dl.printFmt("i", "Receipt max: " .. r["max"][1])
                                   dl.printFmt("i", "Receipt weight: " .. r["weight"][1])
                                   r["input"] = {}
                                   local receipt = ""
                                   for _, slotIdx in pairs(idxs) do
                                       local slIt = dl.stackInSlot(ic, side, slotIdx)
                                       if slIt == nil then
                                           receipt = receipt .. "n"
                                       else
                                           local itIndex = dl.itemIndex(r["input"], slIt)
                                           if itIndex>0 then
                                               receipt = receipt .. itIndex
                                           else
                                               dl.printFmt("i", "Adding input item " .. slIt["label"])
                                               r["input"][#r["input"]+1] = {name=slIt["name"], label=slIt["label"], damage=slIt["damage"]}
                                               receipt = receipt .. #r["input"]
                                           end
                                       end
                                   end
                                   r["receipt"][1] = receipt
                                   dl.printFmt("i", "Receipt: " .. string.sub(receipt, 1, 3) .. " " .. string.sub(receipt, 4, 6) .. " " .. string.sub(receipt, 7, 9))
                                   dl.enterToContinue()
                               else
                                   dl.printFmt("e", "There must be the output item in slot 1x1, skipping receipt")
                                   dl.enterToContinue()
                               end
                           end end
                        else
                          dl.printFmt("e", "I detect no inventory on this side")
                          dl.enterToContinue()
                        end
                    end
                elseif i2 == "c" then -- Clear
                    dl.printFmt("e", "Deleting all recipes")
                    setting["recipes"] = {}
                    dl.enterToContinue()
                elseif i2 == "d" then -- Delete One
                    local idx = dl.inputIndex("Receipt to delete", 1, #setting["recipes"], true)
                    if idx ~= nil then
                        dl.printFmt("e", "Removing receipt " .. idx)
                        table.remove(setting["recipes"], idx)
                        dl.enterToContinue()
                    end
                end
            end
        elseif i1 == "u" then -- Edit Use Weights
            dl.printFmt("t", "Use Weights Switch")
            dl.printFmt("i", texts["useWeights"]["text"])
            setting["useWeights"][1] = daraiLib.input("Pick value (current ".. setting["useWeights"][1] ..")", "Yn", false)
        elseif i1 == "d" then -- Do thorrough edit
            dl.printFmt("t", "Full Configuration Editor")
            setting = dl.editTableKey(setting, texts, default, {})
        end
    end
    dl.saveConfigFile(configFileName, setting)
    return setting
end

function emptyCraftingGrid(ctlStr)
    for cell = 1,4 do
        ic[2].select(cell)
        ic[2].dropDown()
        ic[2].select(cell+ctlStr["rowL"])
        ic[2].dropDown()
        ic[2].select(cell+ctlStr["rowL"]+ctlStr["rowL"])
        ic[2].dropDown()
    end
end

function pickAnItem(theChar, itemList, slot)
    -- the null case
    if theChar == 'n' then return true end
    local itIdx = tonumber(theChar)
    -- if nonexisting item
    if itIdx < 1 or itIdx > #itemList then return false end
    local item = itemList[itIdx]
    local idx = dl.itemSlotIndex(ic, "down", item)
    -- if item not found
    if idx < 0 then return false end
    -- else
    ic[2].select(slot)
    return dl.moveItems(ic, "down", idx, nil, nil, 1)
end

function assembleReceipt(receiptStr, receiptCmps, rowL)
    for cell = 1,3 do
        if not pickAnItem(string.sub(receiptStr, cell, cell), receiptCmps, cell) then return false end
        if not pickAnItem(string.sub(receiptStr, cell+3, cell+3), receiptCmps, cell+rowL) then return false end
        if not pickAnItem(string.sub(receiptStr, cell+6, cell+6), receiptCmps, cell+rowL+rowL) then return false end
    end
    return true
end

function oneCrafterRun(useWeights, receipt, ctlStr)
    -- Precrafting count check
    local count = dl.countItems(ic, "down", receipt["output"])
    local success0 = count < receipt["max"][1]
    -- Get individual resources
    local success1 = false
    if success0 then success1 = assembleReceipt(receipt["receipt"][1], receipt["input"], ctlStr["rowL"]) end
    -- Craft
    local success2 = false
    if success1 then success2 = ic[3].craft() end
    -- Empty the crafting grid
    emptyCraftingGrid(ctlStr)
    -- Mutate the controll structure
    -- if max count, max cycle + weights, or some fail, go to next receipt
    ctlStr["cycle"] = ctlStr["cycle"] + 1
    if (count >= receipt["max"][1]) or ((ctlStr["cycle"] > receipt["weight"][1]) and useWeights) or not (success1 and success2) then
        ctlStr["cycle"] = 1
        ctlStr["receipt"] = ctlStr["receipt"] + 1
        if ctlStr["receipt"] > ctlStr["receiptL"] then ctlStr["receipt"] = 1 end
    end
end

dl.printFmt('T', "Crafter Program")
dl.printFmt('t', "Configuration")
local config = dl.config(configFileName, texts, default, true)

if ic[2] == nil then
    dl.printFmt('e', "This program is for ROBOTS only. Sorry.")
    return 1
end

if ic[1] == nil then
    dl.printFmt('e', "No Inventory Controller is Available. Program cannot run without inventory controller card.")
    return 1
end

if ic[2].inventorySize() < 16 then
    dl.printFmt('e', "The robot needs internal invenory.")
    return 1
end

if dl.input("Change the configuration", "Yn", false) == "Y" then
    config = configureTool(config)
end

local controlStructure = {
    receipt = 1,
    cycle = 1,
    rowL = 4,
    receiptL = #config["recipes"]
}

ic[3] = dl.getComponent("crafting")
if ic[3] == nil then
    dl.printFmt('e', "The robot needs a crafting upgrade.")
    return 1
end

if dl.input("Run program or Terminate", "rt", false) == "r" then

    local useWeights = config["useWeights"][1] == 'Y'
    local receipt = {}
    -- Crafter cycle
    emptyCraftingGrid(controlStructure)
    while true do
        receipt = config["recipes"][controlStructure["receipt"]]
        dl.printFmt('n', "Crafting " .. receipt["output"]["label"] .. " #" .. controlStructure["cycle"])
        dl.printFmt('n', "CTRL+C to terminate")
        local id, _ = ev.pull(1,"interrupted")
        if id == "interrupted" then
            print("soft interrupt, closing")
            break
        else
            oneCrafterRun(useWeights, receipt, controlStructure)
        end
    end
end

dl.printFmt('t', "Thank you for using crafter program.")
