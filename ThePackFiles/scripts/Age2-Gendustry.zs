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
val nugBrass = <ore:nuggetBrass>;
val dustTiberium = <ore:dustTiberium>;

val plateTin = <ore:plateTin>;
val plateValyrium = <tconstruct:large_plate>.withTag({"Material":"valyrium"});

val LVconn = <immersiveengineering:connector>;
val coil1 = <immersiveengineering:wirecoil>;
val coil2 = <immersiveengineering:wirecoil:1>;
val coil3 = <immersiveengineering:wirecoil:2>;
val rcCoil =  <immersiveengineering:metalDecoration0:1>;
val ocRemote = <opencomputers:tool:2>;

val aaRed0 = <actuallyadditions:itemCrystal>;

val aaRed = <actuallyadditions:itemCrystalEmpowered>;
val aaLapis = <actuallyadditions:itemCrystalEmpowered:1>;
val aaIron = <actuallyadditions:itemCrystalEmpowered:5>;

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
val woodPulp = <forestry:woodPulp>;

val powerM = <gendustry:PowerModule>;
val Mtank = <gendustry:MutagenTank>;
val beeR = <gendustry:BeeReceptacle>;
val procGen = <gendustry:GeneticsProcessor>;

val zombSkul = <enderio:itemFrankenSkull:1>;
val zombSkul2 = <enderio:itemFrankenSkull:2>;
val advancedBlock = <libvulpes:advStructureMachine>;
val atmRec = <actuallyadditions:blockAtomicReconstructor>;

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
mods.forestry.Carpenter.addRecipe(<gendustry:UpgradeFrame>, [[dustTiberium, aaRed0, dustTiberium], [aaRed0, <tconstruct:fancy_frame:1>, aaRed0], [dustTiberium, aaRed0, dustTiberium]], 120, <liquid:seed.oil> * 500);
mods.actuallyadditions.AtomicReconstructor.addRecipe(procGen, <gendustry:EnvProcessor>, 150000);
mods.actuallyadditions.AtomicReconstructor.addRecipe(<forestry:greenhouse.climate_control>, <gendustry:ClimateModule>, 150000);
mods.forestry.Carpenter.addRecipe(<gendustry:ImportCover>, [[woodPulp, aaLapis, woodPulp], [aaLapis, <opencomputers:upgrade:18>, aaLapis], [woodPulp, aaLapis, woodPulp]], 120, <liquid:for.honey> * 500);
mods.forestry.Carpenter.addRecipe(<gendustry:EjectCover>, [[woodPulp, aaRed, woodPulp], [aaRed, <opencomputers:upgrade:18>, aaRed], [woodPulp, aaRed, woodPulp]], 120, <liquid:for.honey> * 500);
mods.forestry.Carpenter.addRecipe(<gendustry:ErrorSensorCover>, [[woodPulp, aaIron, woodPulp], [aaIron, <opencomputers:upgrade:18>, aaIron], [woodPulp, aaIron, woodPulp]], 120, <liquid:for.honey> * 500);


// Utilities
recipes.remove(<gendustry:Labware>);
recipes.remove(<gendustry:PollenKit>);
mods.forestry.ThermionicFabricator.addCast(<gendustry:Labware>*2, [[null, nugSilver, null], [nugSilver, nugTitan, nugSilver], [null, nugSilver, null]], 100, null);
mods.forestry.Carpenter.addRecipe(<gendustry:PollenKit>, [[null, nugBrass, null], [nugBrass, <minecraft:glass_bottle>, nugBrass], [nugSilver, nugSilver, nugSilver]], 120, <liquid:nutrient_distillation> * 500);

// Machines
recipes.remove(<gendustry:MutatronAdv>);
recipes.remove(<gendustry:Sampler>);
recipes.remove(<gendustry:Extractor>);
recipes.remove(<gendustry:IndustrialApiary>);
recipes.remove(<gendustry:MutagenProducer>);
recipes.remove(<gendustry:Mutatron>);
recipes.remove(<gendustry:Imprinter>);
recipes.remove(<gendustry:Replicator>);
recipes.remove(<gendustry:Transposer>);

recipes.addShaped(<gendustry:IndustrialApiary>, [[plateTin, powerM, plateTin], [beeR, beeR, beeR], [scaffAlu, gearBoxIron, scaffAlu]]);
recipes.addShaped(<gendustry:MutagenProducer>, [[gearBronze, hopper, gearBronze], [Mtank, Mtank, Mtank], [IELightBlock, powerM, IELightBlock]]);
recipes.addShaped(<gendustry:Mutatron>, [[null, beeR, ocRemote], [IELightBlock, Mtank, gearBoxIron], [IELightBlock, powerM, IELightBlock]]);
recipes.addShaped(<gendustry:MutatronAdv>, [[beeR, <libvulpes:holoProjector>, beeR], [zombSkul, <gendustry:Mutatron>, zombSkul], [advancedBlock, advancedBlock, advancedBlock]]);
recipes.addShaped(<gendustry:Sampler>, [[beeR, <libvulpes:holoProjector>, beeR], [atmRec, zombSkul, atmRec], [procGen, advancedBlock, procGen]]);
recipes.addShaped(<gendustry:Extractor>, [[beeR, atmRec, beeR], [Mtank, zombSkul, Mtank], [procGen, advancedBlock, procGen]]);
recipes.addShaped(<gendustry:Imprinter>, [[<actuallyadditions:blockDisplayStand>, zombSkul2, beeR], [plateValyrium, Mtank, plateValyrium], [procGen, <enderio:blockSoulBinder>, procGen]]);
recipes.addShaped(<gendustry:Replicator>, [[<actuallyadditions:blockDisplayStand>, zombSkul2, <bibliocraft:PotionShelf:*>], [plateValyrium, Mtank, plateValyrium], [procGen, <enderio:blockSliceAndSplice>, procGen]]);
recipes.addShaped(<gendustry:Transposer>, [[<actuallyadditions:blockDisplayStand>, zombSkul2, <actuallyadditions:blockDisplayStand>], [plateValyrium, Mtank, plateValyrium], [procGen, advancedBlock, procGen]]);

// Addons
recipes.remove(<gendustry:GeneSampleBlank>);
recipes.remove(<gendustry:GeneTemplate>);
mods.actuallyadditions.Empowerer.addRecipe(procGen, <gendustry:GeneTemplate>, <gendustry:GeneSampleBlank>, zombSkul2, <gendustry:GeneSampleBlank>, <gendustry:GeneSampleBlank>, 50000, 200, 1, 0.9, 1);
