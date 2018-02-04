// Fixing Uranium Vein
mods.immersiveengineering.Excavator.removeMineral("Uranium");

// Adding Zinc to some vein
mods.immersiveengineering.Excavator.getMineral("Cassiterite").addOre("oreZinc", 0.2);

// Adding Prometheum to Quarzite
mods.immersiveengineering.Excavator.getMineral("Quartzite").addOre("orePrometheum", 0.2);
mods.immersiveengineering.Excavator.getMineral("Quartzite").addOre("netherrack", 1);

// Adding TAIGA general vein
mods.immersiveengineering.Excavator.addMineral("Exposite", 10, 15, ["stoneBasalt", "oreInferium", "oreOsram", "oreEezo"], [20, 10, 20, 20], [0, 1], false);
mods.immersiveengineering.Excavator.addMineral("Basalt", 10, 15, ["stoneBasalt", "oreInferium", "oreDuranite", "oreSaltpeter"], [40, 5, 20, 20], [0, 1], false);

// Adding planet specific veins
