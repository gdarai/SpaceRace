val ingotManyullyn = <ore:ingotManyullyn>;
val searedTank = <tconstruct:seared_tank:1>;

val IECopperCoil = <immersiveengineering:metalDecoration0>;
val IEElectrumCoil = <immersiveengineering:metalDecoration0:1>;
val IESteelCoil = <immersiveengineering:metalDecoration0:2>;

val IECapLV =  <immersiveengineering:metalDevice0>;
val IECapMV =  <immersiveengineering:metalDevice0:1>;
val IECapHV =  <immersiveengineering:metalDevice0:2>;

val scaffAlu = <immersiveengineering:metalDecoration1:5>;
val scaffSteel = <immersiveengineering:metalDecoration1:1>;

val plateBrass = <ore:plateBrass>;
val plateNickel = <ore:plateNickel>;
val plateTriberium = <tconstruct:large_plate>.withTag({"Material":"triberium"});

val tubeCopper = <forestry:thermionicTubes>;
val tubeTin = <forestry:thermionicTubes:1>;

val rodSteel = <ore:stickSteel>;
val rodIron = <ore:stickIron>;

val gearBoxIron = <immersiveengineering:material:8>;
val gearBoxSteel = <immersiveengineering:material:9>;

val aaDiamant0 = <actuallyadditions:itemCrystal:2>;

val capacBasic = <enderio:itemBasicCapacitor>;
val capacDouble = <enderio:itemBasicCapacitor:1>;
val capacQuad = <enderio:itemBasicCapacitor:2>;
val machineBlock = <enderio:itemMachinePart>;
val liquidTank = <enderio:blockTank>;

val ingotElectric = <enderio:itemAlloy>;
val ingotEnergetic = <enderio:itemAlloy:1>;
val ingotVibrant = <enderio:itemAlloy:2>;
val ingotRedstone = <enderio:itemAlloy:3>;
val ingotConductive = <enderio:itemAlloy:4>;
val ingotPulsating = <enderio:itemAlloy:5>;
val ingotDark = <enderio:itemAlloy:6>;
val ingotSoularium = <enderio:itemAlloy:7>;



// Initial Remove Recipes
recipes.remove(machineBlock);
recipes.remove(liquidTank);
recipes.remove(capacBasic); // Moved to Precision Assembler
recipes.remove(capacDouble);
recipes.remove(capacQuad);
recipes.addShaped(machineBlock, [[ingotManyullyn, plateBrass, ingotManyullyn], [plateBrass, gearBoxSteel, plateBrass], [ingotManyullyn, plateBrass, ingotManyullyn]]);
recipes.addShaped(liquidTank, [[aaDiamant0, plateTriberium, aaDiamant0], [searedTank, machineBlock, searedTank], [aaDiamant0, plateTriberium, aaDiamant0]]);

recipes.remove(<enderio:blockAlloySmelter>);
recipes.remove(<enderio:blockSagMill>);

mods.tconstruct.Smeltery.removeAlloy(<liquid:energeticalloy>);
mods.tconstruct.Smeltery.removeAlloy(<liquid:conductiveiron>);
mods.tconstruct.Smeltery.removeAlloy(<liquid:pulsatingiron>);
mods.tconstruct.Smeltery.removeAlloy(<liquid:vibrantalloy>);

// Remove/Tweak ArcFurnace Recipes
mods.immersiveengineering.ArcFurnace.removeRecipe(ingotEnergetic);
mods.immersiveengineering.ArcFurnace.removeRecipe(ingotConductive);
mods.immersiveengineering.ArcFurnace.removeRecipe(ingotDark);
mods.immersiveengineering.ArcFurnace.removeRecipe(ingotSoularium);

// Energy Things
recipes.remove(<enderio:blockStirlingGenerator>);
recipes.remove(<enderio:blockZombieGenerator>);
recipes.remove(<enderio:blockVat>);
recipes.remove(<enderio:blockCombustionGenerator>);
recipes.remove(<enderio:blockCapBank:1>);
recipes.remove(<enderio:blockCapBank:2>);
recipes.remove(<enderio:blockCapBank:3>);
recipes.addShaped(<enderio:blockStirlingGenerator>, [[plateBrass, plateBrass, plateBrass], [rodIron, <minecraft:piston>, rodIron], [tubeCopper, gearBoxIron, tubeTin]]);
recipes.addShaped(<enderio:blockZombieGenerator>, [[tubeCopper, <ore:crystalDilithium>, tubeTin], [plateBrass, <minecraft:skull:2>, plateBrass], [ingotElectric, <ore:ingotIox>, ingotElectric]]);
recipes.addShaped(<enderio:blockVat>, [[ingotElectric, ingotElectric, ingotElectric], [searedTank, machineBlock, searedTank], [scaffAlu, IEElectrumCoil, scaffAlu]]);
recipes.addShaped(<enderio:blockCombustionGenerator>, [[tubeCopper, ingotElectric, tubeTin], [searedTank, machineBlock, searedTank], [scaffSteel, gearBoxSteel, scaffSteel]]);
recipes.addShaped(<enderio:blockCapBank:1>, [[capacBasic, plateTriberium, capacBasic], [IECapLV, machineBlock, IECapLV], [plateTriberium, IECapLV, plateTriberium]]);
mods.forestry.ThermionicFabricator.addCast(<enderio:blockFusedQuartz>*2, [[null, null, null], [<ore:dustQuartz>, aaDiamant0, <ore:dustQuartz>], [null, <ore:dustQuartz>, null]], 1000, <forestry:waxCast>);



