local dl = require("daraiLib")
local sz = require("serialization")

local default = {
    item={name="minecraft:stone", damage=0, label="stone"},
    side={"north"},
    str={"someText"},
    int={1},
    num={1.4},
    list={{0}}
}

local texts = {
    type="table",
    text="Table Item",
    item={
        type="item",
        text="Item Item",
    },
    side={
        type="side",
        text="Side Item",
    },
    str={
        type="str",
        text="String Item",
    },
    int={
        type="int",
        text="Integer Item",
    },
    num={
        type="num",
        text="Number Item",
    },
    list={
        type="list",
        text="List Item",
        object = {
            type="int",
            text="One of Many"
        }
    }
}
dl.printFmt('T', "Test Program")
dl.printFmt('t', "Configuration")
local config = dl.config("try.config", texts, default, false)
dl.printFmt('r', sz.serialize(config))
