####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 27 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

scoreboard objectives setdisplay sidebar BlockHeight


# LAND SOUND FOR SILENT MOBS
execute at @e[tag=SilentBlock,nbt={OnGround:1b}] run playsound block.stone.fall master @a ~ ~ ~
tag @e[tag=SilentBlock,nbt={OnGround:1b}] remove SilentBlock

scoreboard objectives add BlockHeight dummy
execute unless entity @e[tag=StoneMob] run scoreboard objectives remove BlockHeight


tag @e remove MobDrop
execute align x align y align z run tag @e[tag=BossMob,x=-1039,y=60,z=-993,dx=48,dy=5,dz=15] add MobDrop

effect give @e[tag=StoneMob] slowness 1 1 true



# SETS POSITIONS
execute if entity @e[tag=StoneMob1] store result entity @e[tag=StoneAS1,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob1,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob1] store result score @e[tag=StoneAS1,limit=1] BlockHeight run data get entity @e[tag=StoneMob1,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS1] BlockHeight 14
execute if entity @e[tag=StoneMob1] store result entity @e[tag=StoneAS1,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS1,limit=1] BlockHeight
execute if entity @e[tag=StoneMob1] store result entity @e[tag=StoneAS1,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob1,limit=1] Pos[2] 10

execute if entity @e[tag=StoneMob2] store result entity @e[tag=StoneAS2,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob2,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob2] store result score @e[tag=StoneAS2,limit=1] BlockHeight run data get entity @e[tag=StoneMob2,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS2] BlockHeight 14
execute if entity @e[tag=StoneMob2] store result entity @e[tag=StoneAS2,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS2,limit=1] BlockHeight
execute if entity @e[tag=StoneMob2] store result entity @e[tag=StoneAS2,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob2,limit=1] Pos[2] 10

execute if entity @e[tag=StoneMob3] store result entity @e[tag=StoneAS3,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob3,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob3] store result score @e[tag=StoneAS3,limit=1] BlockHeight run data get entity @e[tag=StoneMob3,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS3] BlockHeight 14
execute if entity @e[tag=StoneMob3] store result entity @e[tag=StoneAS3,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS3,limit=1] BlockHeight
execute if entity @e[tag=StoneMob3] store result entity @e[tag=StoneAS3,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob3,limit=1] Pos[2] 10

execute if entity @e[tag=StoneMob4] store result entity @e[tag=StoneAS4,limit=1] Pos[0] double 0.1 run data get entity @e[tag=StoneMob4,limit=1] Pos[0] 10
execute if entity @e[tag=StoneMob4] store result score @e[tag=StoneAS4,limit=1] BlockHeight run data get entity @e[tag=StoneMob4,limit=1] Pos[1] 10
scoreboard players remove @e[tag=StoneAS4] BlockHeight 14
execute if entity @e[tag=StoneMob4] store result entity @e[tag=StoneAS4,limit=1] Pos[1] double 0.1 run scoreboard players get @e[tag=StoneAS4,limit=1] BlockHeight
execute if entity @e[tag=StoneMob4] store result entity @e[tag=StoneAS4,limit=1] Pos[2] double 0.1 run data get entity @e[tag=StoneMob4,limit=1] Pos[2] 10



# SETS ROTATION
execute store result entity @e[tag=StoneAS1,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob1,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS2,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob2,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS3,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob3,limit=1] Rotation[0] 10
execute store result entity @e[tag=StoneAS4,limit=1] Rotation[0] float 0.1 run data get entity @e[tag=StoneMob4,limit=1] Rotation[0] 10



# ROUND 1
execute if entity @e[tag=StoneMob1] unless entity @e[tag=StoneAS1] at @e[tag=StoneMob1] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:stone",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS1"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob2] unless entity @e[tag=StoneAS2] at @e[tag=StoneMob2] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:stone",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS2"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob3] unless entity @e[tag=StoneAS3] at @e[tag=StoneMob3] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:stone",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS3"],DisabledSlots:2039583}
execute if entity @e[tag=StoneMob4] unless entity @e[tag=StoneAS4] at @e[tag=StoneMob4] run summon armor_stand ~ ~ ~ {ArmorItems:[{},{},{},{id:"minecraft:stone",Count:1b}],Invisible:true,NoGravity:true,Marker:true,Tags:["BossMob","StoneAS","StoneAS4"],DisabledSlots:2039583}


execute if entity @e[tag=StoneAS1,tag=MobDrop] unless entity @e[tag=StoneMob1] at @e[tag=StoneAS1] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[tag=StoneAS1,tag=MobDrop] unless entity @e[tag=StoneMob1] at @e[tag=StoneAS1] run summon item ~ 64 ~ {Item:{id:"minecraft:stone",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute if entity @e[tag=StoneAS2,tag=MobDrop] unless entity @e[tag=StoneMob2] at @e[tag=StoneAS2] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[tag=StoneAS2,tag=MobDrop] unless entity @e[tag=StoneMob2] at @e[tag=StoneAS2] run summon item ~ 64 ~ {Item:{id:"minecraft:stone",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute if entity @e[tag=StoneAS3,tag=MobDrop] unless entity @e[tag=StoneMob3] at @e[tag=StoneAS3] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[tag=StoneAS3,tag=MobDrop] unless entity @e[tag=StoneMob3] at @e[tag=StoneAS3] run summon item ~ 64 ~ {Item:{id:"minecraft:stone",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
execute if entity @e[tag=StoneAS4,tag=MobDrop] unless entity @e[tag=StoneMob4] at @e[tag=StoneAS4] run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute if entity @e[tag=StoneAS4,tag=MobDrop] unless entity @e[tag=StoneMob4] at @e[tag=StoneAS4] run summon item ~ 64 ~ {Item:{id:"minecraft:stone",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}


execute if entity @e[tag=StoneAS1] unless entity @e[tag=StoneMob1] run kill @e[tag=StoneAS1]
execute if entity @e[tag=StoneAS2] unless entity @e[tag=StoneMob2] run kill @e[tag=StoneAS2]
execute if entity @e[tag=StoneAS3] unless entity @e[tag=StoneMob3] run kill @e[tag=StoneAS3]
execute if entity @e[tag=StoneAS4] unless entity @e[tag=StoneMob4] run kill @e[tag=StoneAS4]