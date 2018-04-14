print("== Torch Crafting ==")

c = require("component")
sides = require("sides")
sr = require("serialization")
r = require("robot")

ic = c.inventory_controller
sd = sides.down
crafter = c.crafting



-- Check robots inventory is empty
cnti = r.inventorySize()

if cnti < 9 then
  print("Robot's inventory too small.")
  return 1
end

lineLn = cnti / 4

test = false
for i = 1, cnti do
  it = ic.getStackInInternalSlot(i)
  if not (it == nil) then
    test = true
    print(it.label .. " in slot " .. i)
  end
end

if test then
  print("Robot's inventory not empty.")
  return 1
end

-- Check correct items in chest

cnt = ic.getInventorySize(sd)
print("Chest slots: " .. cnt)

if not (cnt > 1) then
   print("Is there chest under the robot?")
   return 1
end

it1 = ic.getStackInSlot(sd, 1)
print(sr.serialize(it1))
it2 = ic.getStackInSlot(sd, 2)
print(sr.serialize(it2))

if not (it1["name"] == "minecraft:coal") then
   print("Need Coal in Slot 1")
   return 1
end

if not (it2["name"] == "minecraft:stick") then
   print("Need Stick in Slot 2")
   return 1
end

r.select(1)
ic.suckFromSlot(sd, 1, 1)
r.select(1+lineLn)
ic.suckFromSlot(sd, 2, 1)

test = crafter.craft(4)

if not (test) then
   print("Something went wrong in the crafing")
end

r.select(1+lineLn)
r.dropDown()