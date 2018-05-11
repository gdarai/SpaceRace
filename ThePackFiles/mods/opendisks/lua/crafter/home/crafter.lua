local dl = require("daraiLib")
local sz = require("serialization")
local sd = require("sides")
local ic = dl.getInventoryController()
local ev = require("event")
local io = require("io")

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
                type="string",
                text="Representation of the receipt, 9 chars [n0-8]"
            },
            output = {
                    type="item",
                    text="Expected output"
            },
            max = {
                type="int",
                text="# of outputs wanted"
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

dl.printFmt('T', "Crafter Program"))
dl.printFmt('t', "Configuration"))

local config = dl.config("crafter.config", texts, default, false)

if ic[2] == nil then
    dl.printFmt('e', "This program is for ROBOTS only. Sorry."))
    return 1
end

if ic[1] == nil then
    dl.printFmt('e', "No Inventory Controller is Available. Program cannot run without inventory controller card."))
    return 1
end

local rowL = ic[2].inventorySize() / 4
if rowL < 3 then
    dl.printFmt('e', "The robot needs internal invenory."))
    return 1
end

local controlStructure = {
    receipt = 1,
    cycle = 1,
    rowL = rowL,
    receiptL = #config["recipes"]
}

ic[3] = dl.getComponent("crafting")
if ic[3] == nil then
    dl.printFmt('e', "The robot needs a crafting upgrade."))
    return 1
end

if dl.input("Run program or Terminate", "rt", false) == "r" then

    local useWeights = config["useWeights"][1] == 'Y'
    local receipt = {}
    -- Crafter cycle
    emptyCraftingGrid(controlStructure)
    while true do
        receipt = config["recipes"][controlStructure["receipt"]]
        dl.printFmt('n', "Crafting " .. receipt["output"]["label"] .. " #" .. controlStructure["cycle"]))
        dl.printFmt('n', "CTRL+C to terminate"))
        local id, _ = ev.pull(1,"interrupted")
        if id == "interrupted" then
            print("soft interrupt, closing")
            break
        else
            oneCrafterRun(useWeights, receipt, controlStructure)
        end
    end    
end

dl.printFmt('t', "Thank you for using crafter program."))
