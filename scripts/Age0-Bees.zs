// Bees - Escritoire
val escritoire = <forestry:escritoire>;
mods.forestry.Carpenter.removeRecipe(escritoire, <liquid:seed.oil>);
mods.forestry.Carpenter.addRecipe(escritoire, [[<minecraft:book>, null, null],[<ore:plankTreatedWood>, <immersiveengineering:material:5>, <ore:plankTreatedWood>],[<ore:fenceWood>, <immersiveengineering:wirecoil:3>, <ore:fenceWood>]], 20, <liquid:seed.oil> * 250);

// Bees - Alveary
val casingWood = <actuallyadditions:blockMisc:4>;
val alvearyBlock = <forestry:alveary.plain>;
val alvearyPanel = <forestry:craftingMaterial:6>;
val trStick = <ore:stickTreatedWood>;
val Coil = <immersiveengineering:wirecoil:3>;
val wax = <forestry:beeswax>;

recipes.remove(alvearyBlock);
recipes.addShaped(alvearyBlock, [[alvearyPanel, alvearyPanel, alvearyPanel], [alvearyPanel, casingWood, alvearyPanel], [alvearyPanel, alvearyPanel, alvearyPanel]]);

mods.forestry.Carpenter.removeRecipe(alvearyPanel, <liquid:for.honey>);
mods.forestry.Carpenter.addRecipe(alvearyPanel, [[null, null, null], [trStick, <minecraft:trapdoor>, trStick], [wax, Coil, wax]], 20, <liquid:for.honey>*125, null);

// Bees - Analyzer
val aluScaff = <immersiveengineering:metalDecoration1:5>;
val ironBarrel = <immersiveengineering:metalDevice0:4>;
val gearBoxIron = <immersiveengineering:material:8>;
val plateAlu = <ore:plateAluminum>;
val FCi3 = <forestry:chipsets:3>.withTag({T: 3 as short});
val FCi1 = <forestry:chipsets:1>.withTag({T: 1 as short});
val piston = <minecraft:piston>;

recipes.remove(<forestry:analyzer>);
recipes.addShaped(<forestry:analyzer>, [[<advancedrocketry:misc>, aluScaff, ironBarrel], [plateAlu, FCi3, plateAlu], [aluScaff, gearBoxIron, aluScaff]]);

recipes.remove(<forestry:squeezer>);
recipes.addShaped(<forestry:squeezer>, [[piston, piston, piston], [gearBoxIron, ironBarrel, gearBoxIron], [aluScaff, FCi1, aluScaff]]);

// Armor
recipes.addShapeless(<harvestcraft:beeswaxitem>, [<harvestcraft:potitem>, <forestry:beeswax>, <forestry:beeswax>, <forestry:beeswax>]);
recipes.remove(<advancedrocketry:spaceHelmet>);
recipes.remove(<advancedrocketry:spaceChestplate>);
recipes.remove(<advancedrocketry:spaceBoots>);
recipes.remove(<advancedrocketry:spaceLeggings>);

recipes.remove(<immersiveengineering:faradaySuit_chest>);
recipes.addShaped(<immersiveengineering:faradaySuit_chest>, [[plateAlu, <harvestcraft:hardenedleatherchestitem>, plateAlu], [plateAlu, <minecraft:leather_chestplate>, plateAlu], [plateAlu, plateAlu, plateAlu]]);
recipes.remove(<immersiveengineering:faradaySuit_head>);
recipes.addShaped(<immersiveengineering:faradaySuit_head>, [[null, plateAlu, null], [plateAlu, <harvestcraft:hardenedleatherhelmitem>, plateAlu], [plateAlu, <minecraft:leather_helmet>, plateAlu]]);
recipes.remove(<immersiveengineering:faradaySuit_feet>);
recipes.addShaped(<immersiveengineering:faradaySuit_feet>, [[null, null, null], [plateAlu, <minecraft:leather_boots>, plateAlu], [plateAlu, <harvestcraft:hardenedleatherbootsitem>, plateAlu]]);
recipes.remove(<immersiveengineering:faradaySuit_legs>);
recipes.addShaped(<immersiveengineering:faradaySuit_legs>, [[plateAlu, <minecraft:leather_leggings>, plateAlu], [plateAlu, <harvestcraft:hardenedleatherleggingsitem>, plateAlu], [plateAlu, null, plateAlu]]);

recipes.remove(<advancedrocketry:suitWorkStation>);
recipes.addShaped(<advancedrocketry:suitWorkStation>, [[null, <advancedrocketry:misc>, null], [<opencomputers:material:9>, <forestry:worktable>, <opencomputers:material:9>], [plateAlu, <libvulpes:structureMachine>, plateAlu]]);

// Infusion Crystal
val honeyDew = <forestry:honeydew>;
val infCrystal = <mysticalagriculture:infusion_crystal>;
val infBlock = <mysticalagriculture:inferium_block>;
val prosperityShard = <mysticalagriculture:prosperity_shard>;

recipes.remove(infCrystal);
recipes.addShaped(infCrystal, [[prosperityShard, honeyDew, prosperityShard], [honeyDew, infBlock, honeyDew], [prosperityShard, honeyDew, prosperityShard]]);

// Torches
val torch = <minecraft:torch>;
val tinyTorch = <actuallyadditions:blockTinyTorch>;
val stoneTorch = <tconstruct:stone_torch>;

val candle = <ore:candle>;
candle.add(<forestry:candle>);
candle.add(<harvestcraft:candledeco1>);
candle.add(<harvestcraft:candledeco2>);
candle.add(<harvestcraft:candledeco3>);
candle.add(<harvestcraft:candledeco4>);
candle.add(<harvestcraft:candledeco5>);
candle.add(<harvestcraft:candledeco6>);
candle.add(<harvestcraft:candledeco7>);
candle.add(<harvestcraft:candledeco8>);
candle.add(<harvestcraft:candledeco9>);
candle.add(<harvestcraft:candledeco10>);
candle.add(<harvestcraft:candledeco11>);
candle.add(<harvestcraft:candledeco12>);
candle.add(<harvestcraft:candledeco13>);
candle.add(<harvestcraft:candledeco14>);
candle.add(<harvestcraft:candledeco15>);
candle.add(<harvestcraft:candledeco16>);

recipes.remove(torch);
recipes.remove(tinyTorch);
recipes.remove(stoneTorch);

recipes.addShaped(torch * 4, [[wax, <actuallyadditions:itemMisc:10>, wax], [null, Coil, null], [null, <minecraft:stick>, null]]);
recipes.addShaped(torch * 4, [[wax, <actuallyadditions:itemMisc:11>, wax], [null, Coil, null], [null, <minecraft:stick>, null]]);
recipes.addShaped(stoneTorch, [[null, null, null], [null, <minecraft:coal>, null], [null, <ore:rodStone>, null]]);
recipes.addShapeless(tinyTorch * 2, [torch, <minecraft:stick>, <minecraft:stick>]);


// Mystical Agriculture
val ess2 = <mysticalagriculture:prudentium_essence>;
val ess3 = <mysticalagriculture:intermedium_essence>;
val infCrystalDmg = <mysticalagriculture:infusion_crystal:*>;
val beeSlimeMet = <morebees:propolisMetallic>;
recipes.removeShaped(ess3, [[null, <*>, null], [<*>, <mysticalagriculture:infusion_crystal:*>, <*>], [null, <*>, null]]);
recipes.addShaped(ess3, [[ess2, beeSlimeMet, ess2], [infCrystalDmg, beeSlimeMet, infCrystalDmg], [ess2, beeSlimeMet, ess2]]);