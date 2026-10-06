####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# FEBRUARY 18 2018 / AUGUST 27 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


# MAIN SCOREBOARD CLOUD FOR WINS
kill @e[tag=MainEscapeAEC]
summon area_effect_cloud -24 2 40 {Tags:["MainEscapeAEC"],Duration:2147483647}


kill @e[tag=EscapeMinecart]


kill @e[tag=EscapeCFG]
summon armor_stand -985 2 805 {NoGravity:true,Invulnerable:true,ShowArms:true,DisabledSlots:2039583,Pose:{RightArm:[347.0f,0.0f,0.0f],LeftLeg:[10.0f,0.0f,0.0f],LeftArm:[16.0f,0.0f,351.0f],RightLeg:[0.0f,0.0f,7.0f]},Small:0b,Rotation:[70.0f,0.0f],HandItems:[{},{}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:3942162}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:2622720}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:51}}},{id:"minecraft:player_head",tag:{SkullOwner:ColdFusionGaming},Count:1b}],NoBasePlate:true,Tags:["EscapeCFG","EscapeCFG_Jail"]}


execute as @e[tag=FirstMileyCyrus] at @s run teleport @s ~ ~-30 ~
summon iron_golem -1002 2 804 {Rotation:[300f,0f],Tags:["FirstMileyCyrus","MileyCyrus"],CustomName:"{\"text\":\"Iron Miley Cyrus\",\"color\":\"white\"}",CustomNameVisible:true,Invulnerable:true}


kill @e[tag=EscapeAnvilFrame]
summon item_frame -999 2 804 {Facing:3b,Tags:["EscapeAnvilFrame"],Item:{id:"minecraft:anvil",Count:1b,Damage:0s},ItemRotation:0b,Invulnerable:true}


setblock -996 0 806 air
setblock -984 3 806 cyan_wool
setblock -985 3 806 oak_button[facing=west]


fill -993 2 808 -991 4 808 stone_bricks


setblock -18 5 46 dark_prismarine


setblock -18 2 46 redstone_block


teleport @a -1000 2 806 270 0
