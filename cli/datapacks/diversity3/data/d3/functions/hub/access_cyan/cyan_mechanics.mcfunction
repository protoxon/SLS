####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar EscapeAccess

# ESCAPE ACCESS -> MINECART
execute if entity @e[scores={EscapeAccess=1}] run kill @e[tag=HubCart,x=14,y=81,z=965,distance=5..]
execute if entity @e[scores={EscapeAccess=1}] run data merge entity @e[tag=HubCart,type=armor_stand,limit=1,x=14,y=80,z=965,dx=0,dy=1,dz=0] {NoGravity:0b,Motion:[0.0d,1.5d,-8.7d]}
execute if entity @e[scores={EscapeAccess=1}] run setblock 14 80 966 redstone_block
execute if entity @e[scores={EscapeAccess=2}] if entity @e[tag=HubCart] run playsound block.end_gateway.spawn master @a 14 81 965 100000 1.4 1
execute if entity @e[scores={EscapeAccess=15}] run setblock 14 80 966 clay
execute if entity @e[scores={EscapeAccess=35}] run playsound block.dispenser.dispense master @a 14 84 965 1 1.2 0

#execute if entity @e[scores={EscapeAccess=35}] run summon armor_stand 14 83 965 {Passengers:[{id:"minecraft:minecart",Invulnerable:true,Rotation:[90f,0f],Tags:["HubCart"]}],Marker:0b,Invisible:0b,Tags:["HubCart"]}
execute if entity @e[scores={EscapeAccess=35}] run summon armor_stand 14 83 965 {Passengers:[{id:"minecraft:minecart",Invulnerable:false,Rotation:[90f,0f],Tags:["HubCart"]}],Marker:0b,Invisible:1b,Small:1b,Tags:["HubCart"]}
#execute if entity @e[scores={EscapeAccess=35}] run summon minecart 14 83 965 {Invulnerable:true,Rotation:[90f,0f],Tags:["HubCart"]}

execute if entity @e[scores={EscapeAccess=45}] align x align y align z as @e[tag=HubCart,type=armor_stand,x=14,y=81,z=965,dx=0,dy=0,dz=0] run data merge entity @s {NoGravity:1b}
execute if entity @e[scores={EscapeAccess=45}] align x align y align z as @e[tag=HubCart,type=armor_stand,x=14,y=81,z=965,dx=0,dy=0,dz=0] at @s run teleport @s ~ ~-0.8 ~



execute if entity @e[scores={EscapeAccess=1..34}] at @e[tag=HubCart,type=minecart] run particle dust 0 1 1 1 ~ ~ ~0.5 0.2 0.1 0.2 0 10 force
execute if entity @e[scores={EscapeAccess=1}] at @e[tag=HubCart,type=minecart] run particle smoke ~ ~1 ~-1 0.3 0.3 0.3 0 100 force
execute if entity @e[scores={EscapeAccess=1..3}] align x align y align z run effect give @a[x=14,y=81,z=963,dx=0,dy=2,dz=1.5,nbt=!{RootVehicle:{Entity:{id:"minecraft:armor_stand"}}}] instant_damage 1 1 true
execute if entity @e[scores={EscapeAccess=1..3}] align x align y align z at @e[tag=HubCart] run teleport @a[x=14,y=81,z=963,dx=0,dy=2,dz=1.5,nbt=!{RootVehicle:{Entity:{id:"minecraft:armor_stand"}}}] ~ ~ ~

execute if entity @e[scores={EscapeAccess=50..}] run scoreboard objectives remove EscapeAccess
