// Still missing
// [SERVER_STARTED][SERVER]<davincisvessels:balloon>, Air Balloon
// [SERVER_STARTED][SERVER]<davincisvessels:engine>, Steam Engine
// [SERVER_STARTED][SERVER]<davincisvessels:gauge>, Measurement Gauges

// Introducing Cloth/Wool
// Introducing Davinci parts

val Wood = <ore:logWood>;

val Sticks = <ore:stickTreatedWood>;
	Sticks.add(<forestry:oakStick>);

val Planks = <ore:plankTreatedWood>;
val String = <minecraft:string>;
val Hemp = <immersiveengineering:material:4>;
val Cotton = <harvestcraft:cottonitem>;

val Cloth = <harvestcraft:wovencottonitem>;
val Fabric = <immersiveengineering:material:5>;
val Coil = <immersiveengineering:wirecoil:3>;

val Wool = <minecraft:wool>;
val AnyWool = <ore:wool>;

val Parts = <forestry:impregnatedCasing>;
val shipEngine = <davincisvessels:engine>;

val scaffAlu = <immersiveengineering:metalDecoration1:5>;
val gearBoxIron = <immersiveengineering:material:8>;
val plateCopper = <ore:plateCopper>;

mods.forestry.Carpenter.addRecipe(<immersiveengineering:treatedWood> * 2, 
  [[null, null, null],
  [<ore:logWood>, <ore:logWood>, <ore:logWood>], 
  [null, null, null]], 20, <liquid:seed.oil> * 100);
  
recipes.remove(Coil);
recipes.addShaped(Coil, [[String, Hemp, String],[Hemp, <ore:stickWood>, Hemp],[String, Hemp, String]]);
mods.forestry.Carpenter.addRecipe(Coil * 2, [[String, Hemp, String],[Hemp, <ore:stickWood>, Hemp],[String, Hemp, String]], 20, <liquid:canolaoil> * 25);
mods.forestry.Carpenter.addRecipe(Coil * 2, [[String, Hemp, String],[Hemp, <ore:stickWood>, Hemp],[String, Hemp, String]], 20, <liquid:seed.oil> * 25);

recipes.remove(Cloth);
recipes.addShaped(Cloth, [[String, Cotton, String],[Cotton, Cotton, Cotton],[String, Cotton, String]]);
mods.forestry.Carpenter.addRecipe(Cloth * 2, [[String, Cotton, String],[Cotton, Cotton, Cotton],[String, Cotton, String]], 20, <liquid:canolaoil> * 25);
mods.forestry.Carpenter.addRecipe(Cloth * 2, [[String, Cotton, String],[Cotton, Cotton, Cotton],[String, Cotton, String]], 20, <liquid:seed.oil> * 25);

recipes.remove(Fabric);
recipes.addShaped(Fabric, [[null, Hemp, null],[Hemp, Cloth, Hemp],[null, Hemp, null]]);
mods.forestry.Carpenter.addRecipe(Fabric * 2, [[null, Hemp, null],[Hemp, Cloth, Hemp],[null, Hemp, null]], 20, <liquid:canolaoil> * 25);
mods.forestry.Carpenter.addRecipe(Fabric * 2, [[null, Hemp, null],[Hemp, Cloth, Hemp],[null, Hemp, null]], 20, <liquid:seed.oil> * 25);

recipes.remove(Wool);
recipes.addShaped(Wool, [[null, Coil, null], [Cloth, Cloth, Cloth], [null, Fabric, null]]);
mods.forestry.Carpenter.addRecipe(Wool * 2, [[null, Coil, null], [Cloth, Cloth, Cloth], [null, Fabric, null]], 20, <liquid:canolaoil> * 25);
mods.forestry.Carpenter.addRecipe(Wool * 2, [[null, Coil, null], [Cloth, Cloth, Cloth], [null, Fabric, null]], 20, <liquid:seed.oil> * 25);

recipes.remove(<davincisvessels:marker>);
recipes.remove(<davincisvessels:floater>);
recipes.remove(<davincisvessels:buffer>);
recipes.remove(<davincisvessels:stickyBuffer>);
recipes.remove(<davincisvessels:seat>);
recipes.remove(<davincisvessels:securedBed>);
recipes.remove(<davincisvessels:crate_wood>);
recipes.remove(<davincisvessels:anchorPoint>);

mods.forestry.Carpenter.addRecipe(Parts, 
  [[Planks, Planks, Planks],
  [Coil, Coil, Coil], 
  [Sticks, Sticks, Sticks]], 20, <liquid:canolaoil> * 100);

mods.forestry.Carpenter.addRecipe(Parts, 
  [[Planks, Planks, Planks],
  [Coil, Coil, Coil], 
  [Sticks, Sticks, Sticks]], 20, <liquid:seed.oil> * 100);

mods.forestry.Carpenter.addRecipe(<davincisvessels:marker>, 
  [[Coil, Sticks, Coil],
  [Sticks, Parts, Sticks], 
  [Planks, Parts, Planks]], 20, <liquid:canolaoil> * 100);

mods.forestry.Carpenter.addRecipe(<davincisvessels:floater>, 
  [[Planks, Coil, Planks],
  [Sticks, Parts, Sticks], 
  [Fabric, Coil, Fabric]], 20, <liquid:canolaoil> * 100);

mods.forestry.Carpenter.addRecipe(<davincisvessels:buffer>, 
  [[null, null, null],
  [Planks, Planks, Planks], 
  [Parts, Coil, Parts]], 20, <liquid:canolaoil> * 100);

mods.forestry.Carpenter.addRecipe(<davincisvessels:stickyBuffer>, 
  [[Coil, Sticks, Coil],
  [Sticks, <davincisvessels:buffer>, Sticks], 
  [Coil, Sticks, Coil]], 20, <liquid:canolaoil> * 100);

mods.forestry.Carpenter.addRecipe(<davincisvessels:seat>, 
  [[null, null, Cloth],
  [Wool, Fabric, Coil], 
  [Sticks, Planks, Planks]], 20, <liquid:canolaoil> * 100);
  
mods.forestry.Carpenter.addRecipe(<davincisvessels:securedBed>, 
  [[null, null, null],
  [Cloth, Cloth, Fabric],
  [Sticks, Planks, Sticks]], 20, <liquid:canolaoil> * 100);
  
mods.forestry.Carpenter.addRecipe(<davincisvessels:crate_wood>, 
  [[Coil, Sticks, Coil],
  [Sticks, null, Sticks], 
  [Planks, Parts, Planks]], 20, <liquid:canolaoil> * 100);
  
mods.forestry.Carpenter.addRecipe(<davincisvessels:anchorPoint>, 
  [[Coil, Coil, Coil],
  [null, Parts, null], 
  [Sticks, Parts, Sticks]], 20, <liquid:canolaoil> * 100);

// Seed oil variants
mods.forestry.Carpenter.addRecipe(<davincisvessels:marker>, 
  [[Coil, Sticks, Coil],
  [Sticks, Parts, Sticks], 
  [Planks, Parts, Planks]], 20, <liquid:seed.oil> * 100);

mods.forestry.Carpenter.addRecipe(<davincisvessels:floater>, 
  [[Planks, Coil, Planks],
  [Sticks, Parts, Sticks], 
  [Fabric, Coil, Fabric]], 20, <liquid:seed.oil> * 100);

mods.forestry.Carpenter.addRecipe(<davincisvessels:buffer>, 
  [[null, null, null],
  [Planks, Planks, Planks], 
  [Parts, Coil, Parts]], 20, <liquid:seed.oil> * 100);

mods.forestry.Carpenter.addRecipe(<davincisvessels:stickyBuffer>, 
  [[Coil, Sticks, Coil],
  [Sticks, <davincisvessels:buffer>, Sticks], 
  [Coil, Sticks, Coil]], 20, <liquid:seed.oil> * 100);

mods.forestry.Carpenter.addRecipe(<davincisvessels:seat>, 
  [[null, null, Cloth],
  [Wool, Fabric, Coil], 
  [Sticks, Planks, Planks]], 20, <liquid:seed.oil> * 100);
  
mods.forestry.Carpenter.addRecipe(<davincisvessels:securedBed>, 
  [[null, null, null],
  [Cloth, Cloth, Fabric],
  [Sticks, Planks, Sticks]], 20, <liquid:seed.oil> * 100);
  
mods.forestry.Carpenter.addRecipe(<davincisvessels:crate_wood>, 
  [[Coil, Sticks, Coil],
  [Sticks, null, Sticks], 
  [Planks, Parts, Planks]], 20, <liquid:seed.oil> * 100);
  
mods.forestry.Carpenter.addRecipe(<davincisvessels:anchorPoint>, 
  [[Coil, Coil, Coil],
  [null, Parts, null], 
  [Sticks, Parts, Sticks]], 20, <liquid:seed.oil> * 100);
  
// Davinci's airships and engines
recipes.remove(shipEngine);
recipes.remove(<davincisvessels:balloon:*>);

mods.forestry.Carpenter.addRecipe(shipEngine, 
  [[plateCopper, <tconstruct:seared_tank:1>, plateCopper],
   [plateCopper, <tconstruct:seared_tank:1>, plateCopper], 
   [scaffAlu, gearBoxIron, scaffAlu]], 20, <liquid:canolaoil> * 100);

mods.forestry.Carpenter.addRecipe(shipEngine, 
  [[plateCopper, <tconstruct:seared_tank:1>, plateCopper],
   [plateCopper, <tconstruct:seared_tank:1>, plateCopper], 
   [scaffAlu, gearBoxIron, scaffAlu]], 20, <liquid:seed.oil> * 100);

mods.forestry.Fermenter.addRecipe(<liquid:steam>, <minecraft:coal>, <liquid:water>, 500, 0.2);   
mods.forestry.Fermenter.addRecipe(<liquid:steam>, <minecraft:coal:1>, <liquid:water>, 500, 0.2);   

mods.immersiveengineering.BottlingMachine.addRecipe(<davincisvessels:balloon:0>, <powersuits:powerArmorComponent:9>, <liquid:steam> * 2000);

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
