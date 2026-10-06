####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 23 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


# FOR TESTING
#say plains details not changed


execute if block 14 11 -18 grass_block unless entity @e[tag=SurvivalCow1,x=-2,y=64,z=-1072,dx=5,dy=0,dz=3] run summon cow -1 64 -1070 {PersistenceRequired:1b,Tags:["SurvivalCow1","SurvivalMob"]}
execute if block 14 11 -18 grass_block unless entity @e[tag=SurvivalCow2,x=-2,y=64,z=-1072,dx=5,dy=0,dz=3] run summon cow 2 64 -1070 {PersistenceRequired:1b,Tags:["SurvivalCow2","SurvivalMob"]}

kill @e[tag=SurvivalBook,nbt=!{HandItems:[{id:"minecraft:written_book"}]}]
execute if block 14 11 -18 grass_block unless entity @e[tag=SurvivalBook] run summon armor_stand 8.45 62.26 -1070.53 {Invisible:true,ShowArms:true,NoGravity:true,HandItems:[{id:"minecraft:written_book",Count:1b,tag:{pages:["{\"text\":\"Got tired of waiting. Went to the Swamp to head into the Nether. If you want the Brown Wool, you can find me there.\\n\\nCenter island, with the big obsidian portal.\\n\\nHard to miss.\"}","{\"text\":\"Oh! And remember we're all in Survival Mode now. If you die, you'll lose your stuff. Watch your hunger, and watch out for those creepers!\\n\\nStuff resets if you leave the Branch, just so you know.\\n\\n- qmagnet\"}"],author:"qmagnet",title:"Brown Wool?",RealBook:1b}}],Rotation:[270f,0f],Pose:{RightArm:[180f,270f,180f]},Tags:["SurvivalBook"],Invulnerable:true,DisabledSlots:1973790}
teleport @e[tag=SurvivalBook] 8.45 64.26 -1070.53


execute if block 14 11 -18 grass_block if entity @e[tag=SurvivalCow1,x=-2,y=64,z=-1072,dx=5,dy=0,dz=3] if entity @e[tag=SurvivalCow2,x=-2,y=64,z=-1072,dx=5,dy=0,dz=3] if entity @e[tag=SurvivalBook] run setblock 14 13 -18 grass_block


# FOR TESTING
#execute if block 14 11 -18 grass_block if entity @e[tag=SurvivalCow1,x=-2,y=64,z=-1072,dx=5,dy=0,dz=3] if entity @e[tag=SurvivalCow2,x=-2,y=64,z=-1072,dx=5,dy=0,dz=3] if entity @e[tag=SurvivalBook] run say plains details changed


