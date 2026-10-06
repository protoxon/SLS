####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 27 2019 / MAY 9 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

execute align x align y align z as @a[x=-128,y=0,z=-128,dx=255,dy=200,dz=271] unless entity @s[x=0,y=1,z=-32,dx=15,dy=15,dz=2] if entity @s[gamemode=survival] run tellraw @s ["",{"text":"<qmagnet> ","color":"dark_red","bold":false},{"text":"Vilder50 and April have force me to do this.","color":"none","bold":false,"underlined":false}]
execute align x align y align z as @a[x=-128,y=0,z=-128,dx=255,dy=200,dz=271] unless entity @s[x=0,y=1,z=-32,dx=15,dy=15,dz=2] run kill @s[gamemode=survival]
fill 0 1 -20 15 255 -20 barrier replace air
fill 0 0 -32 15 0 -17 bedrock replace air
fill 0 20 -19 15 20 -12 barrier replace air

fill -4 1 92 -2 18 114 barrier replace air
fill 17 1 92 19 18 114 barrier replace air
fill -1 1 112 16 18 114 barrier replace air
fill -1 6 92 16 18 94 barrier replace air
fill -1 17 95 16 18 111 barrier replace air
fill -4 0 92 19 0 114 bedrock replace air