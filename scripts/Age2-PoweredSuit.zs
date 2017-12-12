// Disabled
recipes.remove(<powersuits:powerArmorHead>);
recipes.remove(<powersuits:powerArmorTorso>);
recipes.remove(<powersuits:powerArmorLegs>);
recipes.remove(<powersuits:powerArmorFeet>);

recipes.remove(<powersuits:powerTool>);

// Rebuilt
recipes.remove(<powersuits:tile.tinkerTable>);
recipes.remove(<powersuits:powerArmorComponent:*>);

val advItemRelay = <actuallyadditions:blockLaserRelayItemWhitelist>;
val display = <advancedrocketry:misc>;
val ARCi0 = <advancedrocketry:ic:3>;
val plateInvar = <railcraft:plate:9>;
val rollingMachine = <railcraft:equipment:1>;
val slabSteel = <ore:slabSteel>;
val coil1 = <actuallyadditions:itemMisc:7>;
val ioSi = <enderio:itemMaterial>;
val IENozzle = <immersiveengineering:toolupgrade:7>;
val IEPump = <immersiveengineering:metalDevice0:5>;
val pipeLiquid = <advancedrocketry:liquidPipe>;
val rsDust = <minecraft:redstone>;

val fabric = <immersiveengineering:material:5>;
val ropeCoil = <immersiveengineering:wirecoil:3>;
val crystal = <mysticalagriculture:infusion_crystal>.noReturn();

val gearBoxIron = <immersiveengineering:material:8>;
val gearBoxSteel = <immersiveengineering:material:9>;

val plateMan = <tconstruct:large_plate>.withTag({Material: "manyullyn"});
val plateSteel = <ore:plateSteel>;
val plateSi = <ore:plateSilicon>;

val wires = <powersuits:powerArmorComponent>;
val solen = <powersuits:powerArmorComponent:1>;
val fibre = <powersuits:powerArmorComponent:14>;
val sheetTitAlu = <advancedrocketry:productsheet>;
val tankNit = <advancedrocketry:bucketNitrogen>;
val IEcapME = <immersiveengineering:metalDevice0:1>;
val IEconnME = <immersiveengineering:connector:2>;
val blockLens = <advancedrocketry:blockLens:0>;

val nucleumCapsule = <forestry:refractory:1>.withTag({"Fluid":{"FluidName":"nucleum_fluid", Amount:1000}});

// temporal nitrogen recipes
recipes.addShaped(<advancedrocketry:bucketNitrogen>, [[null, <ore:dustSaltpeter>, null], [<ore:dustSaltpeter>, <minecraft:bucket>, <ore:dustSaltpeter>], [null, <ore:dustSaltpeter>, null]]);

val dustKarm = <ore:dustKarmesine>;
val dustObsidi = <ore:dustObsidiorite>;

// New recipes

mods.immersiveengineering.BottlingMachine.addRecipe(tankNit, <advancedrocketry:pressureTank:1>, <liquid:nitrogen> * 1000);

recipes.addShaped(<powersuits:tile.tinkerTable>, [[advItemRelay, display, advItemRelay], [null, rollingMachine, null], [slabSteel, coil1, slabSteel]]);
recipes.addShaped(<powersuits:powerArmorHead>, [[plateInvar, gearBoxSteel, plateInvar], [plateInvar, <actuallyadditions:itemHelmCrystalRed>, plateInvar], [null, ARCi0, null]]);
recipes.addShaped(<powersuits:powerArmorTorso>, [[plateInvar, null, plateInvar], [gearBoxSteel, <actuallyadditions:itemChestCrystalRed>, gearBoxSteel], [plateInvar, ARCi0, plateInvar]]);
recipes.addShaped(<powersuits:powerArmorLegs>, [[gearBoxSteel, ARCi0, gearBoxSteel], [plateInvar, <actuallyadditions:itemPantsCrystalRed>, plateInvar], [plateInvar, null, plateInvar]]);
recipes.addShaped(<powersuits:powerArmorFeet>, [[null, null, null], [gearBoxSteel, <actuallyadditions:itemBootsCrystalRed>, gearBoxSteel], [plateInvar, ARCi0, plateInvar]]);
recipes.addShaped(<powersuits:powerTool>, [[<actuallyadditions:itemSwordCrystalRed>, null, <actuallyadditions:itemSwordCrystalRed>], [plateInvar, gearBoxSteel, plateInvar], [plateInvar, ARCi0, plateInvar]]);

recipes.addShaped(<powersuits:powerArmorComponent:9>, [[fabric, fabric, fabric],[fabric, fabric, fabric],[ropeCoil, null, ropeCoil]]);
recipes.addShaped(<powersuits:powerArmorComponent:2>, [[null, wires, null],[wires, <railcraft:charge:5>, wires],[null, wires, null]]);
recipes.addShaped(<powersuits:powerArmorComponent:3>, [[null, sheetTitAlu, sheetTitAlu],[plateMan, plateMan, sheetTitAlu],[sheetTitAlu, plateMan, null]]);
recipes.addShaped(<powersuits:powerArmorComponent:4>, [[pipeLiquid, pipeLiquid, pipeLiquid],[tankNit, IEPump, tankNit],[IENozzle, IENozzle, IENozzle]]);
recipes.addShaped(<powersuits:powerArmorComponent:5>, [[IEconnME, wires, IEconnME],[wires, IEcapME, wires],[null, wires, null]]);
mods.forestry.Carpenter.addRecipe(<powersuits:powerArmorComponent:15>, [[null, wires, null], [ARCi0, wires, ARCi0], [ioSi, wires, ioSi]], 20, <liquid:eezo_fluid> * 500, <forestry:waxCast>);
recipes.addShaped(<powersuits:powerArmorComponent:12>, [[wires, crystal, wires],[null, tankNit, null],[ARCi0, IEcapME, ARCi0]]);
mods.forestry.ThermionicFabricator.addCast(<powersuits:powerArmorComponent:16>, [[null, null, null], [rsDust, rsDust, rsDust], [ioSi, ioSi, ioSi]], 250, null);
recipes.addShaped(<powersuits:powerArmorComponent:17>, [[wires, fibre, wires],[fibre, <powersuits:powerArmorComponent:16>, fibre],[wires, fibre, wires]]);
mods.forestry.Carpenter.addRecipe(<powersuits:powerArmorComponent:18>, [[blockLens, blockLens, blockLens], [dustKarm, dustKarm, dustKarm], [ioSi, <powersuits:powerArmorComponent:16>, ioSi]], 20, <liquid:eezo_fluid> * 500, <forestry:waxCast>);
mods.forestry.ThermionicFabricator.addCast(<powersuits:powerArmorComponent:21>, [[ioSi, fibre, ioSi], [fibre, plateMan, fibre], [ioSi, fibre, ioSi]], 500, null);
mods.forestry.Carpenter.addRecipe(<powersuits:powerArmorComponent:10>, [[dustObsidi, plateSteel, dustObsidi], [plateSteel, plateSi, plateSteel], [dustObsidi, plateSteel, dustObsidi]], 20, <liquid:karmesine_fluid> * 1000, null);
mods.forestry.Carpenter.addRecipe(<powersuits:powerArmorComponent:11>, [[dustObsidi, sheetTitAlu, dustObsidi], [plateMan, plateSi, plateMan], [dustObsidi, sheetTitAlu, dustObsidi]], 20, <liquid:karmesine_fluid> * 2000, null);

//A3 and more
mods.forestry.ThermionicFabricator.addCast(<powersuits:powerArmorComponent:6>, [[ioSi, ioSi, ioSi], [<powersuits:powerArmorComponent:5>, nucleumCapsule, <powersuits:powerArmorComponent:5>], [ioSi, ioSi, ioSi]], 250, <actuallyadditions:itemCrystal>);