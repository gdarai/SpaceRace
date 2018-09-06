local dl = require("daraiLib")

local configFileName = "assembler.config"

local default = {    
    recipes={
        {
            name={"wood plank"},
            group={0},
            craftType={0},
            input={
                {name="minecraft:log", damage=-1, label="wood log"}
            },
            receipt={"1nnnnnnnn"},
            output={name="minecraft:planks", damage=-1, label="wood plank"},
            size={4}
        },
        {
            name={"stick"},
            group={0},
            craftType={0},
            input={
                {name="minecraft:planks", damage=-1, label="wood plank"}
            },
            receipt={"1nn1nnnnn"},
            output={name="minecraft:stick", damage=0, label="stick"},
            size={4}
        }
    },
    types={
        {
            name={"crafting"},
            item={name="minecraft:stick", damage=0, label="stick"},
            position={""}
            shortcut={"x"}
        }
    },
    groups={
        {"Basic"}
    }
    
}

local texts = {
    type="table",
    text="Assembler robot setting",
    recipes={
        type="list",
        text="List of recipes",
        object={
            type="table",
            text="One assembling receipt",
            name={
                type="str",
                text="Name of this receipt"
            },
            group={
                type="int",
                text="Representing the group this receipt is placed into"
            },
            craftType={
                type="int",
                text="Representing the type of this receipt"
            },
            input={
                type="list",
                text="List of needed items",
                object={
                    type="item",
                    text="One needed resource"
                }
            },
            receipt={
                type="str",
                text="Representation of the receipt, 9 chars [n1-9], or comma separated list of counts for individual items"
            },
            output={
                    type="item",
                    text="Expected output item"
            },
            size={
                type="int",
                text="expected output count"
            }
        }
    },
    types={
        type="list",
        text="List of recipes",
        object={
            type="table",
            text="One assembler machine",
            name={
                type="str",
                text="assemblng type name"
            },
            item={
                type="item",
                text="crafting automat identificator item"
            },
            position={
                type="str",
                text="Navigation to input box, 0L means go 0 and turn left"
            },
            shortcut={
                type="str",
                text="shortcut for quick referrence"
            }
        }
    },
    groups={
        type="list",
        text="List of assembling groups",
        object={
            type="str",
            text="One assembling group name"
        }
    }
}

dl.printFmt('T', "Assembler Program")
dl.printFmt('t', "Configuration")
local config = dl.config(configFileName, texts, default, true)
