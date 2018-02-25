val st = <minecraft:stick>;
val buc = <minecraft:bucket>;
recipes.addShaped(<immersiveengineering:ore:1>, [[st, st, st], [null, null, null], [null, null, null]]);
recipes.addShaped(<taiga:prometheum_ore>, [[st, st, null], [st, null, null], [null, null, null]]);
recipes.addShaped(<minecraft:quartz_ore>, [[st, st, null], [st, null, null], [null, null, null]]);
recipes.addShaped(<minecraft:netherrack>, [[st, st, null], [null, st, null], [null, null, null]]);
recipes.addShaped(<draconicevolution:dislocator:19>.withTag({"IsSet": 1, "Dimension":0, "DimentionName":"Overworld", "X":0, "Y":70, "Z":0, "Yaw":0, "Pitch":0}), [[null, st, null], [st, null, st], [null, st, null]]);

// Replacement receips or gasgiant mining
recipes.addShaped(<advancedrocketry:bucketOxygen>, [[buc, st, st], [null, null, null], [null, null, null]]);
recipes.addShaped(<advancedrocketry:bucketHydrogen>, [[buc, st, null], [st, null, null], [null, null, null]]);
recipes.addShaped(<advancedrocketry:bucketNitrogen>, [[buc, st, null], [null, st, null], [null, null, null]]);
recipes.addShaped(<forge:bucketFilled>.withTag({"FluidName":"hootch", "Amount":1000}), [[buc, st, null], [null, null, null], [st, null, null]]);
recipes.addShaped(<forge:bucketFilled>.withTag({"FluidName":"cloud_seed", "Amount":1000}), [[buc, st, null], [null, null, null], [null, st, null]]);
recipes.addShaped(<forge:bucketFilled>.withTag({"FluidName":"nutrient_distillation", "Amount":1000}), [[buc, st, null], [null, null, null], [null, null, st]]);

