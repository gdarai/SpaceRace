val Ash = <forestry:ash>;

furnace.addRecipe(Ash, <ore:treeSapling>);
recipes.addShapeless(<minecraft:dye:15> * 16, [Ash, <ore:dirt>, <ore:sand>, <ore:gravel>]);

recipes.addShapeless(<harvestcraft:freshwateritem> * 2, [<minecraft:bowl>, <claybucket:claybucket:1>.giveBack(<claybucket:claybucket:0>)]);