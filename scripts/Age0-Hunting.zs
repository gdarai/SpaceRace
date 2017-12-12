val leaves = <ore:treeLeaves>;
val grass = <minecraft:tallgrass:*>;

val Bait = <harvestcraft:fishtrapbaititem>;
val String = <minecraft:string>;
val Cotton = <harvestcraft:cottonitem>;
val Feather = <minecraft:feather>;
val Coil = <immersiveengineering:wirecoil:3>;
val FishingRod = <minecraft:fishing_rod>;
val Stick = <minecraft:stick>;
val FishTrap = <harvestcraft:watertrap>;
val GroundTrap = <harvestcraft:groundtrap>;
val Chest = <minecraft:chest>;

recipes.remove(FishingRod);
recipes.remove(FishTrap);
recipes.remove(GroundTrap);

recipes.addShaped(FishingRod, [[null, null, Stick],[null, Stick, Coil],[Stick, null, Coil]]);
recipes.addShaped(FishTrap, [[Stick, FishingRod, Stick],[Coil, Chest, Coil],[Stick, Coil, Stick]]);
recipes.addShaped(GroundTrap, [[Stick, <ore:trapdoorWood>, Stick],[Coil, Chest, Coil],[Stick, Coil, Stick]]);

recipes.addShaped(Bait * 4, [[String, Cotton, null],[Cotton, Cotton, null],[null, null, null]]);
recipes.addShaped(Bait * 4, [[String, Feather, null],[Feather, Feather, null],[null, null, null]]);

recipes.addShapeless(<harvestcraft:vinegaritem>, [<harvestcraft:potitem>, <ore:foodApplejuice>]);

recipes.remove(<sleepingbag:sleepingbag>);
recipes.addShaped(<sleepingbag:sleepingbag>, [[grass, grass, grass],[leaves, leaves, leaves],[Stick, Stick, Stick]]);