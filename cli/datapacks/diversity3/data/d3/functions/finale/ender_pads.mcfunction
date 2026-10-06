####################################################################
# THIS FUNCTION WAS MADE QMAGNET
# JANUARY 24 2019 / MARCH 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar EnderPad


tag @a remove EnderPad

# WHITE PAD
execute align x align y align z run tag @a[x=14,y=36,z=5019,dx=2,dy=2,dz=2] add EnderPad

# ORANGE PAD
execute if block 10 6 110 clay run fill 47 44 5092 49 44 5094 air replace orange_wool
execute if block 48 44 5093 orange_wool align x align y align z run tag @a[x=47,y=45,z=5092,dx=2,dy=2,dz=2] add EnderPad

# YELLOW PAD
execute if block 9 6 110 clay run fill 74 51 5170 76 51 5172 air replace yellow_wool
execute if block 75 51 5171 yellow_wool align x align y align z run tag @a[x=74,y=52,z=5170,dx=2,dy=2,dz=2] add EnderPad

# LIME PAD
execute if block 8 6 110 clay run fill 93 62 5261 95 62 5263 air replace lime_wool
execute if block 94 62 5262 lime_wool align x align y align z run tag @a[x=93,y=63,z=5261,dx=2,dy=2,dz=2] add EnderPad

# PINK PAD
execute if block 7 6 110 clay run fill 57 89 5329 59 89 5331 air replace pink_wool
execute if block 58 89 5330 pink_wool align x align y align z run tag @a[x=57,y=90,z=5329,dx=2,dy=2,dz=2] add EnderPad

# CYAN PAD
execute if block 6 6 110 clay run fill -33 112 5346 -31 112 5348 air replace cyan_wool
execute if block -32 112 5347 cyan_wool align x align y align z run tag @a[x=-33,y=113,z=5346,dx=2,dy=2,dz=2] add EnderPad

# PURPLE PAD
execute if block 5 6 110 clay run fill -137 107 5187 -135 107 5189 air replace purple_wool
execute if block -136 107 5188 purple_wool align x align y align z run tag @a[x=-137,y=108,z=5187,dx=2,dy=2,dz=2] add EnderPad

# BLUE PAD
execute if block 4 6 110 clay run fill -155 139 5113 -153 139 5115 air replace blue_wool
execute if block -154 139 5114 blue_wool align x align y align z run tag @a[x=-155,y=140,z=5113,dx=2,dy=2,dz=2] add EnderPad

# BROWN PAD
execute if block 3 6 110 clay run fill -155 156 5010 -153 156 5012 air replace brown_wool
execute if block -154 156 5011 brown_wool align x align y align z run tag @a[x=-155,y=157,z=5010,dx=2,dy=2,dz=2] add EnderPad

# RED PAD
execute if block 2 6 110 clay run fill -83 171 4970 -81 171 4972 air replace red_wool
execute if block -82 171 4971 red_wool align x align y align z run tag @a[x=-83,y=172,z=4970,dx=2,dy=2,dz=2] add EnderPad

# BLACK PAD
execute if block 1 6 110 clay run fill -37 184 4911 -35 184 4913 air replace black_wool
execute if block -36 184 4912 black_wool align x align y align z run tag @a[x=-37,y=185,z=4911,dx=2,dy=2,dz=2] add EnderPad

execute if entity @a[tag=EnderPad] run scoreboard objectives add EnderPad dummy
scoreboard players add @a[tag=EnderPad] EnderPad 0
scoreboard players add @a[scores={EnderPad=0..4}] EnderPad 1
clear @a[tag=!EnderPad,tag=!inGolfBranch,scores={EnderPad=5}] ender_pearl
scoreboard players reset @a[tag=!EnderPad] EnderPad
execute unless entity @a[tag=EnderPad] run scoreboard objectives remove EnderPad

clear @a[tag=!EnderPad,nbt={Inventory:[{id:"minecraft:ender_pearl"}]}] ender_pearl
effect give @a[tag=EnderPad] resistance 2 255 true
give @a[tag=EnderPad,nbt=!{Inventory:[{id:"minecraft:ender_pearl"}]},scores={EnderPad=2}] ender_pearl

execute if entity @a[tag=EnderPad] run kill @e[type=item,nbt={Item:{id:"minecraft:ender_pearl"},OnGround:1b}]