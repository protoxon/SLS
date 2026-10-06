####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 29 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BlockHeight


# LAND SOUND FOR SILENT MOBS
execute at @e[tag=SilentBlock,nbt={OnGround:1b}] run playsound block.stone.fall master @a ~ ~ ~
tag @e[tag=SilentBlock,nbt={OnGround:1b}] remove SilentBlock

scoreboard objectives add BlockHeight dummy
execute unless entity @e[tag=StoneMob] run scoreboard objectives remove BlockHeight


tag @e remove MobDrop
execute align x align y align z run tag @e[tag=BossMob,x=-1039,y=60,z=-993,dx=48,dy=5,dz=15] add MobDrop

effect give @e[tag=Level2Mob] slowness 1 1 true



# SETS POSITIONS
execute if entity @e[tag=StoneMob5] store result entity @e[tag=StoneAS5,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob5,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob5] store result score @e[tag=StoneAS5,limit=1] BlockHeight run data get entity @e[tag=StoneMob5,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS5] BlockHeight 14
execute if entity @e[tag=StoneMob5] store result entity @e[tag=StoneAS5,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS5,limit=1] BlockHeight
execute if entity @e[tag=StoneMob5] store result entity @e[tag=StoneAS5,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob5,limit=1] Pos[2] 10


execute if entity @e[tag=StoneMob6] store result entity @e[tag=StoneAS6,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob6,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob6] store result score @e[tag=StoneAS6,limit=1] BlockHeight run data get entity @e[tag=StoneMob6,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS6] BlockHeight 14
execute if entity @e[tag=StoneMob6] store result entity @e[tag=StoneAS6,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS6,limit=1] BlockHeight
execute if entity @e[tag=StoneMob6] store result entity @e[tag=StoneAS6,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob6,limit=1] Pos[2] 10

execute if entity @e[tag=StoneMob7] store result entity @e[tag=StoneAS7,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob7,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob7] store result score @e[tag=StoneAS7,limit=1] BlockHeight run data get entity @e[tag=StoneMob7,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS7] BlockHeight 14
execute if entity @e[tag=StoneMob7] store result entity @e[tag=StoneAS7,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS7,limit=1] BlockHeight
execute if entity @e[tag=StoneMob7] store result entity @e[tag=StoneAS7,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob7,limit=1] Pos[2] 10


execute if entity @e[tag=StoneMob8] store result entity @e[tag=StoneAS8,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob8,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob8] store result score @e[tag=StoneAS8,limit=1] BlockHeight run data get entity @e[tag=StoneMob8,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS8] BlockHeight 14
execute if entity @e[tag=StoneMob8] store result entity @e[tag=StoneAS8,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS8,limit=1] BlockHeight
execute if entity @e[tag=StoneMob8] store result entity @e[tag=StoneAS8,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob8,limit=1] Pos[2] 10

execute if entity @e[tag=StoneMob9] store result entity @e[tag=StoneAS9,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob9,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob9] store result score @e[tag=StoneAS9,limit=1] BlockHeight run data get entity @e[tag=StoneMob9,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS9] BlockHeight 14
execute if entity @e[tag=StoneMob9] store result entity @e[tag=StoneAS9,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS9,limit=1] BlockHeight
execute if entity @e[tag=StoneMob9] store result entity @e[tag=StoneAS9,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob9,limit=1] Pos[2] 10

execute if entity @e[tag=StoneMob10] store result entity @e[tag=StoneAS10,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob10,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob10] store result score @e[tag=StoneAS10,limit=1] BlockHeight run data get entity @e[tag=StoneMob10,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS10] BlockHeight 14
execute if entity @e[tag=StoneMob10] store result entity @e[tag=StoneAS10,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS10,limit=1] BlockHeight
execute if entity @e[tag=StoneMob10] store result entity @e[tag=StoneAS10,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob10,limit=1] Pos[2] 10


execute if entity @e[tag=StoneMob11] store result entity @e[tag=StoneAS11,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob11,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob11] store result score @e[tag=StoneAS11,limit=1] BlockHeight run data get entity @e[tag=StoneMob11,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS11] BlockHeight 14
execute if entity @e[tag=StoneMob11] store result entity @e[tag=StoneAS11,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS11,limit=1] BlockHeight
execute if entity @e[tag=StoneMob11] store result entity @e[tag=StoneAS11,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob11,limit=1] Pos[2] 10

execute if entity @e[tag=StoneMob12] store result entity @e[tag=StoneAS12,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob12,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob12] store result score @e[tag=StoneAS12,limit=1] BlockHeight run data get entity @e[tag=StoneMob12,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS12] BlockHeight 14
execute if entity @e[tag=StoneMob12] store result entity @e[tag=StoneAS12,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS12,limit=1] BlockHeight
execute if entity @e[tag=StoneMob12] store result entity @e[tag=StoneAS12,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob12,limit=1] Pos[2] 10

execute if entity @e[tag=StoneMob13] store result entity @e[tag=StoneAS13,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob13,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob13] store result score @e[tag=StoneAS13,limit=1] BlockHeight run data get entity @e[tag=StoneMob13,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS13] BlockHeight 14
execute if entity @e[tag=StoneMob13] store result entity @e[tag=StoneAS13,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS13,limit=1] BlockHeight
execute if entity @e[tag=StoneMob13] store result entity @e[tag=StoneAS13,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob13,limit=1] Pos[2] 10

execute if entity @e[tag=StoneMob14] store result entity @e[tag=StoneAS14,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob14,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob14] store result score @e[tag=StoneAS14,limit=1] BlockHeight run data get entity @e[tag=StoneMob14,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS14] BlockHeight 14
execute if entity @e[tag=StoneMob14] store result entity @e[tag=StoneAS14,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS14,limit=1] BlockHeight
execute if entity @e[tag=StoneMob14] store result entity @e[tag=StoneAS14,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob14,limit=1] Pos[2] 10


execute if entity @e[tag=StoneMob15] store result entity @e[tag=StoneAS15,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob15,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob15] store result score @e[tag=StoneAS15,limit=1] BlockHeight run data get entity @e[tag=StoneMob15,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS15] BlockHeight 14
execute if entity @e[tag=StoneMob15] store result entity @e[tag=StoneAS15,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS15,limit=1] BlockHeight
execute if entity @e[tag=StoneMob15] store result entity @e[tag=StoneAS15,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob15,limit=1] Pos[2] 10

execute if entity @e[tag=StoneMob16] store result entity @e[tag=StoneAS16,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob16,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob16] store result score @e[tag=StoneAS16,limit=1] BlockHeight run data get entity @e[tag=StoneMob16,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS16] BlockHeight 14
execute if entity @e[tag=StoneMob16] store result entity @e[tag=StoneAS16,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS16,limit=1] BlockHeight
execute if entity @e[tag=StoneMob16] store result entity @e[tag=StoneAS16,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob16,limit=1] Pos[2] 10

execute if entity @e[tag=StoneMob17] store result entity @e[tag=StoneAS17,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob17,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob17] store result score @e[tag=StoneAS17,limit=1] BlockHeight run data get entity @e[tag=StoneMob17,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS17] BlockHeight 14
execute if entity @e[tag=StoneMob17] store result entity @e[tag=StoneAS17,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS17,limit=1] BlockHeight
execute if entity @e[tag=StoneMob17] store result entity @e[tag=StoneAS17,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob17,limit=1] Pos[2] 10

execute if entity @e[tag=StoneMob18] store result entity @e[tag=StoneAS18,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob18,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob18] store result score @e[tag=StoneAS18,limit=1] BlockHeight run data get entity @e[tag=StoneMob18,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS18] BlockHeight 14
execute if entity @e[tag=StoneMob18] store result entity @e[tag=StoneAS18,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS18,limit=1] BlockHeight
execute if entity @e[tag=StoneMob18] store result entity @e[tag=StoneAS18,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob18,limit=1] Pos[2] 10

execute if entity @e[tag=StoneMob19] store result entity @e[tag=StoneAS19,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob19,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob19] store result score @e[tag=StoneAS19,limit=1] BlockHeight run data get entity @e[tag=StoneMob19,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS19] BlockHeight 14
execute if entity @e[tag=StoneMob19] store result entity @e[tag=StoneAS19,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS19,limit=1] BlockHeight
execute if entity @e[tag=StoneMob19] store result entity @e[tag=StoneAS19,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob19,limit=1] Pos[2] 10


execute at @e[tag=Level2Mob,nbt=!{Motion:[0.0d,0.0d,0.0d]}] if block ~ ~-0.1 ~ black_concrete run particle block black_concrete ~ ~ ~ 0.1 0.1 0.1 0 2 force
execute at @e[tag=Level2Mob,nbt=!{Motion:[0.0d,0.0d,0.0d]}] if block ~ ~-0.1 ~ red_concrete run particle block red_concrete ~ ~ ~ 0.1 0.1 0.1 0 2 force
execute at @e[tag=Level2Mob,nbt=!{Motion:[0.0d,0.0d,0.0d]}] if block ~ ~-0.1 ~ light_blue_concrete run particle block light_blue_concrete ~ ~ ~ 0.1 0.1 0.1 0 2 force
execute at @e[tag=Level2Mob,nbt=!{Motion:[0.0d,0.0d,0.0d]}] if block ~ ~-0.1 ~ grass_block run particle block grass_block ~ ~ ~ 0.1 0.1 0.1 0 2 force
execute at @e[tag=Level2Mob,nbt=!{Motion:[0.0d,0.0d,0.0d]}] if block ~ ~-0.1 ~ stone run particle block stone ~ ~ ~ 0.1 0.1 0.1 0 2 force
execute at @e[tag=Level2Mob,nbt=!{Motion:[0.0d,0.0d,0.0d]}] if block ~ ~-0.1 ~ granite run particle block granite ~ ~ ~ 0.1 0.1 0.1 0 2 force
execute at @e[tag=Level2Mob,nbt=!{Motion:[0.0d,0.0d,0.0d]}] if block ~ ~-0.1 ~ andesite run particle block andesite ~ ~ ~ 0.1 0.1 0.1 0 2 force
execute at @e[tag=Level2Mob,nbt=!{Motion:[0.0d,0.0d,0.0d]}] if block ~ ~-0.1 ~ diorite run particle block diorite ~ ~ ~ 0.1 0.1 0.1 0 2 force
execute at @e[tag=Level2Mob,nbt=!{Motion:[0.0d,0.0d,0.0d]}] if block ~ ~-0.1 ~ coal_ore run particle block stone ~ ~ ~ 0.1 0.1 0.1 0 2 force

execute as @e[tag=Level2Mob,nbt={HurtTime:10s}] at @s run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0


# SETS ROTATION
execute store result entity @e[tag=StoneAS5,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob5,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS6,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob6,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS7,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob7,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS8,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob8,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS9,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob9,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS10,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob10,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS11,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob11,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS12,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob12,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS13,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob13,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS14,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob14,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS15,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob15,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS16,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob16,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS17,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob17,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS18,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob18,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS19,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob19,limit=1] Rotation[0] 10



# ROUND 2
execute if entity @e[tag=StoneMob5] unless entity @e[tag=StoneAS5] at @e[tag=StoneMob5] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:cobblestone",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS5","Level2Mob"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob6] unless entity @e[tag=StoneAS6] at @e[tag=StoneMob6] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:cobblestone",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS6","Level2Mob"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob7] unless entity @e[tag=StoneAS7] at @e[tag=StoneMob7] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:cobblestone",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS7","Level2Mob"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob8] unless entity @e[tag=StoneAS8] at @e[tag=StoneMob8] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:cobblestone",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS8","Level2Mob"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob9] unless entity @e[tag=StoneAS9] at @e[tag=StoneMob9] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:cobblestone",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS9","Level2Mob"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob10] unless entity @e[tag=StoneAS10] at @e[tag=StoneMob10] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:cobblestone",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS10","Level2Mob"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob11] unless entity @e[tag=StoneAS11] at @e[tag=StoneMob11] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:cobblestone",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS11","Level2Mob"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob12] unless entity @e[tag=StoneAS12] at @e[tag=StoneMob12] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:cobblestone",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS12","Level2Mob"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob13] unless entity @e[tag=StoneAS13] at @e[tag=StoneMob13] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:cobblestone",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS13","Level2Mob"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob14] unless entity @e[tag=StoneAS14] at @e[tag=StoneMob14] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:cobblestone",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS14","Level2Mob"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob15] unless entity @e[tag=StoneAS15] at @e[tag=StoneMob15] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:cobblestone",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS15","Level2Mob"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob16] unless entity @e[tag=StoneAS16] at @e[tag=StoneMob16] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:cobblestone",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS16","Level2Mob"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob17] unless entity @e[tag=StoneAS17] at @e[tag=StoneMob17] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:cobblestone",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS17","Level2Mob"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob18] unless entity @e[tag=StoneAS18] at @e[tag=StoneMob18] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:cobblestone",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS18","Level2Mob"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob19] unless entity @e[tag=StoneAS19] at @e[tag=StoneMob19] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:cobblestone",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS19","Level2Mob"],DisabledSlots:2039583}


execute if entity @e[tag=StoneAS5,tag=MobDrop] unless entity @e[tag=StoneMob5] at @e[tag=StoneAS5] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[tag=StoneAS5,tag=MobDrop] unless entity @e[tag=StoneMob5] at @e[tag=StoneAS5] run summon item ~ 64 ~ {Item:{id:"minecraft:cobblestone",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute if entity @e[tag=StoneAS6,tag=MobDrop] unless entity @e[tag=StoneMob6] at @e[tag=StoneAS6] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[tag=StoneAS6,tag=MobDrop] unless entity @e[tag=StoneMob6] at @e[tag=StoneAS6] run summon item ~ 64 ~ {Item:{id:"minecraft:cobblestone",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute if entity @e[tag=StoneAS7,tag=MobDrop] unless entity @e[tag=StoneMob7] at @e[tag=StoneAS7] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[tag=StoneAS7,tag=MobDrop] unless entity @e[tag=StoneMob7] at @e[tag=StoneAS7] run summon item ~ 64 ~ {Item:{id:"minecraft:cobblestone",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute if entity @e[tag=StoneAS8,tag=MobDrop] unless entity @e[tag=StoneMob8] at @e[tag=StoneAS8] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[tag=StoneAS8,tag=MobDrop] unless entity @e[tag=StoneMob8] at @e[tag=StoneAS8] run summon item ~ 64 ~ {Item:{id:"minecraft:cobblestone",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}

execute if entity @e[tag=StoneAS9,tag=MobDrop] unless entity @e[tag=StoneMob9] at @e[tag=StoneAS9] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[tag=StoneAS9,tag=MobDrop] unless entity @e[tag=StoneMob9] at @e[tag=StoneAS9] run summon item ~ 64 ~ {Item:{id:"minecraft:cobblestone",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute if entity @e[tag=StoneAS10,tag=MobDrop] unless entity @e[tag=StoneMob10] at @e[tag=StoneAS10] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[tag=StoneAS10,tag=MobDrop] unless entity @e[tag=StoneMob10] at @e[tag=StoneAS10] run summon item ~ 64 ~ {Item:{id:"minecraft:cobblestone",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute if entity @e[tag=StoneAS11,tag=MobDrop] unless entity @e[tag=StoneMob11] at @e[tag=StoneAS11] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[tag=StoneAS11,tag=MobDrop] unless entity @e[tag=StoneMob11] at @e[tag=StoneAS11] run summon item ~ 64 ~ {Item:{id:"minecraft:cobblestone",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute if entity @e[tag=StoneAS12,tag=MobDrop] unless entity @e[tag=StoneMob12] at @e[tag=StoneAS12] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[tag=StoneAS12,tag=MobDrop] unless entity @e[tag=StoneMob12] at @e[tag=StoneAS12] run summon item ~ 64 ~ {Item:{id:"minecraft:cobblestone",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}

execute if entity @e[tag=StoneAS13,tag=MobDrop] unless entity @e[tag=StoneMob13] at @e[tag=StoneAS13] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[tag=StoneAS13,tag=MobDrop] unless entity @e[tag=StoneMob13] at @e[tag=StoneAS13] run summon item ~ 64 ~ {Item:{id:"minecraft:cobblestone",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute if entity @e[tag=StoneAS14,tag=MobDrop] unless entity @e[tag=StoneMob14] at @e[tag=StoneAS14] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[tag=StoneAS14,tag=MobDrop] unless entity @e[tag=StoneMob14] at @e[tag=StoneAS14] run summon item ~ 64 ~ {Item:{id:"minecraft:cobblestone",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute if entity @e[tag=StoneAS15,tag=MobDrop] unless entity @e[tag=StoneMob15] at @e[tag=StoneAS15] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[tag=StoneAS15,tag=MobDrop] unless entity @e[tag=StoneMob15] at @e[tag=StoneAS15] run summon item ~ 64 ~ {Item:{id:"minecraft:cobblestone",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute if entity @e[tag=StoneAS16,tag=MobDrop] unless entity @e[tag=StoneMob16] at @e[tag=StoneAS16] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[tag=StoneAS16,tag=MobDrop] unless entity @e[tag=StoneMob16] at @e[tag=StoneAS16] run summon item ~ 64 ~ {Item:{id:"minecraft:cobblestone",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}

execute if entity @e[tag=StoneAS17,tag=MobDrop] unless entity @e[tag=StoneMob17] at @e[tag=StoneAS17] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[tag=StoneAS17,tag=MobDrop] unless entity @e[tag=StoneMob17] at @e[tag=StoneAS17] run summon item ~ 64 ~ {Item:{id:"minecraft:cobblestone",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute if entity @e[tag=StoneAS18,tag=MobDrop] unless entity @e[tag=StoneMob18] at @e[tag=StoneAS18] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[tag=StoneAS18,tag=MobDrop] unless entity @e[tag=StoneMob18] at @e[tag=StoneAS18] run summon item ~ 64 ~ {Item:{id:"minecraft:cobblestone",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute if entity @e[tag=StoneAS19,tag=MobDrop] unless entity @e[tag=StoneMob19] at @e[tag=StoneAS19] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[tag=StoneAS19,tag=MobDrop] unless entity @e[tag=StoneMob19] at @e[tag=StoneAS19] run summon item ~ 64 ~ {Item:{id:"minecraft:cobblestone",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}




execute if entity @e[tag=StoneAS5] unless entity @e[tag=StoneMob5] run kill @e[tag=StoneAS5]
execute if entity @e[tag=StoneAS6] unless entity @e[tag=StoneMob6] run kill @e[tag=StoneAS6]
execute if entity @e[tag=StoneAS7] unless entity @e[tag=StoneMob7] run kill @e[tag=StoneAS7]
execute if entity @e[tag=StoneAS8] unless entity @e[tag=StoneMob8] run kill @e[tag=StoneAS8]
execute if entity @e[tag=StoneAS9] unless entity @e[tag=StoneMob9] run kill @e[tag=StoneAS9]
execute if entity @e[tag=StoneAS10] unless entity @e[tag=StoneMob10] run kill @e[tag=StoneAS10]
execute if entity @e[tag=StoneAS11] unless entity @e[tag=StoneMob11] run kill @e[tag=StoneAS11]
execute if entity @e[tag=StoneAS12] unless entity @e[tag=StoneMob12] run kill @e[tag=StoneAS12]
execute if entity @e[tag=StoneAS13] unless entity @e[tag=StoneMob13] run kill @e[tag=StoneAS13]
execute if entity @e[tag=StoneAS14] unless entity @e[tag=StoneMob14] run kill @e[tag=StoneAS14]
execute if entity @e[tag=StoneAS15] unless entity @e[tag=StoneMob15] run kill @e[tag=StoneAS15]
execute if entity @e[tag=StoneAS16] unless entity @e[tag=StoneMob16] run kill @e[tag=StoneAS16]
execute if entity @e[tag=StoneAS17] unless entity @e[tag=StoneMob17] run kill @e[tag=StoneAS17]
execute if entity @e[tag=StoneAS18] unless entity @e[tag=StoneMob18] run kill @e[tag=StoneAS18]
execute if entity @e[tag=StoneAS19] unless entity @e[tag=StoneMob19] run kill @e[tag=StoneAS19]
