val raintank = <forestry:raintank>;
val ironPlate = <ore:plateIron>;
val aluPlate = <ore:plateAluminum>;
val tinPlate = <ore:plateTin>;
val battery = <actuallyadditions:itemBattery>;
val redCoil = <immersiveengineering:wirecoil:5>;

recipes.remove(raintank);
recipes.addShaped(raintank, [[ironPlate, null, ironPlate],[ironPlate, null, ironPlate],[ironPlate, <minecraft:heavy_weighted_pressure_plate>, ironPlate]]);

// Removing hammering ingots
recipes.removeShapeless(<immersiveengineering:metal:*>);

// Battery
recipes.remove(battery);
recipes.addShaped(battery, [[null, <ore:nuggetConstantan>, null],[redCoil, <railcraft:charge:6>, redCoil],[aluPlate, redCoil, aluPlate]]);

// Fixing glass
val glassOre = <ore:blockGlassColorless>;
glassOre.remove(<enderio:blockFusedQuartz:*>);
glassOre.remove(<enderio:blockFusedQuartz>);

val blockGlass = <ore:blockGlass>;
blockGlass.remove(<chisel:glass:*>);
blockGlass.remove(<chisel:glassdyedblack:*>);
blockGlass.remove(<chisel:glassdyedred:*>);
blockGlass.remove(<chisel:glassdyedgreen:*>);
blockGlass.remove(<chisel:glassdyedbrown:*>);
blockGlass.remove(<chisel:glassdyedblue:*>);
blockGlass.remove(<chisel:glassdyedpurple:*>);
blockGlass.remove(<chisel:glassdyedcyan:*>);
blockGlass.remove(<chisel:glassdyedlightgray:*>);
blockGlass.remove(<chisel:glassdyedgray:*>);
blockGlass.remove(<chisel:glassdyedpink:*>);
blockGlass.remove(<chisel:glassdyedlime:*>);
blockGlass.remove(<chisel:glassdyedyellow:*>);
blockGlass.remove(<chisel:glassdyedlightblue:*>);
blockGlass.remove(<chisel:glassdyedmagenta:*>);
blockGlass.remove(<chisel:glassdyedorange:*>);
blockGlass.remove(<chisel:glassdyedwhite:*>);

val sGlass = <tconstruct:seared_glass>;
recipes.remove(sGlass);

// Quartz Dust Oredict
val quartzDust = <ore:dustAnyQuartz>;
quartzDust.addAll(<ore:dustNetherQuartz>);
quartzDust.addAll(<ore:dustQuartzBlack>);

// Silicon Dust
recipes.addShaped(<libvulpes:productdust:3>, [[null, quartzDust, null],[quartzDust, <ore:sand>, quartzDust],[null, quartzDust, null]]);

// Smeltery
val sIngot = <ore:ingotBrickSeared>;
val dIngot = <ore:ingotDuranite>;
recipes.remove(<tconstruct:soil>);
recipes.addShapeless(<tconstruct:soil>*2, [<ore:sand>, <ore:gravel>, <minecraft:clay_ball>, <minecraft:coal:1>]);

recipes.remove(<tconstruct:casting>);
recipes.addShaped(<tconstruct:casting>, [[dIngot, dIngot, dIngot], [sIngot, <ore:gearStone>, sIngot], [sIngot, null, sIngot]]);

recipes.remove(<tconstruct:smeltery_controller>);
recipes.addShaped(<tconstruct:smeltery_controller>, [[sIngot, sIngot, sIngot], [sIngot, <ore:gearStone>, sIngot], [sIngot, <minecraft:furnace>, sIngot]]);

recipes.remove(<tconstruct:seared_tank:1>);
recipes.addShaped(<tconstruct:seared_tank:1>, [[sIngot, sGlass, sIngot], [sGlass, sGlass, sGlass], [sIngot, sGlass, sIngot]]);

recipes.remove(<tconstruct:seared_tank:2>);
recipes.addShaped(<tconstruct:seared_tank:2>, [[sIngot, sGlass, sIngot], [sIngot, sGlass, sIngot], [sIngot, sGlass, sIngot]]);

// Rod fix

// Alu Rod
val aluRod = <immersiveengineering:material:3>;
recipes.remove(aluRod);
mods.tconstruct.Casting.addTableRecipe(aluRod, <liquid:aluminum> * 432, <tconstruct:cast>.withTag({PartType: "tconstruct:tough_tool_rod"}), false, 100);
mods.tconstruct.Casting.addTableRecipe(aluRod, <liquid:aluminum> * 432, <tconstruct:clay_cast>.withTag({PartType: "tconstruct:tough_tool_rod"}), false, 100);

// Iron Rod
recipes.remove(<immersiveengineering:material:1>);
recipes.remove(<libvulpes:productrod:1>);
<ore:stickIron>.add(<tconstruct:tough_tool_rod>.withTag({Material:"iron"}));

// Steel Rod
recipes.remove(<immersiveengineering:material:2>);
recipes.remove(<libvulpes:productrod:6>);
<ore:stickSteel>.add(<tconstruct:tough_tool_rod>.withTag({Material:"steel"}));

// Copper Rod
recipes.remove(<libvulpes:productrod:4>);
<ore:stickSteel>.add(<tconstruct:tough_tool_rod>.withTag({Material:"copper"}));

// Titanium + Iridium rods
recipes.remove(<libvulpes:productrod:7>);
recipes.remove(<libvulpes:productrod:10>);
recipes.remove(<advancedrocketry:productrod>);
recipes.remove(<advancedrocketry:productrod:1>);

// IE Rod pressing
mods.immersiveengineering.MetalPress.removeRecipe(<immersiveengineering:material:1>);
mods.immersiveengineering.MetalPress.removeRecipe(<immersiveengineering:material:2>);
mods.immersiveengineering.MetalPress.removeRecipe(<immersiveengineering:material:3>);
mods.immersiveengineering.MetalPress.removeRecipe(<libvulpes:productrod:4>);
mods.immersiveengineering.MetalPress.removeRecipe(<libvulpes:productrod:7>);
mods.immersiveengineering.MetalPress.removeRecipe(<libvulpes:productrod:10>);
mods.immersiveengineering.MetalPress.addRecipe(<immersiveengineering:material:1>, <ore:ingotIron>, <immersiveengineering:mold:2>, 500);
mods.immersiveengineering.MetalPress.addRecipe(<immersiveengineering:material:2>, <ore:ingotSteel>, <immersiveengineering:mold:2>, 1500);
mods.immersiveengineering.MetalPress.addRecipe(<immersiveengineering:material:3>, <ore:ingotAluminum>, <immersiveengineering:mold:2>, 500);
mods.immersiveengineering.MetalPress.addRecipe(<libvulpes:productrod:4>, <ore:ingotCopper>, <immersiveengineering:mold:2>, 500);
mods.immersiveengineering.MetalPress.addRecipe(<libvulpes:productrod:7>, <ore:ingotTitanium>, <immersiveengineering:mold:2>, 25000);
mods.immersiveengineering.MetalPress.addRecipe(<libvulpes:productrod:10>, <ore:ingotIridium>*2, <immersiveengineering:mold:2>, 25000);
mods.immersiveengineering.MetalPress.addRecipe(<advancedrocketry:productrod>, <ore:ingotTitaniumAluminide>, <immersiveengineering:mold:2>, 50000);
mods.immersiveengineering.MetalPress.addRecipe(<advancedrocketry:productrod:1>, <ore:ingotTitaniumIridium>*2, <immersiveengineering:mold:2>, 50000);

// Bronze ingots
recipes.remove(<forestry:ingotBronze>*4);
recipes.remove(<railcraft:ingot:5>*4);

// Gears fix
mods.immersiveengineering.MetalPress.removeRecipeByMold(<immersiveengineering:mold:1>);

mods.immersiveengineering.MetalPress.addRecipe(<libvulpes:productgear:6>, <ore:ingotSteel>, <immersiveengineering:mold:1>, 500, 2);
mods.immersiveengineering.MetalPress.addRecipe(<libvulpes:productgear:7>, <ore:ingotTitanium>, <immersiveengineering:mold:1>, 500, 2);
mods.immersiveengineering.MetalPress.addRecipe(<advancedrocketry:productgear>, <ore:ingotTitaniumAluminide>, <immersiveengineering:mold:1>, 500, 2);
mods.immersiveengineering.MetalPress.addRecipe(<advancedrocketry:productgear:1>, <ore:ingotTitaniumIridium>, <immersiveengineering:mold:1>, 500, 2);
mods.immersiveengineering.MetalPress.addRecipe(<forestry:gearBronze>, <ore:ingotBronze>, <immersiveengineering:mold:1>, 500, 2);
mods.immersiveengineering.MetalPress.addRecipe(<forestry:gearCopper>, <ore:ingotCopper>, <immersiveengineering:mold:1>, 500, 2);
mods.immersiveengineering.MetalPress.addRecipe(<forestry:gearTin>, <ore:ingotTin>, <immersiveengineering:mold:1>, 500, 2);

recipes.remove(<advancedrocketry:productgear>);
recipes.remove(<advancedrocketry:productgear:1>);
recipes.remove(<libvulpes:productgear:6>);
recipes.remove(<libvulpes:productgear:7>);

// IE Capacitors
val IECopperCoil = <immersiveengineering:metalDecoration0>;
val IEElectrumCoil = <immersiveengineering:metalDecoration0:1>;
val IESteelCoil = <immersiveengineering:metalDecoration0:2>;
val IECopperCon = <immersiveengineering:connector>;
val IEElectrumCon = <immersiveengineering:connector:2>;
val IESteelCon = <immersiveengineering:connector:4>;
val plateCopper = <ore:plateCopper>;
val trPlank = <ore:plankTreatedWood>;
val leadBlock = <ore:blockLead>;
recipes.remove(<immersiveengineering:metalDevice0>);
recipes.remove(<immersiveengineering:metalDevice0:1>);
recipes.remove(<immersiveengineering:metalDevice0:2>);

recipes.addShaped(<immersiveengineering:metalDevice0>, [[IECopperCon, plateCopper, IECopperCon], [plateCopper, leadBlock, plateCopper], [trPlank, IECopperCoil, trPlank]]);
recipes.addShaped(<immersiveengineering:metalDevice0:1>, [[IEElectrumCon, plateCopper, IEElectrumCon], [plateCopper, leadBlock, plateCopper], [trPlank, IEElectrumCoil, trPlank]]);
recipes.addShaped(<immersiveengineering:metalDevice0:2>, [[IESteelCon, plateCopper, IESteelCon], [plateCopper, leadBlock, plateCopper], [trPlank, IESteelCoil, trPlank]]);

// Fix Plate Casting
mods.tconstruct.Casting.removeTableRecipe(<immersiveengineering:metal:32>, <liquid:lead>, <tconstruct:cast_custom:3>);
mods.tconstruct.Casting.addTableRecipe(<immersiveengineering:metal:32>, <liquid:lead>*288, <tconstruct:cast_custom:3>, false, 100);
mods.tconstruct.Casting.removeTableRecipe(<immersiveengineering:metal:33>, <liquid:silver>, <tconstruct:cast_custom:3>);
mods.tconstruct.Casting.addTableRecipe(<immersiveengineering:metal:33>, <liquid:silver>*288, <tconstruct:cast_custom:3>, false, 100);
mods.tconstruct.Casting.removeTableRecipe(<immersiveengineering:metal:34>, <liquid:nickel>, <tconstruct:cast_custom:3>);
mods.tconstruct.Casting.addTableRecipe(<immersiveengineering:metal:34>, <liquid:nickel>*288, <tconstruct:cast_custom:3>, false, 100);
mods.tconstruct.Casting.removeTableRecipe(<immersiveengineering:metal:35>, <liquid:uranium>, <tconstruct:cast_custom:3>);
mods.tconstruct.Casting.addTableRecipe(<immersiveengineering:metal:35>, <liquid:uranium>*288, <tconstruct:cast_custom:3>, false, 100);
mods.tconstruct.Casting.removeTableRecipe(<immersiveengineering:metal:36>, <liquid:constantan>, <tconstruct:cast_custom:3>);
mods.tconstruct.Casting.addTableRecipe(<immersiveengineering:metal:36>, <liquid:constantan>*288, <tconstruct:cast_custom:3>, false, 100);
mods.tconstruct.Casting.removeTableRecipe(<immersiveengineering:metal:37>, <liquid:electrum>, <tconstruct:cast_custom:3>);
mods.tconstruct.Casting.addTableRecipe(<immersiveengineering:metal:37>, <liquid:electrum>*288, <tconstruct:cast_custom:3>, false, 100);

mods.tconstruct.Casting.removeTableRecipe(<libvulpes:productplate:1>, <liquid:iron>, <tconstruct:cast_custom:3>);
mods.tconstruct.Casting.addTableRecipe(<libvulpes:productplate:1>, <liquid:iron>*288, <tconstruct:cast_custom:3>, false, 100);
mods.tconstruct.Casting.removeTableRecipe(<libvulpes:productplate:2>, <liquid:gold>, <tconstruct:cast_custom:3>);
mods.tconstruct.Casting.addTableRecipe(<libvulpes:productplate:2>, <liquid:gold>*288, <tconstruct:cast_custom:3>, false, 100);
mods.tconstruct.Casting.removeTableRecipe(<libvulpes:productplate:4>, <liquid:copper>, <tconstruct:cast_custom:3>);
mods.tconstruct.Casting.addTableRecipe(<libvulpes:productplate:4>, <liquid:copper>*288, <tconstruct:cast_custom:3>, false, 100);
mods.tconstruct.Casting.removeTableRecipe(<libvulpes:productplate:5>, <liquid:tin>, <tconstruct:cast_custom:3>);
mods.tconstruct.Casting.addTableRecipe(<libvulpes:productplate:5>, <liquid:tin>*288, <tconstruct:cast_custom:3>, false, 100);
mods.tconstruct.Casting.removeTableRecipe(<libvulpes:productplate:6>, <liquid:steel>, <tconstruct:cast_custom:3>);
mods.tconstruct.Casting.addTableRecipe(<libvulpes:productplate:6>, <liquid:steel>*288, <tconstruct:cast_custom:3>, false, 100);
mods.tconstruct.Casting.removeTableRecipe(<libvulpes:productplate:9>, <liquid:aluminum>, <tconstruct:cast_custom:3>);
mods.tconstruct.Casting.addTableRecipe(<libvulpes:productplate:9>, <liquid:aluminum>*288, <tconstruct:cast_custom:3>, false, 100);

// Curtains
val Stick = <ore:stickWood>;
val Fabric = <immersiveengineering:material:5>;

recipes.remove(<immersiveengineering:clothDevice>);
recipes.addShaped(<immersiveengineering:clothDevice>, [[Stick, Stick, Stick], [Fabric, Fabric, Fabric], [Fabric, Fabric, Fabric]]);

// Charcoal
mods.immersiveengineering.CokeOven.removeRecipe(<minecraft:coal:1>);
furnace.remove(<minecraft:coal:1>);

mods.immersiveengineering.BlastFurnace.removeFuel(<minecraft:coal:1>);
mods.immersiveengineering.BlastFurnace.removeFuel(<actuallyadditions:blockMisc:5>);

mods.immersiveengineering.CokeOven.removeRecipe(<immersiveengineering:material:6>);
mods.immersiveengineering.CokeOven.removeRecipe(<immersiveengineering:stoneDecoration:3>);

mods.immersiveengineering.CokeOven.addRecipe(<immersiveengineering:material:6>, 500, <minecraft:coal:1>, 1800);
mods.immersiveengineering.CokeOven.addRecipe(<immersiveengineering:stoneDecoration:3>, 4000, <actuallyadditions:blockMisc:5>, 3000);

// AA Knife
val knBlade = <actuallyadditions:itemMisc:2>;
recipes.remove(knBlade);
recipes.addShaped(knBlade, [[null, <ore:nuggetIron>, null], [null, <ore:nuggetIron>, null], [null, <ore:itemFlint>, null]]);

// AR Fuel in Refiner
mods.immersiveengineering.Refinery.addRecipe(<liquid:rocketfuel> * 1, <liquid:fire_water> * 3, <liquid:bio.ethanol> * 5, 2000);
mods.forestry.Fermenter.addRecipe(<liquid:fire_water>, <mysticalagriculture:fire_essence>, <liquid:potion>, 500, 0.2);

// Ferilizer equivalency
recipes.addShapeless(<forestry:fertilizerCompound>, [<actuallyadditions:itemFertilizer>]);
recipes.addShapeless(<actuallyadditions:itemFertilizer>, [<forestry:fertilizerCompound>]);

// Hoppers
recipes.addShaped(<minecraft:hopper>, [[aluPlate, null, aluPlate],[aluPlate, <minecraft:chest>, aluPlate],[null, aluPlate, null]]);
recipes.addShaped(<minecraft:hopper>, [[tinPlate, null, tinPlate],[tinPlate, <minecraft:chest>, tinPlate],[null, tinPlate, null]]);

// Steel smelting
mods.tconstruct.Smeltery.addMelting(<liquid:steel> * 144, <immersiveengineering:metalDecoration1:1>, 500);
mods.tconstruct.Smeltery.addMelting(<liquid:steel> * 288, <immersiveengineering:metalDecoration1>, 500);

// 3rd way to get a plate
recipes.addShapeless(<immersiveengineering:metal:32>, [<ore:blockLead>, <immersiveengineering:tool>]);

// Diamond chip fix
val chipDiamond = <opencomputers:material:30>;
recipes.remove(chipDiamond);
recipes.addShapeless(chipDiamond * 6, [<enderio:darkSteel_shears:*>.onlyDamageAtMost(200), <ore:gemDiamond>]);

// Melting Poor Ores fix
mods.tconstruct.Smeltery.removeMelting(<railcraft:ore:5>);
mods.tconstruct.Smeltery.addMelting(<liquid:iron> * 72, <railcraft:ore:5>, 500);
mods.tconstruct.Smeltery.removeMelting(<railcraft:ore:6>);
mods.tconstruct.Smeltery.addMelting(<liquid:gold> * 72, <railcraft:ore:6>, 500);
mods.tconstruct.Smeltery.removeMelting(<railcraft:ore:7>);
mods.tconstruct.Smeltery.addMelting(<liquid:copper> * 72, <railcraft:ore:7>, 500);
mods.tconstruct.Smeltery.removeMelting(<railcraft:ore:8>);
mods.tconstruct.Smeltery.addMelting(<liquid:tin> * 72, <railcraft:ore:8>, 500);
mods.tconstruct.Smeltery.removeMelting(<railcraft:ore:9>);
mods.tconstruct.Smeltery.addMelting(<liquid:lead> * 72, <railcraft:ore:9>, 500);
mods.tconstruct.Smeltery.removeMelting(<railcraft:ore:10>);
mods.tconstruct.Smeltery.addMelting(<liquid:silver> * 72, <railcraft:ore:10>, 500);
mods.tconstruct.Smeltery.addMelting(<liquid:iron> * 72, <railcraft:ore_metal_poor>, 500);
mods.tconstruct.Smeltery.addMelting(<liquid:gold> * 72, <railcraft:ore_metal_poor:1>, 500);
mods.tconstruct.Smeltery.addMelting(<liquid:copper> * 72, <railcraft:ore_metal_poor:2>, 500);
mods.tconstruct.Smeltery.addMelting(<liquid:tin> * 72, <railcraft:ore_metal_poor:3>, 500);
mods.tconstruct.Smeltery.addMelting(<liquid:lead> * 72, <railcraft:ore_metal_poor:4>, 500);
mods.tconstruct.Smeltery.addMelting(<liquid:silver> * 72, <railcraft:ore_metal_poor:5>, 500);
mods.tconstruct.Smeltery.removeMelting(<railcraft:ore_metal_poor:6>);
mods.tconstruct.Smeltery.addMelting(<liquid:nickel> * 72, <railcraft:ore_metal_poor:6>, 500);
mods.tconstruct.Smeltery.removeMelting(<railcraft:ore_metal_poor:7>);
mods.tconstruct.Smeltery.addMelting(<liquid:zinc> * 72, <railcraft:ore_metal_poor:7>, 500);

// Fixing sharpening kits
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"obsidian"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"iron"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"pigiron"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"knightslime"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"cobalt"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"ardite"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"manyullyn"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"copper"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"bronze"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"steel"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"lead"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"silver"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"electrum"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"constantan"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"tiberium"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"aurorium"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"prometheum"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"duranite"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"valyrium"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"vibranium"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"terrax"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"palladium"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"uru"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"eezo"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"basalt"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"triberium"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"fractum"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"violium"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"proxii"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"tritonite"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"ignitz"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"imperomite"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"solarium"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"nihilite"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"adamant"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"dyonite"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"nucleum"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"lumix"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"seismum"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"astrium"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"niob"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"yrdeen"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"meteorite"}));
mods.tconstruct.Smeltery.removeMelting(<tconstruct:sharpening_kit>.withTag({"Material":"obsidiorite"}));

recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"obsidian"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetObsidian>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"iron"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetIron>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"pigiron"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetPigiron>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"knightslime"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetKnightslime>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"cobalt"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetCobalt>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"ardite"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetArdite>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"manyullyn"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetManyullyn>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"copper"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetCopper>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"bronze"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetBronze>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"steel"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetSteel>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"lead"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetLead>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"silver"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetSilver>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"electrum"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetElectrum>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"constantan"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetConstantan>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"tiberium"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetTiberium>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"aurorium"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetAurorium>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"prometheum"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetPrometheum>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"duranite"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetDuranite>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"valyrium"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetValyrium>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"vibranium"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetVibranium>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"terrax"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetTerrax>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"palladium"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetPalladium>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"uru"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetUru>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"eezo"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetEezo>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"basalt"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetBasalt>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"triberium"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetTriberium>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"fractum"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetFractum>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"violium"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetViolium>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"proxii"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetProxii>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"tritonite"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetTritonite>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"ignitz"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetIgnitz>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"imperomite"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetImperomite>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"solarium"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetSolarium>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"nihilite"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetNihilite>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"adamant"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetAdamant>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"dyonite"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetDyonite>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"nucleum"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetNucleum>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"lumix"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetLumix>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"seismum"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetSeismum>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"astrium"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetAstrium>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"niob"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetNiob>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"yrdeen"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetYrdeen>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"meteorite"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetMeteorite>]);
recipes.addShapeless(<tconstruct:sharpening_kit>.withTag({"Material":"obsidiorite"}), [<tconstruct:sharpening_kit>.withTag({"Material":"wood"}), <ore:nuggetObsidiorite>]);

// Remove gear melting
mods.tconstruct.Smeltery.removeMelting(<forestry:gearBronze>);
mods.tconstruct.Smeltery.removeMelting(<forestry:gearCopper>);
mods.tconstruct.Smeltery.removeMelting(<forestry:gearTin>);
mods.tconstruct.Smeltery.removeMelting(<railcraft:gear:1>);
mods.tconstruct.Smeltery.removeMelting(<railcraft:gear>);
mods.tconstruct.Smeltery.removeMelting(<libvulpes:productgear:6>);