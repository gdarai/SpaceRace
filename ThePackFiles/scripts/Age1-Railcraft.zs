val ingotBrass = <ore:ingotBrass>;

val rodIron = <ore:stickIron>;
val rodAlu = <immersiveengineering:material:3>;

val plateAlu = <ore:plateAluminum>;
val plateCopper = <ore:plateCopper>;
val plateTin = <ore:plateTin>;
val plateIron = <ore:plateIron>;

val scaffAlu = <immersiveengineering:metalDecoration1:5>;

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
val fabric = <immersiveengineering:material:5>;

val cart = <minecraft:minecart>;
val cartChest = <minecraft:chest_minecart>;

// Piston and Rolling machines

recipes.remove(piston);

recipes.addShaped(piston, [[trPlank, trPlank, trPlank], [cobble, rodIron, cobble], [cobble, <minecraft:redstone>, cobble]]);
recipes.addShaped(piston, [[trPlank, trPlank, trPlank], [cobble, rodAlu, cobble], [cobble, <minecraft:redstone>, cobble]]);

recipes.remove(<railcraft:equipment:*>);

recipes.addShaped(<railcraft:equipment>, [[gearBoxIron, piston, gearBoxIron], [piston, casingWood, piston], [gearBoxIron, piston, gearBoxIron]]);

// Gear Bushing and Brass

recipes.remove(ingotBrass);
recipes.remove(<railcraft:gear:3>);

recipes.addShaped(<railcraft:gear:3>, [[null, ingotBrass, null], [ingotBrass, trStick, ingotBrass], [null, ingotBrass, null]]);

// Davinci's airships and engines
recipes.remove(shipEngine);
recipes.remove(<davincisvessels:balloon:*>);

mods.forestry.Carpenter.addRecipe(shipEngine, 
  [[plateCopper, <tconstruct:seared_tank:1>, plateCopper],
   [plateCopper, <tconstruct:seared_tank:1>, plateCopper], 
   [scaffAlu, gearBoxIron, scaffAlu]], 20, <liquid:canolaoil> * 100);

mods.forestry.Fermenter.addRecipe(<liquid:steam>, <minecraft:coal>, <liquid:water>, 500, 0.2);   
mods.forestry.Fermenter.addRecipe(<liquid:steam>, <minecraft:coal:1>, <liquid:water>, 500, 0.2);   
mods.forestry.Carpenter.addRecipe(<davincisvessels:balloon:0>, 
  [[fabric, fabric, fabric],
   [fabric, null, fabric], 
   [fabric, fabric, fabric]], 20, <liquid:steam> * 2000);

recipes.addShapeless(<davincisvessels:balloon:0>, [<davincisvessels:balloon:*>, <minecraft:dye:15>]);
recipes.addShapeless(<davincisvessels:balloon:1>, [<davincisvessels:balloon:*>, <minecraft:dye:14>]);
recipes.addShapeless(<davincisvessels:balloon:2>, [<davincisvessels:balloon:*>, <minecraft:dye:13>]);
recipes.addShapeless(<davincisvessels:balloon:3>, [<davincisvessels:balloon:*>, <minecraft:dye:12>]);
recipes.addShapeless(<davincisvessels:balloon:4>, [<davincisvessels:balloon:*>, <minecraft:dye:11>]);
recipes.addShapeless(<davincisvessels:balloon:5>, [<davincisvessels:balloon:*>, <minecraft:dye:10>]);
recipes.addShapeless(<davincisvessels:balloon:6>, [<davincisvessels:balloon:*>, <minecraft:dye:9>]);
recipes.addShapeless(<davincisvessels:balloon:7>, [<davincisvessels:balloon:*>, <minecraft:dye:8>]);
recipes.addShapeless(<davincisvessels:balloon:8>, [<davincisvessels:balloon:*>, <minecraft:dye:7>]);
recipes.addShapeless(<davincisvessels:balloon:9>, [<davincisvessels:balloon:*>, <minecraft:dye:6>]);
recipes.addShapeless(<davincisvessels:balloon:10>, [<davincisvessels:balloon:*>, <minecraft:dye:5>]);
recipes.addShapeless(<davincisvessels:balloon:11>, [<davincisvessels:balloon:*>, <minecraft:dye:4>]);
recipes.addShapeless(<davincisvessels:balloon:12>, [<davincisvessels:balloon:*>, <minecraft:dye:3>]);
recipes.addShapeless(<davincisvessels:balloon:13>, [<davincisvessels:balloon:*>, <minecraft:dye:2>]);
recipes.addShapeless(<davincisvessels:balloon:14>, [<davincisvessels:balloon:*>, <minecraft:dye:1>]);
recipes.addShapeless(<davincisvessels:balloon:15>, [<davincisvessels:balloon:*>, <minecraft:dye:0>]);

// Bore Heads
recipes.remove(<railcraft:borehead_bronze>);
recipes.remove(<railcraft:borehead_iron>);
recipes.remove(<railcraft:borehead_steel>);
recipes.remove(<railcraft:borehead_diamond>);

mods.forestry.Carpenter.addRecipe(<railcraft:borehead_bronze>, [[gearIron, gearIron, gearIron], [gearIron, <ore:blockBronze>, gearIron], [gearIron, gearIron, gearIron]], 120, <liquid:duranite_fluid> * 2000, null);
mods.forestry.Carpenter.addRecipe(<railcraft:borehead_iron>, [[gearIron, gearIron, gearIron], [gearIron, <ore:blockIron>, gearIron], [gearIron, gearIron, gearIron]], 120, <liquid:duranite_fluid> * 2000, null);
mods.forestry.Carpenter.addRecipe(<railcraft:borehead_steel>, [[gearSteel, gearSteel, gearSteel], [gearSteel, <ore:blockSteel>, gearSteel], [gearSteel, gearSteel, gearSteel]], 120, <liquid:duranite_fluid> * 2000, null);
mods.forestry.Carpenter.addRecipe(<railcraft:borehead_diamond>, [[gearSteel, gearSteel, gearSteel], [gearSteel, <ore:blockDiamond>, gearSteel], [gearSteel, gearSteel, gearSteel]], 120, <liquid:duranite_fluid> * 2000, null);

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


// Dusts
