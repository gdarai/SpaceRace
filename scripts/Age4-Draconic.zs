val theDust = <draconicevolution:draconium_dust>;
val theIngot = <draconicevolution:draconium_ingot>;
val theBlock = <draconicevolution:draconium_block>;
val craftingCore = <draconicevolution:fusion_crafting_core>;
val coreBasic = <draconicevolution:draconic_core>;
val coreWyvern = <draconicevolution:wyvern_core>;
val coreAwaken = <draconicevolution:awakened_core>;
val coreChaos = <draconicevolution:chaotic_core>;

val dislocator = <draconicevolution:dislocator>;
val iobsidian = <draconicevolution:infused_obsidian>;
// Initial Remove of Recipes
furnace.remove(theIngot);
mods.immersiveengineering.ArcFurnace.removeRecipe(theIngot);

recipes.remove(theBlock);
recipes.remove(craftingCore);

recipes.remove(coreBasic);
recipes.remove(coreWyvern);

recipes.remove(dislocator);

// Utilities

mods.forestry.Carpenter.addRecipe(<draconicevolution:draconium_chest>, [[theDust, theDust, theDust], [iobsidian, <actuallyadditions:blockGiantChestLarge>, iobsidian], [iobsidian, <mysticalagriculture:prudentium_furnace>, iobsidian]], 20, <liquid:lava> * 5000, <minecraft:emerald_block>);
