####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 31 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

kill @e[tag=RandomResponse]
summon area_effect_cloud 5 131 -96 {Tags:["RandomResponse","Response1"],Duration:3}
summon area_effect_cloud 5 131 -96 {Tags:["RandomResponse","Response2"],Duration:3}
summon area_effect_cloud 5 131 -96 {Tags:["RandomResponse","Response3"],Duration:3}
summon area_effect_cloud 5 131 -96 {Tags:["RandomResponse","Response4"],Duration:3}
summon area_effect_cloud 5 131 -96 {Tags:["RandomResponse","Response5"],Duration:3}
summon area_effect_cloud 5 131 -96 {Tags:["RandomResponse","Response6"],Duration:3}
summon area_effect_cloud 5 131 -96 {Tags:["RandomResponse","Response7"],Duration:3}
summon area_effect_cloud 5 131 -96 {Tags:["RandomResponse","Response8"],Duration:3}
summon area_effect_cloud 5 131 -96 {Tags:["RandomResponse","Response9"],Duration:3}
summon area_effect_cloud 5 131 -96 {Tags:["RandomResponse","Response10"],Duration:3}
summon area_effect_cloud 5 131 -96 {Tags:["RandomResponse","Response11"],Duration:3}
summon area_effect_cloud 5 131 -96 {Tags:["RandomResponse","Response11"],Duration:3}

kill @e[tag=RandomResponse,sort=random,limit=1]
kill @e[tag=RandomResponse,sort=random,limit=1]
kill @e[tag=RandomResponse,sort=random,limit=1]
kill @e[tag=RandomResponse,sort=random,limit=1]
kill @e[tag=RandomResponse,sort=random,limit=1]
kill @e[tag=RandomResponse,sort=random,limit=1]
kill @e[tag=RandomResponse,sort=random,limit=1]
kill @e[tag=RandomResponse,sort=random,limit=1]
kill @e[tag=RandomResponse,sort=random,limit=1]
kill @e[tag=RandomResponse,sort=random,limit=1]
kill @e[tag=RandomResponse,sort=random,limit=1]

execute if entity @e[tag=Response1] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Um. I have no use for this. You can have it back.","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=Response2] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Actually I don't need this. You take it.","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=Response3] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"No thanks. Don't you have any news from my friends?","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=Response4] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Why did you just give me this? I don't want it.","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=Response5] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"You look like you need this more than I do.","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=Response6] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Why are you giving me this?","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=Response7] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"I don't understand. Do you want me to hold on to this for you?","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=Response8] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"This looks like mine. Meh. You can have it anyway.","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=Response9] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Actually, I'm looking for proof you helped my friends, not this.","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=Response10] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"Where did you get this? Oh never mind. I don't need it.","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=Response11] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"How exactly is this going to help you get the Brown Wool?","color":"none","bold":false,"underlined":false}]

execute if entity @e[tag=Response12] run tellraw @a[tag=NetherChat] ["",{"text":"<qmagnet> ","color":"gold","bold":false},{"text":"No, thank you though.","color":"none","bold":false,"underlined":false}]
