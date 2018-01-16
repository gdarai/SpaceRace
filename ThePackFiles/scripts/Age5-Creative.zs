val lockKey = <bibliocraft:BiblioCreativeLock>;
val bookCase = <bibliocraft:BookcaseCreative:6>;
val bookCase1 = <bibliocraft:BookcaseCreative:2>;
val goldenHead = <tconstruct:materials:50>;
val exch = <draconicevolution:creative_exchanger>;
val loco = <railcraft:locomotive_creative>;
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
val coral = <coralreef:coral:*>;
val aaIron = <actuallyadditions:itemCrystalEmpowered:5>;

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

// Notch Apple
mods.forestry.Carpenter.addRecipe(<minecraft:golden_apple>, [[gold, gold, gold], [gold, <mysticalagriculture:prudentium_apple>, gold], [gold, gold, gold]], 400, <liquid:xpjuice> * 5000, null);
recipes.remove(notchApple);
mods.forestry.Carpenter.addRecipe(notchApple, [[goldBlock, goldBlock, goldBlock], [goldBlock, <minecraft:golden_apple>, goldBlock], [goldBlock, goldBlock, goldBlock]], 400, <liquid:silver> * 10000, null);

// TP Apples
recipes.remove(apple1);
recipes.remove(apple2); // moved to Crystalizer
recipes.remove(apple3); // moved to Fusion Crafting
mods.forestry.Carpenter.addRecipe(apple1, [[coral, aaIron, coral], [aaIron, <mysticalagriculture:prudentium_apple>, aaIron], [coral, aaIron, coral]], 400, <liquid:gold> * 5000, null);


// Nihilite moved to Alloy Smeltery and Chemical Reactor
mods.tconstruct.Smeltery.removeAlloy(<liquid:nihilite_fluid>);
mods.tconstruct.Smeltery.removeMelting(<taiga:nihilite_nugget>);
mods.tconstruct.Smeltery.removeMelting(<taiga:nihilite_ingot>);
mods.tconstruct.Smeltery.removeMelting(<taiga:nihilite_dust>);

// Lock and Key
mods.actuallyadditions.Empowerer.addRecipe(<storagedrawers:personalKey>, lockKey, notchApple, notchApple, notchApple, notchApple, 750000, 600);

// Creative Bookcase - oak, spruce, birch, jungle, acacia, darkOak, frame 
mods.forestry.Carpenter.addRecipe(bookCase, [[knSlimeBlock, lockKey, knSlimeBlock], [lockKey, <bibliocraft:Bookcase:6>, lockKey], [knSlimeBlock, lockKey, knSlimeBlock]], 400, <liquid:liquiddna> * 10000, null);
mods.actuallyadditions.Empowerer.addRecipe(bookCase, <bibliocraft:BookcaseCreative:0>, <forestry:pile_wood>.withTag({"TreeSpecies":"forestry.treeOak"}), flintIngot, saw, flintIngot, 500000, 200);
mods.actuallyadditions.Empowerer.addRecipe(bookCase, <bibliocraft:BookcaseCreative:1>, <forestry:pile_wood>.withTag({"TreeSpecies":"forestry.treeSpruce"}), flintIngot, saw, flintIngot, 500000, 200);
mods.actuallyadditions.Empowerer.addRecipe(bookCase, <bibliocraft:BookcaseCreative:2>, <forestry:pile_wood>.withTag({"TreeSpecies":"forestry.treeBirch"}), flintIngot, saw, flintIngot, 500000, 200);
mods.actuallyadditions.Empowerer.addRecipe(bookCase, <bibliocraft:BookcaseCreative:3>, <forestry:pile_wood>.withTag({"TreeSpecies":"forestry.treeJungle"}), flintIngot, saw, flintIngot, 500000, 200);
mods.actuallyadditions.Empowerer.addRecipe(bookCase, <bibliocraft:BookcaseCreative:4>, <forestry:pile_wood>.withTag({"TreeSpecies":"forestry.treeAcaciaVanilla"}), flintIngot, saw, flintIngot, 500000, 200);
mods.actuallyadditions.Empowerer.addRecipe(bookCase, <bibliocraft:BookcaseCreative:5>, <forestry:pile_wood>.withTag({"TreeSpecies":"forestry.treeDarkOak"}), flintIngot, saw, flintIngot, 500000, 200);

// Gadgets
// creative_exchanger moved to Infusion Crafting
mods.forestry.ThermionicFabricator.addCast(goldenHead, [[decayWheat, notchApple, decayWheat], [bookCase1, <minecraft:skull:3>, bookCase1], [decayWheat, notchApple, decayWheat]], 2000, <forestry:waxCast>);
mods.forestry.Carpenter.addRecipe(loco, [[iridiumBlock, goldenHead, iridiumBlock], [goldenHead, <railcraft:locomotive_electric>, goldenHead], [iridiumBlock, goldenHead, iridiumBlock]], 3600, <liquid:dilithium_fluid> * 10000, knSlimeBlock);
mods.actuallyadditions.Empowerer.addRecipe(<refinedstorage:wireless_grid>, <refinedstorage:wireless_grid:1>, goldenHead, nihilTank, goldenHead, nihilTank, 750000, 600);
mods.actuallyadditions.Empowerer.addRecipe(<refinedstorage:wireless_crafting_monitor>, <refinedstorage:wireless_crafting_monitor:1>, goldenHead, nihilTank, goldenHead, nihilTank, 750000, 600);

// Computers
mods.forestry.ThermionicFabricator.addCast(<opencomputers:component:18>, [[goldenHead, apple2, goldenHead], [apple2, <opencomputers:component:17>, apple2], [goldenHead, apple2, goldenHead]], 2000, <tconstruct:cast>);
mods.forestry.Carpenter.addRecipe(<opencomputers:component:12>, [[coreWyvern, apple2, coreWyvern], [apple2, <opencomputers:component:15>, apple2], [coreWyvern, apple2, coreWyvern]], 3600, <liquid:xpjuice> * 10000, null);
mods.actuallyadditions.Empowerer.addRecipe(<opencomputers:material:19>, <opencomputers:material:20>, apple3, nihilTank, apple3, nihilTank, 750000, 600);
mods.actuallyadditions.Empowerer.addRecipe(<opencomputers:material:22>, <opencomputers:material:23>, apple3, nihilTank, apple3, nihilTank, 750000, 600);
mods.actuallyadditions.Empowerer.addRecipe(<opencomputers:material:25>, <opencomputers:material:26>, apple3, nihilTank, apple3, nihilTank, 750000, 600);
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
mods.actuallyadditions.Empowerer.addRecipe(ioBank, rsDisc, rsStore, rsStore, rsStore, rsStore, 750000, 600);
mods.actuallyadditions.Empowerer.addRecipe(ioBank, rsFDisc, rsFStore, rsFStore, rsFStore, rsFStore, 750000, 600);

// Inf Power Output
// DE Inf Source moved to Infuser
mods.actuallyadditions.Empowerer.addRecipe(ioBank, IEPower, <draconicevolution:creative_rf_source>, ioBank, <draconicevolution:creative_rf_source>, ioBank, 750000, 600);

// Infinite Items
recipes.addShaped(ioBuffer, [[<opencomputers:component:18>, IEPower, <opencomputers:component:18>], [IEPower, <enderio:blockBuffer>, IEPower], [<opencomputers:component:18>, IEPower, <opencomputers:component:18>]]);
recipes.addShaped(<storagedrawers:upgradeCreative:1>, [[deAdvDisl, goldenHead, deAdvDisl], [ioBuffer, IEPower, ioBuffer], [deAdvDisl, goldenHead, deAdvDisl]]);
