<bqmie:icon_item>.displayName = "World Orb";
<bqmie:icon_item:14>.addTooltip(format.gold("Lava World Orb"));
<bqmie:icon_item:16>.addTooltip(format.gold("Alien World Orb"));
<bqmie:icon_item:13>.addTooltip(format.gold("Mystical World Orb"));
<bqmie:icon_item:15>.addTooltip(format.gold("Distant World Orb"));
<bqmie:icon_item:18>.addTooltip(format.gold("Ocean World Orb"));
<bqmie:icon_item:22>.addTooltip(format.gold("Mushroom World Orb"));
val jelly = <forestry:royalJelly>;
val obsidiorite = <taiga:obsidiorite_block>;

val triberium = <taiga:triberium_block>;
val dilithiumDust = <ore:dustDilithium>;

val blackQuartz = <actuallyadditions:blockMisc:2>;
val blueSlime = <tconstruct:slime:1>;

val uranium = <immersiveengineering:storage:5>;
val chorus = <minecraft:chorus_fruit_popped>;
recipes.addShaped(<bqmie:icon_item:14>, [[jelly, obsidiorite, jelly], [obsidiorite, <ore:blockQuartz>, obsidiorite], [jelly, obsidiorite,jelly]]);
recipes.addShaped(<bqmie:icon_item:16>, [[dilithiumDust, triberium, dilithiumDust], [triberium, <ore:blockDiamond>, triberium], [dilithiumDust, triberium, dilithiumDust]]);
recipes.addShaped(<bqmie:icon_item:13>, [[blackQuartz, blueSlime, blackQuartz], [blueSlime, <ore:blockEnergeticAlloy>, blueSlime], [blackQuartz, blueSlime, blackQuartz]]);
mods.actuallyadditions.Empowerer.addRecipe(uranium, <bqmie:icon_item:15>, chorus, chorus, chorus, chorus, 500000, 1200);

