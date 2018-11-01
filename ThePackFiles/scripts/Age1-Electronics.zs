val wax = <forestry:beeswax>;
val tubeCopper = <forestry:thermionicTubes>;
val tubeTin = <forestry:thermionicTubes:1>;
val tubeBronze = <forestry:thermionicTubes:2>;
val tubeIron = <forestry:thermionicTubes:3>;
val tubeGold = <forestry:thermionicTubes:4>;
val tubeDiamant = <forestry:thermionicTubes:5>;
val tubeObsidian = <forestry:thermionicTubes:6>;
val tubeBlazing = <forestry:thermionicTubes:7>;
val tubeEmerald = <forestry:thermionicTubes:9>;
val tubeAppatite = <forestry:thermionicTubes:10>;
val tubeLapis = <forestry:thermionicTubes:11>;
val tubeEnd = <forestry:thermionicTubes:12>;

val oreBeeComb = <ore:beeComb>;

val casingWood = <actuallyadditions:blockMisc:4>;
val trStick = <ore:stickTreatedWood>;
val stGear = <ore:gearStone>;
val plank = <ore:plankWood>;
val gearBronze = <ore:gearBronze>;
val plateAlu = <ore:plateAluminum>;
val plateCopper = <ore:plateCopper>;
val plateTin = <ore:plateTin>;
val plateIron = <ore:plateIron>;
val plateTitan = <ore:plateTitanium>;
val plateTitAlu = <ore:plateTitaniumAluminide>;
val plateTitIri = <ore:plateTitaniumIridium>;

val FCi0 = <forestry:chipsets>.withTag({T: 0 as short});
val FCi1 = <forestry:chipsets:1>.withTag({T: 1 as short});
val FCi2 = <forestry:chipsets:2>.withTag({T: 2 as short});
val FCi3 = <forestry:chipsets:3>.withTag({T: 3 as short});

val ingot = <immersiveengineering:metal:6>;
val rsDust = <minecraft:redstone>;
val ioSi = <enderio:itemMaterial>;

val ARCi0 = <advancedrocketry:ic:3>;
val ARCi1 = <advancedrocketry:ic:4>;
val ARCi2 = <advancedrocketry:ic:5>;

val gearBoxIron = <immersiveengineering:material:8>;
val gearBox = <immersiveengineering:material:9>;
val IECopperCoil = <immersiveengineering:metalDecoration0>;
val IEElectrumCoil = <immersiveengineering:metalDecoration0:1>;
val IESteelCoil = <immersiveengineering:metalDecoration0:2>;
val IERedstone = <immersiveengineering:metalDecoration0:3>;
val IELight = <immersiveengineering:metalDecoration0:4>;
val IEHeavy = <immersiveengineering:metalDecoration0:5>;
val IEGenerator = <immersiveengineering:metalDecoration0:6>;
val IERadiator = <immersiveengineering:metalDecoration0:7>;

val steelRod = <ore:stickSteel>;
val ironRod = <ore:stickIron>;
val aluRod = <ore:stickAluminum>;
val coil1 = <immersiveengineering:wirecoil>;
val coil2 = <immersiveengineering:wirecoil:1>;
val coil3 = <immersiveengineering:wirecoil:2>;
val plateSteel = <ore:plateSteel>;
val gearSteel = <ore:gearSteel>;
val gearCopper = <ore:gearCopper>;

val gearSoft = <ore:gearSoft>;
val gearHard = <ore:gearHard>;

val ocTrans = <opencomputers:material:7>;
val ocChip1 = <opencomputers:material:8>;
val ocChip2 = <opencomputers:material:9>;
val ocChip3 = <opencomputers:material:10>;

// EL Tubes - From TFab
recipes.addShapeless(<morebees:emeraldFragment>*9, [<ore:gemEmerald>]);

mods.forestry.ThermionicFabricator.removeCast(tubeCopper*4);
mods.forestry.ThermionicFabricator.addCast(tubeCopper*2, [[null, <ore:nuggetCopper>, null], [rsDust, <ore:nuggetCopper>, rsDust], [ioSi, ingot, ioSi]], 250, null);
mods.forestry.ThermionicFabricator.removeCast(tubeTin*4);
mods.forestry.ThermionicFabricator.addCast(tubeTin*2, [[null, <libvulpes:productnugget:5>, null], [rsDust, <libvulpes:productnugget:5>, rsDust], [ioSi, ingot, ioSi]], 250, null);
mods.forestry.ThermionicFabricator.removeCast(tubeBronze*4);
mods.forestry.ThermionicFabricator.addCast(tubeBronze*4, [[null, <ore:nuggetBronze>, null], [rsDust, <ore:nuggetBronze>, rsDust], [ioSi, ingot, ioSi]], 1500, null);
mods.forestry.ThermionicFabricator.removeCast(tubeIron*4);
mods.forestry.ThermionicFabricator.addCast(tubeIron*2, [[null, <ore:nuggetIron>, null], [rsDust, <ore:nuggetIron>, rsDust], [ioSi, ingot, ioSi]], 250, null);
mods.forestry.ThermionicFabricator.removeCast(tubeGold*4);
mods.forestry.ThermionicFabricator.addCast(tubeGold*2, [[null, <ore:nuggetGold>, null], [rsDust, <ore:nuggetGold>, rsDust], [ioSi, ingot, ioSi]], 250, null);
mods.forestry.ThermionicFabricator.removeCast(tubeDiamant*4);
mods.forestry.ThermionicFabricator.addCast(tubeDiamant*2, [[null, <ore:nuggetDiamond>, null], [rsDust, <ore:nuggetDiamond>, rsDust], [ioSi, ingot, ioSi]], 250, null);
mods.forestry.ThermionicFabricator.removeCast(tubeObsidian*4);
mods.forestry.ThermionicFabricator.addCast(tubeObsidian*3, [[null, <ore:dustObsidian>, null], [rsDust, <ore:dustObsidian>, rsDust], [ioSi, ingot, ioSi]], 500, null);
mods.forestry.ThermionicFabricator.removeCast(tubeBlazing*4);
mods.forestry.ThermionicFabricator.addCast(tubeBlazing*3, [[null, <ore:itemBlazePowder>, null], [rsDust, <ore:itemBlazePowder>, rsDust], [ioSi, ingot, ioSi]], 500, null);
mods.forestry.ThermionicFabricator.removeCast(tubeEmerald*4);
mods.forestry.ThermionicFabricator.addCast(tubeEmerald*2, [[null, <ore:nuggetEmerald>, null], [rsDust, <ore:nuggetEmerald>, rsDust], [ioSi, ingot, ioSi]], 250, null);
mods.forestry.ThermionicFabricator.removeCast(tubeAppatite*4);
mods.forestry.ThermionicFabricator.addCast(tubeAppatite*2, [[null, <forestry:fertilizerCompound>, null], [rsDust, <forestry:fertilizerCompound>, rsDust], [ioSi, ingot, ioSi]], 250, null);
mods.forestry.ThermionicFabricator.removeCast(tubeLapis*4);
mods.forestry.ThermionicFabricator.addCast(tubeLapis*4, [[null, <ore:gemLapis>, null], [rsDust, <ore:gemLapis>, rsDust], [ioSi, ingot, ioSi]], 500, null);
mods.forestry.ThermionicFabricator.removeCast(tubeEnd*4);
mods.forestry.ThermionicFabricator.addCast(tubeEnd*2, [[null, <ore:itemEnderCrystalPowder>, null], [rsDust, <ore:itemEnderCrystalPowder>, rsDust], [ioSi, ingot, ioSi]], 500, null);

// EL Tubes - From Smeltery
oreBeeComb.add(<harvestcraft:waxcombitem>);

recipes.addShapeless(<forestry:beeswax>, [<ore:toolPot>, oreBeeComb]);
recipes.addShapeless(<forestry:beeswax>, [oreBeeComb, oreBeeComb, oreBeeComb]);
mods.tconstruct.Casting.addTableRecipe(tubeCopper, <liquid:copper> * 288, <forestry:waxCast>, true, 60);
mods.tconstruct.Casting.addTableRecipe(tubeTin, <liquid:tin> * 288, <forestry:waxCast>, true, 60);

// Gears and cast
recipes.remove(<forestry:gearBronze>);
recipes.remove(<forestry:gearCopper>);
recipes.remove(<forestry:gearTin>);

mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <liquid:gold> * 288, <enderio:itemMachinePart:1>, true, 60);
mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <liquid:alubrass> * 144, <enderio:itemMachinePart:1>, true, 40);
mods.tconstruct.Casting.addTableRecipe(<tconstruct:cast_custom:4>, <liquid:brass> * 144, <enderio:itemMachinePart:1>, true, 20);

// Wooden casing, carpenter and fabricator
recipes.remove(casingWood);
recipes.addShaped(casingWood, [[trStick, plank, trStick],[plank, stGear, plank], [trStick, plank, trStick]]);

recipes.remove(<forestry:carpenter>);
recipes.remove(<forestry:fabricator>);
recipes.addShaped(<forestry:carpenter>, [[tubeCopper, gearBronze, tubeCopper],[plateAlu, casingWood, plateAlu], [trStick, <ore:chest>, trStick]]);
recipes.addShaped(<forestry:fabricator>, [[tubeTin, gearBronze, tubeTin],[plateAlu, casingWood, plateAlu], [trStick, <tconstruct:seared_tank:1>, trStick]]);

// Forestry circuits
mods.forestry.Carpenter.removeRecipe(FCi0, <liquid:water>);
mods.forestry.Carpenter.removeRecipe(FCi1, <liquid:water>);
mods.forestry.Carpenter.removeRecipe(FCi2, <liquid:water>);
mods.forestry.Carpenter.removeRecipe(FCi3, <liquid:water>);

mods.forestry.Carpenter.addRecipe(FCi0, [[null, rsDust, null], [tubeCopper, tubeTin, tubeCopper], [ioSi, <ore:plateTin>, ioSi]], 20, <liquid:eezo_fluid> * 500, <forestry:waxCast>);
mods.forestry.Carpenter.addRecipe(FCi1, [[null, rsDust, null], [tubeBronze, tubeLapis, tubeBronze], [ioSi, plateCopper, ioSi]], 20, <liquid:eezo_fluid> * 500, <forestry:waxCast>);
mods.forestry.Carpenter.addRecipe(FCi2, [[null, rsDust, null], [tubeIron, tubeDiamant, tubeIron], [ioSi, <ore:plateIron>, ioSi]], 20, <liquid:eezo_fluid> * 500, <forestry:waxCast>);
mods.forestry.Carpenter.addRecipe(FCi3, [[null, rsDust, null], [tubeGold, tubeEmerald, tubeGold], [ioSi, <ore:plateGold>, ioSi]], 20, <liquid:eezo_fluid> * 500, <forestry:waxCast>);

mods.forestry.Carpenter.addRecipe(FCi0, [[null, rsDust, null], [ocTrans, tubeTin, ocTrans], [ioSi, <ore:plateTin>, ioSi]], 20, <liquid:eezo_fluid> * 200, <forestry:waxCast>);
mods.forestry.Carpenter.addRecipe(FCi1, [[null, rsDust, null], [ocTrans, tubeLapis, ocTrans], [ioSi, plateCopper, ioSi]], 20, <liquid:eezo_fluid> * 200, <forestry:waxCast>);
mods.forestry.Carpenter.addRecipe(FCi2, [[null, rsDust, null], [ocTrans, tubeDiamant, ocTrans], [ioSi, <ore:plateIron>, ioSi]], 20, <liquid:eezo_fluid> * 200, <forestry:waxCast>);
mods.forestry.Carpenter.addRecipe(FCi3, [[null, rsDust, null], [ocTrans, tubeEmerald, ocTrans], [ioSi, <ore:plateGold>, ioSi]], 20, <liquid:eezo_fluid> * 200, <forestry:waxCast>);

// IO Silicon
mods.forestry.ThermionicFabricator.addCast(ioSi, [[null, null, null], [null, <minecraft:clay_ball>, null], [null, <minecraft:clay_ball>, null]], 10, null);
mods.immersiveengineering.Crusher.addRecipe(<minecraft:clay_ball> * 2, <minecraft:clay>, 1000, ioSi * 2, 0.8);
mods.actuallyadditions.Crusher.addRecipe(<minecraft:clay>, <minecraft:clay_ball> * 2, ioSi * 2, 80);

// AR Circuits
recipes.remove(ARCi0);
recipes.remove(ARCi1);
recipes.remove(ARCi2);
mods.forestry.Carpenter.addRecipe(ARCi0, [[ioSi, tubeObsidian, ioSi], [tubeGold, FCi3, tubeGold], [tubeObsidian, <ore:ingotNiob>, tubeObsidian]], 20, <liquid:eezo_fluid> * 1000, <forestry:waxCast>);
mods.forestry.Carpenter.addRecipe(ARCi1, [[ioSi, tubeBronze, ioSi], [tubeGold, FCi2, tubeGold], [tubeBronze, <ore:ingotNiob>, tubeBronze]], 20, <liquid:eezo_fluid> * 1000, <forestry:waxCast>);
mods.forestry.Carpenter.addRecipe(ARCi2, [[ioSi, tubeLapis, ioSi], [tubeGold, FCi2, tubeGold], [tubeLapis, <ore:ingotNiob>, tubeLapis]], 20, <liquid:eezo_fluid> * 1000, <forestry:waxCast>);

// IE Techs
gearSoft.addAll(<ore:gearCopper>);
gearSoft.addAll(<ore:gearBronze>);
gearSoft.addAll(<ore:gearBrass>);
gearSoft.addAll(<ore:gearIron>);
gearHard.addAll(<ore:gearSteel>);
gearHard.addAll(<ore:gearInvar>);
gearHard.addAll(<ore:gearTitanium>);
gearHard.addAll(<ore:gearTitaniumAluminide>);
gearHard.addAll(<ore:gearTitaniumIridium>);

recipes.remove(<libvulpes:productgear:6>);
recipes.remove(gearBoxIron);
recipes.remove(gearBox);
recipes.addShaped(gearBoxIron, [[null, aluRod, null], [ironRod, gearBronze, ironRod], [null, gearSoft, null]]);
recipes.addShaped(gearBoxIron, [[null, aluRod, null], [ironRod, <ore:gearBrass>, ironRod], [null, gearSoft, null]]);
recipes.addShaped(gearBox, [[null, steelRod, null], [plateAlu, gearSteel, plateAlu], [null, gearHard, null]]);

recipes.remove(<immersiveengineering:metalDecoration0:*>);
recipes.addShaped(IECopperCoil * 2, [[coil1, coil1, coil1], [coil1, ironRod, coil1], [coil1, coil1, coil1]]);
recipes.addShaped(IEElectrumCoil * 2, [[coil2, coil2, coil2], [coil2, steelRod, coil2], [coil2, coil2, coil2]]);
recipes.addShaped(IESteelCoil * 2, [[coil3, coil3, coil3], [coil3, steelRod, coil3], [coil3, coil3, coil3]]);

recipes.addShaped(IERedstone * 2, [[plateSteel, plateAlu, plateSteel], [tubeCopper, FCi3, tubeTin], [plateSteel, gearBox, plateSteel]]);
recipes.addShaped(IELight * 2, [[plateAlu, plateSteel, plateAlu], [tubeIron, gearBox, tubeIron], [plateAlu, trStick, plateAlu]]);
recipes.addShaped(IEHeavy * 2, [[plateSteel, plateAlu, plateSteel], [gearBox, ARCi0, gearBox], [plateSteel, gearSteel, plateSteel]]);
recipes.addShaped(IEGenerator * 2, [[plateAlu, gearBox, plateAlu], [IESteelCoil, gearBox, IESteelCoil], [plateSteel, ARCi1, plateSteel]]);
recipes.addShaped(IERadiator * 2, [[plateCopper, plateCopper, plateCopper], [IECopperCoil, <tconstruct:seared_tank:1>, IECopperCoil], [plateSteel, ARCi2, plateSteel]]);

// AR OC recipes
recipes.remove(ocTrans);
recipes.remove(ocChip1);
recipes.remove(ocChip2);
recipes.remove(ocChip3);

mods.forestry.Carpenter.addRecipe(ARCi0, [[ioSi, ocTrans, ioSi], [ocTrans, ocChip2, ocTrans], [<ore:dustObsidian>, <ore:ingotNiob>, <ore:dustObsidian>]], 20, <liquid:eezo_fluid> * 1000, <forestry:waxCast>);
mods.forestry.Carpenter.addRecipe(ARCi1, [[ioSi, <ore:ingotBronze>, ioSi], [ocTrans, ocChip1, ocTrans], [<ore:nuggetGold>, <ore:ingotNiob>, <ore:nuggetGold>]], 20, <liquid:eezo_fluid> * 1000, <forestry:waxCast>);
mods.forestry.Carpenter.addRecipe(ARCi2, [[ioSi, <ore:gemLapis>, ioSi], [ocTrans, ocChip1, ocTrans], [<ore:nuggetGold>, <ore:ingotNiob>, <ore:nuggetGold>]], 20, <liquid:eezo_fluid> * 1000, <forestry:waxCast>);

// IE blocks using OC electronics
recipes.addShaped(IERedstone * 2, [[plateSteel, plateAlu, plateSteel], [ocTrans, ocChip2, ocTrans], [plateSteel, gearBox, plateSteel]]);
recipes.addShaped(IELight * 2, [[plateAlu, plateSteel, plateAlu], [ocTrans, gearBox, ocTrans], [plateAlu, trStick, plateAlu]]);

// Magma, needed for nitronite:
mods.forestry.Squeezer.addRecipe(<liquid:magma_fluid> * 100, [<minecraft:magma>], 200);

val boardRaw = <opencomputers:material:3>;
val boardPrinted = <opencomputers:material:5>;
val ui = <advancedrocketry:misc>;
val lens = <advancedrocketry:lens>;

recipes.remove(boardRaw);
// furnace.remove(boardPrinted); - not needed since it is off in mod setting

recipes.remove(ui);
mods.forestry.ThermionicFabricator.addCast(ui, [[null, null, null], [lens, lens, lens], [tubeIron, FCi0, tubeIron]], 250, null);

// OC Components - mostly moved to Precision Assembler

// Card Base
recipes.remove(<opencomputers:material:6>);
// Screens (2 and 3 in Prec. Assembler)
recipes.remove(<opencomputers:screen1>);
recipes.addShaped(<opencomputers:screen1>, [[null, null, lens], [ocChip1, <ore:blockSheetmetalAluminum>, lens], [ocChip1, <ore:slabSheetmetalAluminum>, lens]]);
recipes.remove(<opencomputers:screen2>);
recipes.remove(<opencomputers:screen3>);

// Cases
recipes.remove(<opencomputers:case1>);
recipes.remove(<opencomputers:case2>);
recipes.remove(<opencomputers:case3>);
recipes.addShaped(<opencomputers:case1>, [[ocChip1, ocChip1, ocChip1], [plateAlu, <ore:blockSheetmetalAluminum>, plateAlu], [<ore:slabSheetmetalAluminum>, boardPrinted, <ore:slabSheetmetalAluminum>]]);
recipes.addShaped(<opencomputers:case2>, [[ocChip2, ocChip2, ocChip2], [plateTitAlu, <ore:blockSheetmetalAluminum>, plateTitAlu], [boardPrinted, <ore:slabSheetmetalAluminum>, boardPrinted]]);
recipes.addShaped(<opencomputers:case3>, [[ocChip3, ocChip3, ocChip3], [plateTitIri, <ore:blockSheetmetalAluminum>, plateTitIri], [boardPrinted, boardPrinted, boardPrinted]]);
// Controll Units, moved to PrecAss
recipes.remove(<opencomputers:material:11>);
recipes.remove(<opencomputers:material:12>);

// AR Holoprojector
val projector = <libvulpes:holoProjector>;

recipes.remove(projector);
mods.forestry.Carpenter.addRecipe(projector, [[<ore:nuggetGold>, lens, null], [ocTrans, ocChip2, null], [ocTrans, ui, null]], 20, <liquid:eezo_fluid> * 1000, <railcraft:plate:9>);
mods.forestry.Carpenter.addRecipe(projector, [[<ore:nuggetGold>, lens, null], [FCi2, FCi3, null], [FCi2, ui, null]], 20, <liquid:eezo_fluid> * 4000, <railcraft:plate:9>);

// AR Basic construction
val ARBlock = <libvulpes:structureMachine>;
val ARBlockItemsIn = <libvulpes:hatch>;
val ARBlockItemsOut = <libvulpes:hatch:1>;
val ARBlockFluidIn = <libvulpes:hatch:2>;
val ARBlockFluidOut = <libvulpes:hatch:3>;
val ARBlockPowerIn = <libvulpes:forgePowerInput>;
val ARBlockPowerOut = <libvulpes:forgePowerOutput>;
val ARBlockData = <advancedrocketry:loader>;

recipes.remove(ARBlock);
recipes.remove(ARBlockPowerIn);
recipes.remove(ARBlockPowerOut);
recipes.remove(<libvulpes:hatch:*>);
recipes.remove(ARBlockData);
recipes.addShaped(ARBlock * 3, [[steelRod, gearBox, steelRod], [null, <ore:blockSheetmetalAluminum>, null], [steelRod, FCi1, steelRod]]);
recipes.addShaped(ARBlock * 4, [[steelRod, gearBox, steelRod], [null, <ore:blockSheetmetalAluminum>, null], [steelRod, ocChip1, steelRod]]);
recipes.addShaped(ARBlockItemsIn, [[plateTin, null, plateTin], [tubeCopper, ARBlock, tubeCopper], [plateCopper, <minecraft:hopper>, plateCopper]]);
recipes.addShaped(ARBlockFluidIn, [[plateTin, <ore:ingotImperomite>, plateTin], [tubeLapis, ARBlock, tubeLapis], [plateCopper, <immersiveengineering:metalDevice1:6>, plateCopper]]);
recipes.addShaped(ARBlockItemsIn, [[plateTin, null, plateTin], [ocTrans, ARBlock, ocTrans], [plateCopper, <minecraft:hopper>, plateCopper]]);
recipes.addShaped(ARBlockFluidIn, [[plateTin, <ore:ingotImperomite>, plateTin], [ocTrans, ARBlock, ocTrans], [plateCopper, <immersiveengineering:metalDevice1:6>, plateCopper]]);
recipes.addShaped(ARBlockPowerIn, [[plateTin, <immersiveengineering:connector:2>, plateTin], [coil2, ARBlock, coil2], [coil2, IEElectrumCoil, coil2]]);
recipes.addShapeless(ARBlockItemsIn, [ARBlockItemsOut]);
recipes.addShapeless(ARBlockItemsOut, [ARBlockItemsIn]);
recipes.addShapeless(ARBlockFluidIn, [ARBlockFluidOut]);
recipes.addShapeless(ARBlockFluidOut, [ARBlockFluidIn]);
recipes.addShapeless(ARBlockPowerIn, [ARBlockPowerOut]);
recipes.addShapeless(ARBlockPowerOut, [ARBlockPowerIn]);
recipes.addShapeless(ARBlockData, [ARBlockPowerIn, <advancedrocketry:dataPipe>, ARCi0, <opencomputers:material:5>]);

// Clockwork engine
val CWEngine = <forestry:engine_clockwork>;
val trPlank = <ore:plankTreatedWood>;

recipes.remove(CWEngine);
recipes.addShaped(CWEngine, [[trPlank, trPlank, trPlank], [null, <ore:blockGlassColorless>, null], [tubeCopper, <minecraft:piston>, tubeTin]]);

// Kynetic dynamo
val kyneticDynamo = <immersiveengineering:metalDevice1:2>;
val aluScaff = <immersiveengineering:metalDecoration1:5>;
recipes.remove(kyneticDynamo);
recipes.addShaped(kyneticDynamo, [[plateIron, plateCopper, plateIron], [ironRod, gearBoxIron, plateIron], [aluScaff, IECopperCoil, aluScaff]]);

// Oil generator
val oilGenerator = <actuallyadditions:blockOilGenerator>;
val steelScaff = <immersiveengineering:metalDecoration1:1>;
val barrel = <immersiveengineering:metalDevice0:4>;
val MVconn = <immersiveengineering:connector:2>;
val AAcoil1 = <actuallyadditions:itemMisc:7>;

recipes.remove(oilGenerator);
recipes.addShaped(oilGenerator, [[MVconn, AAcoil1, MVconn], [steelScaff, gearBox, steelScaff], [barrel, IEElectrumCoil, barrel]]);

// Gadgets
val experienceRod = <enderio:itemXpTransfer>;
val experienceSolidifier = <actuallyadditions:blockXPSolidifier>;
val elMagnet = <enderio:itemMagnet>;
val chLoader1 = <railcraft:worldspike:1>;
val chLoader2 = <railcraft:worldspike:2>;
val chLoader3 = <railcraft:worldspike:3>;
val chLoaderAdd = <railcraft:worldspike_point>;
val handFiller = <actuallyadditions:itemFillingWand>;
val leafBlower = <actuallyadditions:itemLeafBlower>;

val infCrystal = <advancedrocketry:crystal:4>;
val battery = <actuallyadditions:itemBattery>;
val obsPlate = <tconstruct:large_plate>.withTag({Material: "obsidian"});
val handle = <immersiveengineering:material:13>;
// Experience handling
recipes.remove(experienceSolidifier);
recipes.addShaped(experienceSolidifier, [[null, <actuallyadditions:blockSmileyCloud>, null], [gearBronze, casingWood, gearBronze], [aluScaff, <tconstruct:metal:5>, aluScaff]]);

recipes.remove(experienceRod);
recipes.addShaped(experienceRod, [[null, tubeEmerald, infCrystal], [tubeEmerald, <ore:ingotAbyssum>, tubeEmerald], [infCrystal, tubeEmerald, null]]);

// Magnet
recipes.remove(elMagnet);
recipes.addShaped(elMagnet, [[coil1, battery, coil1], [ironRod, null, ironRod], [null, null, null]]);

// SpotLoader
recipes.remove(chLoader1);
recipes.addShaped(chLoader1, [[null, tubeDiamant, null], [obsPlate, <ore:blockPrismarine>, obsPlate], [obsPlate, <actuallyadditions:blockSmileyCloud>, obsPlate]]);
recipes.remove(chLoader2);
recipes.addShaped(chLoader2, [[null, tubeDiamant, null], [obsPlate, <ore:gemEmerald>, obsPlate], [obsPlate, <actuallyadditions:blockSmileyCloud>, obsPlate]]);
recipes.remove(chLoader3);
recipes.addShaped(chLoader3, [[null, tubeDiamant, null], [obsPlate, <ore:gemDiamond>, obsPlate], [obsPlate, <actuallyadditions:blockSmileyCloud>, obsPlate]]);
recipes.remove(chLoaderAdd);
recipes.addShaped(chLoaderAdd, [[null, tubeDiamant, null], [null, <ore:gemDiamond>, null], [obsPlate, <ore:ingotGold>, obsPlate]]);

recipes.addShapeless(<railcraft:dust:3>, [<immersiveengineering:tool>.reuse(), <ore:charCoal>]);


// Handheld Filler
recipes.remove(handFiller);
recipes.addShaped(handFiller, [[null, tubeObsidian, null], [<ore:plateGold>, infCrystal, <ore:plateGold>], [handle, battery, handle]]);

// Leaf Blower
recipes.remove(leafBlower);
recipes.addShaped(leafBlower, [[tubeCopper, tubeCopper, null], [battery, gearBoxIron, <immersiveengineering:material:14>], [handle, null, null]]);

// Centrifuge and fermenter

val barrelWood = <immersiveengineering:woodenDevice0:1>;

recipes.remove(<forestry:centrifuge>);
recipes.remove(<forestry:fermenter>);
recipes.addShaped(<forestry:centrifuge>, [[tubeIron, barrel, tubeIron],[plateAlu, casingWood, plateAlu], [aluScaff, gearBoxIron, aluScaff]]);
recipes.addShaped(<forestry:fermenter>, [[tubeBronze, barrelWood, tubeBronze],[plateAlu, casingWood, plateAlu], [aluScaff, <tconstruct:seared_tank:1>, aluScaff]]);

// Creosole
furnace.remove(<railcraft:fluid_bottle_creosote>);

// Steel
// Blast Furnace
val brickBlock = <minecraft:brick_block>;
val lavaWood = <tconstruct:firewood>;
val furnaceBricks = <advancedrocketry:blastBrick>;
val basalt = <taiga:basalt_ingot>;
val saltpeter = <railcraft:dust:2>;
val blastBrick = <immersiveengineering:stoneDecoration:1>;
val arcFurnace = <advancedrocketry:arcFurnace>;
val abyssal = <railcraft:brick_abyssal:2>;
val ingotSteel = <railcraft:ingot>;
val oreingotSteel = <ore:ingotSteel>;


val coalCoke1 = <immersiveengineering:stoneDecoration:3>;
val coalCoke2 = <railcraft:generic:6>;


recipes.remove(furnaceBricks);
recipes.addShaped(furnaceBricks*2, [[basalt, brickBlock, basalt],[brickBlock, lavaWood, brickBlock], [basalt, brickBlock, basalt]]);
recipes.remove(arcFurnace);
recipes.addShaped(arcFurnace, [[basalt, furnaceBricks, basalt],[furnaceBricks, <minecraft:furnace>, furnaceBricks], [gearBronze, FCi0, gearBronze]]);
recipes.addShaped(arcFurnace, [[basalt, furnaceBricks, basalt],[furnaceBricks, <minecraft:furnace>, furnaceBricks], [gearBronze, ocChip1, gearBronze]]);
recipes.remove(blastBrick);
recipes.addShaped(blastBrick, [[saltpeter, abyssal, saltpeter],[abyssal, furnaceBricks, abyssal], [saltpeter, abyssal, saltpeter]]);

mods.tconstruct.Casting.addTableRecipe(ingotSteel, <liquid:iron> * 576, coalCoke1, true, 3600);
mods.tconstruct.Casting.addTableRecipe(ingotSteel, <liquid:iron> * 576, coalCoke2, true, 3600);

// Wind and WaterPower
val wheelSegment = <immersiveengineering:material:10>;
recipes.remove(wheelSegment);
recipes.addShaped(wheelSegment, [[trStick, trPlank, trStick], [trPlank, oreingotSteel, trPlank], [trStick, trPlank, trStick]]);

// Steel Sheet Metal
val dustObsidiorite = <ore:dustObsidiorite>;
recipes.remove(<ore:blockSheetmetalSteel>);
recipes.addShaped(<immersiveengineering:sheetmetal:8>*4, [[plateSteel, dustObsidiorite, plateSteel], [dustObsidiorite, <ore:blockManyullyn>, dustObsidiorite], [plateSteel, dustObsidiorite, plateSteel]]); 

// Lantern, Lamp and cloche
var lantern = <immersiveengineering:metalDecoration2:4>;

recipes.remove(lantern);
recipes.remove(<immersiveengineering:metalDevice1:13>);
mods.forestry.Carpenter.addRecipe(lantern*2, [[<ore:nuggetIron>, lens, <ore:nuggetIron>], [lens, <ore:candle>, lens], [<ore:nuggetIron>, <minecraft:bowl>, <ore:nuggetIron>]], 20, <liquid:seed.oil> * 200, null);
recipes.addShaped(<immersiveengineering:metalDevice1:13>, [[lantern, MVconn, lantern], [lens, gearBox, lens], [trPlank, <gendustry:MutagenTank>, trPlank]]);

var torEndHead = <enderio:itemFrankenSkull:4>;
var basicDECore = <draconicevolution:draconic_core>;
mods.actuallyadditions.Empowerer.addRecipe(<minecraft:enchanting_table>, <minecraft:end_portal_frame>, torEndHead, basicDECore, torEndHead, basicDECore, 750000, 1200, 0, 0, 0);

// Crushing Obsidian
mods.actuallyadditions.Crusher.addRecipe(<minecraft:obsidian>, <enderio:itemPowderIngot:7>*3, <enderio:itemPowderIngot:7>*1, 25);

// Backward compatibility - AA to Electronics
// PCB from empowered palis
// CU from empoweed restonia
// ALU from empowered enori