local args = {...}
local source = "wget https://raw.githubusercontent.com/gdarai/SpaceRace/master/OC/"
print("\n== Darai's Space Race Downloader ==")
print("  -- Basic OC programs for you --\n")

cmp   = require("component")
shell = require("shell")
io    = require("io")
fs    = require("filesystem")

-- Test if we have internet card available
test = false
for _, a in pairs(cmp.list()) do
    if a == "internet" then test = true end
end
if test == false then
    print("Sorry, this computer doesn't have internet access. How did you get this program here anyway?")
    return 1
end

-- Check the daraiLib presence
prgTgt = "/lib/daraiLib.lua"
if not fs.exists(prgTgt) then
    print("Missing crucial library daraiLib.lua. Can I download it from SpaceRace repo?")
    io.write("?? [Yn]: ")
    if io.read() ~="Y" then
        print("Without this lib, no program here will work.")
    else
        -- Jump to target directory
        wd = shell.getWorkingDirectory()
        shell.setWorkingDirectory("/lib")
        -- Download the program
        prgCmd = source .. "OpenDiscs/filter/lib/daraiLib.lua"
        print("Saving library daraiLib into the path /lib")
        print(prgCmd)
        shell.execute(prgCmd)
        -- Jump back
        shell.setWorkingDirectory(wd)
        print("Done\n")
    end
end

-- Set the table of known programs
programs = {}
programs['debug'] = {origin="InitialPrograms/", file="debug.lua", target="/bin"}
programs['filter'] = {origin="OpenDiscs/filter/home", file="filter.lua", target="/home"}
programs['crafter'] = {origin="OpenDiscs/crafter/home", file="crafter.lua", target="/home"}

-- If we don't have program selected, give the list
if #args==0 then
    print("Select program and run 'get <Program>'. The program will be copied into the Target folder.")
    print("<Press Any Key> to print available programs.")
    io.read()
    print('Program', 'Target')
    print('=======', '======')
    for a in pairs(programs) do
        print(a, programs[a].target)
    end
    print('')
    return 1
else
    -- Check if the program is known
    prgName = args[1]
    prgLine = programs[prgName]
    if prgLine == nil then
        print("Program " .. prgName .. " is unknown.")
        return 1
    end

    -- Check if the program is allready downloaded
    prgTgt = prgLine.target .. "/" .. prgLine.file
    if fs.exists(prgTgt) then
        print("Program " .. prgTgt .. " is allready downloaded.")
        return 1
    end

    -- Jump to target directory
    wd = shell.getWorkingDirectory()
    shell.setWorkingDirectory(prgLine.target)
    -- Download the program
    prgCmd = source .. prgLine.origin .. prgLine.file
    print("Saving program " .. prgName .. " into the path " .. prgLine.target)
    print(prgCmd)
    shell.execute(prgCmd)
    -- Jump back
    shell.setWorkingDirectory(wd)
    print("Done")
end
