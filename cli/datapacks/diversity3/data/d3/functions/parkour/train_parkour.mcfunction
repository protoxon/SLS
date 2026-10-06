####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# JULY 24 2018 / SEPTEMBER 9 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

execute unless entity @e[tag=TrainNaor] run summon armor_stand 992.15 143 -882.5 {Invulnerable:true,ShowArms:true,NoBasePlate:true,NoGravity:true,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:7358509}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:11430993}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:15856113}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"baf2ba95-ea6f-4a91-8880-29bfe81d7ef2",Properties:{textures:[{Signature:"HCQluytHdpKbf0XWeyogFGXE8/pFUwxNCwcoRknayqn1CznThB1BFNnsg1XcIetkWfaoAmKAjhq4fH5V7TS3W5mnDaUPdgzlKGUbLAwKETjJqOcoqYSdsMA/MFWVprAubAKZ1K2oBnPw9WXDTXT+FiLuK8bDjdoQXc3GMkEMYHm/j0ZgQgECL6Z96673mQiWwuFFO2KL2N+Rzc8lgitZia/meKkCY+d1ueQ1UMipt+XpoWjwCyzSCNHjLA0FXbG6UhIXfZtuH102aKPHAV0dB9P1yWHuhyKT9O8T8iMU7CIfzW+urCa5xzGgvbSjRPJFT1cwM/o1/1X/p1OL5jcg4gQF1gon8qmne6mW0tDfHb6FN7+q6rBZSA07lN/CqEwt9VS4mjEtvaZATv3MRcB7QsSHoTJmMPNiT5sJYxUfn8+iL6njNGDY2hlbOCRC+sITSrp0fKmA5Igf0khN22o//Vx7u/+VTBSFlNUQebdHoGyqZL5Brc2G19ZJnMrHYyuBX3tvLCA7nWRl7gv6qyWuKx7kZ0R4gEGKY01IgPkNo05b9/mCRQ4uNJoQsooh5m+OqkCJlu8zTetOu5LPaVJ3LSEnoMuNerp8wjXrjwwvYiMQOWP6NwML+osoELikwIckMfhMd3jfHAmWQ6B56OPzKItuxz5ZNOERe+R2qLChxtI=",Value:"eyJ0aW1lc3RhbXAiOjE1NDMxMDIwMjUxNDUsInByb2ZpbGVJZCI6ImJhZjJiYTk1ZWE2ZjRhOTE4ODgwMjliZmU4MWQ3ZWYyIiwicHJvZmlsZU5hbWUiOiJuYW9yMjAxMyIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYjRkZGRlMWMzODdkODc1ZWI2NWZlM2Y3MWMxMjFlMzFmNmU5MzA3MmFkOWFhMjhjMTYxZTJlNDU5NjYyOGVmZCJ9fX0="}]},Name:"naor2013"}},Count:1b}],DisabledSlots:2039583,Tags:["TrainNaor"],Pose:{Head:[280f,0f,0f],LeftLeg:[0f,0f,0f],RightLeg:[0f,0f,0f],LeftArm:[190f,0f,0f],RightArm:[190f,0f,0f]},Rotation:[90f,0f],DisabledSlots:2039583}

execute align x align y align z if entity @a[x=991,y=145,z=-883,dx=0,dy=1,dz=0] run scoreboard objectives add TrainChat dummy
execute align x align y align z run scoreboard players add @a[x=991,y=145,z=-883,dx=0,dy=1,dz=0] TrainChat 1

tellraw @a[scores={TrainChat=10}] ["",{"text":"<naor2013> ","color":"gray","bold":false},{"text":"\"Come out Wednesday night and join the Brotherhood,\" they said. \"We'll happily ","color":"none","bold":false,"underlined":false},{"text":"train","color":"none","bold":false,"italic":true},{"text":" you,\", they said. Good grief...","color":"none","bold":false,"underlined":false}]
scoreboard players set @a[scores={TrainChat=10}] TrainChat 11


# CHECKPOINTS
execute align x align y align z run spawnpoint @a[x=988,y=129,z=-888,dx=4,dy=1,dz=4] 988 129 -888
execute align x align y align z run spawnpoint @a[x=986,y=155,z=-886,dx=4,dy=2,dz=4] 987 155 -885
execute align x align y align z run spawnpoint @a[x=986,y=181,z=-886,dx=4,dy=2,dz=4] 988 181 -883


# COMPLETE ORANGE
execute align x align y align z if entity @a[x=987,y=189,z=-941,dx=2,dy=4,dz=0] run scoreboard players set @e[scores={OrangeParkour=0}] OrangeParkour 1
execute align x align y align z if entity @a[x=987,y=189,z=-941,dx=2,dy=4,dz=0] run setblock 42 1 -18 mossy_stone_bricks
execute align x align y align z if entity @a[x=987,y=189,z=-941,dx=2,dy=4,dz=0] run setblock 40 1 -18 orange_concrete

execute align x align y align z if entity @a[x=987,y=189,z=-941,dx=2,dy=4,dz=0] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run setblock 1 4 1 white_concrete
execute align x align y align z if entity @a[x=987,y=189,z=-941,dx=2,dy=4,dz=0] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run spawnpoint @a 1000 66 -1004
execute align x align y align z if entity @a[x=987,y=189,z=-941,dx=2,dy=4,dz=0] run execute unless entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run teleport @a 1000 66 -1004 0 0

execute align x align y align z if entity @a[x=987,y=189,z=-941,dx=2,dy=4,dz=0] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run setblock 1 4 1 pink_glazed_terracotta
execute align x align y align z if entity @a[x=987,y=189,z=-941,dx=2,dy=4,dz=0] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run spawnpoint @a 1000 192 -1004
execute align x align y align z if entity @a[x=987,y=189,z=-941,dx=2,dy=4,dz=0] run execute if entity @e[scores={OrangeParkour=1,YellowParkour=1,BrownParkour=1,BlackParkour=1,LimeParkour=1,PurpleParkour=1,GreenParkour=1,LightBlueParkour=1}] run teleport @a 1000 192 -1004 0 0



# QUIT ORANGE
execute align x align y align z if entity @a[x=992,y=106,z=-886,dx=0,dy=0,dz=0] run setblock 1 4 1 white_concrete
execute align x align y align z if entity @a[x=992,y=106,z=-886,dx=0,dy=0,dz=0] run spawnpoint @a 1000 66 -1004
execute align x align y align z if entity @a[x=992,y=106,z=-886,dx=0,dy=0,dz=0] run teleport @a 1002 66 -997 0 0