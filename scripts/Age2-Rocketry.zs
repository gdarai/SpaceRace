// Disabled
recipes.remove(<advancedrocketry:concrete>);

// Variables
val glowstone = <minecraft:glowstone_dust>;
val redstone = <minecraft:redstone>;
val daySensor = <minecraft:daylight_detector>;
val hiTechDoor = <malisisdoors:hitechdoor>;
val ioSi = <enderio:itemMaterial>;
val tubeEmerald = <forestry:thermionicTubes:9>;
val tubeDiamant = <forestry:thermionicTubes:5>;
val tubeBlazing = <forestry:thermionicTubes:7>;
val tubeGold = <forestry:thermionicTubes:4>;
val searedTank = <tconstruct:seared_tank:1>;
val piston = <minecraft:piston>;
val blazeRod = <ore:itemBlazeRod>;
val binder = <enderio:itemMaterial:1>;
val glass= <ore:blockGlass>;

val dustMeteorite = <ore:dustMeteorite>;

val ocTrans = <opencomputers:material:7>;
val ocChip1 = <opencomputers:material:8>;
val ocChip2 = <opencomputers:material:9>;
val ocChip3 = <opencomputers:material:10>;
val ocRemote = <opencomputers:tool:2>;
val ocPCB = <opencomputers:material:5>;

val rodSteel = <ore:stickSteel>;
val rodIron = <ore:stickIron>;
val bars = <minecraft:iron_bars>;
val plateAlu = <ore:plateAluminum>;
val plateCopper = <ore:plateCopper>;
val plateGold = <ore:plateGold>;
val plateTin = <ore:plateTin>;
val plateIron = <ore:plateIron>;
val plateSteel = <ore:plateSteel>;
val plateIri = <ore:plateIridium>;
val plateTitan = <ore:plateTitanium>;
val plateSilicon = <ore:plateSilicon>;

val scaffAlu = <immersiveengineering:metalDecoration1:5>;
val scaffSteel = <immersiveengineering:metalDecoration1:1>;

val IECopperCoil = <immersiveengineering:metalDecoration0>;
val IEElectrumCoil = <immersiveengineering:metalDecoration0:1>;
val IESteelCoil = <immersiveengineering:metalDecoration0:2>;

val SheetBlockGold = <ore:blockSheetmetalGold>;
val SheetSlabGold = <ore:slabSheetmetalGold>;
val SheetBlockCopper = <ore:blockSheetmetalCopper>;
val SheetBlockSteel = <ore:blockSheetmetalSteel>;
val SheetBlockAlu = <ore:blockSheetmetalAluminum>;
val SheetSlabNickel = <ore:slabSheetmetalNickel>;
val SheetSlabConstantan = <ore:slabSheetmetalConstantan>;
val SheetIron = <libvulpes:productsheet:1>;
val SheetCopper = <libvulpes:productsheet:4>;
val SheetSteel = <libvulpes:productsheet:6>;
val SheetAlu = <libvulpes:productsheet:9>;
val SheetTitIri = <advancedrocketry:productsheet:1>;
val SheetTitan = <libvulpes:productsheet:7>;

val ARCoilGold = <libvulpes:coil0:2>;
val ARCoilCopper = <libvulpes:coil0:4>;
val ARCoilAlu = <libvulpes:coil0:9>;
val ARCoilIridium = <libvulpes:coil0:10>;
val ARCoilTitan = <libvulpes:coil0:7>;

val gearBronze = <ore:gearBronze>;
val gearSteel = <ore:gearSteel>;
val gearIron = <ore:gearIron>;
val gearTitan = <ore:gearTitanium>;

val gearBoxIron = <immersiveengineering:material:8>;
val gearBoxSteel = <immersiveengineering:material:9>;

val IENozzle = <immersiveengineering:toolupgrade:7>;
val IEPump = <immersiveengineering:metalDevice0:5>;
val IELightBlock = <immersiveengineering:metalDecoration0:4>;
val IEHeavyBlock = <immersiveengineering:metalDecoration0:5>;
val IEFabric = <immersiveengineering:material:5>;
val IRRope = <immersiveengineering:wirecoil:3>;

val motorBasic = <libvulpes:motor>;
val motorAdvanced = <libvulpes:advancedMotor>;
val motorEnhanced = <libvulpes:enhancedMotor>;
val motorElite = <libvulpes:eliteMotor>;

val pipeLiquid = <advancedrocketry:liquidPipe>;
val pipeData = <advancedrocketry:dataPipe>;
val pipeEnergy = <advancedrocketry:energyPipe>;
val basicBlock = <libvulpes:structureMachine>;
val display = <advancedrocketry:misc>;
val ARCi0 = <advancedrocketry:ic:3>;
val ARCi1 = <advancedrocketry:ic:4>;
val ARCi2 = <advancedrocketry:ic:5>;
val rotor = <ore:fanSteel>;

val rocketTank = <advancedrocketry:fuelTank>;
val rocketEngine1 = <advancedrocketry:rocketmotor>;

val opticalSensor = <advancedrocketry:satellitePrimaryFunction>;
val blockLens = <advancedrocketry:blockLens>;

val circuitBasic = <advancedrocketry:ic>;
val circuitAdanced = <advancedrocketry:ic:2>;

val diamondHead = <railcraft:borehead_diamond>;
val satSolarPanel = <advancedrocketry:satellitePowerSource>;
val lightTank = <advancedrocketry:pressureTank>;
val medTank = <advancedrocketry:pressureTank:1>;
val advancedTank = <advancedrocketry:liquidTank>;

val airSeal = <bqmie:icon_item:24>;
val solarCell = <powersuits:powerArmorComponent:18>;

// AR Cables - Moved to Precission Assembler
recipes.remove(pipeLiquid);
recipes.remove(pipeData);
recipes.remove(pipeEnergy);

// AR Coils
recipes.remove(ARCoilCopper);
recipes.remove(ARCoilGold);
recipes.remove(ARCoilAlu);
recipes.remove(ARCoilTitan);
recipes.remove(ARCoilIridium);
recipes.addShaped(ARCoilCopper, [[SheetBlockCopper, SheetCopper, SheetBlockCopper], [SheetCopper, IECopperCoil, SheetCopper], [SheetBlockCopper, SheetCopper, SheetBlockCopper]]);
recipes.addShaped(ARCoilGold, [[SheetBlockGold, SheetIron, SheetBlockGold], [SheetIron, IECopperCoil, SheetIron], [SheetBlockGold, SheetIron, SheetBlockGold]]);
mods.forestry.Carpenter.addRecipe(ARCoilAlu, [[SheetBlockAlu, SheetAlu, SheetBlockAlu], [SheetAlu, IEElectrumCoil, SheetAlu], [SheetBlockAlu, SheetAlu, SheetBlockAlu]], 120, <liquid:oil> * 1000);
mods.forestry.Carpenter.addRecipe(ARCoilTitan, [[plateTitan, SheetTitan, plateTitan], [SheetTitan, IESteelCoil, SheetTitan], [plateTitan, SheetTitan, plateTitan]], 120, <liquid:obsidiorite_fluid> * 1000);
mods.forestry.Carpenter.addRecipe(ARCoilIridium, [[plateIri, SheetTitIri, plateIri], [SheetTitIri, IESteelCoil, SheetTitIri], [plateIri, SheetTitIri, plateIri]], 120, <liquid:obsidiorite_fluid> * 2000);

// AR Navigation Chips
recipes.remove(<advancedrocketry:planetIdChip>);
recipes.remove(<advancedrocketry:spaceStationChip>);
mods.forestry.ThermionicFabricator.addCast(<advancedrocketry:planetIdChip>, [[tubeEmerald, tubeGold, tubeEmerald], [redstone, tubeGold, redstone], [ioSi, plateSilicon, ioSi]], 2000, null);
mods.forestry.ThermionicFabricator.addCast(<advancedrocketry:spaceStationChip>, [[tubeDiamant, tubeGold, tubeDiamant], [redstone, tubeGold, redstone], [ioSi, plateSilicon, ioSi]], 2000, null);

recipes.remove(<advancedrocketry:satelliteIdChip>);
recipes.remove(<advancedrocketry:asteroidChip>);
mods.forestry.ThermionicFabricator.addCast(<advancedrocketry:satelliteIdChip>, [[tubeEmerald, tubeGold, tubeEmerald], [dustMeteorite, tubeGold, dustMeteorite], [plateSilicon, ocPCB, plateSilicon]], 2000, null);
mods.forestry.ThermionicFabricator.addCast(<advancedrocketry:asteroidChip>, [[tubeDiamant, tubeGold, tubeDiamant], [dustMeteorite, tubeGold, dustMeteorite], [plateSilicon, ocPCB, plateSilicon]], 2000, null);

recipes.remove(<advancedrocketry:elevatorChip>);
mods.forestry.ThermionicFabricator.addCast(<advancedrocketry:elevatorChip>, [[tubeBlazing, tubeBlazing, tubeBlazing], [dustMeteorite, <ore:dustLapis>, dustMeteorite], [plateSilicon, ocPCB, plateSilicon]], 2000, null);

// Motors
recipes.remove(motorBasic);
recipes.remove(motorAdvanced);
recipes.remove(motorEnhanced);
recipes.remove(motorElite);
recipes.addShaped(motorBasic, [[null, ARCoilCopper, plateSteel], [IELightBlock, IELightBlock, gearSteel], [null, ARCoilCopper, plateSteel]]);
recipes.addShaped(motorAdvanced, [[null, ARCoilGold, plateSteel], [IELightBlock, IELightBlock, gearSteel], [null, ARCoilGold, plateSteel]]);
recipes.addShaped(motorEnhanced, [[null, ARCoilAlu, plateTitan], [IEHeavyBlock, IEHeavyBlock, gearTitan], [null, ARCoilAlu, plateTitan]]);
recipes.addShaped(motorElite, [[null, ARCoilTitan, plateTitan], [IEHeavyBlock, IEHeavyBlock, gearTitan], [null, ARCoilTitan, plateTitan]]);

// Rocket Components
recipes.remove(rocketTank);
recipes.remove(rocketEngine1);
recipes.remove(<advancedrocketry:seat>);
recipes.remove(<advancedrocketry:loader:1>);
recipes.remove(<advancedrocketry:loader:6>);
recipes.remove(<advancedrocketry:guidanceComputer>);
mods.forestry.Carpenter.addRecipe(rocketTank, [[IELightBlock, pipeLiquid, SheetSlabNickel], [SheetSteel, scaffAlu, SheetSteel], [SheetSlabNickel, SheetSlabNickel, SheetSlabNickel]], 120, <liquid:water> * 2000);
recipes.addShaped(rocketEngine1, [[pipeLiquid, scaffSteel, pipeLiquid], [IEPump, rocketTank, motorAdvanced], [IENozzle, IENozzle, IENozzle]]);
recipes.addShaped(<advancedrocketry:seat>, [[IRRope, null, IRRope], [IEFabric, IEFabric, IEFabric], [scaffAlu, IENozzle, scaffAlu]]);
recipes.addShaped(<advancedrocketry:loader:1>, [[hiTechDoor, hiTechDoor, hiTechDoor], [basicBlock, null, basicBlock], [scaffAlu, ARCi0, scaffAlu]]);
recipes.addShaped(<advancedrocketry:loader:6>, [[null, hiTechDoor, null], [scaffAlu, <advancedrocketry:loader>, scaffAlu], [ARCi0, basicBlock, pipeData]]);
recipes.addShaped(<advancedrocketry:guidanceComputer>, [[scaffAlu, ARCi0, scaffAlu], [ARCi0, basicBlock, display], [scaffAlu, pipeData, scaffAlu]]);

// Rocket Automation
recipes.remove(<advancedrocketry:loader:2>);
recipes.remove(<advancedrocketry:loader:3>);
recipes.remove(<advancedrocketry:loader:4>);
recipes.remove(<advancedrocketry:loader:5>);

recipes.addShaped(<advancedrocketry:loader:2>, [[gearBoxSteel, <advancedrocketry:structureTower>, null], [basicBlock, <libvulpes:hatch>, ocRemote], [scaffAlu, ARCi0, scaffAlu]]);
recipes.addShaped(<advancedrocketry:loader:4>, [[pipeLiquid, pipeLiquid, null], [basicBlock, <libvulpes:hatch:2>, ocRemote], [scaffAlu, ARCi0, scaffAlu]]);

recipes.addShapeless(<advancedrocketry:loader:2>, [<advancedrocketry:loader:3>]);
recipes.addShapeless(<advancedrocketry:loader:3>, [<advancedrocketry:loader:2>]);
recipes.addShapeless(<advancedrocketry:loader:4>, [<advancedrocketry:loader:5>]);
recipes.addShapeless(<advancedrocketry:loader:5>, [<advancedrocketry:loader:4>]);


// Basic Machines
recipes.remove(<advancedrocketry:rocketBuilder>);
recipes.remove(<advancedrocketry:fuelingStation>);
recipes.remove(<advancedrocketry:monitoringStation>);
recipes.remove(<advancedrocketry:precisionassemblingmachine>);
recipes.remove(<advancedrocketry:crystallizer>);
recipes.remove(<advancedrocketry:observatory>);
recipes.remove(<advancedrocketry:planetSelector>);
recipes.remove(<advancedrocketry:planetHoloSelector>);
recipes.remove(<advancedrocketry:satelliteControlCenter>);
recipes.remove(<advancedrocketry:planetAnalyser>);
recipes.remove(<advancedrocketry:platePress>);
recipes.remove(<advancedrocketry:stationBuilder>);
recipes.remove(<advancedrocketry:deployableRocketBuilder>);
recipes.remove(<advancedrocketry:electrolyser>);
recipes.remove(<advancedrocketry:chemicalReactor>);

recipes.addShaped(<advancedrocketry:rocketBuilder>, [[gearBronze, display, gearBronze], [ARCi0, basicBlock, ARCi0], [gearBoxSteel, motorAdvanced, gearBoxSteel]]);
recipes.addShaped(<advancedrocketry:fuelingStation>, [[pipeLiquid, display, rocketTank], [ARCi2, basicBlock, rocketTank], [scaffAlu, motorBasic, scaffAlu]]);
recipes.addShaped(<advancedrocketry:monitoringStation>, [[null, display, opticalSensor], [ARCi0, pipeData, IELightBlock], [scaffAlu, basicBlock, scaffAlu]]);
recipes.addShaped(<advancedrocketry:precisionassemblingmachine>, [[ARCi0, display, ARCi1], [basicBlock, ARCi2, basicBlock], [IELightBlock, motorAdvanced, IELightBlock]]);
recipes.addShaped(<advancedrocketry:crystallizer>, [[ARCi1, display, ARCi2], [basicBlock, ARCi0, basicBlock], [searedTank, basicBlock, searedTank]]);
recipes.addShaped(<advancedrocketry:observatory>, [[display, display, display], [basicBlock, ARCi0, basicBlock], [scaffAlu, basicBlock, scaffAlu]]);
recipes.addShaped(<advancedrocketry:planetSelector>, [[plateAlu, plateAlu, plateAlu], [pipeData, display, pipeData], [<opencomputers:case1>, basicBlock, <opencomputers:case1>]]);
recipes.addShaped(<advancedrocketry:planetHoloSelector>, [[null, <actuallyadditions:itemCrystal:2>, null], [pipeData, <opencomputers:hologram2>, pipeData], [<opencomputers:case2>, basicBlock, <opencomputers:case2>]]);
recipes.addShaped(<advancedrocketry:satelliteControlCenter>, [[opticalSensor, ocRemote, opticalSensor], [pipeData, basicBlock, pipeData], [<opencomputers:diskDrive>, <opencomputers:case2>, <opencomputers:diskDrive>]]);
recipes.addShaped(<advancedrocketry:planetAnalyser>, [[display, ocRemote, display], [pipeData, basicBlock, pipeData], [<opencomputers:diskDrive>, <opencomputers:case1>, <opencomputers:diskDrive>]]);
recipes.addShaped(<advancedrocketry:platePress>, [[<minecraft:stone>, <ore:blockInferium>, <minecraft:stone>], [rodIron, rodSteel, rodIron], [piston, piston, piston]]);
recipes.addShaped(<advancedrocketry:stationBuilder>, [[circuitBasic ,display, circuitBasic], [scaffSteel, <advancedrocketry:rocketBuilder>, scaffSteel], [IEHeavyBlock, IEHeavyBlock, IEHeavyBlock]]);
recipes.addShaped(<advancedrocketry:deployableRocketBuilder>, [[circuitAdanced ,ocRemote, circuitAdanced], [scaffSteel, <advancedrocketry:rocketBuilder>, scaffSteel], [IEHeavyBlock, IEHeavyBlock, IEHeavyBlock]]);
recipes.addShaped(<advancedrocketry:electrolyser>, [[ARCoilGold ,display, ARCoilGold], [pipeLiquid, basicBlock, pipeLiquid], [searedTank, IELightBlock, searedTank]]);
recipes.addShaped(<advancedrocketry:chemicalReactor>, [[ARCoilIridium ,ocRemote, ARCoilIridium], [pipeLiquid, basicBlock, pipeLiquid], [searedTank, IEHeavyBlock, searedTank]]);

// Oxygen and warp
recipes.remove(<advancedrocketry:oxygenScrubber>);
recipes.remove(<advancedrocketry:oxygenVent>);
recipes.remove(<advancedrocketry:carbonScrubberCartridge>);
recipes.remove(<advancedrocketry:suitWorkStation>);
recipes.remove(<advancedrocketry:oxygenCharger>);
recipes.remove(<advancedrocketry:warpCore>);
recipes.remove(<advancedrocketry:warpMonitor>);

recipes.addShaped(<advancedrocketry:oxygenScrubber>, [[bars ,bars, bars], [pipeLiquid, basicBlock, pipeLiquid], [advancedTank, rotor, advancedTank]]);
recipes.addShaped(<advancedrocketry:oxygenVent>, [[bars ,bars, bars], [rotor, basicBlock, rotor], [pipeLiquid, IELightBlock, pipeLiquid]]);
recipes.addShaped(<advancedrocketry:carbonScrubberCartridge>, [[SheetCopper ,blazeRod, SheetCopper], [SheetCopper, <ore:blockOvium>, SheetCopper], [SheetCopper, blazeRod, SheetCopper]]);

recipes.addShaped(<advancedrocketry:suitWorkStation>, [[gearBoxIron ,display, gearBoxIron], [plateTin, <bibliocraft:FancyWorkbench:6>, plateTin], [IELightBlock, IELightBlock, IELightBlock]]);
recipes.addShaped(<advancedrocketry:oxygenCharger>, [[pipeLiquid ,null, null], [pipeLiquid, SheetSlabConstantan, SheetSlabConstantan], [searedTank, IELightBlock, scaffSteel]]);
recipes.addShaped(<advancedrocketry:warpCore>, [[circuitBasic ,ARCoilAlu, circuitBasic], [SheetBlockSteel, ARCoilGold, SheetBlockSteel], [circuitBasic, ARCoilAlu, circuitBasic]]);
recipes.addShaped(<advancedrocketry:warpMonitor>, [[ARCi0 ,display, ARCi0], [circuitBasic, basicBlock, circuitBasic], [<opencomputers:case2>, SheetBlockSteel, <opencomputers:case2>]]);

// Fuel and air bottling
mods.immersiveengineering.BottlingMachine.addRecipe(<advancedrocketry:bucketRocketFuel>, lightTank, <liquid:rocketfuel> * 1000);
mods.immersiveengineering.BottlingMachine.addRecipe(<advancedrocketry:bucketOxygen>, lightTank, <liquid:oxygen> * 1000);
mods.immersiveengineering.BottlingMachine.addRecipe(<advancedrocketry:bucketHydrogen>, lightTank, <liquid:hydrogen> * 1000);
mods.immersiveengineering.BottlingMachine.addRecipe(<advancedrocketry:bucketNitrogen>, lightTank, <liquid:nitrogen> * 1000);

// Sattelite Components
recipes.remove(opticalSensor);
recipes.remove(<advancedrocketry:satelliteBuilder>);
mods.forestry.Carpenter.addRecipe(opticalSensor, [[blockLens, blockLens, blockLens], [glowstone, daySensor, glowstone], [ocChip1, SheetBlockAlu, ocChip1]], 120, <liquid:eezo_fluid> * 250);
recipes.addShaped(<advancedrocketry:satelliteBuilder>, [[ocRemote, display, <advancedrocketry:precisionassemblingmachine>], [IEHeavyBlock, basicBlock, IEHeavyBlock], [IEHeavyBlock, motorAdvanced, IEHeavyBlock]]);

// Dilithium
mods.immersiveengineering.Crusher.addRecipe(<taiga:dilithium_crystal> * 2, <taiga:dilithium_ore>, 10000);
mods.actuallyadditions.Crusher.addRecipe(<taiga:dilithium_ore>, <taiga:dilithium_crystal>*1, <taiga:dilithium_crystal>, 80);

// AirTight Space Suits
mods.forestry.Carpenter.addRecipe(airSeal, [[glowstone, ioSi, glowstone], [ioSi, <minecraft:diamond>, ioSi], [glowstone, ioSi, glowstone]], 120, <liquid:obsidiorite_fluid> * 2000);
<bqmie:icon_item:24>.addTooltip(format.gold("Air Tight Orb"));

recipes.addShaped(<railcraft:armor_helmet_steel>.withTag({ench: [{id: 128 as short, lvl: 1 as short}]}), [[ioSi, airSeal, ioSi], [ioSi, <railcraft:armor_helmet_steel>, ioSi], [ioSi, ioSi, ioSi]]);
recipes.addShaped(<railcraft:armor_chestplate_steel>.withTag({ench: [{id: 128 as short, lvl: 1 as short}]}), [[ioSi, airSeal, ioSi], [ioSi, <railcraft:armor_chestplate_steel>, ioSi], [ioSi, ioSi, ioSi]]);
recipes.addShaped(<railcraft:armor_leggings_steel>.withTag({ench: [{id: 128 as short, lvl: 1 as short}]}), [[ioSi, airSeal, ioSi], [ioSi, <railcraft:armor_leggings_steel>, ioSi], [ioSi, ioSi, ioSi]]);
recipes.addShaped(<railcraft:armor_boots_steel>.withTag({ench: [{id: 128 as short, lvl: 1 as short}]}), [[ioSi, airSeal, ioSi], [ioSi, <railcraft:armor_boots_steel>, ioSi], [ioSi, ioSi, ioSi]]);

// TODO
recipes.remove(<advancedrocketry:forceFieldProjector>);
recipes.remove(<advancedrocketry:oreScanner>);
recipes.remove(<advancedrocketry:atmAnalyser>);
recipes.remove(<advancedrocketry:beacon>);
recipes.remove(<advancedrocketry:beaconFinder>);
recipes.remove(<advancedrocketry:biomeChanger>);
recipes.remove(<advancedrocketry:biomeScanner>);
recipes.remove(<advancedrocketry:sealDetector>);
recipes.remove(<advancedrocketry:terraformer>);
recipes.remove(<advancedrocketry:oxygenDetection>);

// TODO - urgent
recipes.remove(<advancedrocketry:stationMarker>);
recipes.remove(<advancedrocketry:basicLaserGun>);
recipes.remove(<advancedrocketry:spaceLaser>);
recipes.remove(<advancedrocketry:smallAirlockDoor>);
recipes.remove(<advancedrocketry:landingPad>);
recipes.remove(<advancedrocketry:advRocketmotor>);
recipes.remove(<advancedrocketry:altitudeController>);
recipes.remove(<advancedrocketry:orientationController>);
recipes.remove(<advancedrocketry:gravityController>);
recipes.remove(<advancedrocketry:jackHammer>);
recipes.remove(<advancedrocketry:gravityMachine>);

// done - urgent
recipes.remove(<advancedrocketry:intake>);
recipes.remove(<advancedrocketry:solarGenerator>);
recipes.remove(<advancedrocketry:solarPanel>);
recipes.remove(<advancedrocketry:spaceElevatorController>);
recipes.remove(<advancedrocketry:railgun>);
recipes.remove(<advancedrocketry:microwaveReciever>);

recipes.addShaped(<advancedrocketry:intake>, [[IENozzle, IENozzle, IENozzle], [null, <actuallyadditions:blockLaserRelayFluids>, null], [IEPump, IEHeavyBlock, IEPump]]);
mods.forestry.Carpenter.addRecipe(<advancedrocketry:solarGenerator>, [[solarCell, solarCell, solarCell], [solarCell, ARCoilCopper, solarCell], [IELightBlock, <libvulpes:forgePowerInput>, IELightBlock]], 120, <liquid:obsidiorite_fluid> * 2000);
mods.forestry.Carpenter.addRecipe(<advancedrocketry:solarPanel>, [[solarCell, solarCell, solarCell], [solarCell, ARCoilCopper, solarCell], [scaffAlu, IELightBlock, scaffAlu]], 120, <liquid:nitrogen> * 1000);
recipes.addShaped(<advancedrocketry:spaceElevatorController>, [[display ,display, display], [<actuallyadditions:blockLaserRelayAdvanced>, IEHeavyBlock, <actuallyadditions:blockLaserRelayAdvanced>], [basicBlock, IEHeavyBlock, basicBlock]]);
recipes.addShaped(<advancedrocketry:railgun>, [[opticalSensor ,ocRemote, opticalSensor], [<actuallyadditions:blockLaserRelayItemWhitelist>, ocRemote, <actuallyadditions:blockLaserRelayItemWhitelist>], [IEHeavyBlock, basicBlock, IEHeavyBlock]]);
recipes.addShaped(<advancedrocketry:microwaveReciever>, [[opticalSensor ,opticalSensor, opticalSensor], [<actuallyadditions:blockLaserRelayAdvanced>, ocRemote, <actuallyadditions:blockLaserRelayAdvanced>], [basicBlock, IEHeavyBlock, basicBlock]]);


// Done (Was most urgent)
recipes.remove(<advancedrocketry:circleLight>);
recipes.remove(<advancedrocketry:drill>);
recipes.remove(<advancedrocketry:satellite>);
recipes.remove(satSolarPanel);
recipes.remove(<advancedrocketry:satellitePowerSource:1>);
recipes.remove(<advancedrocketry:jetPack>);
recipes.addShaped(<advancedrocketry:circleLight>, [[binder, binder, binder], [binder, <immersiveengineering:metalDevice1:9>, binder], [glass, glass, glass]]); 
recipes.addShaped(<advancedrocketry:drill>, [[diamondHead, diamondHead, diamondHead], [gearBoxSteel, IEHeavyBlock, gearBoxSteel], [scaffSteel, basicBlock, scaffSteel]]); 
recipes.addShaped(<advancedrocketry:satellite>, [[satSolarPanel, IELightBlock, satSolarPanel], [scaffAlu, <opencomputers:case2>, scaffAlu], [satSolarPanel, IELightBlock, satSolarPanel]]); 
recipes.addShaped(satSolarPanel, [[blockLens, blockLens, blockLens], [plateGold, basicBlock, plateGold], [pipeEnergy, pipeEnergy, pipeEnergy]]); 
recipes.addShaped(<advancedrocketry:satellitePowerSource:1>, [[null, satSolarPanel, satSolarPanel], [scaffSteel, scaffSteel, pipeEnergy], [null, satSolarPanel, satSolarPanel]]); 
recipes.addShaped(<advancedrocketry:jetPack>, [[medTank, <railcraft:backpack_apothecary_t1>, medTank], [pipeLiquid, pipeLiquid, pipeLiquid], [IENozzle, <minecraft:fire_charge>, IENozzle]]); 
// Moved to Precision Assembler
recipes.remove(<advancedrocketry:satellitePrimaryFunction:1>);
recipes.remove(<advancedrocketry:satellitePrimaryFunction:2>);