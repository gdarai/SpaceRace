val theIngot = <refinedstorage:quartz_enriched_iron>;
val theBlock = <refinedstorage:machine_casing>;

val core1 = <refinedstorage:processor>;
val core2 = <refinedstorage:processor:1>;
val core3 = <refinedstorage:processor:2>;

val chip1 = <refinedstorage:processor:3>;
val chip2 = <refinedstorage:processor:4>;
val chip3 = <refinedstorage:processor:5>;

val quartzDust = <actuallyadditions:itemDust:7>;
val capacDouble = <enderio:itemBasicCapacitor:1>;
val si = <refinedstorage:silicon>;
val clearGlass = <enderio:blockFusedQuartz:1>;
val gearTitIri = <advancedrocketry:productgear:1>;

// Basic Recipes
recipes.remove(theBlock);
recipes.remove(theIngot); // moved to Cutting machine
recipes.remove(<refinedstorage:solderer>);
recipes.addShaped(theBlock, [[theIngot, quartzDust, theIngot], [capacDouble, <opencomputers:case3>, capacDouble], [theIngot, quartzDust, theIngot]]);
recipes.addShaped(<refinedstorage:solderer>, [[<immersiveengineering:metalDecoration1:1>, <advancedrocketry:platePress>, theIngot], [theBlock, null, null], [<libvulpes:forgePowerInput>, theBlock, theIngot]]);

// Tweaking Solderer recipes
mods.refinedstorage.Solderer.remove(core1);
mods.refinedstorage.Solderer.remove(core2);
mods.refinedstorage.Solderer.remove(core3);
mods.refinedstorage.Solderer.remove(<refinedstorage:processor:6>);

mods.refinedstorage.Solderer.add(core1, 2, <opencomputers:material:12>, <actuallyadditions:itemCrystalEmpowered>, quartzDust);
mods.refinedstorage.Solderer.add(core2, 2, <opencomputers:material:12>, <actuallyadditions:itemCrystalEmpowered:3>, <taiga:uru_dust>);
mods.refinedstorage.Solderer.add(core3, 2, <opencomputers:material:12>, <actuallyadditions:itemCrystalEmpowered:2>, <taiga:yrdeen_dust>);
mods.refinedstorage.Solderer.add(<refinedstorage:processor:6>, 2, <advancedrocketry:wafer>, quartzDust, si);

// Improving core recipes
furnace.remove(<refinedstorage:silicon>);
recipes.remove(<refinedstorage:storage_part>);
recipes.remove(<refinedstorage:fluid_storage_part>);
mods.actuallyadditions.Empowerer.addRecipe(<minecraft:quartz>, si, <minecraft:dye:15>, <minecraft:dye:15>, <minecraft:dye:15>, <minecraft:dye:15>, 500, 20);
recipes.addShaped(<refinedstorage:storage_part>, [[si, clearGlass, si], [clearGlass, <actuallyadditions:itemCrystal>, clearGlass], [si, clearGlass, si]]);
recipes.addShaped(<refinedstorage:fluid_storage_part>, [[si, clearGlass, si], [clearGlass, <actuallyadditions:itemCrystal:1>, clearGlass], [si, clearGlass, si]]);

// Making early items more accessible
recipes.remove(<refinedstorage:grid>);
recipes.remove(<refinedstorage:disk_drive>);
mods.refinedstorage.Solderer.remove(<refinedstorage:grid:1>);
mods.refinedstorage.Solderer.remove(<refinedstorage:grid:3>);

recipes.addShaped(<refinedstorage:grid>, [[chip1, <refinedstorage:core:1>, chip1], [<advancedrocketry:misc>, theBlock, <refinedstorage:storage_part:1>], [gearTitIri, <refinedstorage:core>, gearTitIri]]);
recipes.addShaped(<refinedstorage:grid:3>, [[chip1, <refinedstorage:core:1>, chip1], [<advancedrocketry:misc>, theBlock, <refinedstorage:fluid_storage_part:1>], [gearTitIri, <refinedstorage:core>, gearTitIri]]);
mods.refinedstorage.Solderer.add(<refinedstorage:grid:1>, 10, <refinedstorage:grid>, chip1, <opencomputers:upgrade:11>);
mods.refinedstorage.Solderer.add(<refinedstorage:disk_drive>, 10, theBlock, chip1, <bibliocraft:Bookcase:6>);
