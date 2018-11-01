// mixing dusts
recipes.addShapeless(<taiga:terrax_dust>*2, [<taiga:karmesine_dust>, <taiga:ovium_dust>, <taiga:jauxum_dust>]);
recipes.addShapeless(<taiga:triberium_dust>, [<taiga:tiberium_dust>, <taiga:tiberium_dust>, <taiga:tiberium_dust>, <taiga:tiberium_dust>, <taiga:tiberium_dust>, <taiga:dilithium_crystal>, <taiga:dilithium_crystal>]);
recipes.addShapeless(<taiga:fractum_dust>*2, [<taiga:triberium_dust>, <taiga:triberium_dust>, <taiga:triberium_dust>, <ore:dustObsidian>, <ore:dustObsidian>, <ore:dustObsidian>, <taiga:abyssum_dust>]);
recipes.addShapeless(<taiga:proxii_dust>*3, [<taiga:prometheum_dust>, <taiga:prometheum_dust>, <taiga:prometheum_dust>, <taiga:palladium_dust>, <taiga:palladium_dust>, <taiga:palladium_dust>, <taiga:eezo_dust>]);
recipes.addShapeless(<taiga:imperomite_dust>*2, [<taiga:duranite_dust>, <taiga:duranite_dust>, <taiga:duranite_dust>, <taiga:prometheum_dust>, <taiga:abyssum_dust>]);
recipes.addShapeless(<taiga:niob_dust>*3, [<taiga:palladium_dust>, <taiga:palladium_dust>, <taiga:palladium_dust>, <taiga:duranite_dust>, <taiga:osram_dust>]);
recipes.addShapeless(<taiga:seismum_dust>*4, [<ore:dustObsidian>, <ore:dustObsidian>, <ore:dustObsidian>, <ore:dustObsidian>, <taiga:triberium_dust>, <taiga:triberium_dust>, <taiga:eezo_dust>]);
recipes.addShapeless(<taiga:obsidiorite_dust>, [<taiga:meteorite_dust>, <ore:dustObsidian>]);

// Smashing meteorite cobble to dust
recipes.addShapeless(<taiga:meteorite_dust>, [<taiga:meteoritecobble_block>, <immersiveengineering:tool>]);

// Smashing alloy ingots to dusts
recipes.addShapeless(<taiga:terrax_dust>, [<taiga:terrax_ingot>, <immersiveengineering:tool>, <minecraft:flint>]);
recipes.addShapeless(<taiga:triberium_dust>, [<taiga:triberium_ingot>, <immersiveengineering:tool>, <minecraft:flint>]);
recipes.addShapeless(<taiga:fractum_dust>, [<taiga:fractum_ingot>, <immersiveengineering:tool>, <minecraft:flint>]);
recipes.addShapeless(<taiga:proxii_dust>, [<taiga:proxii_ingot>, <immersiveengineering:tool>, <minecraft:flint>]);
recipes.addShapeless(<taiga:imperomite_dust>, [<taiga:imperomite_ingot>, <immersiveengineering:tool>, <minecraft:flint>]);
recipes.addShapeless(<taiga:niob_dust>, [<taiga:niob_ingot>, <immersiveengineering:tool>, <minecraft:flint>]);
recipes.addShapeless(<taiga:seismum_dust>, [<taiga:seismum_ingot>, <immersiveengineering:tool>, <minecraft:flint>]);
recipes.addShapeless(<taiga:obsidiorite_dust>, [<taiga:obsidiorite_ingot>, <immersiveengineering:tool>, <minecraft:flint>]);

// Fixing eezo mess
recipes.addShaped(<taiga:eezo_ingot>, [[<taiga:eezo_nugget>, <taiga:eezo_nugget>, <taiga:eezo_nugget>], [<taiga:eezo_nugget>, <taiga:eezo_nugget>, <taiga:eezo_nugget>], [<taiga:eezo_nugget>, <taiga:eezo_nugget>, <taiga:eezo_nugget>]]);
recipes.removeShapeless(<taiga:eezo_ingot> * 9, [<taiga:eezo_ingot>]);
recipes.removeShaped(<taiga:eezo_ingot>, [[<taiga:eezo_ingot>, <taiga:eezo_ingot>, <taiga:eezo_ingot>], [<taiga:eezo_ingot>, <taiga:eezo_ingot>, <taiga:eezo_ingot>], [<taiga:eezo_ingot>, <taiga:eezo_ingot>, <taiga:eezo_ingot>]]);

// Adding missing nugget -> ingot receipes
recipes.addShapeless(<immersiveengineering:metal:27> * 9, [<ore:ingotElectrum>]);
recipes.addShapeless(<taiga:eezo_nugget> * 9, [<ore:ingotEezo>]);
recipes.addShapeless(<taiga:basalt_nugget> * 9, [<ore:ingotBasalt>]);

// Adding furnace smelting
furnace.addRecipe(<taiga:tiberium_ingot>, <taiga:tiberium_dust>);
furnace.addRecipe(<taiga:aurorium_ingot>, <taiga:aurorium_dust>);
furnace.addRecipe(<taiga:prometheum_ingot>, <taiga:prometheum_dust>);
furnace.addRecipe(<taiga:duranite_ingot>, <taiga:duranite_dust>);
furnace.addRecipe(<taiga:valyrium_ingot>, <taiga:valyrium_dust>);
furnace.addRecipe(<taiga:vibranium_ingot>, <taiga:vibranium_dust>);
furnace.addRecipe(<taiga:karmesine_ingot>, <taiga:karmesine_dust>);
furnace.addRecipe(<taiga:ovium_ingot>, <taiga:ovium_dust>);
furnace.addRecipe(<taiga:jauxum_ingot>, <taiga:jauxum_dust>);
furnace.addRecipe(<taiga:terrax_ingot>, <taiga:terrax_dust>);
furnace.addRecipe(<taiga:palladium_ingot>, <taiga:palladium_dust>);
furnace.addRecipe(<taiga:uru_ingot>, <taiga:uru_dust>);
furnace.addRecipe(<taiga:osram_ingot>, <taiga:osram_dust>);
furnace.addRecipe(<taiga:abyssum_ingot>, <taiga:abyssum_dust>);
furnace.addRecipe(<taiga:eezo_ingot>, <taiga:eezo_dust>);
furnace.addRecipe(<taiga:triberium_ingot>, <taiga:triberium_dust>);
furnace.addRecipe(<taiga:fractum_ingot>, <taiga:fractum_dust>);
furnace.addRecipe(<taiga:violium_ingot>, <taiga:violium_dust>);
furnace.addRecipe(<taiga:proxii_ingot>, <taiga:proxii_dust>);
furnace.addRecipe(<taiga:tritonite_ingot>, <taiga:tritonite_dust>);
furnace.addRecipe(<taiga:ignitz_ingot>, <taiga:ignitz_dust>);
furnace.addRecipe(<taiga:imperomite_ingot>, <taiga:imperomite_dust>);
furnace.addRecipe(<taiga:solarium_ingot>, <taiga:solarium_dust>);
furnace.addRecipe(<taiga:nihilite_ingot>, <taiga:nihilite_dust>);
furnace.addRecipe(<taiga:adamant_ingot>, <taiga:adamant_dust>);
furnace.addRecipe(<taiga:dyonite_ingot>, <taiga:dyonite_dust>);
furnace.addRecipe(<taiga:nucleum_ingot>, <taiga:nucleum_dust>);
furnace.addRecipe(<taiga:lumix_ingot>, <taiga:lumix_dust>);
furnace.addRecipe(<taiga:seismum_ingot>, <taiga:seismum_dust>);
furnace.addRecipe(<taiga:astrium_ingot>, <taiga:astrium_dust>);
furnace.addRecipe(<taiga:niob_ingot>, <taiga:niob_dust>);
furnace.addRecipe(<taiga:yrdeen_ingot>, <taiga:yrdeen_dust>);
furnace.addRecipe(<taiga:iox_ingot>, <taiga:iox_dust>);
furnace.addRecipe(<taiga:meteorite_ingot>, <taiga:meteorite_dust>);
furnace.addRecipe(<taiga:basalt_ingot>, <taiga:basalt_dust>);
furnace.addRecipe(<taiga:obsidiorite_ingot>, <taiga:obsidiorite_dust>);
furnace.addRecipe(<taiga:dilithium_ingot>, <taiga:dilithium_dust>);

// Adding Tiberium recipe - in electric arc furnace
// Adding Dilithium block casting
mods.tconstruct.Casting.addBasinRecipe(<taiga:dilithium_block>, <liquid:dilithium_fluid> * 1296, null, false, 400);

// Fixing Tiberium Crystal handling
mods.tconstruct.Smeltery.removeMelting(<taiga:tiberium_crystal>);
mods.tconstruct.Smeltery.addMelting(<liquid:tiberium_fluid> * 36, <taiga:tiberium_crystal>, 100);
