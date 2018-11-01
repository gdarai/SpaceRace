val essBrass = <mysticalagriculture:brass_essence>;
val essBronze = <mysticalagriculture:bronze_essence>;
val essInvar = <mysticalagriculture:invar_essence>;
val scrubberCartridge = <advancedrocketry:carbonScrubberCartridge>;
val usedCartridge = scrubberCartridge.anyDamage();
val mash = <forestry:craftingMaterial:3>;

val dracoOre0 = <draconicevolution:draconium_ore>;
val dracoOre1 = <draconicevolution:draconium_ore:1>;
val dracoOre2 = <draconicevolution:draconium_ore:2>;
val dracoDust = <draconicevolution:draconium_dust>;


recipes.remove(<libvulpes:linker>);
recipes.addShaped(<libvulpes:linker>, [[null, <minecraft:redstone_torch>, null], [null, <railcraft:tool_signal_tuner>, null], [null, <powersuits:powerArmorComponent:15>, null]]);
recipes.addShapeless(<libvulpes:linker>, [<libvulpes:linker>]);

<bqmie:icon_item:4>.addTooltip(format.gold("Market Key"));
<bqmie:icon_item:11>.addTooltip(format.gold("Advanced Market Key"));
<bqmie:icon_item:23>.addTooltip(format.gold("Victory Medal"));
<bqmie:icon_item:20>.addTooltip(format.gold("Victory Point"));
<bqmie:icon_item:21>.addTooltip(format.gold("Burned Firestone"));

recipes.addShaped(scrubberCartridge, [[null, null, null], [mash, usedCartridge, mash], [null, null, null]]);

recipes.addShaped(<chisel:limestoneextra:7>, [[<ore:sandstone>, <ore:cobblestone>], [<ore:cobblestone>, <ore:sandstone>]]);
recipes.addShaped(<chisel:marbleextra:7>, [[<ore:sandstone>, <ore:stone>], [<ore:stone>, <ore:sandstone>]]);
recipes.addShaped(<chisel:blockPlatinum>, [[<ore:ingotGold>, <ore:gemDiamond>], [<ore:gemDiamond>, <ore:ingotGold>]]);

// Brass
recipes.remove(<railcraft:ingot:9>);
recipes.addShaped(<railcraft:ingot:9>*6, [[essBrass, essBrass, essBrass], [essBrass, null, essBrass], [essBrass, essBrass, essBrass]]);

// Bronze ingots
recipes.remove(<forestry:ingotBronze>*4);
recipes.remove(<railcraft:ingot:5>*4);
recipes.addShaped(<forestry:ingotBronze>*4, [[essBronze, essBronze, essBronze], [essBronze, null, essBronze], [essBronze, essBronze, essBronze]]);

// Invar ingots
recipes.remove(<railcraft:ingot:7>*3);
recipes.addShaped(<railcraft:ingot:7>*3, [[essInvar, essInvar, essInvar], [essInvar, null, essInvar], [essInvar, essInvar, essInvar]]);

// Draconium dust crushing

mods.immersiveengineering.Crusher.addRecipe(dracoDust * 2, dracoOre0, 2000, dracoDust, 0.5);
mods.immersiveengineering.Crusher.addRecipe(dracoDust * 2, dracoOre1, 2000, dracoDust, 0.5);
mods.immersiveengineering.Crusher.addRecipe(dracoDust * 2, dracoOre2, 2000, dracoDust, 0.5);
mods.actuallyadditions.Crusher.addRecipe(dracoOre0, dracoDust * 2, dracoDust, 50);
mods.actuallyadditions.Crusher.addRecipe(dracoOre1, dracoDust * 2, dracoDust, 50);
mods.actuallyadditions.Crusher.addRecipe(dracoOre2, dracoDust * 2, dracoDust, 50);
