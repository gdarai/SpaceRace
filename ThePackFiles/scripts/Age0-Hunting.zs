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

val woodenFrame = <actuallyadditions:blockMisc:4>;
val leather = <ore:leather>;
val stoneGear = <ore:gearStone>;
val steel = <ore:ingotSteel>;

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

recipes.remove(<harvestcraft:presser>);
recipes.addShaped(<harvestcraft:presser>, [[null, leather, null],[leather, woodenFrame, leather],[stoneGear, leather, stoneGear]]);

recipes.remove(<immersiveengineering:toolupgrade:4>);
recipes.addShaped(<immersiveengineering:toolupgrade:4>, [[<tconstruct:sword_blade>.withTag({Material:"iron"}), steel],[steel, <immersiveengineering:wirecoil:3>]]);

