####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ArenaAccess
#scoreboard objectives setdisplay sidebar TridentAge
#scoreboard objectives setdisplay sidebar TridentLife

# ARENA ACCESS -> TRIDENT TARGET
execute if block -20 89 1039 lever[powered=false] run fill -26 99 1043 -26 102 1043 air replace ladder
execute if block -20 89 1039 lever[powered=true] if block -26 99 1043 air run playsound entity.experience_orb.pickup master @a -26 99 1043
execute if block -20 89 1039 lever[powered=true] if block -26 99 1043 air run playsound item.chorus_fruit.teleport master @a -26 99 1043 2 0.7 1
execute if block -20 89 1039 lever[powered=true] if block -26 99 1043 air run particle cloud -26 100 1043 0.3 1.5 0.3 0 50
execute if block -20 89 1039 lever[powered=true] run fill -26 99 1043 -26 102 1043 ladder[facing=east] replace air

execute if entity @a[x=-48,y=102,z=1033,dx=32,dy=17,dz=32] run scoreboard objectives add ArenaAccess dummy
execute if entity @e[tag=TridentAS] run scoreboard objectives remove ArenaAccess
execute if entity @e[nbt={Item:{id:"minecraft:trident"}}] run scoreboard objectives remove ArenaAccess
execute if entity @a[nbt={Inventory:[{id:"minecraft:trident"}]}] run scoreboard objectives remove ArenaAccess
execute if entity @a[nbt={Inventory:[{id:"minecraft:trident"}]}] run kill @e[tag=TridentAS]
execute if entity @e[type=trident] run scoreboard objectives remove ArenaAccess
execute if block -24 86 986 hopper{Items:[{id:"minecraft:trident"}]} run scoreboard objectives remove ArenaAccess
scoreboard players add @e[tag=MainHubAEC] ArenaAccess 0
scoreboard players add @e[scores={ArenaAccess=0..50}] ArenaAccess 1

execute if entity @e[nbt={Item:{id:"minecraft:trident"}},x=-87,y=34,z=813,dx=220,dy=72,dz=300] run scoreboard objectives add TridentLife dummy
execute unless entity @e[nbt={Item:{id:"minecraft:trident"}}] run scoreboard objectives remove TridentLife
scoreboard players add @e[nbt={Item:{id:"minecraft:trident"}},x=-87,y=34,z=813,dx=220,dy=72,dz=300] TridentLife 1
kill @e[nbt={Item:{id:"minecraft:trident"}},scores={TridentLife=500..}]


execute if entity @e[scores={ArenaAccess=50}] run summon armor_stand -32 105.55 1041 {Invisible:true,NoGravity:true,HandItems:[{id:"minecraft:trident",Count:1b,tag:{HideFlags:63,Unbreakable:true,Enchantments: [{id:"minecraft:loyalty",lvl:3s}]}}],Pose:{RightArm:[90f,95f,15f]},Rotation:[135f,0f],Tags:["TridentAS"]}

execute if entity @e[scores={ArenaAccess=50}] run summon lightning_bolt -32 106 1041
execute if entity @e[scores={ArenaAccess=50}] run playsound item.trident.thunder master @a -32 106 1041 0.5 1 0

execute if entity @e[type=trident] run scoreboard objectives add TridentAge dummy
scoreboard players add @e[type=trident] TridentAge 1
execute at @e[scores={TridentAge=1}] run summon area_effect_cloud ~ ~-1 ~ {Tags:["TridentAEC"],Duration:60}
execute as @e[scores={TridentAge=200..}] run kill @e[tag=TridentAEC]
execute as @e[scores={TridentAge=200..}] run kill @s

# BUILDS BRIDGE
execute unless block -33 82 1037 oak_fence run function d3:hub/access_yellow/build_bridge
