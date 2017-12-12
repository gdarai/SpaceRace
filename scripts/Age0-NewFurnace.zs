val Furnace = <minecraft:furnace>;
val BrickB = <minecraft:brick_block>;
val BrickD = <tconstruct:dried_clay:1>;

recipes.addShapeless(<minecraft:clay>, [<ore:dirt>, <actuallyadditions:itemWaterBowl>.giveBack(<minecraft:bowl>), <ore:treeLeaves>, <ore:treeLeaves>]);

mods.tconstruct.Drying.addRecipe(<minecraft:dirt>, <tconstruct:materials:2>, 3600);

recipes.addShapeless(<minecraft:flint_and_steel>, [<ore:ingotAluminum>, <ore:itemFlint>]);

recipes.remove(Furnace);
recipes.addShaped(Furnace, [[null, BrickB, null],[BrickB, null, BrickB],[BrickB, BrickB, BrickB]]);
recipes.addShaped(Furnace, [[null, BrickD, null],[BrickD, null, BrickD],[BrickD, BrickD, BrickD]]);

furnace.addRecipe(<mysticalagriculture:inferium_essence>, <mysticalagriculture:inferium_ore>);
furnace.addRecipe(<mysticalagriculture:prosperity_shard>, <mysticalagriculture:prosperity_ore>);
furnace.addRecipe(<mysticalagriculture:inferium_essence>, <mysticalagriculture:nether_inferium_ore>);
furnace.addRecipe(<mysticalagriculture:prosperity_shard>, <mysticalagriculture:nether_prosperity_ore>);
furnace.addRecipe(<mysticalagriculture:inferium_essence>, <mysticalagriculture:end_inferium_ore>);
furnace.addRecipe(<mysticalagriculture:prosperity_shard>, <mysticalagriculture:end_prosperity_ore>);
