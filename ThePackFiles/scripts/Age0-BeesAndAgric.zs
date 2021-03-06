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
recipes.addShaped(alvearyBlock*3, [[trStick, alvearyPanel, trStick], [alvearyPanel, casingWood, alvearyPanel], [trStick, alvearyPanel, trStick]]);

mods.forestry.Carpenter.removeRecipe(alvearyPanel, <liquid:for.honey>);
mods.forestry.Carpenter.addRecipe(alvearyPanel, [[null, null, null], [trStick, <minecraft:trapdoor>, trStick], [wax, Coil, wax]], 20, <liquid:for.honey>*125, null);

// Bees - Analyzer
val aluScaff = <immersiveengineering:metalDecoration1:5>;
val ironBarrel = <immersiveengineering:metalDevice0:4>;
val gearBoxIron = <immersiveengineering:material:8>;
val plateAlu = <ore:plateAluminum>;
val FCi3 = <forestry:chipsets:3>.withTag({T: 3 as short});
val FCi1 = <forestry:chipsets:1>.withTag({T: 1 as short});
val ARCi0 = <advancedrocketry:ic:3>;

val piston = <minecraft:piston>;

recipes.remove(<forestry:analyzer>);
recipes.addShaped(<forestry:analyzer>, [[<advancedrocketry:misc>, aluScaff, ironBarrel], [plateAlu, FCi3, plateAlu], [aluScaff, gearBoxIron, aluScaff]]);
recipes.addShaped(<forestry:analyzer>, [[<advancedrocketry:misc>, aluScaff, ironBarrel], [plateAlu, ARCi0, plateAlu], [aluScaff, gearBoxIron, aluScaff]]);

recipes.remove(<forestry:squeezer>);
recipes.addShaped(<forestry:squeezer>, [[piston, piston, piston], [gearBoxIron, ironBarrel, gearBoxIron], [aluScaff, FCi1, aluScaff]]);
recipes.addShaped(<forestry:squeezer>, [[piston, piston, piston], [gearBoxIron, ironBarrel, gearBoxIron], [aluScaff, ARCi0, aluScaff]]);

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
furnace.addRecipe(<advancedrocketry:crystal:4>, infCrystal, 20);

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
recipes.addShaped(stoneTorch, [[<minecraft:coal:*>, null], [<ore:rodStone>, null]]);
recipes.addShapeless(tinyTorch * 2, [torch, <minecraft:stick>, <minecraft:stick>]);
recipes.addShapeless(tinyTorch, [candle]);

// Gendustry Bee Receptacle

// Mystical Agriculture
val ess1 = <mysticalagriculture:inferium_essence>;
val ess2 = <mysticalagriculture:prudentium_essence>;
val ess3 = <mysticalagriculture:intermedium_essence>;
val ess4 = <mysticalagriculture:superium_essence>;
val ess5 = <mysticalagriculture:supremium_essence>;

val infCrystalDmg = <mysticalagriculture:infusion_crystal:*>;
val beeSlimeMet = <morebees:propolisMetallic>;
val magentaHoney = <gendustry:HoneyDrop:23>;
val colBlood = <tconstruct:edible:33>;
val bloodBlock = <tconstruct:slime:3>;

val lemon = <forestry:fruits:3>;
val plum = <forestry:fruits:4>;
val superWood = <forestry:logs.fireproof.3:2>;

val esNatur = <mysticalagriculture:nature_essence>;
val esCoal = <mysticalagriculture:coal_essence>;
val esCreeper = <mysticalagriculture:creeper_essence>;

val maBonemeal = <mysticalagriculture:fertilized_essence>;
val disipCharge = <forestry:craftingMaterial:4>;
val sulf = <ore:dustSulfur>;
val gunp = <ore:gunpowder>;

val xp = <ore:xp>;
xp.add(<supercraftingframe:super_xp_bottle>);
xp.add(<actuallyadditions:itemSolidifiedExperience>);

val skull = <minecraft:skull>;
val essSkel = <mysticalagriculture:skeleton_essence>;
val essExp = <mysticalagriculture:experience_essence>;
val essZomb = <mysticalagriculture:zombie_essence>;
val essCreep = <mysticalagriculture:creeper_essence>;

recipes.removeShaped(<mysticalagriculture:superium_apple>);
recipes.addShaped(<mysticalagriculture:superium_apple>, [[superWood, ess4, superWood], [ess4, <mysticalagriculture:intermedium_apple>, ess4], [superWood, ess4, superWood]]);
recipes.removeShaped(<mysticalagriculture:intermedium_apple>);
recipes.addShaped(<mysticalagriculture:intermedium_apple>, [[lemon, ess3, lemon], [ess3, <mysticalagriculture:prudentium_apple>, ess3], [lemon, ess3, lemon]]);

recipes.removeShaped(ess3, [[null, <*>, null], [<*>, <mysticalagriculture:infusion_crystal:*>, <*>], [null, <*>, null]]);
recipes.removeShaped(ess4);
recipes.removeShaped(ess5);
recipes.removeShaped(<mysticalagriculture:supremium_block>,[[null, <*>, null], [<*>, <mysticalagriculture:master_infusion_crystal>, <*>], [null, <*>, null]]);
recipes.removeShaped(<mysticalagriculture:superium_block>,[[null, <*>, null], [<*>, <mysticalagriculture:master_infusion_crystal>, <*>], [null, <*>, null]]);
recipes.removeShaped(<mysticalagriculture:intermedium_block>,[[null, <*>, null], [<*>, <mysticalagriculture:master_infusion_crystal>, <*>], [null, <*>, null]]);
recipes.removeShaped(<mysticalagriculture:prudentium_block>,[[null, <*>, null], [<*>, <mysticalagriculture:master_infusion_crystal>, <*>], [null, <*>, null]]);
recipes.addShaped(ess3, [[ess2, beeSlimeMet, ess2], [infCrystalDmg, beeSlimeMet, infCrystalDmg], [ess2, beeSlimeMet, ess2]]);
mods.actuallyadditions.Empowerer.addRecipe(<mysticalagriculture:intermedium_apple>, ess4, magentaHoney, colBlood, <enderio:itemFrankenSkull:1>, colBlood, 50000, 200, 1, 0.5, 0.5);
mods.actuallyadditions.Empowerer.addRecipe(<mysticalagriculture:superium_apple>, ess5, <forestry:craftingMaterial:7>, bloodBlock, <enderio:itemColdFireIgniter>.withTag({famount:1000}), bloodBlock, 200000, 200, 1, 0.5, 0.5);

// Crushing Prosperity ore
// Crushing Inferomite ore
mods.immersiveengineering.Crusher.addRecipe(prosperityShard * 2, <mysticalagriculture:prosperity_ore>, 2000, prosperityShard, 0.5);
mods.immersiveengineering.Crusher.addRecipe(prosperityShard * 2, <mysticalagriculture:nether_prosperity_ore>, 2000, prosperityShard, 0.5);
mods.immersiveengineering.Crusher.addRecipe(prosperityShard * 2, <mysticalagriculture:end_prosperity_ore>, 2000, prosperityShard, 0.5);
mods.actuallyadditions.Crusher.addRecipe(<mysticalagriculture:prosperity_ore>, prosperityShard * 2, prosperityShard, 50);
mods.actuallyadditions.Crusher.addRecipe(<mysticalagriculture:nether_prosperity_ore>, prosperityShard * 2, prosperityShard, 50);
mods.actuallyadditions.Crusher.addRecipe(<mysticalagriculture:end_prosperity_ore>, prosperityShard * 2, prosperityShard, 50);

mods.immersiveengineering.Crusher.addRecipe(ess1 * 3, <mysticalagriculture:inferium_ore>, 2000, ess1, 0.5);
mods.immersiveengineering.Crusher.addRecipe(ess1 * 3, <mysticalagriculture:nether_inferium_ore>, 2000, ess1, 0.5);
mods.immersiveengineering.Crusher.addRecipe(ess1 * 3, <mysticalagriculture:end_inferium_ore>, 2000, ess1, 0.5);

mods.actuallyadditions.Crusher.addRecipe(<mysticalagriculture:inferium_ore>, ess1 * 3, ess1, 50);
mods.actuallyadditions.Crusher.addRecipe(<mysticalagriculture:nether_inferium_ore>, ess1 * 3, ess1, 50);
mods.actuallyadditions.Crusher.addRecipe(<mysticalagriculture:end_inferium_ore>, ess1 * 3, ess1, 50);
// Adding agric. recipes
recipes.addShaped(<minecraft:coal:1>*8, [[esCoal, esNatur, esCoal], [esNatur, <forestry:royalJelly>, esNatur], [esCoal, esNatur, esCoal]]);
recipes.addShaped(<minecraft:flint>*2, [[esCreeper, esCreeper, esCreeper], [esCreeper, <ore:gravel>, esCreeper], [esCreeper, esCreeper, esCreeper]]);

// Agric Bonemeal
recipes.addShaped(maBonemeal*4, [[sulf, xp, sulf], [xp, disipCharge, xp], [sulf, xp, sulf]]);
recipes.addShaped(maBonemeal*8, [[gunp, xp, gunp], [xp, disipCharge, xp], [gunp, xp, gunp]]);
mods.forestry.Carpenter.addRecipe(maBonemeal*12, [[sulf, xp, sulf], [xp, disipCharge, xp], [sulf, xp, sulf]], 20, <liquid:ice> * 250, null);
mods.forestry.Carpenter.addRecipe(maBonemeal*24, [[gunp, xp, gunp], [xp, disipCharge, xp], [gunp, xp, gunp]], 20, <liquid:ice> * 250, null);

// Removing deassemling of supremium essence
recipes.removeShapeless(ess4*4, [ess5]);

// Heads Recepty

recipes.addShaped(skull, [[essSkel, essSkel, essSkel], [essSkel,essSkel, essSkel], [essSkel, essSkel, essSkel]]);
recipes.addShaped(<minecraft:skull:2>, [[essZomb, essZomb, essZomb], [essExp, skull, essExp], [essZomb, essZomb, essZomb]]);
recipes.addShaped(<minecraft:skull:4>, [[essCreep, essCreep, essCreep], [essExp, skull, essExp], [essCreep, essCreep, essCreep]]);
