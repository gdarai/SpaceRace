val ingotManyullyn = <ore:ingotManyullyn>;
val searedTank = <tconstruct:seared_tank:1>;
val ocRemote = <opencomputers:tool:2>;
val netherStar = <minecraft:nether_star>;

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
val plateTitIri = <ore:plateTitaniumIridium>;
val plateTitan = <ore:plateTitanium>;
val plateUru = <tconstruct:large_plate>.withTag({"Material":"uru"});
val plateYrdeen = <tconstruct:large_plate>.withTag({"Material":"yrdeen"});

val tubeCopper = <forestry:thermionicTubes>;
val tubeTin = <forestry:thermionicTubes:1>;

val rodSteel = <ore:stickSteel>;
val rodIron = <ore:stickIron>;
val rodPrometheum = <tconstruct:tough_tool_rod>.withTag({"Material":"prometheum"});

val gearBoxIron = <immersiveengineering:material:8>;
val gearBoxSteel = <immersiveengineering:material:9>;
val gearTitAlu = <advancedrocketry:productgear>;
val gearTitIri = <advancedrocketry:productgear:1>;

val aaDiamant0 = <actuallyadditions:itemCrystal:2>;

val capacBasic = <enderio:itemBasicCapacitor>;
val capacDouble = <enderio:itemBasicCapacitor:1>;
val capacQuad = <enderio:itemBasicCapacitor:2>;
val machineBlock = <enderio:itemMachinePart>;
val liquidTank = <enderio:blockTank>;
val binding = <enderio:itemMaterial:1>;

val ingotElectric = <enderio:itemAlloy>;
val ingotEnergetic = <enderio:itemAlloy:1>;
val ingotVibrant = <enderio:itemAlloy:2>;
val ingotRedstone = <enderio:itemAlloy:3>;
val ingotConductive = <enderio:itemAlloy:4>;
val ingotPulsating = <enderio:itemAlloy:5>;
val ingotDark = <enderio:itemAlloy:6>;
val ingotSoularium = <enderio:itemAlloy:7>;

val coilIridium = <libvulpes:coil0:10>;
val AALaser = <actuallyadditions:blockAtomicReconstructor>;

val darkSteelCapsule = <forestry:refractory:1>.withTag({"Fluid":{"FluidName":"darksteel", Amount:1000}});
val uraniumCapsule = <forestry:refractory:1>.withTag({"Fluid":{"FluidName":"uranium", Amount:1000}});
val experienceCapsule = <forestry:refractory:1>.withTag({"Fluid":{"FluidName":"xpjuice", Amount:1000}});

val skelSkul = <enderio:itemFrankenSkull:5>;
val endeSkul = <enderio:blockEndermanSkull:2>;
val endeSkul2 = <enderio:blockEndermanSkull:4>;
val frankEndeSkul = <enderio:itemFrankenSkull:4>;

val wyvernCore = <draconicevolution:wyvern_core>;

// Initial Remove Recipes
recipes.remove(machineBlock);
recipes.remove(liquidTank);
recipes.remove(capacBasic); // Moved to Precision Assembler
recipes.remove(capacDouble); // Moved to Precision Assembler
recipes.remove(capacQuad); // Moved to Precision Assembler
recipes.addShaped(machineBlock, [[ingotManyullyn, plateBrass, ingotManyullyn], [plateBrass, gearBoxSteel, plateBrass], [ingotManyullyn, plateBrass, ingotManyullyn]]);
recipes.addShaped(liquidTank, [[aaDiamant0, plateTriberium, aaDiamant0], [searedTank, machineBlock, searedTank], [aaDiamant0, plateTriberium, aaDiamant0]]);

mods.tconstruct.Smeltery.removeAlloy(<liquid:energeticalloy>);
mods.tconstruct.Smeltery.removeAlloy(<liquid:conductiveiron>);
mods.tconstruct.Smeltery.removeAlloy(<liquid:pulsatingiron>);
mods.tconstruct.Smeltery.removeAlloy(<liquid:vibrantalloy>);

// Armor
recipes.remove(<enderio:darkSteel_helmet>);
recipes.remove(<enderio:darkSteel_chestplate>);
recipes.remove(<enderio:darkSteel_leggings>);
recipes.remove(<enderio:darkSteel_boots>);
recipes.addShaped(<enderio:darkSteel_helmet>, [[ingotDark, ingotDark, ingotDark], [ingotDark, <mysticalagriculture:prudentium_helmet>, ingotDark], [null, null, null]]);
recipes.addShaped(<enderio:darkSteel_chestplate>, [[ingotDark, null, ingotDark], [ingotDark, <mysticalagriculture:prudentium_chestplate>, ingotDark], [ingotDark, ingotDark, ingotDark]]);
recipes.addShaped(<enderio:darkSteel_leggings>, [[ingotDark, ingotDark, ingotDark], [ingotDark, <mysticalagriculture:prudentium_leggings>, ingotDark], [ingotDark, null, ingotDark]]);
recipes.addShaped(<enderio:darkSteel_boots>, [[null, null, null], [ingotDark, <mysticalagriculture:prudentium_boots>, ingotDark], [ingotDark, null, ingotDark]]);

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
recipes.addShaped(<enderio:blockCapBank:2>, [[capacDouble, plateTitIri, capacDouble], [IECapMV, machineBlock, IECapMV], [plateTriberium, IECapMV, plateTriberium]]);
recipes.addShaped(<enderio:blockCapBank:3>, [[capacQuad, <actuallyadditions:blockCrystalEmpowered>, capacQuad], [IECapHV, machineBlock, IECapHV], [plateTriberium, IECapHV, plateTriberium]]);
mods.forestry.ThermionicFabricator.addCast(<enderio:blockFusedQuartz>*2, [[null, null, null], [<ore:dustQuartz>, aaDiamant0, <ore:dustQuartz>], [null, <ore:dustQuartz>, null]], 1000, <forestry:waxCast>);

// Factory
recipes.remove(<enderio:blockAlloySmelter>);
recipes.remove(<enderio:blockSagMill>);
recipes.remove(<enderio:blockInventoryPanel>);
recipes.remove(<enderio:itemItemConduit>);
recipes.remove(<enderio:itemMaterial:2>); // Binding composite
recipes.remove(<enderio:blockSliceAndSplice>);
recipes.remove(<enderio:blockSoulBinder>);

recipes.addShaped(<enderio:blockAlloySmelter>, [[AALaser, <storagedrawers:controller>, AALaser], [coilIridium, machineBlock, coilIridium], [capacBasic, plateTriberium, capacBasic]]);
recipes.addShaped(<enderio:blockInventoryPanel>, [[plateTitIri, ocRemote, plateTitIri], [darkSteelCapsule, <enderio:itemFunctionUpgrade>, darkSteelCapsule], [gearTitAlu, liquidTank, gearTitAlu]]);
recipes.addShaped(<enderio:itemItemConduit>*8, [[binding, binding, binding], [<enderio:itemMaterial:3>, gearTitAlu, <enderio:itemMaterial:3>], [binding, binding, binding]]);
mods.forestry.Carpenter.addRecipe(<enderio:itemMaterial:2>*4, [[null, <ore:sand>, null], [<actuallyadditions:itemMisc:10>, <minecraft:clay_ball>, <actuallyadditions:itemMisc:10>], [null, <ore:sand>, null]], 20, <liquid:water> * 250, <taiga:osram_dust>);
mods.forestry.Carpenter.addRecipe(<enderio:itemMaterial:2>*4, [[null, <ore:sand>, null], [<actuallyadditions:itemMisc:11>, <minecraft:clay_ball>, <actuallyadditions:itemMisc:11>], [null, <ore:sand>, null]], 20, <liquid:water> * 250, <taiga:osram_dust>);
recipes.addShaped(<enderio:blockSagMill>, [[machineBlock, darkSteelCapsule, machineBlock], [gearTitIri, gearTitIri, gearTitIri], [machineBlock, <actuallyadditions:blockMisc:8>, machineBlock]]);
recipes.addShaped(<enderio:blockSliceAndSplice>, [[plateTriberium, plateUru, plateTriberium], [<ore:plateUranium>, <advancedrocketry:sawBladeIron>, <ore:plateUranium>], [machineBlock, darkSteelCapsule, machineBlock]]);
recipes.addShaped(<enderio:blockSoulBinder>, [[plateYrdeen, <railcraft:firestone_refined>, plateYrdeen], [<ore:plateUranium>, <actuallyadditions:blockEmpowerer>, <ore:plateUranium>], [machineBlock, experienceCapsule, machineBlock]]);

// Gadgets
recipes.remove(<enderio:blockPoweredSpawner>);
recipes.remove(<enderio:blockSpawnGuard>);

recipes.remove(<enderio:blockExperienceObelisk>);
recipes.remove(<enderio:blockEnchanter>);
recipes.remove(<enderio:itemRemoteInvAccess:1>);
recipes.remove(<enderio:itemRemoteInvAccess:2>);
recipes.addShaped(<enderio:blockExperienceObelisk>, [[null, <enderio:itemXpTransfer>, null], [null, plateTitan, null], [plateTitan, <taiga:dilithium_crystal>, plateTitan]]);
recipes.addShaped(<enderio:blockEnchanter>, [[endeSkul, <taiga:dilithium_crystal>, endeSkul], [ingotDark, ingotSoularium, ingotDark], [null, ingotSoularium, null]]);
mods.actuallyadditions.Empowerer.addRecipe(<enderio:itemRemoteInvAccess>, <enderio:itemRemoteInvAccess:1>, uraniumCapsule, <taiga:uru_dust>, endeSkul, netherStar, 250000, 200);
mods.actuallyadditions.Empowerer.addRecipe(<enderio:itemRemoteInvAccess:1>, <enderio:itemRemoteInvAccess:2>, uraniumCapsule, <taiga:yrdeen_dust>, <enderio:itemFrankenSkull:3>, <railcraft:firestone_raw>, 250000, 200);
recipes.addShaped(<enderio:blockPoweredSpawner>, [[<enderio:blockReinforcedObsidian>, uraniumCapsule, <enderio:blockReinforcedObsidian>], [plateYrdeen, machineBlock, plateYrdeen], [<enderio:itemMaterial:9>, <enderio:itemFrankenSkull:2>, <enderio:itemMaterial:9>]]);
recipes.addShaped(<enderio:blockSpawnGuard>, [[null, <enderio:itemMaterial:8>, null], [ingotSoularium, ingotDark, ingotSoularium], [ingotDark, machineBlock, ingotDark]]);

// Teleporting
recipes.remove(<enderio:blockTransceiver>); // Moved to Infusion Crafting
recipes.remove(<enderio:blockTelePad>);

recipes.remove(<enderio:itemRodOfReturn>);
recipes.remove(<enderio:itemTravelStaff>);
recipes.remove(<enderio:blockTravelAnchor>); // Moved to Precision Assembler

recipes.addShaped(<enderio:itemTravelStaff>, [[null, ingotSoularium, endeSkul], [<taiga:dilithium_crystal>, rodPrometheum, ingotSoularium], [rodPrometheum, <taiga:dilithium_crystal>, null]]);
mods.actuallyadditions.Empowerer.addRecipe(<enderio:itemTravelStaff>, <enderio:itemRodOfReturn>, uraniumCapsule, netherStar, uraniumCapsule, netherStar, 500000, 100);
mods.actuallyadditions.Empowerer.addRecipe(<draconicevolution:crafting_pedestal:1>, <enderio:blockTelePad>, frankEndeSkul, <draconicevolution:reactor_part:4>, frankEndeSkul, <draconicevolution:reactor_part:4>, 500000, 600);
