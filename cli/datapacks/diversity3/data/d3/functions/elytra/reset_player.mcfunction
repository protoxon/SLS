####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# MARCH 7 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


tag @s remove WhiteRing
tag @s remove YellowRing
execute align x align y align z unless entity @s[x=-1802,y=208,z=2064,dx=4,dy=4,dz=-1] run tag @s remove OrangeRing
tag @s remove PurpleRing
execute align x align y align z unless entity @s[x=-1866,y=208,z=1998,dx=1,dy=4,dz=4] run tag @s remove GreenRing
tag @s remove BlueRing
execute align x align y align z unless entity @s[x=-1802,y=208,z=1929,dx=4,dy=4,dz=1] run tag @s remove LimeRing
tag @s remove BlackRing
execute align x align y align z unless entity @s[x=-1736,y=214,z=1996,dx=-1,dy=4,dz=4] run tag @s remove BrownRing


effect clear @s night_vision
effect give @s[nbt=!{Health:20.0f}] regeneration 1 255 true
#effect give @s[nbt=!{foodSaturationLevel:20.0f}] saturation 1 255 true
