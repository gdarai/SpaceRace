val lockKey = <bibliocraft:BiblioCreativeLock>;
val bookCase = <bibliocraft:BookcaseCreative:6>;
val bookCase1 = <bibliocraft:BookcaseCreative:2>;
val goldenHead = <tconstruct:materials:50>;
val exch = <draconicevolution:creative_exchanger>;
val drawer1 = <storagedrawers:upgradeCreative>;
val arPlug = <libvulpes:creativePowerBattery>;
val rfCont1 = <refinedstorage:controller:1>;
val ioBank = <enderio:blockCapBank>;
val deCap = <draconicevolution:draconium_capacitor:2>.withTag({"Energy": 1073741823});
val rsStore = <refinedstorage:storage:4>;
val rsFStore = <refinedstorage:fluid_storage:4>;
val rsDisc = <refinedstorage:storage_disk:4>;
val rsFDisc = <refinedstorage:fluid_storage_disk:4>;
val IEPower = <immersiveengineering:metalDevice0:3>;
val ioBuffer = <enderio:blockBuffer:3>;

val gold = <minecraft:gold_ingot>;
val goldBlock = <minecraft:gold_block>;
val notchApple = <minecraft:golden_apple:1>;
val knSlimeBlock = <tconstruct:metal:3>;
val flintIngot = <tp:flint_ingot>;
val saw = <bibliocraft:FramingSaw>;
val decayWheat = <forestry:decayingWheat>;
val iridiumBlock = <libvulpes:metal0:10>;
val nihilTank = <advancedrocketry:liquidTank>.withTag({"Fluid":{"FluidName":"nihilite_fluid", "Amount":64000}});
val XPwax = <forestry:capsule:1>.withTag({"Fluid":{"FluidName":"xpjuice", Amount:1000}});
val goldCan = <forestry:refractory:1>.withTag({"Fluid":{"FluidName":"gold", Amount:1000}});
val dnaCan = <forestry:refractory:1>.withTag({"Fluid":{"FluidName":"liquiddna", Amount:1000}});
val coral = <coralreef:coral:*>;
val aaIronBlock = <actuallyadditions:blockCrystalEmpowered:5>;

val apple1 = <tp:golden_apple>;
val apple2 = <tp:diamond_apple>;
val apple3 = <tp:emerald_apple>;

val coreBasic = <draconicevolution:draconic_core>;
val coreWyvern = <draconicevolution:wyvern_core>;
val coreAwaken = <draconicevolution:awakened_core>;
val coreChaos = <draconicevolution:chaotic_core>;

val ped0 = <draconicevolution:crafting_pedestal>;
val ped1 = <draconicevolution:crafting_pedestal:1>;
val ped2 = <draconicevolution:crafting_pedestal:2>;
val ped3 = <draconicevolution:crafting_pedestal:3>;

val rfCont = <refinedstorage:controller>;
val ocCase = <opencomputers:caseCreative>;
val chest = <minecraft:chest>;
val bucket = <minecraft:bucket>;
val deAdvDisl = <draconicevolution:dislocator_advanced>;

val pileOak = <forestry:pile_wood>.withTag({"TreeSpecies":"forestry.treeOak"});
val pileSpruce = <forestry:pile_wood>.withTag({"TreeSpecies":"forestry.treeSpruce"});
val pileBirch = <forestry:pile_wood>.withTag({"TreeSpecies":"forestry.treeBirch"});
val pileJungle = <forestry:pile_wood>.withTag({"TreeSpecies":"forestry.treeJungle"});
val pileAcacia = <forestry:pile_wood>.withTag({"TreeSpecies":"forestry.treeAcaciaVanilla"});
val pileDarkOak = <forestry:pile_wood>.withTag({"TreeSpecies":"forestry.treeDarkOak"});

// Head
mods.actuallyadditions.Empowerer.addRecipe(<minecraft:pumpkin>, <minecraft:skull:3>, <minecraft:skull>, <minecraft:skull:2>, <minecraft:skull>, <minecraft:skull:2>, 20000, 200, 0.4, 0.2, 0.3);

// Notch Apple
mods.forestry.Carpenter.addRecipe(<minecraft:golden_apple>, [[XPwax, goldBlock, XPwax], [XPwax, <mysticalagriculture:prudentium_apple>, XPwax], [XPwax, goldBlock, XPwax]], 200, <liquid:for.honey> * 2000, <forestry:phosphor>);
recipes.remove(notchApple);
// Notch apple is moved to infusion crafter

// TP Apples
recipes.remove(apple1);
recipes.remove(apple2); // moved to Crystalizer
recipes.remove(apple3); // moved to Fusion Crafting
mods.forestry.Carpenter.addRecipe(apple1, [[coral, goldCan, coral], [goldCan, aaIronBlock, goldCan], [coral, goldCan, coral]], 400, <liquid:for.honey> * 2000, <mysticalagriculture:prudentium_apple>);


// Nihilite moved to Alloy Smeltery and Chemical Reactor
mods.tconstruct.Smeltery.removeAlloy(<liquid:nihilite_fluid>);
mods.tconstruct.Smeltery.removeMelting(<taiga:nihilite_nugget>);
mods.tconstruct.Smeltery.removeMelting(<taiga:nihilite_ingot>);
mods.tconstruct.Smeltery.removeMelting(<taiga:nihilite_dust>);

// Lock and Key
mods.actuallyadditions.Empowerer.addRecipe(<storagedrawers:personalKey>, lockKey, notchApple, notchApple, notchApple, notchApple, 750000, 600, 1, 1, 0.3);

// Creative Bookcase - oak, spruce, birch, jungle, acacia, darkOak, frame 
mods.forestry.Carpenter.addRecipe(bookCase, [[dnaCan, lockKey, dnaCan], [lockKey, <bibliocraft:Bookcase:6>, lockKey], [dnaCan, lockKey, dnaCan]], 400, <liquid:seed.oil> * 10000, knSlimeBlock);
recipes.addShaped(<bibliocraft:BookcaseCreative:0>, [[pileOak, flintIngot, pileOak], [flintIngot, bookCase, flintIngot], [pileOak, saw, pileOak]]);
recipes.addShaped(<bibliocraft:BookcaseCreative:1>, [[pileSpruce, flintIngot, pileSpruce], [flintIngot, bookCase, flintIngot], [pileSpruce, saw, pileSpruce]]);
recipes.addShaped(<bibliocraft:BookcaseCreative:2>, [[pileBirch, flintIngot, pileBirch], [flintIngot, bookCase, flintIngot], [pileBirch, saw, pileBirch]]);
recipes.addShaped(<bibliocraft:BookcaseCreative:3>, [[pileJungle, flintIngot, pileJungle], [flintIngot, bookCase, flintIngot], [pileJungle, saw, pileJungle]]);
recipes.addShaped(<bibliocraft:BookcaseCreative:4>, [[pileAcacia, flintIngot, pileAcacia], [flintIngot, bookCase, flintIngot], [pileAcacia, saw, pileAcacia]]);
recipes.addShaped(<bibliocraft:BookcaseCreative:5>, [[pileDarkOak, flintIngot, pileDarkOak], [flintIngot, bookCase, flintIngot], [pileDarkOak, saw, pileDarkOak]]);

// Gadgets
// creative_exchanger moved to Infusion Crafting
mods.forestry.ThermionicFabricator.addCast(goldenHead, [[decayWheat, notchApple, decayWheat], [bookCase1, <minecraft:skull:3>, bookCase1], [decayWheat, notchApple, decayWheat]], 2000, <forestry:waxCast>);
// creative locomotive moved to infusion
mods.actuallyadditions.Empowerer.addRecipe(<refinedstorage:wireless_grid>, <refinedstorage:wireless_grid:1>, goldenHead, nihilTank, goldenHead, nihilTank, 750000, 600, 0.2, 1, 1);
mods.actuallyadditions.Empowerer.addRecipe(<refinedstorage:wireless_crafting_monitor>, <refinedstorage:wireless_crafting_monitor:1>, goldenHead, nihilTank, goldenHead, nihilTank, 750000, 600, 0.3, 1, 1);

// Computers
mods.forestry.ThermionicFabricator.addCast(<opencomputers:component:18>, [[goldenHead, apple2, goldenHead], [apple2, <opencomputers:component:17>, apple2], [goldenHead, apple2, goldenHead]], 2000, <tconstruct:cast>);
mods.forestry.Carpenter.addRecipe(<opencomputers:component:12>, [[coreWyvern, apple2, coreWyvern], [apple2, <opencomputers:component:15>, apple2], [coreWyvern, apple2, coreWyvern]], 3600, <liquid:xpjuice> * 10000, null);
mods.actuallyadditions.Empowerer.addRecipe(<opencomputers:material:19>, <opencomputers:material:20>, apple3, nihilTank, apple3, nihilTank, 750000, 600, 1, 0, 0);
mods.actuallyadditions.Empowerer.addRecipe(<opencomputers:material:22>, <opencomputers:material:23>, apple3, nihilTank, apple3, nihilTank, 750000, 600, 1, 0, 0);
mods.actuallyadditions.Empowerer.addRecipe(<opencomputers:material:25>, <opencomputers:material:26>, apple3, nihilTank, apple3, nihilTank, 750000, 600, 1, 0, 0);
// OC Creative PC Case in Fusion

// Inf Storage
recipes.addShaped(rfCont1, [[ocCase, rfCont, ocCase], [rfCont, <opencomputers:component:18>, rfCont], [ocCase, rfCont, ocCase]]);
recipes.addShaped(drawer1, [[bookCase, bookCase, bookCase], [<refinedstorage:controller:1>, apple3, <refinedstorage:controller:1>], [bookCase, bookCase, bookCase]]);
recipes.addShaped(rsStore, [[chest, drawer1, chest], [drawer1, <refinedstorage:machine_casing>, drawer1], [chest, drawer1, chest]]);
recipes.addShaped(rsFStore, [[bucket, drawer1, bucket], [drawer1, <refinedstorage:machine_casing>, drawer1], [bucket, drawer1, bucket]]);

// Inf Power, Limited output
recipes.addShaped(arPlug,[[rfCont1, ped1, rfCont1], [<libvulpes:forgePowerInput>, ped1, <libvulpes:forgePowerInput>], [rfCont1, ped1, rfCont1]]);
recipes.addShaped(ioBank, [[arPlug, ped2, arPlug], [ped2, <enderio:blockCapBank:3>, ped2], [arPlug, ped2, arPlug]]);
recipes.addShaped(deCap, [[ioBank, ioBank, ioBank], [ped3, exch, ped3], [ioBank, ioBank, ioBank]]);

// Portable Infinite Storage
mods.actuallyadditions.Empowerer.addRecipe(ioBank, rsDisc, rsStore, rsStore, rsStore, rsStore, 750000, 600, 0, 1, 0.75);
mods.actuallyadditions.Empowerer.addRecipe(ioBank, rsFDisc, rsFStore, rsFStore, rsFStore, rsFStore, 750000, 600, 0, 1, 0.75);

// Inf Power Output
// DE Inf Source moved to Infuser
mods.actuallyadditions.Empowerer.addRecipe(ioBank, IEPower, <draconicevolution:creative_rf_source>, ioBank, <draconicevolution:creative_rf_source>, ioBank, 750000, 600, 0, 0.6, 0);

// Infinite Items
recipes.addShaped(ioBuffer, [[<opencomputers:component:18>, IEPower, <opencomputers:component:18>], [IEPower, <enderio:blockBuffer>, IEPower], [<opencomputers:component:18>, IEPower, <opencomputers:component:18>]]);
recipes.addShaped(<storagedrawers:upgradeCreative:1>, [[deAdvDisl, goldenHead, deAdvDisl], [ioBuffer, IEPower, ioBuffer], [deAdvDisl, goldenHead, deAdvDisl]]);
