val theDust = <draconicevolution:draconium_dust>;
val theIngot = <draconicevolution:draconium_ingot>;
val theBlock = <draconicevolution:draconium_block>;
val theBlockCH = <draconicevolution:draconium_block:1>;
val craftingCore = <draconicevolution:fusion_crafting_core>;
val coreBasic = <draconicevolution:draconic_core>;
val coreWyvern = <draconicevolution:wyvern_core>;
val coreAwaken = <draconicevolution:awakened_core>;
val coreChaos = <draconicevolution:chaotic_core>;
val ped0 = <draconicevolution:crafting_pedestal>;
val ped1 = <draconicevolution:crafting_pedestal:1>;
val ped2 = <draconicevolution:crafting_pedestal:2>;
val ped3 = <draconicevolution:crafting_pedestal:3>;

val iobsidian = <draconicevolution:infused_obsidian>;
val partGen = <draconicevolution:particle_generator>;

val skelSkul = <enderio:itemFrankenSkull:5>;
val soulVial = <enderio:itemSoulVessel>;
val uraniumCapsule = <forestry:refractory:1>.withTag({"Fluid":{"FluidName":"uranium", Amount:1000}});
val ghastTear = <minecraft:ghast_tear>;
val theEgg = <minecraft:dragon_egg>;
val theStar = <minecraft:nether_star>;

val enCrystal = <draconicevolution:energy_crystal>;
val wyvEC = <draconicevolution:wyvern_energy_core>;

val enWyvCrystal = <draconicevolution:energy_crystal:1>;
val avaEC = <draconicevolution:draconic_energy_core>;

val dragonHeart = <draconicevolution:dragon_heart>;

// Basic Ingredients

furnace.remove(theIngot);
recipes.remove(theIngot*9);
recipes.remove(theBlock);
recipes.remove(partGen);
mods.immersiveengineering.ArcFurnace.removeRecipe(theIngot);
mods.actuallyadditions.AtomicReconstructor.addRecipe(theBlock, theBlockCH, 200000);
mods.actuallyadditions.Empowerer.addRecipe(iobsidian, theIngot, uraniumCapsule, ghastTear, <forestry:craftingMaterial:1>, <minecraft:prismarine:2>, 100000, 100);
mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:blockMisc:8>, partGen, uraniumCapsule, theBlockCH, uraniumCapsule, theBlockCH, 200000, 1200);
mods.forestry.Carpenter.addRecipe(theBlock, [[theIngot, iobsidian, theIngot], [iobsidian, <mysticalagriculture:charm_rainbow>, iobsidian], [theIngot, iobsidian, theIngot]], 400, <liquid:uranium> * 4000, <actuallyadditions:itemMisc:18>);

// Cores
recipes.remove(coreWyvern); // Moved to infusion Crafter

recipes.remove(coreBasic);
mods.actuallyadditions.Empowerer.addRecipe(theBlock, coreBasic, skelSkul, <actuallyadditions:blockPhantomEnergyface>, skelSkul, soulVial, 500000, 200);

// Components
recipes.remove(craftingCore);
recipes.remove(ped0);
mods.actuallyadditions.Empowerer.addRecipe(ped0, craftingCore, theEgg, theStar, theEgg, theStar, 750000, 1200);
mods.forestry.Carpenter.addRecipe(ped0, [[theIngot, theStar, theIngot], [iobsidian, <mysticalagriculture:intermedium_furnace>, iobsidian], [skelSkul, uraniumCapsule, skelSkul]], 400, <liquid:xpjuice> * 4000, <railcraft:frame>);

// Utilities
recipes.remove(<draconicevolution:dislocator>);
recipes.remove(<draconicevolution:dislocator_receptacle>);
recipes.remove(<draconicevolution:grinder>);

recipes.remove(<draconicevolution:draconium_chest>);
mods.forestry.Carpenter.addRecipe(<draconicevolution:draconium_chest>, [[theDust, theDust, theDust], [iobsidian, <actuallyadditions:blockGiantChestLarge>, iobsidian], [iobsidian, <mysticalagriculture:prudentium_furnace>, iobsidian]], 20, <liquid:lava> * 5000, <minecraft:emerald_block>);
mods.forestry.Carpenter.addRecipe(<draconicevolution:grinder>, [[<ore:blockViolium>, <draconicevolution:draconic_staff_of_power>, <ore:blockViolium>], [iobsidian, coreChaos, iobsidian], [<ore:blockAstrium>, <mysticalagriculture:ultimate_furnace>, <ore:blockAstrium>]], 20, <liquid:nucleum_fluid> * 8000, <actuallyadditions:blockMisc:8>);

//Power
recipes.remove(<draconicevolution:energy_storage_core>);
recipes.remove(<draconicevolution:energy_crystal:1>);

recipes.addShaped(<draconicevolution:energy_storage_core>, [[partGen, coreBasic, partGen], [coreBasic, wyvEC, coreBasic], [partGen, coreBasic, partGen]]);
recipes.addShaped(enWyvCrystal*4, [[enCrystal, wyvEC, enCrystal], [wyvEC, coreWyvern, wyvEC], [enCrystal, wyvEC, enCrystal]]);

recipes.addShaped(<draconicevolution:energy_crystal:2>*4, [[enWyvCrystal, avaEC, enWyvCrystal], [avaEC, dragonHeart, avaEC], [enWyvCrystal, avaEC, enWyvCrystal]]);

//Wyvern Tools and Armor
recipes.remove(<draconicevolution:wyvern_helm>);
recipes.remove(<draconicevolution:wyvern_chest>);
recipes.remove(<draconicevolution:wyvern_legs>);
recipes.remove(<draconicevolution:wyvern_boots>);
recipes.remove(<draconicevolution:wyvern_bow>);
recipes.remove(<draconicevolution:wyvern_sword>);
recipes.remove(<draconicevolution:wyvern_axe>);
recipes.remove(<draconicevolution:wyvern_pick>);
recipes.remove(<draconicevolution:wyvern_shovel>);

//Glowgas recipes
mods.tconstruct.Smeltery.removeMelting(<minecraft:glowstone>);
mods.tconstruct.Smeltery.removeMelting(<minecraft:glowstone_dust>);
mods.immersiveengineering.Refinery.addRecipe(<liquid:glowstone> * 1, <liquid:uranium> * 8, <liquid:gold> * 16, 250);