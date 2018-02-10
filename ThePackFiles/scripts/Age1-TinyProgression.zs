val flintIngot = <tp:flint_ingot>;
val netherStar = <minecraft:nether_star>;
val ingotDyonite = <taiga:dyonite_block>;
val intermediumApple = <mysticalagriculture:intermedium_apple>;

// Add mising OreDict
val oreEnder = <ore:oreEnder>;
oreEnder.add(<tp:ender_ore>);

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
mods.actuallyadditions.Empowerer.addRecipe(<tp:growth_block>, <tp:growth_upgrade>, ingotDyonite, intermediumApple, ingotDyonite, intermediumApple, 100000, 200);
mods.immersiveengineering.BottlingMachine.addRecipe(<tp:med_kit>, <forestry:crate>, <liquid:protein> * 200);

// Apples and Hardened blocks used for Creative recipes