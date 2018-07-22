val flintIngot = <tp:flint_ingot>;
val netherStar = <minecraft:nether_star>;
val ingotDyonite = <taiga:dyonite_block>;
val intermediumApple = <mysticalagriculture:intermedium_apple>;
val bars = <minecraft:iron_bars>;
val obsidian = <minecraft:obsidian>;
val diamondNugget = <ore:nuggetDiamond>;
val propolis = <forestry:propolis>;

// Add mising OreDict
val oreEnder = <ore:oreEnder>;
oreEnder.add(<tp:ender_ore>);

mods.actuallyadditions.Crusher.addRecipe(<tp:ender_ore>, <railcraft:dust:6>*16, <railcraft:dust:6>*8, 50);
mods.immersiveengineering.Crusher.addRecipe(<railcraft:dust:6>*16, <tp:ender_ore>, 5000, <railcraft:dust:6>*8, 0.2);

// Remove Old Recipes
recipes.remove(<tp:flint_boots>);
recipes.remove(<tp:flint_chestplate>);
recipes.remove(<tp:flint_helmet>);
recipes.remove(<tp:flint_leggings>);

recipes.remove(<tp:watering_can_upgrade>);
recipes.remove(<tp:growth_upgrade>);
recipes.remove(<tp:growth_upgrade_two>);
recipes.remove(<tp:med_kit>);
recipes.remove(<tp:flint_block>);

// Adding Back What make Sense
recipes.addShaped(<tp:watering_can_upgrade>, [[flintIngot, netherStar, null], [flintIngot, <tp:watering_can>, flintIngot], [null, flintIngot, null]]);
mods.actuallyadditions.Empowerer.addRecipe(<tp:growth_block>, <tp:growth_upgrade>, ingotDyonite, intermediumApple, ingotDyonite, intermediumApple, 100000, 200, 0.5, 1, 0.5);
mods.immersiveengineering.BottlingMachine.addRecipe(<tp:med_kit>, <forestry:crate>, <liquid:protein> * 200);

// Apples and Hardened blocks used for Creative recipes

// Witherproof Obsidian improved with Crushed Ice and Draconium
recipes.remove(<tp:reinforced_obsidian>);
mods.forestry.Carpenter.addRecipe(<tp:reinforced_obsidian>, [[bars, obsidian, bars], [obsidian, <draconicevolution:draconium_dust>, obsidian], [bars, obsidian, bars]], 60, <liquid:ice> * 500, null);

// Reinforced glass made much more expensive
recipes.remove(<tp:reinforced_glass>);
mods.forestry.Carpenter.addRecipe(<tp:reinforced_glass>, [[obsidian, diamondNugget, obsidian], [diamondNugget, <tp:dirty_glass>, diamondNugget], [obsidian, diamondNugget, obsidian]], 60, <liquid:water> * 1000, propolis);

