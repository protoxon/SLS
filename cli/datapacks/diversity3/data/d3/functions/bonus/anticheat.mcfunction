####################################################################
# THIS FUNCTION WAS MADE BY QWERTYUIOPTHEPIE
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://www.youtube.com/Temporarily9
# Twitter -> https://twitter.com/qwertyuiopthepi
####################################################################

# It's called anticheat, but it really just handles all of the UUID-based teleports.
# Executes once per tick on every player when golf branch is active.
scoreboard players operation @e[type=ender_pearl] UUID -= @s UUID
scoreboard players operation @e[tag=golferLoc] UUID -= @s UUID
scoreboard players operation @e[tag=enderPearlLoc] UUID -= @s UUID
scoreboard players operation @e[tag=lastLoc] UUID -= @s UUID

execute at @e[tag=golferLoc,scores={UUID=0},distance=0.5..] run scoreboard players reset @s ballReturnTimer

execute at @e[tag=golferLoc,scores={UUID=0},distance=0.5..] run teleport @s ~ ~ ~
tp @e[tag=enderPearlLoc,scores={UUID=0}] @e[type=ender_pearl,limit=1,scores={UUID=0}]

# Move LastLoc to current golferLoc
execute if entity @e[tag=enderPearlLoc,scores={UUID=0}] unless entity @e[type=ender_pearl,scores={UUID=0}] run tp @e[tag=lastLoc,scores={UUID=0}] @e[tag=golferLoc,scores={UUID=0},limit=1]

# move golferLoc to where enderPearlLoc is if ender pearl hit (new method)
execute if entity @e[tag=enderPearlLoc,scores={UUID=0}] unless entity @e[type=ender_pearl,scores={UUID=0}] at @e[tag=enderPearlLoc,scores={UUID=0},limit=1] as @e[tag=golferLoc,scores={UUID=0}] align x align y align z positioned ~.5 ~1.5 ~.5 run tp ~ ~ ~
execute if entity @e[tag=enderPearlLoc,scores={UUID=0}] unless entity @e[type=ender_pearl,scores={UUID=0}] run data merge entity @e[tag=golferLoc,scores={UUID=0},limit=1] {Marker:0b}

#execute if entity @e[tag=enderPearlLoc,scores={UUID=0}] unless entity @e[type=ender_pearl,scores={UUID=0}] run say marker 0


# Old item_frame technique, not needed with align
#execute if entity @e[tag=enderPearlLoc,scores={UUID=0}] unless entity @e[type=ender_pearl,scores={UUID=0}] run tp @e[tag=golferLoc,scores={UUID=0}] @e[tag=enderPearlLoc,scores={UUID=0},limit=1]
#execute if entity @e[tag=enderPearlLoc,scores={UUID=0}] unless entity @e[type=ender_pearl,scores={UUID=0}] at @e[tag=enderPearlLoc,scores={UUID=0},limit=1] run summon item_frame ~ ~-5 ~ {Tags:["alignGolferLoc"]}
#execute if entity @e[tag=enderPearlLoc,scores={UUID=0}] unless entity @e[type=ender_pearl,scores={UUID=0}] run tp @e[tag=enderPearlLoc,scores={UUID=0}] @e[tag=alignGolferLoc,limit=1]
#execute if entity @e[tag=enderPearlLoc,scores={UUID=0}] unless entity @e[type=ender_pearl,scores={UUID=0}] as @e[tag=enderPearlLoc,scores={UUID=0}] at @s run tp @s ~ ~5.5 ~
#execute if entity @e[tag=enderPearlLoc,scores={UUID=0}] unless entity @e[type=ender_pearl,scores={UUID=0}] run tp @e[tag=golferLoc,scores={UUID=0}] @e[tag=enderPearlLoc,scores={UUID=0},limit=1]
#kill @e[tag=alignGolferLoc]

# Give the player an ender pearl to get ready for next shot
# modified to instead give the tag "needsBall"
execute if entity @e[tag=enderPearlLoc,scores={UUID=0}] unless entity @e[type=ender_pearl,scores={UUID=0}] run clear @s ender_pearl
#execute if entity @e[tag=enderPearlLoc,scores={UUID=0}] unless entity @e[type=ender_pearl,scores={UUID=0}] run give @s ender_pearl{display:{Name:"{\"text\":\"Golf Pearl\",\"italic\":\"false\",\"color\":\"dark_green\",\"bold\":\"true\"}",Lore:['{"text":"Drop this item to quit current hole","italic":"true","color":"green"}']}}

execute if entity @e[tag=enderPearlLoc,scores={UUID=0}] unless entity @e[type=ender_pearl,scores={UUID=0}] run tag @s add needsBall
execute unless entity @e[type=ender_pearl,scores={UUID=0}] run kill @e[tag=enderPearlLoc,scores={UUID=0}]


# Failsafe
execute unless entity @s[nbt={Inventory:[{id:"minecraft:ender_pearl"}]}] run scoreboard players add @s[tag=golfing,nbt={OnGround:1b}] golfFailsafe 1
tag @s[scores={golfFailsafe=200..}] add needsBall
scoreboard players reset @s[nbt={Inventory:[{id:"minecraft:ender_pearl"}]}] golfFailsafe


# KILLS ARMOR ON GROUND
execute if entity @e[nbt={Item:{tag:{GolfGear:1b}},OnGround:1b}] run kill @e[nbt={Item:{tag:{GolfGear:1b}},OnGround:1b}]


# OoB stuff
# Ball out of bounds
execute if entity @e[type=ender_pearl,tag=outOfBounds,scores={UUID=0}] run kill @e[tag=enderPearlLoc,scores={UUID=0}]
execute if entity @e[type=ender_pearl,tag=outOfBounds,scores={UUID=0}] run tellraw @s {"text":"● Pearl went out of bounds! ●","color":"dark_red"}
execute if entity @e[type=ender_pearl,tag=outOfBounds,scores={UUID=0}] run playsound entity.zombie.destroy_egg master @s ~ ~ ~ 1 0.5
execute if entity @e[type=ender_pearl,tag=outOfBounds,scores={UUID=0}] run clear @s ender_pearl
execute if entity @e[type=ender_pearl,tag=outOfBounds,scores={UUID=0}] run tag @s add needsBall
kill @e[type=ender_pearl,tag=outOfBounds,scores={UUID=0}]

# golferLoc out of bounds (fell out)
execute if entity @e[type=!ender_pearl,tag=outOfBounds,scores={UUID=0}] run tellraw @s {"text":"● Out of bounds! ●","color":"dark_red"}
execute if entity @e[type=!ender_pearl,tag=outOfBounds,scores={UUID=0}] run tp @e[tag=golferLoc,scores={UUID=0}] @e[tag=lastLoc,limit=1,scores={UUID=0}]

# player fell in water
execute if entity @s[tag=golfing] if block ~ ~ ~ water run tellraw @s {"text":"░ Water Hazard! ░","color":"blue"}
execute if entity @s[tag=golfing] if block ~ ~ ~ water run playsound ambient.underwater.enter master @s ~ ~ ~ 10 1 1
execute if entity @s[tag=golfing] if block ~ ~ ~ water run tp @e[tag=golferLoc,scores={UUID=0}] @e[tag=lastLoc,limit=1,scores={UUID=0}]
execute if entity @s[tag=golfing] if block ~ ~ ~ water at @e[tag=lastLoc,limit=1,scores={UUID=0}] run teleport @s ~ ~ ~

# Return the ball
scoreboard players add @s[tag=needsBall,nbt={OnGround:1b}] ballReturnTimer 1
tag @s[tag=needsBall,nbt={OnGround:1b},scores={ballReturnTimer=10..}] add giveBall
execute if entity @s[tag=giveBall] run data merge entity @e[tag=golferLoc,scores={UUID=0},limit=1] {Marker:1b}
#execute if entity @s[tag=giveBall] run say marker 1

#scoreboard players reset @s[tag=giveBall] ballReturnTimer
#tag @s[tag=giveBall] remove needsBall

execute as @s[tag=golfing] if entity @s[nbt={Inventory:[{Slot:0b,id:"minecraft:written_book"}]}] run replaceitem entity @s[tag=giveBall,nbt={OnGround:1b},scores={ballReturnTimer=10..}] hotbar.1 ender_pearl{display:{Name:"{\"text\":\"Golf Pearl\",\"italic\":\"false\",\"color\":\"dark_green\",\"bold\":\"true\"},{\"text\":\"Golf Pearl\",\"italic\":\"false\",\"color\":\"dark_green\",\"bold\":\"true\"",Lore:['{"text":"Drop this item to quit current hole","italic":"true","color":"green"}']}}
execute as @s[tag=golfing] unless entity @s[nbt={Inventory:[{Slot:0b,id:"minecraft:written_book"}]}] run replaceitem entity @s[tag=giveBall,nbt={OnGround:1b},scores={ballReturnTimer=10..}] hotbar.0 ender_pearl{display:{Name:"{\"text\":\"Golf Pearl\",\"italic\":\"false\",\"color\":\"dark_green\",\"bold\":\"true\"}",Lore:['{"text":"Drop this item to quit current hole","italic":"true","color":"green"}']}}
scoreboard players reset @s[nbt={Inventory:[{id:"minecraft:ender_pearl"}]}] ballReturnTimer
tag @s[tag=giveBall,nbt={Inventory:[{id:"minecraft:ender_pearl"}]}] remove needsBall
tag @s[tag=giveBall,nbt={Inventory:[{id:"minecraft:ender_pearl"}]}] remove giveBall

#execute as @s[tag=golfing] run give @s[tag=giveBall] ender_pearl{display:{Name:"{\"text\":\"Golf Pearl\",\"italic\":\"false\",\"color\":\"dark_green\",\"bold\":\"true\"}",Lore:['{"text":"Drop this item to quit current hole","italic":"true","color":"green"}']}}




# sand trap nausea
execute if block ~ ~-1 ~ sand run scoreboard players add @s[tag=golfing,scores={sandTrapTimer=..6}] sandTrapTimer 1
execute if block ~ ~-1 ~ sand if entity @s[scores={sandTrapTimer=1}] run effect give @s nausea 1000000 0 true
execute if block ~ ~-1 ~ sand if entity @s[scores={sandTrapTimer=5}] run tellraw @s {"text":"☠ Sand Trap ☠","color":"dark_red"}

# When off sand
execute unless block ~ ~-1 ~ sand run effect clear @s nausea
execute unless block ~ ~-1 ~ sand run scoreboard players set @s sandTrapTimer 0


scoreboard players operation @e[type=ender_pearl] UUID += @s UUID
scoreboard players operation @e[tag=golferLoc] UUID += @s UUID
scoreboard players operation @e[tag=enderPearlLoc] UUID += @s UUID
scoreboard players operation @e[tag=lastLoc] UUID += @s UUID