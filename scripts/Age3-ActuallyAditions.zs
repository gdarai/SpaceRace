
val brickBlock = <minecraft:brick_block>;
val stoneBrick = <ore:brickStone>;
val piston = <minecraft:piston>;
val trPlank = <ore:plankTreatedWood>;
val crystal = <mysticalagriculture:infusion_crystal>;
val bowString = <mysticalagriculture:mystical_bowstring>;
val pearl = <ore:materialEnderPearl>;
val ioSi = <enderio:itemMaterial>;
val barrelIron = <immersiveengineering:metalDevice0:4>;
val rodSteel = <ore:stickSteel>;
val MVconn = <immersiveengineering:connector:2>;
val tankNit = <advancedrocketry:bucketNitrogen>;
val blockLens = <advancedrocketry:blockLens>;
val ironBar = <ore:barsIron>;
val prospShard = <ore:itemProsperityShard>;
val obsShard = <tconstruct:shard>.withTag({"Material":"obsidian"});
val inferiCoal = <ore:coalInferium>;

val gearBoxSteel = <immersiveengineering:material:9>;

val IENozzle = <immersiveengineering:toolupgrade:7>;
val IEPump = <immersiveengineering:metalDevice0:5>;
val IELightBlock = <immersiveengineering:metalDecoration0:4>;
val IEHeavyBlock = <immersiveengineering:metalDecoration0:5>;
val IEFabric = <immersiveengineering:material:5>;
val IRRope = <immersiveengineering:wirecoil:3>;

val tubeBlazing = <forestry:thermionicTubes:7>;

val plateCopper = <ore:plateCopper>;
val plateIron = <ore:plateIron>;

val scaffAlu = <immersiveengineering:metalDecoration1:5>;

val casingWood = <actuallyadditions:blockMisc:4>;
val casingIron = <actuallyadditions:blockMisc:9>;
val pearlBlock = <actuallyadditions:blockMisc:6>;
val ingotCobalt = <ore:ingotCobalt>;

val dustKarm = <ore:dustKarmesine>;
val dustLead = <ore:dustLead>;
val dustLapis = <ore:dustLapis>;
val dustDrac = <draconicevolution:draconium_dust>;
val dustIox = <ore:dustIox>;

val nugTitan = <ore:nuggetTitanium>;
val nugSilver = <ore:nuggetSilver>;

val inRedX = <minecraft:redstone>;
val inLapisX = <minecraft:dye:4>;
val inDiamantX = <minecraft:diamond>;
val inCoalX = <minecraft:coal>;
val inEmeraldX = <minecraft:emerald>;
val inIronX = <minecraft:iron_ingot>;

val inRedBLX = <minecraft:redstone_block>;
val inLapisBLX = <minecraft:lapis_block>;
val inDiamantBLX = <minecraft:diamond_block>;
val inCoalBLX = <minecraft:coal_block>;
val inEmeraldBLX = <minecraft:emerald_block>;
val inIronBLX = <minecraft:iron_block>;

val inRed0 = <actuallyadditions:itemCrystal>;
val inLapis0 = <actuallyadditions:itemCrystal:1>;
val inDiamant0 = <actuallyadditions:itemCrystal:2>;
val inCoal0 = <actuallyadditions:itemCrystal:3>;
val inEmerald0 = <actuallyadditions:itemCrystal:4>;
val inIron0 = <actuallyadditions:itemCrystal:5>;

val inRedBL0 = <actuallyadditions:blockCrystal>;
val inLapisBL0 = <actuallyadditions:blockCrystal:1>;
val inDiamantBL0 = <actuallyadditions:blockCrystal:2>;
val inCoalBL0 = <actuallyadditions:blockCrystal:3>;
val inEmeraldBL0 = <actuallyadditions:blockCrystal:4>;
val inIronBL0 = <actuallyadditions:blockCrystal:5>;

val inRed = <actuallyadditions:itemCrystalEmpowered>;
val inLapis = <actuallyadditions:itemCrystalEmpowered:1>;
val inDiamant = <actuallyadditions:itemCrystalEmpowered:2>;
val inCoal = <actuallyadditions:itemCrystalEmpowered:3>;
val inEmerald = <actuallyadditions:itemCrystalEmpowered:4>;
val inIron = <actuallyadditions:itemCrystalEmpowered:5>;

val inRedBL = <actuallyadditions:blockCrystalEmpowered>;
val inLapisBL = <actuallyadditions:blockCrystalEmpowered:1>;
val inDiamantBL = <actuallyadditions:blockCrystalEmpowered:2>;
val inCoalBL = <actuallyadditions:blockCrystalEmpowered:3>;
val inEmeraldBL = <actuallyadditions:blockCrystalEmpowered:4>;
val inIronBL = <actuallyadditions:blockCrystalEmpowered:5>;

val reconstructor = <actuallyadditions:blockAtomicReconstructor>;
val empowerer = <actuallyadditions:blockEmpowerer>;

val coil1 = <actuallyadditions:itemMisc:7>; // Moved to Lathe
val coil2 = <actuallyadditions:itemMisc:8>;

val aaCasing = <actuallyadditions:blockMisc:7>;

val chest1 = <actuallyadditions:blockGiantChest>;
val chest2 = <actuallyadditions:blockGiantChestMedium>;
val chest3 = <actuallyadditions:blockGiantChestLarge>;

val aaLens = <actuallyadditions:itemMisc:18>;

val nucleumCapsule = <forestry:refractory:1>.withTag({"Fluid":{"FluidName":"nucleum_fluid", Amount:1000}});
val plateTriberium = <tconstruct:large_plate>.withTag({"Material":"triberium"});
val inChisGreenBL = <actuallyadditions:blockTestifiBucksGreenWall>;

val GDpowerM = <gendustry:PowerModule>;

val agriSword3 = <mysticalagriculture:intermedium_sword>;
val agriScythe3 = <mysticalagriculture:intermedium_scythe>;
val agriPick3 = <mysticalagriculture:intermedium_pickaxe>;

// Materials

mods.actuallyadditions.AtomicReconstructor.remove(inRedX);
mods.actuallyadditions.AtomicReconstructor.remove(inRedBLX);
mods.actuallyadditions.Empowerer.remove(<actuallyadditions:itemCrystal>, <actuallyadditions:itemCrystalEmpowered>);
mods.actuallyadditions.Empowerer.remove(<actuallyadditions:blockCrystal>, <actuallyadditions:blockCrystalEmpowered>);
mods.actuallyadditions.AtomicReconstructor.remove(inLapisX);
mods.actuallyadditions.AtomicReconstructor.remove(inLapisBLX);
mods.actuallyadditions.Empowerer.remove(<actuallyadditions:itemCrystal:1>, <actuallyadditions:itemCrystalEmpowered:1>);
mods.actuallyadditions.Empowerer.remove(<actuallyadditions:blockCrystal:1>, <actuallyadditions:blockCrystalEmpowered:1>);
mods.actuallyadditions.AtomicReconstructor.remove(inDiamantX);
mods.actuallyadditions.AtomicReconstructor.remove(inDiamantBLX);
mods.actuallyadditions.Empowerer.remove(<actuallyadditions:itemCrystal:2>, <actuallyadditions:itemCrystalEmpowered:2>);
mods.actuallyadditions.Empowerer.remove(<actuallyadditions:blockCrystal:2>, <actuallyadditions:blockCrystalEmpowered:2>);
mods.actuallyadditions.AtomicReconstructor.remove(inCoalX);
mods.actuallyadditions.AtomicReconstructor.remove(inCoalBLX);
mods.actuallyadditions.Empowerer.remove(<actuallyadditions:itemCrystal:3>, <actuallyadditions:itemCrystalEmpowered:3>);
mods.actuallyadditions.Empowerer.remove(<actuallyadditions:blockCrystal:3>, <actuallyadditions:blockCrystalEmpowered:3>);
mods.actuallyadditions.AtomicReconstructor.remove(inEmeraldX);
mods.actuallyadditions.AtomicReconstructor.remove(inEmeraldBLX);
mods.actuallyadditions.Empowerer.remove(<actuallyadditions:itemCrystal:4>, <actuallyadditions:itemCrystalEmpowered:4>);
mods.actuallyadditions.Empowerer.remove(<actuallyadditions:blockCrystal:4>, <actuallyadditions:blockCrystalEmpowered:4>);
mods.actuallyadditions.AtomicReconstructor.remove(inIronX);
mods.actuallyadditions.AtomicReconstructor.remove(inIronBLX);
mods.actuallyadditions.Empowerer.remove(<actuallyadditions:itemCrystal:5>, <actuallyadditions:itemCrystalEmpowered:5>);
mods.actuallyadditions.Empowerer.remove(<actuallyadditions:blockCrystal:5>, <actuallyadditions:blockCrystalEmpowered:5>);

recipes.remove(coil1); // Moved to Lathe
recipes.remove(coil2);
recipes.remove(casingIron);
recipes.addShaped(casingIron, [[plateIron, inDiamant0, plateIron], [gearBoxSteel, inIronBL0, gearBoxSteel], [plateIron, plateTriberium, plateIron]]);

// AA Primitive Factory
recipes.remove(reconstructor);
recipes.remove(<actuallyadditions:blockFarmer>);
recipes.addShaped(reconstructor, [[tubeBlazing, blockLens, tubeBlazing], [tankNit, <actuallyadditions:blockLaserRelayExtreme>, tankNit], [scaffAlu, <libvulpes:forgePowerInput>, scaffAlu]]);
recipes.addShaped(<actuallyadditions:blockFarmer>, [[inChisGreenBL, nucleumCapsule, inChisGreenBL], [inChisGreenBL, <actuallyadditions:blockBioReactor>, inChisGreenBL], [IEHeavyBlock, tankNit, IEHeavyBlock]]);

// AA Factory
// Ok: Item Interface, Powered Furnace, Auto Breaker/ Placer, Ranged Collector, Auto Feeder, Sacks, Advanced leafBlower
recipes.remove(<actuallyadditions:blockMiner>);
recipes.remove(<actuallyadditions:blockGrinder>);
recipes.remove(aaCasing);
recipes.remove(<actuallyadditions:blockDropper>);
recipes.addShaped(<actuallyadditions:blockMiner>, [[casingIron, IEHeavyBlock, casingIron], [gearBoxSteel, reconstructor, gearBoxSteel], [casingIron, <actuallyadditions:itemDrill:*>, casingIron]]);
recipes.addShaped(aaCasing, [[dustIox, plateTriberium, dustIox], [plateTriberium, inEmerald0, plateTriberium], [dustIox, plateTriberium, dustIox]]);
recipes.addShaped(<actuallyadditions:blockGrinder>, [[casingIron, gearBoxSteel, casingIron], [aaCasing, <railcraft:borehead_diamond>, aaCasing], [IEHeavyBlock, GDpowerM, IEHeavyBlock]]);
recipes.addShaped(<actuallyadditions:blockDropper>, [[null, inLapis0, null], [inLapis0, <minecraft:dropper>, inLapis0], [null, inLapis0, null]]);

// Lenses
// Color, Damage moved into Precision Assembler
recipes.remove(aaLens);
mods.actuallyadditions.AtomicReconstructor.remove(aaLens);
mods.actuallyadditions.AtomicReconstructor.remove(<actuallyadditions:itemColorLens>);
mods.actuallyadditions.AtomicReconstructor.remove(<actuallyadditions:itemExplosionLens>);
mods.actuallyadditions.AtomicReconstructor.remove(<actuallyadditions:itemDamageLens>);
recipes.remove(<actuallyadditions:itemMoreDamageLens>);
recipes.remove(<actuallyadditions:itemMiningLens>);
recipes.remove(<actuallyadditions:itemDisenchantingLens>);
mods.forestry.ThermionicFabricator.addCast(aaLens, [[nugTitan, nugSilver, nugTitan], [nugSilver, inEmeraldBL0, nugSilver], [nugTitan, nugSilver, nugTitan]], 2000, <tconstruct:cast>.withTag({"PartType":"tconstruct:pan_head"}));
mods.forestry.ThermionicFabricator.addCast(<actuallyadditions:itemExplosionLens>, [[blockLens, blockLens, blockLens], [blockLens, aaLens, blockLens], [blockLens, blockLens, blockLens]], 1000, null);
mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:itemDamageLens>, <actuallyadditions:itemMoreDamageLens>, agriSword3, agriScythe3, agriSword3, agriScythe3, 250000, 600);
mods.actuallyadditions.Empowerer.addRecipe(<actuallyadditions:itemColorLens>, <actuallyadditions:itemMiningLens>, agriPick3, inCoal, agriPick3, inCoal, 500000, 600);
mods.forestry.Carpenter.addRecipe(<actuallyadditions:itemDisenchantingLens>, [[inCoal0, crystal, inCoal0], [<minecraft:enchanting_table>, aaLens, <minecraft:enchanting_table>], [inCoal0, crystal, inCoal0]], 300, <liquid:dyonite_fluid> * 2000, blockLens);

// AA Advanced Factory
// Change: Heat Collector, Phantom Booster, Long Range Breaker, Greenhouse Glass, Lava Factory
recipes.remove(<actuallyadditions:blockGrinderDouble>);

// AA Phantom Factory
// Change: Item Reparierer
recipes.remove(empowerer);

// inRed0, inLapis0, inDiamant0, inCoal0, inEmerald0 all added through crystalizer
mods.actuallyadditions.AtomicReconstructor.addRecipe(<forestry:refractory:1>.withTag({"Fluid":{"FluidName": "cloud_seed", "Amount":1000}}), inIron0, 5000);

// Tools
recipes.remove(<actuallyadditions:itemLaserWrench>);
recipes.remove(<actuallyadditions:itemTeleStaff>);
recipes.remove(<actuallyadditions:itemDrill:3>);
recipes.remove(pearlBlock);
recipes.addShaped(<actuallyadditions:itemLaserWrench>,[[null, bowString, crystal.noReturn()],[null, rodSteel, bowString],[rodSteel, null, null]]);
recipes.addShaped(<actuallyadditions:itemTeleStaff>,[[null, bowString, pearlBlock],[null, <actuallyadditions:itemLaserWrench>, bowString],[rodSteel, <actuallyadditions:itemBattery>, null]]);
mods.forestry.ThermionicFabricator.addCast(pearlBlock, [[pearl, ioSi, pearl], [ioSi, dustDrac, ioSi], [pearl, ioSi, pearl]], 1000, null);
recipes.addShaped(<actuallyadditions:itemDrill:3>,[[inDiamant0, <railcraft:borehead_steel>, inDiamant0],[<mysticalagriculture:intermedium_tool_core>, <actuallyadditions:itemMisc:16>, <mysticalagriculture:intermedium_tool_core>],[<immersiveengineering:material:13>, <actuallyadditions:itemBatteryDouble>, <immersiveengineering:material:13>]]);

// Obsidian ToolSet
recipes.addShaped(<actuallyadditions:itemHelmObsidian>,[[null, obsShard, null],[obsShard, <minecraft:leather_helmet>, obsShard],[obsShard, inferiCoal, obsShard]]);
recipes.addShaped(<actuallyadditions:itemChestObsidian>,[[obsShard, obsShard, obsShard],[obsShard, <minecraft:leather_chestplate>, obsShard],[obsShard, inferiCoal, obsShard]]);
recipes.addShaped(<actuallyadditions:itemPantsObsidian>,[[obsShard, null, obsShard],[obsShard, <minecraft:leather_leggings>, obsShard],[obsShard, inferiCoal, obsShard]]);
recipes.addShaped(<actuallyadditions:itemBootsObsidian>,[[null, null, null],[obsShard, <minecraft:leather_boots>, obsShard],[obsShard, inferiCoal, obsShard]]);

// Storage
recipes.remove(chest2);
recipes.remove(chest3);
recipes.addShaped(chest2, [[trPlank, trPlank, trPlank], [chest1, trPlank, chest1], [trPlank, trPlank, trPlank]]);
recipes.addShaped(chest3, [[trPlank, trPlank, trPlank], [chest1, chest1, chest1], [trPlank, trPlank, trPlank]]);

// Item and Fluid Transfer
mods.actuallyadditions.AtomicReconstructor.remove(<actuallyadditions:blockLaserRelayFluids>);
mods.actuallyadditions.AtomicReconstructor.remove(<actuallyadditions:blockLaserRelay>);
mods.actuallyadditions.AtomicReconstructor.remove(<actuallyadditions:blockLaserRelayItem>);
recipes.remove(<actuallyadditions:itemFilter>);
recipes.remove(<actuallyadditions:blockLaserRelayItemWhitelist>);
mods.forestry.Carpenter.addRecipe(<actuallyadditions:blockLaserRelayFluids>*2, [[null, crystal, null], [bowString, <immersiveengineering:connector:5>, bowString], [dustLapis, <bibliocraft:SwordPedestal:*>, dustLapis]], 20, <liquid:eezo_fluid> * 200, null);
mods.forestry.Carpenter.addRecipe(<actuallyadditions:blockLaserRelayItem>*2, [[null, crystal, null], [bowString, <immersiveengineering:connector:5>, bowString], [dustLead, <bibliocraft:SwordPedestal:*>, dustLead]], 20, <liquid:eezo_fluid> * 200, null);
recipes.addShaped(<actuallyadditions:blockLaserRelayItemWhitelist>, [[dustKarm, inRed0, dustKarm], [tankNit, <actuallyadditions:blockLaserRelayItem>, tankNit], [dustKarm, inRed0, dustKarm]]);
recipes.addShaped(<actuallyadditions:itemFilter>, [[ironBar, prospShard, ironBar], [prospShard, null, prospShard], [ironBar, prospShard, ironBar]]);

// PowerGen
recipes.remove(<actuallyadditions:blockCanolaPress>);
recipes.remove(<actuallyadditions:blockFermentingBarrel>);
recipes.remove(<actuallyadditions:blockBioReactor>);
recipes.remove(<actuallyadditions:blockEnergizer>);
recipes.remove(<actuallyadditions:blockEnervator>);
recipes.remove(<actuallyadditions:blockLaserRelay>);
recipes.remove(<actuallyadditions:blockLaserRelayAdvanced>);
recipes.remove(<actuallyadditions:blockLaserRelayExtreme>);
recipes.remove(<actuallyadditions:blockFurnaceSolar>);
recipes.addShaped(<actuallyadditions:blockCanolaPress>, [[stoneBrick, piston, stoneBrick], [stoneBrick, null, stoneBrick], [brickBlock, casingWood, brickBlock]]);
recipes.addShaped(<actuallyadditions:blockFermentingBarrel>, [[plateCopper, <ore:trapdoorWood>, plateCopper], [plateCopper, null, plateCopper], [scaffAlu, casingWood, scaffAlu]]);
recipes.addShaped(<actuallyadditions:blockBioReactor>, [[MVconn, coil1, MVconn], [plateCopper, barrelIron, plateCopper], [scaffAlu, coil1, scaffAlu]]);
mods.forestry.Carpenter.addRecipe(<actuallyadditions:blockLaserRelay>*2, [[null, crystal, null], [inRed0, <immersiveengineering:connector:5>, inRed0], [inRed0, <bibliocraft:SwordPedestal:*>, inRed0]], 20, <liquid:eezo_fluid> * 200, null);
recipes.addShaped(<actuallyadditions:blockLaserRelayAdvanced>, [[inRed0, plateCopper, inRed0], [tankNit, <actuallyadditions:blockLaserRelay>, tankNit], [inRed0, plateCopper, inRed0]]);
recipes.addShaped(<actuallyadditions:blockLaserRelayExtreme>, [[ingotCobalt, inRed0, ingotCobalt], [tankNit, <actuallyadditions:blockLaserRelayAdvanced>, tankNit], [ingotCobalt, inRed0, ingotCobalt]]);
recipes.addShaped(<actuallyadditions:blockEnergizer>, [[<taiga:meteorite_ingot>, inRed0, inRed0], [scaffAlu, coil1, null], [<taiga:meteorite_ingot>, scaffAlu, scaffAlu]]);
recipes.addShapeless(<actuallyadditions:blockEnergizer>, [<actuallyadditions:blockEnervator>]);
recipes.addShapeless(<actuallyadditions:blockEnervator>, [<actuallyadditions:blockEnergizer>]);
mods.actuallyadditions.AtomicReconstructor.addRecipe(<advancedrocketry:solarPanel>, <actuallyadditions:blockFurnaceSolar>, 25000);
recipes.remove(<actuallyadditions:blockColoredLamp:*>);
recipes.remove(<actuallyadditions:blockLampPowerer>);
recipes.addShaped(<actuallyadditions:blockColoredLamp>*2, [[blockLens, tankNit, blockLens], [blockLens, <forestry:refractory:1>.withTag({"Fluid":{"FluidName":"magma_fluid", Amount:1000}}), blockLens], [blockLens, tankNit, blockLens]]);
recipes.addShapeless(<actuallyadditions:blockColoredLamp:1>, [<actuallyadditions:blockColoredLamp>]);
recipes.addShapeless(<actuallyadditions:blockColoredLamp:2>, [<actuallyadditions:blockColoredLamp:1>]);
recipes.addShapeless(<actuallyadditions:blockColoredLamp:3>, [<actuallyadditions:blockColoredLamp:2>]);
recipes.addShapeless(<actuallyadditions:blockColoredLamp:4>, [<actuallyadditions:blockColoredLamp:3>]);
recipes.addShapeless(<actuallyadditions:blockColoredLamp:5>, [<actuallyadditions:blockColoredLamp:4>]);
recipes.addShapeless(<actuallyadditions:blockColoredLamp:6>, [<actuallyadditions:blockColoredLamp:5>]);
recipes.addShapeless(<actuallyadditions:blockColoredLamp:7>, [<actuallyadditions:blockColoredLamp:6>]);
recipes.addShapeless(<actuallyadditions:blockColoredLamp:8>, [<actuallyadditions:blockColoredLamp:7>]);
recipes.addShapeless(<actuallyadditions:blockColoredLamp:9>, [<actuallyadditions:blockColoredLamp:8>]);
recipes.addShapeless(<actuallyadditions:blockColoredLamp:10>, [<actuallyadditions:blockColoredLamp:9>]);
recipes.addShapeless(<actuallyadditions:blockColoredLamp:11>, [<actuallyadditions:blockColoredLamp:10>]);
recipes.addShapeless(<actuallyadditions:blockColoredLamp:12>, [<actuallyadditions:blockColoredLamp:11>]);
recipes.addShapeless(<actuallyadditions:blockColoredLamp:13>, [<actuallyadditions:blockColoredLamp:12>]);
recipes.addShapeless(<actuallyadditions:blockColoredLamp:14>, [<actuallyadditions:blockColoredLamp:13>]);
recipes.addShapeless(<actuallyadditions:blockColoredLamp:15>, [<actuallyadditions:blockColoredLamp:14>]);
recipes.addShapeless(<actuallyadditions:blockColoredLamp>, [<actuallyadditions:blockColoredLamp:15>]);
mods.actuallyadditions.AtomicReconstructor.addRecipe(<actuallyadditions:blockColoredLamp:*>, <actuallyadditions:blockLampPowerer>, 10000);

// Batteries
recipes.remove(<actuallyadditions:itemBatteryDouble>);
recipes.addShaped(<actuallyadditions:itemBatteryDouble>, [[inIron0, inIron0, inIron0], [inIron0, <actuallyadditions:itemBattery>, inIron0], [inIron0, inIron0, inIron0]]);

// Utilities
recipes.remove(<actuallyadditions:blockCoffeeMachine>);
recipes.addShaped(<actuallyadditions:blockCoffeeMachine>, [[null, <railcraft:charge:5>, null], [null, scaffAlu, null], [inRed0, casingWood, inRed0]]);
