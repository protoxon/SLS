####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 17 2018 / JULY 4 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

effect clear @a saturation
effect give @a[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true

# MATCH FLOOR
execute if block 986 65 27 stone_button[powered=true] run clear @a nether_star
execute if block 986 65 27 stone_button[powered=true] run kill @e[nbt={Item:{id:"minecraft:nether_star"}}]
execute if block 986 65 27 stone_button[powered=true] run give @p[x=986,y=65,z=27] nether_star{display:{Name:"{\"text\":\"Puzzle Key\",\"italic\":\"false\",\"color\":\"white\"}"},PuzzleKey:1b}
#execute if block 986 65 27 stone_button[powered=true] run entitydata @e[tag=HasPurpleKey] {Item:{id:"minecraft:air"}}


# MEMORY
execute if block 1017 65 17 stone_button[powered=true] run clear @a spawner
execute if block 1017 65 17 stone_button[powered=true] run kill @e[nbt={Item:{id:"minecraft:spawner"}}]
execute if block 1017 65 17 stone_button[powered=true] run give @p[x=1017,y=65,z=17] spawner{display:{Name:"{\"text\":\"Puzzle Key\",\"italic\":\"false\",\"color\":\"white\"}"},PuzzleKey:1b}
#execute if block 1017 65 17 stone_button[powered=true] run entitydata @e[tag=HasYellowKey] {Item:{id:"minecraft:air"}}


# PISTON PUZZLE
execute if block 981 65 8 stone_button[powered=true] run clear @a green_concrete_powder
execute if block 981 65 8 stone_button[powered=true] run kill @e[nbt={Item:{id:"minecraft:green_concrete_powder"}}]
execute if block 981 65 8 stone_button[powered=true] run give @p[x=981,y=65,z=8] green_concrete_powder{display:{Name:"{\"text\":\"Puzzle Key\",\"italic\":\"false\",\"color\":\"white\"}"},PuzzleKey:1b}
#execute if block 981 65 8 stone_button[powered=true] run entitydata @e[tag=HasGreenKey] {Item:{id:"minecraft:air"}}


# SOUND PUZZLE
execute if block 1019 65 8 stone_button[powered=true] run clear @a note_block
execute if block 1019 65 8 stone_button[powered=true] run kill @e[nbt={Item:{id:"minecraft:note_block"}}]
execute if block 1019 65 8 stone_button[powered=true] run give @p[x=1019,y=65,z=8] note_block{display:{Name:"{\"text\":\"Puzzle Key\",\"italic\":\"false\",\"color\":\"white\"}"},PuzzleKey:1b}
#execute if block 1019 65 8 stone_button[powered=true] run entitydata @e[tag=HasBrownKey] {Item:{id:"minecraft:air"}}


# HOPPER ORDER
execute if block 981 65 -6 stone_button[powered=true] run clear @a potion
execute if block 981 65 -6 stone_button[powered=true] run clear @a glass_bottle
execute if block 981 65 -6 stone_button[powered=true] run kill @e[nbt={Item:{id:"minecraft:potion"}}]
execute if block 981 65 -6 stone_button[powered=true] run kill @e[nbt={Item:{id:"minecraft:glass_bottle"}}]
execute if block 981 65 -6 stone_button[powered=true] run give @p[x=981,y=65,z=-6] potion{display:{Name:"{\"text\":\"Puzzle Key\",\"italic\":\"false\",\"color\":\"white\"}"},CustomPotionColor:7512056,HideFlags:32,PuzzleKey:1b}
#execute if block 981 65 8 stone_button[powered=true] run entitydata @e[tag=HasLightBlueKey] {Item:{id:"minecraft:air"}}


# PATHFINDER
execute if block 1014 65 -11 stone_button[powered=true] run clear @a emerald
execute if block 1014 65 -11 stone_button[powered=true] run kill @e[nbt={Item:{id:"minecraft:emerald"}}]
execute if block 1014 65 -11 stone_button[powered=true] run give @p[x=1014,y=65,z=-11] emerald{display:{Name:"{\"text\":\"Puzzle Key\",\"italic\":\"false\",\"color\":\"white\"}"},PuzzleKey:1b}
#execute if block 1014 65 -11 stone_button[powered=true] run entitydata @e[tag=HasBlackKey] {Item:{id:"minecraft:air"}}


# HANGMAN
execute if block 995 65 -9 stone_button[powered=true] run clear @a black_banner
execute if block 995 65 -9 stone_button[powered=true] run kill @e[nbt={Item:{id:"minecraft:black_banner"}}]
execute if block 995 65 -9 stone_button[powered=true] run give @p[x=995,y=65,z=-9] black_banner{HideFlags:32,BlockEntityTag:{Patterns:[{Pattern:"cr",Color:5},{Pattern:"vh",Color:15},{Pattern:"hh",Color:15},{Pattern:"ms",Color:15},{Pattern:"ts",Color:5},{Pattern:"bs",Color:5},{Pattern:"ls",Color:5},{Pattern:"rs",Color:5},{Pattern:"bo",Color:15}]},display:{Name:"{\"text\":\"Puzzle Key\",\"italic\":\"false\",\"color\":\"white\"}"},PuzzleKey:1b}
#execute if block 995 65 -9 stone_button[powered=true] run entitydata @e[tag=HasLimeKey] {Item:{id:"minecraft:air"}}


# BANNER BULLET
execute if block 1000 64 6 stone_button[powered=true] run clear @a iron_axe
execute if block 1000 64 6 stone_button[powered=true] run kill @e[nbt={Item:{id:"minecraft:iron_axe"}}]
execute if block 1000 64 6 stone_button[powered=true] run give @p[x=1000,y=64,z=6] iron_axe{display:{Name:"{\"text\":\"Puzzle Key\",\"italic\":\"false\",\"color\":\"white\"}"},Unbreakable:true,CanDestroy:["minecraft:pumpkin"],HideFlags:6,PuzzleKey:1b}
#execute if block 1000 64 6 stone_button[powered=true] run entitydata @e[tag=HasWhiteKey] {Item:{id:"minecraft:air"}}


# SETS UP FAKE ORANGE BLOCKS UNDER PUMPKIN
execute if block 1000 64 6 stone_button[powered=true] run fill 1000 46 21 1000 47 21 air
kill @e[tag=FakeOrangeBlock]
summon armor_stand 1000 46 21 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:orange_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["FakeOrangeBlock","BottomFakeOrangeBlock"]}],Tags:["FakeOrangeBlock","BottomFakeOrangeBlock"]}
summon armor_stand 1000 47 21 {Small:true,Invisible:true,NoGravity:true,Marker:true,Passengers:[{id:"minecraft:falling_block",BlockState:{Name:"minecraft:orange_concrete"},Time:1,NoGravity:true,DropItem:false,Time:-2147483648,Tags:["FakeOrangeBlock","TopFakeOrangeBlock"]}],Tags:["FakeOrangeBlock","TopFakeOrangeBlock"]}


# ORANGE ROOM
execute if block 1000 47 13 stone_button[powered=true] run clear @a jack_o_lantern
execute if block 1000 47 13 stone_button[powered=true] run kill @e[nbt={Item:{id:"minecraft:jack_o_lantern"}}]
execute if block 1000 47 13 stone_button[powered=true] run give @p[x=1000,y=47,z=13] jack_o_lantern{display:{Name:"{\"text\":\"Puzzle Key\",\"italic\":\"false\",\"color\":\"white\"}"},PuzzleKey:1b}
#execute if block 1000 47 13 stone_button[powered=true] run entitydata @e[tag=HasOrangeKey] {Item:{id:"minecraft:air"}}

execute if block 1000 47 13 stone_button[powered=true] run fill 999 65 30 1001 67 30 air
execute if block 1000 47 13 stone_button[powered=true] run fill 999 65 28 1001 67 28 air

execute if block 1000 47 13 stone_button[powered=true] run gamerule doEntityDrops true
execute if block 1000 47 13 stone_button[powered=true] run scoreboard objectives add PuzzleComplete dummy
execute if block 1000 47 13 stone_button[powered=true] run scoreboard players add @e[tag=MainPuzzleAEC] PuzzleComplete 0

#execute if block 1000 47 13 stone_button[powered=true] run kill @e[tag=DoorFrame]
#execute if block 1000 47 13 stone_button[powered=true] run summon item_frame 999 65 28 {Facing:2b,Tags:["LightBlueDoorFrame","DoorFrame"]}
#execute if block 1000 47 13 stone_button[powered=true] run summon item_frame 1000 65 28 {Facing:2b,Tags:["LimeDoorFrame","DoorFrame"]}
#execute if block 1000 47 13 stone_button[powered=true] run summon item_frame 1001 65 28 {Facing:2b,Tags:["BlackDoorFrame","DoorFrame"]}
#execute if block 1000 47 13 stone_button[powered=true] run summon item_frame 999 66 28 {Facing:2b,Tags:["GreenDoorFrame","DoorFrame"]}
#execute if block 1000 47 13 stone_button[powered=true] run summon item_frame 1000 66 28 {Facing:2b,Tags:["WhiteDoorFrame","DoorFrame"]}
#execute if block 1000 47 13 stone_button[powered=true] run summon item_frame 1001 66 28 {Facing:2b,Tags:["BrownDoorFrame","DoorFrame"]}
#execute if block 1000 47 13 stone_button[powered=true] run summon item_frame 999 67 28 {Facing:2b,Tags:["PurpleDoorFrame","DoorFrame"]}
#execute if block 1000 47 13 stone_button[powered=true] run summon item_frame 1000 67 28 {Facing:2b,Tags:["OrangeDoorFrame","DoorFrame"]}
#execute if block 1000 47 13 stone_button[powered=true] run summon item_frame 1001 67 28 {Facing:2b,Tags:["YellowDoorFrame","DoorFrame"]}

execute if block 1000 47 13 stone_button[powered=true] run setblock 33 2 14 redstone_block


# MAGMA TROLL BUTTON
execute if block 997 46 13 acacia_button[powered=true] run fill 997 45 13 1003 45 19 magma_block
execute if block 997 46 13 acacia_button[powered=true] run setblock 997 46 13 stone_button[face=floor]
execute if block 997 46 13 stone_button[powered=true] run fill 997 45 13 1003 45 19 iron_block
execute if block 997 46 13 stone_button[powered=true] run setblock 997 46 13 acacia_button[face=floor]


# I LOVE Q
execute if block 1000 46 22 oak_button[powered=true] run setblock 33 2 14 redstone_block