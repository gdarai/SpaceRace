
val searedTank = <tconstruct:seared_tank:1>;
val piston = <minecraft:piston>;
val hopper = <minecraft:hopper>;
val casingWood = <actuallyadditions:blockMisc:4>;
val pipe = <immersiveengineering:metalDevice1:6>;
val barrelWood = <immersiveengineering:woodenDevice0:1>;
val barrelIron = <immersiveengineering:metalDevice0:4>;
val ioSi = <enderio:itemMaterial>;
val nugTitan = <ore:nuggetTitanium>;
val nugSilver = <ore:nuggetSilver>;
val nugManyullyn = <ore:nuggetManyullyn>;
val dustTiberium = <ore:dustTiberium>;

val plateTin = <ore:plateTin>;

val LVconn = <immersiveengineering:connector>;
val coil1 = <immersiveengineering:wirecoil>;
val coil2 = <immersiveengineering:wirecoil:1>;
val coil3 = <immersiveengineering:wirecoil:2>;
val rcCoil = <railcraft:charge>;
val ocRemote = <opencomputers:tool:2>;

val aaRed0 = <actuallyadditions:itemCrystal>;

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

val honeyComb = <ore:beeComb>;

val powerM = <gendustry:PowerModule>;
val Mtank = <gendustry:MutagenTank>;
val beeR = <gendustry:BeeReceptacle>;
val procGen = <gendustry:GeneticsProcessor>;

recipes.remove(powerM);
recipes.remove(<gendustry:Liquifier>);
mods.forestry.Carpenter.addRecipe(powerM, [[LVconn, null, LVconn], [coil1, rcCoil, coil1], [tubeTin, rcCoil, tubeTin]], 120, <liquid:seed.oil> * 500);
recipes.addShaped(<gendustry:Liquifier>, [[gearBronze, hopper, gearBronze], [piston, barrelWood, piston], [gearBoxIron, powerM, gearBoxIron]]);

//// Initial disable ////

// Components
recipes.remove(beeR);
recipes.remove(procGen);
recipes.remove(Mtank);
recipes.remove(<gendustry:ClimateModule>);
recipes.remove(<gendustry:EnvProcessor>);
// BeeReceptacle, and GeneticsProcessor moved to Precission Assembler
mods.forestry.Carpenter.addRecipe(Mtank, [[nugManyullyn, honeyComb, nugManyullyn], [nugManyullyn, <advancedrocketry:pressureTank>, nugManyullyn], [nugManyullyn, rcCoil, nugManyullyn]], 120, <liquid:seed.oil> * 500);

// Automation
recipes.remove(<gendustry:ImportCover>);
recipes.remove(<gendustry:EjectCover>);
recipes.remove(<gendustry:ErrorSensorCover>);
recipes.remove(<gendustry:UpgradeFrame>);
mods.forestry.Carpenter.addRecipe(<gendustry:UpgradeFrame>, [[dustTiberium, aaRed0, dustTiberium], [aaRed0, <tconstruct:fancy_frame:1>, aaRed0], [dustTiberium, aaRed0, dustTiberium]], 120, <liquid:creosote> * 500);
mods.actuallyadditions.AtomicReconstructor.addRecipe(procGen, <gendustry:EnvProcessor>, 150000);
mods.actuallyadditions.AtomicReconstructor.addRecipe(<forestry:greenhouse.climate_control>, <gendustry:ClimateModule>, 150000);


// Utilities
recipes.remove(<gendustry:Labware>);
recipes.remove(<gendustry:PollenKit>);
mods.forestry.ThermionicFabricator.addCast(<gendustry:Labware>*2, [[null, nugSilver, null], [nugSilver, nugTitan, nugSilver], [null, nugSilver, null]], 100, null);

// Machines
recipes.remove(<gendustry:Imprinter>);
recipes.remove(<gendustry:IndustrialApiary>);
recipes.remove(<gendustry:MutagenProducer>);
recipes.remove(<gendustry:Mutatron>);
recipes.remove(<gendustry:Extractor>);
recipes.remove(<gendustry:Replicator>);
recipes.remove(<gendustry:Sampler>);
recipes.remove(<gendustry:Transposer>);
recipes.remove(<gendustry:MutatronAdv>);
recipes.addShaped(<gendustry:IndustrialApiary>, [[plateTin, powerM, plateTin], [beeR, beeR, beeR], [scaffAlu, gearBoxIron, scaffAlu]]);
recipes.addShaped(<gendustry:MutagenProducer>, [[gearBronze, hopper, gearBronze], [Mtank, Mtank, Mtank], [IELightBlock, powerM, IELightBlock]]);
recipes.addShaped(<gendustry:Mutatron>, [[null, beeR, ocRemote], [IELightBlock, Mtank, gearBoxIron], [IELightBlock, powerM, IELightBlock]]);



recipes.remove(<gendustry:GeneSampleBlank>);
recipes.remove(<gendustry:GeneTemplate>);
