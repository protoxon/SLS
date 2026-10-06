####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 29 2018 / NOVEMBER 5 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar LowerDoor1
#scoreboard objectives setdisplay sidebar LowerDoor2
#scoreboard objectives setdisplay sidebar LowerDoor3
#scoreboard objectives setdisplay sidebar LowerDoor4
#scoreboard objectives setdisplay sidebar LowerDoor5
#scoreboard objectives setdisplay sidebar LowerDoor6


# REC ROOM DOOR - GREEN
execute if entity @e[scores={AdventureLevel=..14}] run scoreboard objectives remove LowerDoor1
execute if entity @e[scores={AdventureLevel=..14}] run fill 999 93 2026 1001 95 2026 white_stained_glass replace air
execute if entity @e[scores={AdventureLevel=15..}] align x align y align z if entity @e[x=998,y=93,z=2025,dx=4,dy=4,dz=2,tag=DoorLevel1] run scoreboard objectives add LowerDoor1 dummy
execute align x align y align z if entity @e[x=998,y=93,z=2025,dx=4,dy=4,dz=2,tag=DoorLevel1] run scoreboard players add @e[tag=MainAdventureAEC] LowerDoor1 0
execute align x align y align z if entity @e[x=998,y=93,z=2025,dx=4,dy=4,dz=2,tag=DoorLevel1] run scoreboard players add @e[scores={LowerDoor1=..10}] LowerDoor1 1
execute align x align y align z unless entity @e[x=998,y=93,z=2025,dx=4,dy=4,dz=2,tag=DoorLevel1] run scoreboard players remove @e[scores={LowerDoor1=-10..}] LowerDoor1 1

execute if entity @e[scores={LowerDoor1=2}] run playsound entity.generic.burn master @a 1000 94 2026 0.2 1.5 0
execute if entity @e[scores={LowerDoor1=2}] run playsound entity.evoker.cast_spell master @a 1000 94 2026 0.2 1.3 0
execute if entity @e[scores={LowerDoor1=2}] run setblock 1001 95 2026 air
execute if entity @e[scores={LowerDoor1=3}] run setblock 1000 95 2026 air
execute if entity @e[scores={LowerDoor1=4}] run setblock 999 95 2026 air
execute if entity @e[scores={LowerDoor1=5}] run setblock 999 94 2026 air
execute if entity @e[scores={LowerDoor1=6}] run setblock 1000 94 2026 air
execute if entity @e[scores={LowerDoor1=7}] run setblock 1001 94 2026 air
execute if entity @e[scores={LowerDoor1=8}] run setblock 1001 93 2026 air
execute if entity @e[scores={LowerDoor1=9}] run setblock 1000 93 2026 air
execute if entity @e[scores={LowerDoor1=10}] run setblock 999 93 2026 air

execute if entity @e[scores={LowerDoor1=-9}] run setblock 1001 95 2026 white_stained_glass
execute if entity @e[scores={LowerDoor1=-8}] run setblock 1000 95 2026 white_stained_glass
execute if entity @e[scores={LowerDoor1=-7}] run setblock 999 95 2026 white_stained_glass
execute if entity @e[scores={LowerDoor1=-6}] run setblock 999 94 2026 white_stained_glass
execute if entity @e[scores={LowerDoor1=-5}] run setblock 1000 94 2026 white_stained_glass
execute if entity @e[scores={LowerDoor1=-4}] run setblock 1001 94 2026 white_stained_glass
execute if entity @e[scores={LowerDoor1=-3}] run setblock 1001 93 2026 white_stained_glass
execute if entity @e[scores={LowerDoor1=-2}] run setblock 1000 93 2026 white_stained_glass
execute if entity @e[scores={LowerDoor1=-1}] run setblock 999 93 2026 white_stained_glass

execute if entity @e[scores={LowerDoor1=..-10}] run scoreboard objectives remove LowerDoor1



# LAB -> RED
execute if entity @e[scores={AdventureLevel=30..}] align x align y align z if entity @e[x=973,y=93,z=1998,dx=2,dy=4,dz=4,tag=DoorLevel4] run scoreboard objectives add LowerDoor2 dummy
execute align x align y align z if entity @e[x=973,y=93,z=1998,dx=2,dy=4,dz=4,tag=DoorLevel4] run scoreboard players add @e[tag=MainAdventureAEC] LowerDoor2 0
execute align x align y align z if entity @e[x=973,y=93,z=1998,dx=2,dy=4,dz=4,tag=DoorLevel4] run scoreboard players add @e[scores={LowerDoor2=..10}] LowerDoor2 1
execute align x align y align z unless entity @e[x=973,y=93,z=1998,dx=2,dy=4,dz=4,tag=DoorLevel4] run scoreboard players remove @e[scores={LowerDoor2=-10..}] LowerDoor2 1

execute if entity @e[scores={LowerDoor2=2}] run playsound entity.generic.burn master @a 974 94 2000 0.2 1.5 0
execute if entity @e[scores={LowerDoor2=2}] run playsound entity.evoker.cast_spell master @a 974 94 2000 0.2 1.3 0
execute if entity @e[scores={LowerDoor2=2}] run setblock 974 95 2001 air
execute if entity @e[scores={LowerDoor2=3}] run setblock 974 95 2000 air
execute if entity @e[scores={LowerDoor2=4}] run setblock 974 95 1999 air
execute if entity @e[scores={LowerDoor2=5}] run setblock 974 94 1999 air
execute if entity @e[scores={LowerDoor2=6}] run setblock 974 94 2000 air
execute if entity @e[scores={LowerDoor2=7}] run setblock 974 94 2001 air
execute if entity @e[scores={LowerDoor2=8}] run setblock 974 93 2001 air
execute if entity @e[scores={LowerDoor2=9}] run setblock 974 93 2000 air
execute if entity @e[scores={LowerDoor2=10}] run setblock 974 93 1999 air

execute if entity @e[scores={LowerDoor2=-9}] run setblock 974 95 2001 white_stained_glass
execute if entity @e[scores={LowerDoor2=-8}] run setblock 974 95 2000 white_stained_glass
execute if entity @e[scores={LowerDoor2=-7}] run setblock 974 95 1999 white_stained_glass
execute if entity @e[scores={LowerDoor2=-6}] run setblock 974 94 1999 white_stained_glass
execute if entity @e[scores={LowerDoor2=-5}] run setblock 974 94 2000 white_stained_glass
execute if entity @e[scores={LowerDoor2=-4}] run setblock 974 94 2001 white_stained_glass
execute if entity @e[scores={LowerDoor2=-3}] run setblock 974 93 2001 white_stained_glass
execute if entity @e[scores={LowerDoor2=-2}] run setblock 974 93 2000 white_stained_glass
execute if entity @e[scores={LowerDoor2=-1}] run setblock 974 93 1999 white_stained_glass

execute if entity @e[scores={LowerDoor2=..-10}] run scoreboard objectives remove LowerDoor2


# LAB BEDROOM -> RED
execute if entity @e[scores={AdventureLevel=23..}] align x align y align z if entity @e[x=960,y=93,z=1991,dx=4,dy=4,dz=2,tag=DoorLevel4] run scoreboard objectives add LowerDoor6 dummy
execute align x align y align z if entity @e[x=960,y=93,z=1991,dx=4,dy=4,dz=2,tag=DoorLevel4] run scoreboard players add @e[tag=MainAdventureAEC] LowerDoor6 0
execute align x align y align z if entity @e[x=960,y=93,z=1991,dx=4,dy=4,dz=2,tag=DoorLevel4] run scoreboard players add @e[scores={LowerDoor6=..10}] LowerDoor6 1
execute align x align y align z unless entity @e[x=960,y=93,z=1991,dx=4,dy=4,dz=2,tag=DoorLevel4] run scoreboard players remove @e[scores={LowerDoor6=-10..}] LowerDoor6 1

execute if entity @e[scores={LowerDoor6=2}] run playsound entity.generic.burn master @a 962 94 1992 0.2 1.5 0
execute if entity @e[scores={LowerDoor6=2}] run playsound entity.evoker.cast_spell master @a 962 94 1992 0.2 1.3 0
execute if entity @e[scores={LowerDoor6=2}] run setblock 961 95 1992 air
execute if entity @e[scores={LowerDoor6=3}] run setblock 962 95 1992 air
execute if entity @e[scores={LowerDoor6=4}] run setblock 963 95 1992 air
execute if entity @e[scores={LowerDoor6=5}] run setblock 963 94 1992 air
execute if entity @e[scores={LowerDoor6=6}] run setblock 962 94 1992 air
execute if entity @e[scores={LowerDoor6=7}] run setblock 961 94 1992 air
execute if entity @e[scores={LowerDoor6=8}] run setblock 961 93 1992 air
execute if entity @e[scores={LowerDoor6=9}] run setblock 962 93 1992 air
execute if entity @e[scores={LowerDoor6=10}] run setblock 963 93 1992 air

execute if entity @e[scores={LowerDoor6=-9}] run setblock 961 95 1992 white_stained_glass
execute if entity @e[scores={LowerDoor6=-8}] run setblock 962 95 1992 white_stained_glass
execute if entity @e[scores={LowerDoor6=-7}] run setblock 963 95 1992 white_stained_glass
execute if entity @e[scores={LowerDoor6=-6}] run setblock 963 94 1992 white_stained_glass
execute if entity @e[scores={LowerDoor6=-5}] run setblock 962 94 1992 white_stained_glass
execute if entity @e[scores={LowerDoor6=-4}] run setblock 961 94 1992 white_stained_glass
execute if entity @e[scores={LowerDoor6=-3}] run setblock 961 93 1992 white_stained_glass
execute if entity @e[scores={LowerDoor6=-2}] run setblock 962 93 1992 white_stained_glass
execute if entity @e[scores={LowerDoor6=-1}] run setblock 963 93 1992 white_stained_glass

execute if entity @e[scores={LowerDoor6=..-10}] run scoreboard objectives remove LowerDoor6


# DRILLING CHAMBER -> RED
execute align x align y align z if entity @e[x=1003,y=93,z=1968,dx=2,dy=4,dz=4,tag=DoorLevel4] run scoreboard objectives add LowerDoor3 dummy
execute align x align y align z if entity @e[x=1003,y=93,z=1968,dx=2,dy=4,dz=4,tag=DoorLevel4] run scoreboard players add @e[tag=MainAdventureAEC] LowerDoor3 0
execute align x align y align z if entity @e[x=1003,y=93,z=1968,dx=2,dy=4,dz=4,tag=DoorLevel4] run scoreboard players add @e[scores={LowerDoor3=..10}] LowerDoor3 1
execute align x align y align z unless entity @e[x=1003,y=93,z=1968,dx=2,dy=4,dz=4,tag=DoorLevel4] run scoreboard players remove @e[scores={LowerDoor3=-10..}] LowerDoor3 1

execute if entity @e[scores={LowerDoor3=2}] run playsound entity.generic.burn master @a 1004 94 1970 0.2 1.5 0
execute if entity @e[scores={LowerDoor3=2}] run playsound entity.evoker.cast_spell master @a 1004 94 1970 0.2 1.3 0
execute if entity @e[scores={LowerDoor3=2}] run setblock 1004 95 1969 air
execute if entity @e[scores={LowerDoor3=3}] run setblock 1004 95 1970 air
execute if entity @e[scores={LowerDoor3=4}] run setblock 1004 95 1971 air
execute if entity @e[scores={LowerDoor3=5}] run setblock 1004 94 1971 air
execute if entity @e[scores={LowerDoor3=6}] run setblock 1004 94 1970 air
execute if entity @e[scores={LowerDoor3=7}] run setblock 1004 94 1969 air
execute if entity @e[scores={LowerDoor3=8}] run setblock 1004 93 1969 air
execute if entity @e[scores={LowerDoor3=9}] run setblock 1004 93 1970 air
execute if entity @e[scores={LowerDoor3=10}] run setblock 1004 93 1971 air

execute if entity @e[scores={LowerDoor3=-9}] run setblock 1004 95 1969 white_stained_glass
execute if entity @e[scores={LowerDoor3=-8}] run setblock 1004 95 1970 white_stained_glass
execute if entity @e[scores={LowerDoor3=-7}] run setblock 1004 95 1971 white_stained_glass
execute if entity @e[scores={LowerDoor3=-6}] run setblock 1004 94 1971 white_stained_glass
execute if entity @e[scores={LowerDoor3=-5}] run setblock 1004 94 1970 white_stained_glass
execute if entity @e[scores={LowerDoor3=-4}] run setblock 1004 94 1969 white_stained_glass
execute if entity @e[scores={LowerDoor3=-3}] run setblock 1004 93 1969 white_stained_glass
execute if entity @e[scores={LowerDoor3=-2}] run setblock 1004 93 1970 white_stained_glass
execute if entity @e[scores={LowerDoor3=-1}] run setblock 1004 93 1971 white_stained_glass

execute if entity @e[scores={LowerDoor3=..-10}] run scoreboard objectives remove LowerDoor3



# GENERATOR -> BLUE
execute align x align y align z if entity @e[x=1025,y=93,z=1998,dx=2,dy=4,dz=4,tag=DoorLevel2] run scoreboard objectives add LowerDoor5 dummy
execute align x align y align z if entity @e[x=1025,y=93,z=1998,dx=2,dy=4,dz=4,tag=DoorLevel2] run scoreboard players add @e[tag=MainAdventureAEC] LowerDoor5 0
execute align x align y align z if entity @e[x=1025,y=93,z=1998,dx=2,dy=4,dz=4,tag=DoorLevel2] run scoreboard players add @e[scores={LowerDoor5=..10}] LowerDoor5 1
execute align x align y align z unless entity @e[x=1025,y=93,z=1998,dx=2,dy=4,dz=4,tag=DoorLevel2] run scoreboard players remove @e[scores={LowerDoor5=-10..}] LowerDoor5 1

execute if entity @e[scores={LowerDoor5=2}] run playsound entity.generic.burn master @a 1026 94 2000 0.2 1.5 0
execute if entity @e[scores={LowerDoor5=2}] run playsound entity.evoker.cast_spell master @a 1026 94 2000 0.2 1.3 0
execute if entity @e[scores={LowerDoor5=2}] run setblock 1026 95 1999 air
execute if entity @e[scores={LowerDoor5=3}] run setblock 1026 95 2000 air
execute if entity @e[scores={LowerDoor5=4}] run setblock 1026 95 2001 air
execute if entity @e[scores={LowerDoor5=5}] run setblock 1026 94 2001 air
execute if entity @e[scores={LowerDoor5=6}] run setblock 1026 94 2000 air
execute if entity @e[scores={LowerDoor5=7}] run setblock 1026 94 1999 air
execute if entity @e[scores={LowerDoor5=8}] run setblock 1026 93 1999 air
execute if entity @e[scores={LowerDoor5=9}] run setblock 1026 93 2000 air
execute if entity @e[scores={LowerDoor5=10}] run setblock 1026 93 2001 air

execute if entity @e[scores={LowerDoor5=-9}] run setblock 1026 95 1999 white_stained_glass
execute if entity @e[scores={LowerDoor5=-8}] run setblock 1026 95 2000 white_stained_glass
execute if entity @e[scores={LowerDoor5=-7}] run setblock 1026 95 2001 white_stained_glass
execute if entity @e[scores={LowerDoor5=-6}] run setblock 1026 94 2001 white_stained_glass
execute if entity @e[scores={LowerDoor5=-5}] run setblock 1026 94 2000 white_stained_glass
execute if entity @e[scores={LowerDoor5=-4}] run setblock 1026 94 1999 white_stained_glass
execute if entity @e[scores={LowerDoor5=-3}] run setblock 1026 93 1999 white_stained_glass
execute if entity @e[scores={LowerDoor5=-2}] run setblock 1026 93 2000 white_stained_glass
execute if entity @e[scores={LowerDoor5=-1}] run setblock 1026 93 2001 white_stained_glass

execute if entity @e[scores={LowerDoor5=..-10}] run scoreboard objectives remove LowerDoor5

