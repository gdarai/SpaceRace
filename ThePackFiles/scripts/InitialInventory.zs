mods.initialinventory.InvHandler.addStartingItem(<gbook:guidebook>.withTag({"Book":"gbook:guideBook.xml"}));

recipes.addShapeless(<gbook:guidebook>.withTag({"Book":"gbook:guideBook.xml"}), [<minecraft:stick>, <minecraft:stick>, <minecraft:paper>]);
recipes.addShapeless(<gbook:guidebook>.withTag({"Book":"gbook:computerBook.xml"}), [<minecraft:book>, <opencomputers:storage:1>]);

// Program Disc
recipes.addShapeless(<opencomputers:storage:1>.withTag({"oc:data": {"oc:fs.label": "SpaceRace-get"}, "oc:color": 1, display: {Name: "SpaceRace-get"}, "oc:lootFactory": "OpenComputers:SpaceRace-get"}), [<opencomputers:storage:1>, <minecraft:ender_pearl>]);
recipes.addShapeless(<opencomputers:storage:1>.withTag({"oc:data": {"oc:fs.label": "SpaceRace-filter"}, "oc:color": 11, display: {Name: "SpaceRace-filter"}, "oc:lootFactory": "OpenComputers:SpaceRace-filter"}), [<opencomputers:storage:1>, <minecraft:hopper>]);
recipes.addShapeless(<opencomputers:storage:1>.withTag({"oc:data": {"oc:fs.label": "SpaceRace-crafter"}, "oc:color": 5, display: {Name: "SpaceRace-crafter"}, "oc:lootFactory": "OpenComputers:SpaceRace-crafter"}), [<opencomputers:storage:1>, <minecraft:crafting_table>]);