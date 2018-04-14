local args = table.pack(...)
local iox = require("io")

local f, m = loadfile(args[1])
if not f then
    io.stderr:write("Could not load lua: "..m.."\n")
    return 1
end

fout, m = iox.open("_err", "w")

local ret
local s, m = xpcall(function()
    ret = f(table.unpack(args, 2))
end, function(...)
    io.stderr:write(debug.traceback()..'\n')
    fout:write(debug.traceback()..'\n')
    print(...)
    fout:write(...)
end)
if not s and m then
    io.stderr:write(m..'\n')
    fout:write(m..'\n')
end
iox.close(fout)

return ret