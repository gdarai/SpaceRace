/// Initial remove

mods.forestry.Carpenter.removeRecipe(<forestry:hardenedMachine>);
recipes.remove(<forestry:sturdyMachine>);
recipes.remove(<forestry:bottler>);
recipes.remove(<forestry:rainmaker>);

// Variables

val trPlank = <ore:plankTreatedWood>;
val rodSteel = <ore:stickSteel>;

val searedTank = <tconstruct:seared_tank:1>;
val piston = <minecraft:piston>;
val hopper = <minecraft:hopper>;
val casingWood = <actuallyadditions:blockMisc:4>;
val pipe = <immersiveengineering:metalDevice1:6>;
val barrelWood = <immersiveengineering:woodenDevice0:1>;
val barrelIron = <immersiveengineering:metalDevice0:4>;

val LVconn = <immersiveengineering:connector>;
val coil1 = <immersiveengineering:wirecoil>;
val coil2 = <immersiveengineering:wirecoil:1>;
val coil3 = <immersiveengineering:wirecoil:2>;
val ioSi = <enderio:itemMaterial>;

val tubeCopper = <forestry:thermionicTubes>;
val tubeTin = <forestry:thermionicTubes:1>;

val scaffAlu = <immersiveengineering:metalDecoration1:5>;

val gearBronze = <ore:gearBronze>;
val gearSteel = <ore:gearSteel>;
val gearIron = <ore:gearIron>;
val gearTitan = <ore:gearTitanium>;

val gearBoxIron = <immersiveengineering:material:8>;
val gearBoxSteel = <immersiveengineering:material:9>;

val IELightBlock = <immersiveengineering:metalDecoration0:4>;
val IRRope = <immersiveengineering:wirecoil:3>;

val FCi0 = <forestry:chipsets>.withTag({T: 0 as short});
val FCi1 = <forestry:chipsets:1>.withTag({T: 1 as short});
val FCi2 = <forestry:chipsets:2>.withTag({T: 2 as short});
val FCi3 = <forestry:chipsets:3>.withTag({T: 3 as short});

val ocChip1 = <opencomputers:material:8>;

val powerM = <gendustry:PowerModule>;
val honeyPot = <forestry:honeyPot>;

val aaRed = <actuallyadditions:itemCrystal>;
val capacSmall = <powersuits:powerArmorComponent:5>;
// Removing pipette
recipes.remove(<forestry:pipette>);

// Recipes
recipes.remove(<forestry:engine_biogas>);
recipes.remove(<forestry:engine_peat>);
recipes.remove(<forestry:still>);
recipes.remove(<forestry:moistener>);
mods.forestry.Carpenter.removeRecipe(<forestry:portableAlyzer>);

// Engines
recipes.addShaped(<forestry:engine_peat>, [[trPlank, trPlank, trPlank], [rodSteel, null, rodSteel], [tubeCopper, <minecraft:piston>, tubeTin]]);
recipes.addShaped(<forestry:engine_biogas>, [[trPlank, trPlank, trPlank], [rodSteel, null, rodSteel], [FCi0, gearBoxIron, FCi0]]);
recipes.addShaped(<forestry:engine_biogas>, [[trPlank, trPlank, trPlank], [rodSteel, null, rodSteel], [ocChip1, gearBoxIron, ocChip1]]);

// Machines
recipes.addShaped(<forestry:still>, [[searedTank, pipe, searedTank],[pipe, <minecraft:furnace>, pipe],[scaffAlu, powerM, scaffAlu]]);
recipes.addShaped(<forestry:moistener>, [[searedTank, barrelWood, searedTank], [IRRope, barrelIron, IRRope], [scaffAlu, tubeCopper, scaffAlu]]);
mods.forestry.Carpenter.addRecipe(<forestry:portableAlyzer>, [[<advancedrocketry:lens>, <advancedrocketry:lens>, <minecraft:book>], [honeyPot, <forestry:can>, honeyPot], [ioSi, FCi1, ioSi]], 20, <liquid:seed.oil> * 500, <forestry:waxCast>);
recipes.addShaped(<forestry:bottler>, [[aaRed, searedTank, aaRed], [aaRed, hopper, aaRed], [scaffAlu, powerM, scaffAlu]]);
recipes.addShaped(<forestry:rainmaker>, [[null, <advancedrocketry:crystal:4>, null],[capacSmall, pipe, capacSmall],[IELightBlock, <actuallyadditions:blockMisc:6>, IELightBlock]]);

// Industrial Oil and Ethanol from Forestry items
mods.immersiveengineering.Squeezer.addRecipe(null, <liquid:plantoil> * 200, <forestry:fruits:2>, 160);
mods.immersiveengineering.Refinery.addRecipe(<liquid:biodiesel> * 20, <liquid:plantoil> * 8, <liquid:bio.ethanol> * 8, 340);
mods.immersiveengineering.Refinery.addRecipe(<liquid:biodiesel> * 16, <liquid:seed.oil> * 8, <liquid:bio.ethanol> * 8, 340);
