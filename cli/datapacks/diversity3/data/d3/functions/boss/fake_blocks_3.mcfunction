####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 29 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


# LAND SOUND FOR SILENT MOBS
execute at @e[tag=SilentBlock,nbt={OnGround:1b}] run playsound block.stone.fall master @a ~ ~ ~
tag @e[tag=SilentBlock,nbt={OnGround:1b}] remove SilentBlock

tag @e remove MobDrop
execute align x align y align z run tag @e[tag=BossMob,x=-1039,y=60,z=-993,dx=48,dy=5,dz=15] add MobDrop

#effect give @e[tag=StoneMob] slowness 1 1 true

execute as @e[tag=IronOreMob,nbt={HurtTime:10s}] at @s run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0

execute as @e[tag=IronOreAS,tag=MobDrop,scores={IronAttack=1}] at @s run playsound block.stone.break master @a ~ 64 ~ 1 1.3 0
execute as @e[tag=IronOreAS,tag=MobDrop,scores={IronAttack=1}] at @s run summon item ~ ~ ~ {Item:{id:"minecraft:iron_ore",Count:1b},Motion:[0.0d,0.2d,0.0d],PickupDelay:20}
