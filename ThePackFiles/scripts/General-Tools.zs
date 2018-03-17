// Tools

recipes.remove(<minecraft:stone_axe>);
recipes.remove(<minecraft:stone_hoe>);
recipes.remove(<minecraft:stone_pickaxe>);
recipes.remove(<minecraft:stone_shovel>);
recipes.remove(<minecraft:stone_sword>);

recipes.remove(<minecraft:golden_axe>);
recipes.remove(<minecraft:golden_hoe>);
recipes.remove(<minecraft:golden_pickaxe>);
recipes.remove(<minecraft:golden_shovel>);
recipes.remove(<minecraft:golden_sword>);

recipes.remove(<minecraft:diamond_axe>);
recipes.remove(<minecraft:diamond_hoe>);
recipes.remove(<minecraft:diamond_pickaxe>);
recipes.remove(<minecraft:diamond_shovel>);
recipes.remove(<minecraft:diamond_sword>);
val mStick = <tconstruct:tough_tool_rod>.withTag({"Material":"meteorite"});
val nutriCan = <forestry:refractory:1>.withTag({"Fluid":{"FluidName":"nutrient_distillation", Amount:1000}});
val D = <ore:gemDiamond>;

mods.forestry.Carpenter.addRecipe(<minecraft:diamond_pickaxe>, [[D, D, D], [null, mStick, null], [null, mStick, null]], 400, <liquid:for.honey> * 3000, nutriCan);
mods.forestry.Carpenter.addRecipe(<minecraft:diamond_axe>, [[D, D, null], [D, mStick, null], [null, mStick, null]], 400, <liquid:for.honey> * 3000, nutriCan);
mods.forestry.Carpenter.addRecipe(<minecraft:diamond_hoe>, [[D, D, null], [null, mStick, null], [null, mStick, null]], 400, <liquid:for.honey> * 3000, nutriCan);
mods.forestry.Carpenter.addRecipe(<minecraft:diamond_shovel>, [[null, D, null], [null, mStick, null], [null, mStick, null]], 400, <liquid:for.honey> * 3000, nutriCan);
mods.forestry.Carpenter.addRecipe(<minecraft:diamond_sword>, [[null, D, null], [null, D, null], [null, mStick, null]], 400, <liquid:for.honey> * 3000, nutriCan);
mods.forestry.Carpenter.addRecipe(<minecraft:diamond_helmet>, [[D, D, D], [D, <minecraft:chainmail_helmet>, D], [null, null, null]], 400, <liquid:for.honey> * 3000, nutriCan);
mods.forestry.Carpenter.addRecipe(<minecraft:diamond_chestplate>, [[D, null, D], [D, <minecraft:chainmail_chestplate>, D], [D, D, D]], 400, <liquid:for.honey> * 3000, nutriCan);
mods.forestry.Carpenter.addRecipe(<minecraft:diamond_leggings>, [[D, D, D], [D, <minecraft:chainmail_leggings>, D], [D, null, D]], 400, <liquid:for.honey> * 3000, nutriCan);
mods.forestry.Carpenter.addRecipe(<minecraft:diamond_boots>, [[D, null, D], [D, <minecraft:chainmail_boots>, D], [null, null, null]], 400, <liquid:for.honey> * 3000, nutriCan);

recipes.remove(<minecraft:wooden_axe>);
recipes.remove(<minecraft:wooden_hoe>);
recipes.remove(<minecraft:wooden_pickaxe>);
recipes.remove(<minecraft:wooden_shovel>);
recipes.remove(<minecraft:wooden_sword>);

recipes.remove(<minecraft:iron_axe>);
recipes.remove(<minecraft:iron_hoe>);
recipes.remove(<minecraft:iron_pickaxe>);
recipes.remove(<minecraft:iron_shovel>);
recipes.remove(<minecraft:iron_sword>);

recipes.remove(<minecraft:flint>);

// Armor

recipes.remove(<minecraft:diamond_helmet>);
recipes.remove(<minecraft:diamond_chestplate>);
recipes.remove(<minecraft:diamond_leggings>);
recipes.remove(<minecraft:diamond_boots>);

recipes.remove(<minecraft:golden_helmet>);
recipes.remove(<minecraft:golden_chestplate>);
recipes.remove(<minecraft:golden_leggings>);
recipes.remove(<minecraft:golden_boots>);

recipes.remove(<minecraft:iron_helmet>);
recipes.remove(<minecraft:iron_chestplate>);
recipes.remove(<minecraft:iron_leggings>);
recipes.remove(<minecraft:iron_boots>);
