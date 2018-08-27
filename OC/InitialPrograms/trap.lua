local dl = require("daraiLib")
local sd = require("sides")
local ic = dl.getInventoryController()

local store = "up"
local trap  = "down"
local trapBaitSlot = 19
local trapStoreSize = 18
local maxBaitStack = 64

local baits = {
    { name="harvestcraft:grainbaititem", damage="0", type="Grain" },
    { name="harvestcraft:veggiebaititem", damage="0", type="Veggie" },
    { name="harvestcraft:fruitbaititem", damage="0", type="Fruit" },
    { name="harvestcraft:fishtrapbaititem", damage="0", type="Fish" }
}

local idx = 0
while true do
    idx = idx + 1
    if idx > #ic[3] then idx = 1 end
    dl.printFmt("T", "Next Trap ("..idx.."/"..#ic[3]..")")
    local icx = dl.getProxy(ic, idx)

    dl.printFmt("t", "Dumping items")
    local count = 0
    for slot=1,trapStoreSize do
        local item = dl.stackInSlot(icx, trap, slot)
        if item ~= nil then
            local freeSlot, _ = dl.itemSlotNotFull(icx, store, item)
            if freeSlot == -1 then freeSlot = dl.getFreeSlot(icx, store, nil) end
            if freeSlot ~= -1 then
                count = count + dl.moveItems(icx, trap, slot, store, freeSlot, item.size)
                dl.printFmt("i", "Dumping '".. item.name .."'")
            end
        end
    end
    dl.printFmt("r", count .. " items dumped")
    os.sleep(5)
    
    dl.printFmt("t", "Resuply Bait")
    local bait = dl.stackInSlot(icx, trap, trapBaitSlot)
    local baitRefill = maxBaitStack
    local baitSlot = -1
    if bait == nil then -- No bait left in the Trap
        dl.printFmt("e", "No Bait In Trap")
        for newBaitItem in baits do
            if bait == nil then
                slot = dl.itemSlotIndex(icx, store, newBaitItem)
                if slot ~= -1 then
                    bait = dl.stackInSlot(icx, store, slot)
                    baitSlot = slot
                    dl.printFmt("i", "Found some '".. newBaitItem.type .."' bait")
                end
            end
        end
    else -- We have some bait in the Trap
        baitRefill = maxBaitStack - bait.size
        baitSlot = dl.itemSlotIndex(icx, store, bait)
    end
    if baitSlot == -1 then -- We have source for refilling
        dl.printFmt("e", "No Bait In Store")
    else -- There is no bait also in the storage
        print( baitSlot, trapBaitSlot )
        local moved = dl.moveItems(icx, store, baitSlot, trap, trapBaitSlot, baitRefill)
        if (moved == true or moved == false) then moved = 0 end
        dl.printFmt("r", moved .. "/" .. baitRefill .. " bait refilled")
        dl.moveItems(icx, trap, 19, store, 4, 64)
        dl.moveItems(icx, store, 1, trap, 19, 64)
    end
    os.sleep(5)
    return
end
