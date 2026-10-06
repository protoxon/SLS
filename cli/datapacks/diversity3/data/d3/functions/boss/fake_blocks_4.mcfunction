####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 30 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar BlockHeight


# LAND SOUND FOR SILENT MOBS
#execute at @e[tag=Level4Mob,tag=SilentBlock,nbt={OnGround:1b}] run playsound block.sand.fall master @a ~ ~ ~
tag @e[tag=SilentBlock,nbt={OnGround:1b}] remove SilentBlock

scoreboard objectives add BlockHeight dummy
execute unless entity @e[tag=StoneMob] run scoreboard objectives remove BlockHeight


tag @e remove MobDrop
execute align x align y align z run tag @e[tag=BossMob,x=-1039,y=60,z=-993,dx=48,dy=5,dz=15] add MobDrop

#effect give @e[tag=StoneMob] slowness 1 1 true



# SETS POSITIONS
execute if entity @e[tag=StoneMob20] store result entity @e[tag=StoneAS20,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob20,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob20] store result score @e[tag=StoneAS20,limit=1] BlockHeight run data get entity @e[tag=StoneMob20,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS20] BlockHeight 14
execute if entity @e[tag=StoneMob20] store result entity @e[tag=StoneAS20,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS20,limit=1] BlockHeight
execute if entity @e[tag=StoneMob20] store result entity @e[tag=StoneAS20,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob20,limit=1] Pos[2] 10

execute if entity @e[tag=StoneMob21] store result entity @e[tag=StoneAS21,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob21,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob21] store result score @e[tag=StoneAS21,limit=1] BlockHeight run data get entity @e[tag=StoneMob21,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS21] BlockHeight 14
execute if entity @e[tag=StoneMob21] store result entity @e[tag=StoneAS21,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS21,limit=1] BlockHeight
execute if entity @e[tag=StoneMob21] store result entity @e[tag=StoneAS21,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob21,limit=1] Pos[2] 10

execute if entity @e[tag=StoneMob22] store result entity @e[tag=StoneAS22,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob22,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob22] store result score @e[tag=StoneAS22,limit=1] BlockHeight run data get entity @e[tag=StoneMob22,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS22] BlockHeight 14
execute if entity @e[tag=StoneMob22] store result entity @e[tag=StoneAS22,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS22,limit=1] BlockHeight
execute if entity @e[tag=StoneMob22] store result entity @e[tag=StoneAS22,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob22,limit=1] Pos[2] 10

execute if entity @e[tag=StoneMob23] store result entity @e[tag=StoneAS23,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob23,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob23] store result score @e[tag=StoneAS23,limit=1] BlockHeight run data get entity @e[tag=StoneMob23,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS23] BlockHeight 14
execute if entity @e[tag=StoneMob23] store result entity @e[tag=StoneAS23,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS23,limit=1] BlockHeight
execute if entity @e[tag=StoneMob23] store result entity @e[tag=StoneAS23,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob23,limit=1] Pos[2] 10


execute at @e[tag=Level4Mob,nbt=!{OnGround:1b}] run particle block light_gray_concrete_powder ~ ~ ~ 0.1 0.1 0.1 0 2 force
#execute at @e[tag=Level4Mob,nbt=!{OnGround:1b}] run particle flame ~ ~ ~ 0.1 0.1 0.1 0 2 force


tag @e[tag=Level4Mob,nbt={OnGround:0b}] remove OnGround
execute at @e[tag=Level4Mob,tag=!OnGround,nbt={OnGround:1b}] run playsound block.sand.place master @a ~ ~ ~ 1 1 0
tag @e[tag=Level4Mob,nbt={OnGround:1b}] add OnGround


execute as @e[tag=Level4Mob,nbt={HurtTime:10s}] at @s run playsound block.sand.break master @a ~ 64 ~ 1 1 0

# SETS ROTATION
execute store result entity @e[tag=StoneAS20,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob20,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS21,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob21,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS22,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob22,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS23,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob23,limit=1] Rotation[0] 10



# ROUND 4
execute if entity @e[tag=StoneMob20] unless entity @e[tag=StoneAS20] at @e[tag=StoneMob20] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:light_gray_concrete_powder",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS20","Level4Mob"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob21] unless entity @e[tag=StoneAS21] at @e[tag=StoneMob21] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:light_gray_concrete_powder",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS21","Level4Mob"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob22] unless entity @e[tag=StoneAS22] at @e[tag=StoneMob22] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:light_gray_concrete_powder",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS22","Level4Mob"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob23] unless entity @e[tag=StoneAS23] at @e[tag=StoneMob23] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:light_gray_concrete_powder",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS23","Level4Mob"],DisabledSlots:2039583}


execute if entity @e[tag=StoneAS20,tag=MobDrop] unless entity @e[tag=StoneMob20] at @e[tag=StoneAS20] run playsound block.sand.break master @a ~ 64 ~ 1 1 0
execute if entity @e[tag=StoneAS20,tag=MobDrop] unless entity @e[tag=StoneMob20] at @e[tag=StoneAS20] run summon item ~ 64 ~ {Item:{id:"minecraft:light_gray_concrete_powder",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute if entity @e[tag=StoneAS21,tag=MobDrop] unless entity @e[tag=StoneMob21] at @e[tag=StoneAS21] run playsound block.sand.break master @a ~ 64 ~ 1 1 0
execute if entity @e[tag=StoneAS21,tag=MobDrop] unless entity @e[tag=StoneMob21] at @e[tag=StoneAS21] run summon item ~ 64 ~ {Item:{id:"minecraft:light_gray_concrete_powder",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute if entity @e[tag=StoneAS22,tag=MobDrop] unless entity @e[tag=StoneMob22] at @e[tag=StoneAS22] run playsound block.sand.break master @a ~ 64 ~ 1 1 0
execute if entity @e[tag=StoneAS22,tag=MobDrop] unless entity @e[tag=StoneMob22] at @e[tag=StoneAS22] run summon item ~ 64 ~ {Item:{id:"minecraft:light_gray_concrete_powder",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute if entity @e[tag=StoneAS23,tag=MobDrop] unless entity @e[tag=StoneMob23] at @e[tag=StoneAS23] run playsound block.sand.break master @a ~ 64 ~ 1 1 0
execute if entity @e[tag=StoneAS23,tag=MobDrop] unless entity @e[tag=StoneMob23] at @e[tag=StoneAS23] run summon item ~ 64 ~ {Item:{id:"minecraft:light_gray_concrete_powder",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}


execute if entity @e[tag=StoneAS20] unless entity @e[tag=StoneMob20] run kill @e[tag=StoneAS20]
execute if entity @e[tag=StoneAS21] unless entity @e[tag=StoneMob21] run kill @e[tag=StoneAS21]
execute if entity @e[tag=StoneAS22] unless entity @e[tag=StoneMob22] run kill @e[tag=StoneAS22]
execute if entity @e[tag=StoneAS23] unless entity @e[tag=StoneMob23] run kill @e[tag=StoneAS23]