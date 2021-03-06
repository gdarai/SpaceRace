
val leadPlate = <railcraft:plate>;
val strongGlass = <railcraft:glass:*>;
val blockLens = <advancedrocketry:blockLens>;

val plate = <deepresonance:resonating_plate>;
val plateBlock = <deepresonance:resonating_block>;
val DRglass = <deepresonance:dense_glass>;
val DRobsidian = <deepresonance:dense_obsidian>;
val DRfilter = <deepresonance:spent_filter>;
val DRframe = <deepresonance:machine_frame>;

// Adding missing OreDict categories

val oreNetherResonating = <ore:oreNetherResonating>;
oreNetherResonating.add(<deepresonance:resonating_ore:1>);

val oreEndResonating = <ore:oreEndResonating>;
oreEndResonating.add(<deepresonance:resonating_ore:2>);

// Materials
furnace.remove(plate*8);
recipes.remove(<deepresonance:filter>);
recipes.remove(DRframe);
mods.actuallyadditions.AtomicReconstructor.addRecipe(<deepresonance:resonating_ore>, plateBlock, 150000);
mods.actuallyadditions.AtomicReconstructor.addRecipe(<deepresonance:resonating_ore:1>, plateBlock, 150000);
mods.actuallyadditions.AtomicReconstructor.addRecipe(<deepresonance:resonating_ore:2>, plateBlock, 150000);
mods.actuallyadditions.AtomicReconstructor.addRecipe(<immersiveengineering:material:7>, <deepresonance:filter>, 10000);
mods.forestry.Carpenter.addRecipe(DRframe, [[leadPlate, strongGlass, leadPlate], [plate, <advancedrocketry:productgear>, plate], [leadPlate, <advancedrocketry:ic:3>, leadPlate]], 300, <liquid:seed.oil> * 1000, <forestry:can:1>.withTag({"Fluid":{"FluidName":"eezo_fluid", Amount:1000}}));

// Armor
recipes.remove(<deepresonance:helmet>);
recipes.remove(<deepresonance:chest>);
recipes.remove(<deepresonance:leggings>);
recipes.remove(<deepresonance:boots>);

recipes.addShaped(<deepresonance:helmet>, [[plate, plate, plate], [plate, <forestry:apiaristHelmet>, plate], [null, null, null]]);
recipes.addShaped(<deepresonance:chest>, [[plate, null, plate], [plate, <forestry:apiaristChest>, plate], [plate, plate, plate]]);
recipes.addShaped(<deepresonance:leggings>, [[plate, plate, plate], [plate, <forestry:apiaristLegs>, plate], [plate, null, plate]]);
recipes.addShaped(<deepresonance:boots>, [[null, null, null], [plate, <forestry:apiaristBoots>, plate], [plate, null, plate]]);

// Basic Blocks
recipes.remove(DRobsidian);
recipes.remove(DRglass);
mods.forestry.Carpenter.addRecipe(DRobsidian, [[plate, leadPlate, plate], [leadPlate, <draconicevolution:infused_obsidian>, leadPlate], [plate, leadPlate, plate]], 300, <liquid:seed.oil> * 250, <taiga:tiberium_dust>);
mods.forestry.ThermionicFabricator.addCast(DRglass, [[DRfilter, strongGlass, DRfilter], [strongGlass, DRobsidian, strongGlass], [DRfilter, strongGlass, DRfilter]], 1000, null);

//Utils
recipes.remove(<deepresonance:lens>);
mods.forestry.ThermionicFabricator.addCast(<deepresonance:lens>, [[plate, blockLens, plate], [blockLens, <actuallyadditions:itemMisc:18>, blockLens], [plate, blockLens, plate]], 1000, null);

//Missing - All the Machine Recipes