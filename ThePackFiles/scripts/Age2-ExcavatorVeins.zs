// Fixing Uranium Vein
mods.immersiveengineering.Excavator.removeMineral("Uranium");

// Adding Zinc to some vein
mods.immersiveengineering.Excavator.getMineral("Cassiterite").addOre("oreZinc", 0.2);

// Adding Prometheum to Quarzite
mods.immersiveengineering.Excavator.getMineral("Quartzite").addOre("orePrometheum", 0.2);
mods.immersiveengineering.Excavator.getMineral("Quartzite").addOre("netherrack", 1);

// Adding TAIGA general vein
mods.immersiveengineering.Excavator.addMineral("Exposite", 10, 15, ["stoneBasalt", "oreInferium", "oreOsram", "oreEezo"], [20, 10, 20, 20], [0, 1, 20, 22, 23, 24, 25, 30, 31, 33], false);
mods.immersiveengineering.Excavator.addMineral("Basalt", 10, 15, ["stoneBasalt", "oreInferium", "oreDuranite", "oreSaltpeter"], [40, 5, 20, 20], [0, 1, 20, 22, 23, 24, 25, 30, 31, 33], false);

//MineralString, MineralWeight, FailChance, OreStringArray, OreChanceArray, DimensionIDArray, isWhitelistOrBlacklist //true=blacklist; false=whitelist
// Adding planet specific veins
mods.immersiveengineering.Excavator.addMineral("Meteor", 5, 10, ["oreKarmesine", "stoneBasalt", "blockMeteoritecobble", "oreDilithium"], [20, 40, 40, 10], [20, 22, 23, 24, 25, 30, 31, 33], false);
mods.immersiveengineering.Excavator.addMineral("Tiberium", 5, 10, ["oreApatite", "oreTiberium", "oreOvium", "oreDuranite", "oreIridium"], [40, 20, 10, 20, 5], [23, 24, 25, 30, 31, 33], false);
mods.immersiveengineering.Excavator.addMineral("Crystal", 5, 10, ["netherrack", "oreQuartz", "oreQuartzBlack", "oreNetherProsperity"], [40, 20, 10, 10], [24, 25, 30, 31, 33], false);
mods.immersiveengineering.Excavator.addMineral("Abyssal", 5, 10, ["endstone", "oreAbyssum", "orePalladium", "oreEndProsperity", "oreDraconium"], [40, 10, 10, 10, 5], [25, 30, 31, 33], false);
mods.immersiveengineering.Excavator.addMineral("Vibranium", 5, 10, ["stone", "oreValyrium", "oreVibranium", "oreJauxum", "oreIridium"], [40, 10, 5, 10, 15], [31, 33], false);
