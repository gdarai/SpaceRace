val ingotBrass = <ore:ingotBrass>;

val rodIron = <ore:stickIron>;
val rodAlu = <immersiveengineering:material:3>;

val plateAlu = <ore:plateAluminum>;
val plateTin = <ore:plateTin>;
val plateIron = <ore:plateIron>;

val gearBronze = <ore:gearBronze>;
val gearSteel = <ore:gearSteel>;
val gearIron = <ore:gearIron>;

val piston = <minecraft:piston>;
val trPlank = <ore:plankTreatedWood>;
val trStick = <ore:stickTreatedWood>;
val cobble = <ore:cobblestone>;
val gearBoxIron = <immersiveengineering:material:8>;
val gearBoxSteel = <immersiveengineering:material:9>;
val casingWood = <actuallyadditions:blockMisc:4>;

val IECopperCoil = <immersiveengineering:metalDecoration0>;
val IEElectrumCoil = <immersiveengineering:metalDecoration0:1>;
val IESteelCoil = <immersiveengineering:metalDecoration0:2>;
val IERedstone = <immersiveengineering:metalDecoration0:3>;
val IELight = <immersiveengineering:metalDecoration0:4>;
val IEHeavy = <immersiveengineering:metalDecoration0:5>;
val IEGenerator = <immersiveengineering:metalDecoration0:6>;
val IERadiator = <immersiveengineering:metalDecoration0:7>;

val shipEngine = <davincisvessels:engine>;

val cart = <minecraft:minecart>;
val cartChest = <minecraft:chest_minecart>;
val goldCarrot = <minecraft:golden_carrot>;

val canDuranite = <forestry:can:1>.withTag({"Fluid":{"FluidName":"duranite_fluid", Amount:1000}});

// Piston and Rolling machines

recipes.remove(piston);

recipes.addShaped(piston, [[trPlank, trPlank, trPlank], [cobble, rodIron, cobble], [cobble, <minecraft:redstone>, cobble]]);
recipes.addShaped(piston, [[trPlank, trPlank, trPlank], [cobble, rodAlu, cobble], [cobble, <minecraft:redstone>, cobble]]);

recipes.remove(<railcraft:equipment:*>);
recipes.addShaped(<railcraft:equipment>, [[piston, casingWood, piston], [gearBoxIron, null, gearBoxIron], [<ore:gearStone>, casingWood, <ore:gearStone>]]);

// Gear Bushing and Brass

recipes.remove(ingotBrass);
recipes.remove(<railcraft:gear:3>);

recipes.addShaped(<railcraft:gear:3>, [[null, ingotBrass, null], [ingotBrass, trStick, ingotBrass], [null, ingotBrass, null]]);

// Gun Powder
recipes.addShapeless(<minecraft:gunpowder>*2, [<railcraft:dust:2>, <railcraft:dust:1>, <minecraft:redstone>, <minecraft:redstone>]);
recipes.addShapeless(<minecraft:gunpowder>, [<railcraft:dust:2>, <railcraft:dust:1>, <forestry:ash>]);
recipes.addShapeless(<minecraft:gunpowder>*2, [<railcraft:dust:2>, <railcraft:dust:2>, <railcraft:dust:1>, <railcraft:dust:1>, <minecraft:gravel>]);
recipes.addShapeless(<minecraft:gunpowder>*2, [<railcraft:dust:2>, <railcraft:dust:2>, <railcraft:dust:1>, <ore:dustCoal>]);

// Bore Heads
recipes.remove(<railcraft:borehead_bronze>);
recipes.remove(<railcraft:borehead_iron>);
recipes.remove(<railcraft:borehead_steel>);
recipes.remove(<railcraft:borehead_diamond>);

mods.forestry.Carpenter.addRecipe(<railcraft:borehead_bronze>, [[gearIron, gearIron, gearIron], [gearIron, <ore:blockBronze>, gearIron], [gearIron, gearIron, gearIron]], 120, <liquid:seed.oil> * 1000, canDuranite);
mods.forestry.Carpenter.addRecipe(<railcraft:borehead_iron>, [[gearIron, gearIron, gearIron], [gearIron, <ore:blockIron>, gearIron], [gearIron, gearIron, gearIron]], 120, <liquid:seed.oil> * 1000, canDuranite);
mods.forestry.Carpenter.addRecipe(<railcraft:borehead_steel>, [[gearSteel, gearSteel, gearSteel], [gearSteel, <ore:blockSteel>, gearSteel], [gearSteel, gearSteel, gearSteel]], 120, <liquid:seed.oil> * 1000, canDuranite);
mods.forestry.Carpenter.addRecipe(<railcraft:borehead_diamond>, [[gearSteel, gearSteel, gearSteel], [gearSteel, <ore:blockDiamond>, gearSteel], [gearSteel, gearSteel, gearSteel]], 120, <liquid:seed.oil> * 1000, canDuranite);

// Tunel bore and carts
recipes.remove(<railcraft:bore>);
recipes.remove(<railcraft:mow_track_relayer>);
recipes.remove(<railcraft:mow_undercutter>);

recipes.addShaped(<railcraft:bore>, [[IEHeavy, gearBoxSteel, IEHeavy], [shipEngine, IEGenerator, shipEngine], [cartChest, cartChest, cartChest]]);
recipes.addShaped(<railcraft:mow_track_relayer>, [[<ore:dyeYellow>, <minecraft:redstone_lamp>, <ore:dyeYellow>], [gearBoxIron, <ore:blockSteel>, gearBoxIron], [<railcraft:gear>, cart, <railcraft:gear>]]);
recipes.addShaped(<railcraft:mow_undercutter>, [[<ore:dyeOrange>, <minecraft:redstone_lamp>, <ore:dyeOrange>], [gearBoxIron, <ore:blockSteel>, gearBoxIron], [cart, <railcraft:borehead_bronze>,cart]]);

// Posts
recipes.addShapeless(<railcraft:post_metal:0>, [<railcraft:post_metal:*>, <minecraft:dye:15>]);
recipes.addShapeless(<railcraft:post_metal:1>, [<railcraft:post_metal:*>, <minecraft:dye:14>]);
recipes.addShapeless(<railcraft:post_metal:2>, [<railcraft:post_metal:*>, <minecraft:dye:13>]);
recipes.addShapeless(<railcraft:post_metal:3>, [<railcraft:post_metal:*>, <minecraft:dye:12>]);
recipes.addShapeless(<railcraft:post_metal:4>, [<railcraft:post_metal:*>, <minecraft:dye:11>]);
recipes.addShapeless(<railcraft:post_metal:5>, [<railcraft:post_metal:*>, <minecraft:dye:10>]);
recipes.addShapeless(<railcraft:post_metal:6>, [<railcraft:post_metal:*>, <minecraft:dye:9>]);
recipes.addShapeless(<railcraft:post_metal:7>, [<railcraft:post_metal:*>, <minecraft:dye:8>]);
recipes.addShapeless(<railcraft:post_metal:8>, [<railcraft:post_metal:*>, <minecraft:dye:7>]);
recipes.addShapeless(<railcraft:post_metal:9>, [<railcraft:post_metal:*>, <minecraft:dye:6>]);
recipes.addShapeless(<railcraft:post_metal:10>, [<railcraft:post_metal:*>, <minecraft:dye:5>]);
recipes.addShapeless(<railcraft:post_metal:11>, [<railcraft:post_metal:*>, <minecraft:dye:4>]);
recipes.addShapeless(<railcraft:post_metal:12>, [<railcraft:post_metal:*>, <minecraft:dye:3>]);
recipes.addShapeless(<railcraft:post_metal:13>, [<railcraft:post_metal:*>, <minecraft:dye:2>]);
recipes.addShapeless(<railcraft:post_metal:14>, [<railcraft:post_metal:*>, <minecraft:dye:1>]);
recipes.addShapeless(<railcraft:post_metal:15>, [<railcraft:post_metal:*>, <minecraft:dye:0>]);

// Feeder
recipes.addShaped(<railcraft:equipment:2>, [[trPlank, goldCarrot, trPlank], [goldCarrot, <ore:gearBrass>, goldCarrot],[trPlank, goldCarrot, trPlank]]);

// End Dust
mods.tconstruct.Casting.addTableRecipe(<railcraft:dust:6>, <liquid:ender> * 32, <minecraft:sand:1>, true, 100);
mods.immersiveengineering.Crusher.addRecipe(<forestry:ash> * 2, <minecraft:end_stone>, 2000, <railcraft:dust:6>, 0.15);
mods.tconstruct.Smeltery.addMelting(<liquid:ender> * 4, <minecraft:end_stone>, 100);

