local dl = require("daraiLib")
local sd = require("sides")
local ic = dl.getInventoryController()

local config = {
    resources={
        {"deepCoal", "Coal", "Deep", 0, 128},
        {"deepRed", "Redstone", "Deep", 0, 16},
        {"deepCop", "Copper", "Deep", 30, 120},
        {"deepIron", "Iron", "Deep", 0, 30},
        {"magicInferi", "Magic powder", "Deep", 10, 40},
        {"deepAlu", "Aluminum", "Deep", 30, 50},
        {"prometheum0", "Prometheum", "Deep", 20, 55},
        {"quartz0", "Quartz", "Deep", 20, 55},
        {"coal", "Coal", "Normal", 0, 128},
        {"eezo", "Eezo", "Normal", 15, 40},
        {"tin", "Tin", "Normal", 30, 100},
        {"nickel", "Nickel", "Normal", 30, 50},
        {"lapis", "Lapis", "Normal", 5, 25},
        {"saltpeter", "Saltpeter", "Normal", 50, 80},
        {"redstone", "Redstone", "Normal", 0, 16},
        {"emerald", "Emerald", "Normal", 40, 130},
        {"diamond", "Diamonds", "Normal", 5, 25},
        {"iron", "Iron", "Normal", 10, 55},
        {"alu", "Aluminum", "Normal", 40, 120},
        {"duranite", "Duranite", "Normal", 0, 10},
        {"duranite2", "Duranite", "Normal", 5, 15},
        {"basalt", "Basalt", "Normal", 0, 50},
        {"zinc", "Zinc", "Normal", 30, 40},
        {"copper", "Copper", "Normal", 30, 120},
        {"gold", "Gold", "Normal", 5, 35},
        {"lead", "Lead", "Normal", 15, 40},
        {"osram", "Osram", "Normal", 0, 10},
        {"rutil", "Titanium", "Normal", 30, 60},
        {"iridium", "Iridium", "Normal", 20, 35},
        {"karmesine", "Karmesine", "Normal", 40, 70},
        {"ironS", "Iron", "Small", 10, 55},
        {"goldS", "Gold", "Small", 5, 35},
        {"redstoneS", "Redstone", "Small", 0, 16},
        {"lapisS", "Lapis", "Small", 5, 25},
        {"diamondS", "Diamonds", "Small", 5, 25},
        {"emeraldS", "Emeralds", "Small", 40, 130},
        {"aluS", "Aluminium", "Small", 40, 120},
        {"copperS", "Copper", "Small", 30, 120},
        {"tinS", "Tin", "Small", 30, 100},
        {"zincS", "Zinc", "Small", 30, 40},
        {"leadS", "Lead", "Small", 15, 40},
        {"nickelS", "Nickel", "Small", 30, 50},
        {"eezoS", "Eezo", "Small", 15, 40},
        {"osramS", "Osram", "Small", 0, 10},
        {"basaltS", "Basalt", "Small", 0, 50},
        {"silver", "Silver", "Normal", 20, 55},
        {"silverS", "Silver", "Small", 20, 55},
        {"prometheum", "Prometheum", "Normal", 25, 45},
        {"abyssum", "Abyssum", "Normal", 0, 70},
        {"palladium", "Palladium", "Normal", 60, 150},
        {"magicProsp", "Prosperity", "Normal", 20, 50},
        {"dilithiumS", "Dilithium", "Small", 0, 15},
        {"oviumS", "Ovium", "Small", 10, 50},
        {"draconiumS", "Draconium", "Small", 0, 40},
        {"draconiumE", "Draconium", "Normal", 50, 150},
        {"uruS", "Uru", "Small", 25, 45},
        {"cobaltN", "Cobalt", "Normal", 10, 50},
        {"arditeN", "Ardite", "Normal", 10, 50},
        {"glowstoneN", "Glowstone", "Normal", 10, 100},
        {"quartzN", "Quartz", "Normal", 10, 150},
        {"cobaltNS", "Cobalt", "Small", 10, 50},
        {"arditeNS", "Ardite", "Small", 10, 50},
        {"quartzNS", "Quartz", "Small", 10, 150},
        {"tiberium", "Tiberium", "Normal", 45, 65},
        {"valyrium", "Valyrium", "Normal", 10, 50},
        {"valyriumN", "Valyrium", "Normal", 110, 125},
        {"meteorite", "Meteorite", "Normal", 10, 50},
        {"apatite", "Apatite", "Normal", 10, 50},
        {"dilithium", "Dilithium", "Normal", 10, 50},
        {"osram", "Osram", "Normal", 10, 50},
        {"blackQuartz", "Black Quartz", "Normal", 10, 50},
        {"ovium", "Ovium", "Normal", 10, 50},
        {"soulsand", "Soulsand", "Normal", 50, 70},
        {"uranium", "Uranium", "Normal", 10, 20},
        {"glowstone", "Glowstone", "Normal", 0, 30},
        {"jauxum", "Jauxum", "Normal", 10, 50},
        {"magma", "Magma", "Normal", 10, 50},
        {"vibranium", "Vibranium", "Normal", 10, 50},
        {"uru", "Uru", "Normal", 30, 60},
        {"enderS", "Ender Ore", "Small", 45, 65},
        {"aurorium", "Aurorium", "Normal", 10, 30},
        {"cobaltNN", "Cobalt", "Normal", 45, 65},
        {"arditeNN", "Ardite", "Normal", 45, 65},
        {"quartzNN", "Quartz", "Normal", 45, 65},
        {"resonanceS", "Resonance Ore", "Small", 20, 40},
        {"resonanceN", "Resonance Ore", "Normal", 100, 140},
        {"resonanceE", "Resonance Ore", "Normal", 0, 100},
        {"abyssumE", "Abyssum", "Normal", 0, 100},
        {"palladiumE", "Palladium", "Normal", 0, 100},
        {"magicProspE", "Prosperity", "Normal", 0, 100}
    },
    yields = {
		{"space00s", "ironS", {23,24,30}},
		{"space01s", "goldS", {20,23,24,31}},
		{"space02s", "redstoneS", {20,22,24,30}},
		{"space03s", "lapisS", {20,30}},
		{"space04s", "diamondS", {31}},
		{"space05s", "emeraldS", {20,31}},
		{"space06s", "aluS", {22,24,25,33}},
		{"space07s", "copperS", {22,23,24,25,33}},
		{"space08s", "tinS", {22,23,24,25,33}},
		{"space09s", "zincS", {20,22,24,25,30,31}},
		{"space10s", "leadS", {23,24,31}},
		{"space11s", "nickelS", {20,22,25,30,31}},
		{"space13s", "eezoS", {20,23,24,31}},
		{"space14s", "osramS", {20,22,23}},
		{"space15s", "basaltS", {25,30}},
		{"space16s", "silverS", {20,23,24,31}},
		{"space00", "iron", {20,22,25,31}},
		{"space01", "gold", {22,25,30}},
		{"space02", "redstone", {23,25,31,33}},
		{"space03", "lapis", {23,24,31,33}},
		{"space04", "diamond", {23,24,25,30}},
		{"space05", "emerald", {23,24,30}},
		{"space06", "alu", {20,23,31}},
		{"space07", "copper", {20,31}},
		{"space08", "tin", {20,31}},
		{"space09", "zinc", {23}},
		{"space10", "lead", {22,24,30}},
		{"space11", "nickel", {23,24,33}},
		{"space13", "eezo", {22,30,33}},
		{"space14", "osram", {24,25,30,31,33}},
		{"space15", "basalt", {20,22,23,24,31,33}},
		{"space16", "silver", {22,25,30}},
		{"space17", "karmesine", {20,22,23,24}},
		{"space18", "duranite", {22,23,31}},
		{"space12", "coal", {23,25,30,31}},
		{"space20", "dilithiumS", {22}},
		{"space21", "oviumS", {23,24,25}},
		{"space22", "draconiumS", {23}},
		{"space23", "meteorite", {20,22,23,24,25}},
		{"space24", "apatite", {22,23,31}},
		{"space25", "osram", {20,22,23,24}},
		{"space26", "blackQuartz", {24,25,33}},
		{"space27n", "netherrack", {22,25}},
		{"space27", "tiberium", {22,25}},
		{"space27a", "cobaltNN", {22,25}},
		{"space27b", "arditeNN", {22,25}},
		{"space27c", "quartzNN", {22,25}},
		{"space28", "soulsand", {25,30}},
		{"space29", "uranium", {25,30}},
		{"space30", "glowstone", {24,25}},
		{"space31", "rutil", {22,31}},
		{"space32", "prometheum", {25}},
		{"space40", "ovium", {31}},
		{"space41", "dilithium", {30}},
		{"space42", "jauxum", {30,33}},
		{"space43", "magma", {30}},
		{"space44n", "netherrack", {30}},
		{"space44", "valyrium", {30}},
		{"space45", "vibranium", {31}},
		{"space46", "uru", {33}},
		{"space46x", "uruS", {25}},
		{"space47n", "endstone", {33}},
		{"space47", "aurorium", {33}},
		{"space48", "iridium", {31,23}},
		{"space49", "resonanceS", {22,24,30}},
		{"space50", "enderS", {23,31}},
		{"ast00", "ironA", {21,32}},
		{"ast01", "goldA", {21,32}},
		{"ast02", "redstoneA", {21,32}},
		{"ast03", "lapisA", {21,32}},
		{"ast04", "diamondA", {21}},
		{"ast05", "emeraldA", {32}},
		{"ast06", "aluA", {21,32}},
		{"ast07", "copperA", {21,32}},
		{"ast08", "tinA", {21,32}},
		{"ast09", "zincA", {32}},
		{"ast11", "nickelA", {32}},
		{"ast15", "basaltA", {21}},
		{"ast16", "rutilA", {21,32}},
		{"ast17", "silverA", {21,32}},
		{"ast18", "resonanceA", {21,32}},
		{"ast19", "enderA", {21,32}},
		{"astN01", "cobaltA", {21,32}},
		{"astN02", "arditeA", {21,32}},
		{"astN03", "quartzA", {21,32}},
		{"astN04", "prometheumA", {32}}
    },
    planets={
        {
            name="The Moon",
            place="Orbitting the same Red Giant as the Homeworld",
            item={name="advancedRocketry:moonTurf_dark", damage=0, label="Dark Moon Turf"},
            dimension=20
        },
        {
            name="Lava World",
            place="Nearest planet of your star is a small Hot rock with significant part of surface covered with floating lava.",
            item={name="advancedRocketry:moonTurf_dark", damage=-1, label="Hardened Clay"},
            dimension=22
        },
        {
            name="Alien World",
            place="In the livable zone, further from the star, is a blue-and-blue world with one gigant moon.",
            item={name="advancedRocketry:moonTurf_dark", damage=0, label="Dirt"},
            dimension=23
        },
        {
            name="Crystal Moon",
            place="Orbitting the Alien World, there is small icy ball called the Crystal Moon.",
            item={name="advancedRocketry:moonTurf_dark", damage=0, label="Moon Crystal"},
            dimension=24
        },
        {
            name="Sand Moon",
            place="Further from the star than the Red Giant is the Blue Giant. The Sand Moon is the sole large body orbitting there.",
            item={name="advancedRocketry:moonTurf_dark", damage=0, label="Geode"},
            dimension=25
        },
        {
            name="Distant World",
            place="First planet accessible in the other star system is this desert Hell-Like world.",
            item={name="advancedRocketry:moonTurf_dark", damage=0, label="Obsidian"},
            dimension=30
        },
        {
            name="Ocean World",
            place="This is the most comforting planet of the other star system with a big asteroid belt around it, covered with infinite ocean.",
            item={name="advancedRocketry:moonTurf_dark", damage=0, label="Prismarine Brick"},
            dimension=31
        },
        {
            name="Mushroom World",
            place="Orbiting the sole Gas Giant of the other star system, there is the mushroom world. The hidden globe of natural riches.",
            item={name="advancedRocketry:moonTurf_dark", damage=0, label="Mycelium"},
            dimension=33
        }
    },
    side="",
}

-- #################
-- ##  Code Parts
-- #################
function doChecks(ic, config)
    if ic[2] == nil then
        dl.printFmt('e', "This program is for ROBOTS only. Sorry.")
        return 1
    end
    if ic[1] == nil then
        dl.printFmt('e', "No Inventory Controller or Transposer is Available. Program cannot run without inventory access.")
        return 1
    end
    ic[3] = dl.getComponent("hologram")
    if ic[3] == nil then
        dl.printFmt('e', "This program needs a hologram projector to work properly.")
        return 1
    end
    for (side, idx) in pairs(dl.getAvailableSides()) do if dl.getInventorySize(ic, side) ~= nil then config["side"] = side end end
    if config["side"] == "" then
        dl.printFmt('e', "There is no inventory near the Computer input, place there chest or something.")
        return 1
    end
    return 0
end

function checkPlanetMaterial(ic, config, idx)
    local planet =  config["planets"][idx]
    local haveRes = dl.countItems(ic, config["side"],planet["item"]) > 0
    return haveRes
end

function scannPlanet(ic, config, idx)
    local dim = config["planets"][idx]["dimension"]
    local deposits = {}
    dl.printFmt('t', "Deposit Name/Size (Depths)" )
    for (_,r) in pairs(config["resources"]) do
        deposits[r[1]] = {r[2], r[3], r[4], r[5]}
    end
    for (_,y) in pairs(config["yields"]) do
        local test = false
        for (_,d) in pairs(y[3]) do
            if d==dim then test = true end
        end
        if test == false then deposits[y[2]][1] = "" end
    end
    for (_,r) in pairs(deposits) do
        if r[1] ~= "" then
            dl.printFmt('i', r[1] .. "/" .. r[2] .. " (" .. r[3] .. "-" .. r[4] .. ")")
        end
    end
end

-- #################
-- ##  Printers
-- #################
function printPlanetInfo(ic, config, idx)
    local planet =  config["planets"][idx]
    local haveRes = dl.countItems(ic, config["side"],planet["item"])
    dl.printFmt('t', planet["name"])
    if haveRes then
        dl.printFmt('i', "All material to analyze this planet is available.")
    else
        dl.printFmt('i', "To analyze this planet, supply: " .. planet["item"]["label"] )
    end
end

function printPlanetDetailInfo(planet)
    dl.printFmt('t', planet["name"])
    dl.printFmt('i', planet["place"])
    dl.printFmt('i', "Analyzer needs:" .. planet["item"]["label"] )
end

function scanningAnimation(ic)
end

function finishedAnimation(ic)
end

-- #################
-- ##  MAIN CODE
-- #################
dl.printFmt('T', "Analyzer Program")
dl.printFmt('i', "This program will analyze any planet to which you provide a local sample and show you the spread of available resources.")
if doChecks(ic) == 1 then return 1 end

local i1 = ""
while i1 ~= "x" do
    dl.printFmt("t", "Main Menu")
    i1 = dl.input("List, Scan or Exit", "lsx", false)
    if i1=="l" then -- List planets
        dl.printFmt('i', "List available planets")
        for idx=1,#config["planets"] do
            printPlanetInfo(ic, config, idx)
        end
    else if i1=="s" then -- Scan Planet
        dl.printFmt('i', "Scan particular planet")
        i2 = dl.inputIndex("Pick a planet", 1, #config["planets"], false)
        printPlanetDetailInfo(config["planets"][i2])
        if checkPlanetMaterial(ic, config, i2) then
            scanningAnimation(ic)
            scannPlanet(ic, config, i2)
            finishedAnimation(ic)
        end
    end
end
