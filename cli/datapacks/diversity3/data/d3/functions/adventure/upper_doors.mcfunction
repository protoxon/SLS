####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# OCTOBER 28 2018 / NOVEMBER 5 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar UpperDoor1
#scoreboard objectives setdisplay sidebar UpperDoor2
#scoreboard objectives setdisplay sidebar UpperDoor3
#scoreboard objectives setdisplay sidebar UpperDoor4
#scoreboard objectives setdisplay sidebar UpperDoor5


# LIVING QUARTERS DOOR -> GREEN
execute align x align y align z if entity @e[x=998,y=106,z=2025,dx=4,dy=4,dz=2,tag=DoorLevel1] run scoreboard objectives add UpperDoor1 dummy
execute align x align y align z if entity @e[x=998,y=106,z=2025,dx=4,dy=4,dz=2,tag=DoorLevel1] run scoreboard players add @e[tag=MainAdventureAEC] UpperDoor1 0
execute align x align y align z if entity @e[x=998,y=106,z=2025,dx=4,dy=4,dz=2,tag=DoorLevel1] run scoreboard players add @e[scores={UpperDoor1=..10}] UpperDoor1 1
execute align x align y align z unless entity @e[x=998,y=106,z=2025,dx=4,dy=4,dz=2,tag=DoorLevel1] run scoreboard players remove @e[scores={UpperDoor1=-10..}] UpperDoor1 1

execute if entity @e[scores={UpperDoor1=2}] run playsound entity.generic.burn master @a 1000 107 2026 0.2 1.5 0
execute if entity @e[scores={UpperDoor1=2}] run playsound entity.evoker.cast_spell master @a 1000 107 2026 0.2 1.3 0
execute if entity @e[scores={UpperDoor1=2}] run setblock 1001 108 2026 air
execute if entity @e[scores={UpperDoor1=3}] run setblock 1000 108 2026 air
execute if entity @e[scores={UpperDoor1=4}] run setblock 999 108 2026 air
execute if entity @e[scores={UpperDoor1=5}] run setblock 999 107 2026 air
execute if entity @e[scores={UpperDoor1=6}] run setblock 1000 107 2026 air
execute if entity @e[scores={UpperDoor1=7}] run setblock 1001 107 2026 air
execute if entity @e[scores={UpperDoor1=8}] run setblock 1001 106 2026 air
execute if entity @e[scores={UpperDoor1=9}] run setblock 1000 106 2026 air
execute if entity @e[scores={UpperDoor1=10}] run setblock 999 106 2026 air
execute if entity @e[scores={UpperDoor1=11..}] run fill 999 106 2026 1001 108 2026 air replace white_stained_glass

execute if entity @e[scores={UpperDoor1=-9}] run setblock 1001 108 2026 white_stained_glass
execute if entity @e[scores={UpperDoor1=-8}] run setblock 1000 108 2026 white_stained_glass
execute if entity @e[scores={UpperDoor1=-7}] run setblock 999 108 2026 white_stained_glass
execute if entity @e[scores={UpperDoor1=-6}] run setblock 999 107 2026 white_stained_glass
execute if entity @e[scores={UpperDoor1=-5}] run setblock 1000 107 2026 white_stained_glass
execute if entity @e[scores={UpperDoor1=-4}] run setblock 1001 107 2026 white_stained_glass
execute if entity @e[scores={UpperDoor1=-3}] run setblock 1001 106 2026 white_stained_glass
execute if entity @e[scores={UpperDoor1=-2}] run setblock 1000 106 2026 white_stained_glass
execute if entity @e[scores={UpperDoor1=-1}] run setblock 999 106 2026 white_stained_glass

execute if entity @e[scores={UpperDoor1=..-10}] run scoreboard objectives remove UpperDoor1



# BOSS RECEPTION ->  GREEN
execute if entity @e[scores={AdventureLevel=3..}] align x align y align z if entity @e[x=973,y=106,z=1998,dx=2,dy=4,dz=4,tag=DoorLevel1] run scoreboard objectives add UpperDoor2 dummy
execute align x align y align z if entity @e[x=973,y=106,z=1998,dx=2,dy=4,dz=4,tag=DoorLevel1] run scoreboard players add @e[tag=MainAdventureAEC] UpperDoor2 0
execute align x align y align z if entity @e[x=973,y=106,z=1998,dx=2,dy=4,dz=4,tag=DoorLevel1] run scoreboard players add @e[scores={UpperDoor2=..10}] UpperDoor2 1
execute align x align y align z unless entity @e[x=973,y=106,z=1998,dx=2,dy=4,dz=4,tag=DoorLevel1] run scoreboard players remove @e[scores={UpperDoor2=-10..}] UpperDoor2 1

execute if entity @e[scores={UpperDoor2=2}] run playsound entity.generic.burn master @a 974 107 2000 0.2 1.5 0
execute if entity @e[scores={UpperDoor2=2}] run playsound entity.evoker.cast_spell master @a 974 107 2000 0.2 1.3 0
execute if entity @e[scores={UpperDoor2=2}] run setblock 974 108 2001 air
execute if entity @e[scores={UpperDoor2=3}] run setblock 974 108 2000 air
execute if entity @e[scores={UpperDoor2=4}] run setblock 974 108 1999 air
execute if entity @e[scores={UpperDoor2=5}] run setblock 974 107 1999 air
execute if entity @e[scores={UpperDoor2=6}] run setblock 974 107 2000 air
execute if entity @e[scores={UpperDoor2=7}] run setblock 974 107 2001 air
execute if entity @e[scores={UpperDoor2=8}] run setblock 974 106 2001 air
execute if entity @e[scores={UpperDoor2=9}] run setblock 974 106 2000 air
execute if entity @e[scores={UpperDoor2=10}] run setblock 974 106 1999 air
execute if entity @e[scores={UpperDoor2=11..}] run fill 974 106 1999 974 108 2001 air replace white_stained_glass

execute if entity @e[scores={UpperDoor2=-9}] run setblock 974 108 2001 white_stained_glass
execute if entity @e[scores={UpperDoor2=-8}] run setblock 974 108 2000 white_stained_glass
execute if entity @e[scores={UpperDoor2=-7}] run setblock 974 108 1999 white_stained_glass
execute if entity @e[scores={UpperDoor2=-6}] run setblock 974 107 1999 white_stained_glass
execute if entity @e[scores={UpperDoor2=-5}] run setblock 974 107 2000 white_stained_glass
execute if entity @e[scores={UpperDoor2=-4}] run setblock 974 107 2001 white_stained_glass
execute if entity @e[scores={UpperDoor2=-3}] run setblock 974 106 2001 white_stained_glass
execute if entity @e[scores={UpperDoor2=-2}] run setblock 974 106 2000 white_stained_glass
execute if entity @e[scores={UpperDoor2=-1}] run setblock 974 106 1999 white_stained_glass

execute if entity @e[scores={UpperDoor2=..-10}] run scoreboard objectives remove UpperDoor2



# BOSS OFFICE -> GOLD
execute align x align y align z if entity @e[x=965,y=106,z=1995,dx=2,dy=4,dz=4,tag=DoorLevel5] run scoreboard objectives add UpperDoor3 dummy
execute align x align y align z if entity @e[x=965,y=106,z=1995,dx=2,dy=4,dz=4,tag=DoorLevel5] run scoreboard players add @e[tag=MainAdventureAEC] UpperDoor3 0
execute align x align y align z if entity @e[x=965,y=106,z=1995,dx=2,dy=4,dz=4,tag=DoorLevel5] run scoreboard players add @e[scores={UpperDoor3=..10}] UpperDoor3 1
execute align x align y align z unless entity @e[x=965,y=106,z=1995,dx=2,dy=4,dz=4,tag=DoorLevel5] run scoreboard players remove @e[scores={UpperDoor3=-10..}] UpperDoor3 1

execute if entity @e[scores={UpperDoor3=2}] run playsound entity.generic.burn master @a 966 107 1997 0.2 1.5 0
execute if entity @e[scores={UpperDoor3=2}] run playsound entity.evoker.cast_spell master @a 966 107 1997 0.2 1.3 0
execute if entity @e[scores={UpperDoor3=2}] run setblock 966 108 1998 air
execute if entity @e[scores={UpperDoor3=3}] run setblock 966 108 1997 air
execute if entity @e[scores={UpperDoor3=4}] run setblock 966 108 1996 air
execute if entity @e[scores={UpperDoor3=5}] run setblock 966 107 1996 air
execute if entity @e[scores={UpperDoor3=6}] run setblock 966 107 1997 air
execute if entity @e[scores={UpperDoor3=7}] run setblock 966 107 1998 air
execute if entity @e[scores={UpperDoor3=8}] run setblock 966 106 1998 air
execute if entity @e[scores={UpperDoor3=9}] run setblock 966 106 1997 air
execute if entity @e[scores={UpperDoor3=10}] run setblock 966 106 1996 air
execute if entity @e[scores={UpperDoor3=11..}] run fill 966 106 1996 966 108 1998 air replace white_stained_glass

execute if entity @e[scores={UpperDoor3=-9}] run setblock 966 108 1998 white_stained_glass
execute if entity @e[scores={UpperDoor3=-8}] run setblock 966 108 1997 white_stained_glass
execute if entity @e[scores={UpperDoor3=-7}] run setblock 966 108 1996 white_stained_glass
execute if entity @e[scores={UpperDoor3=-6}] run setblock 966 107 1996 white_stained_glass
execute if entity @e[scores={UpperDoor3=-5}] run setblock 966 107 1997 white_stained_glass
execute if entity @e[scores={UpperDoor3=-4}] run setblock 966 107 1998 white_stained_glass
execute if entity @e[scores={UpperDoor3=-3}] run setblock 966 106 1998 white_stained_glass
execute if entity @e[scores={UpperDoor3=-2}] run setblock 966 106 1997 white_stained_glass
execute if entity @e[scores={UpperDoor3=-1}] run setblock 966 106 1996 white_stained_glass

execute if entity @e[scores={UpperDoor3=..-10}] run scoreboard objectives remove UpperDoor3



# BOSS BEDROOM -> GOLD
execute align x align y align z if entity @e[x=959,y=106,z=1991,dx=4,dy=4,dz=2,tag=DoorLevel5] run scoreboard objectives add UpperDoor4 dummy
execute align x align y align z if entity @e[x=959,y=106,z=1991,dx=4,dy=4,dz=2,tag=DoorLevel5] run scoreboard players add @e[tag=MainAdventureAEC] UpperDoor4 0
execute align x align y align z if entity @e[x=959,y=106,z=1991,dx=4,dy=4,dz=2,tag=DoorLevel5] run scoreboard players add @e[scores={UpperDoor4=..10}] UpperDoor4 1
execute align x align y align z unless entity @e[x=959,y=106,z=1991,dx=4,dy=4,dz=2,tag=DoorLevel5] run scoreboard players remove @e[scores={UpperDoor4=-10..}] UpperDoor4 1

execute if entity @e[scores={UpperDoor4=2}] run playsound entity.generic.burn master @a 961 107 1992 0.2 1.5 0
execute if entity @e[scores={UpperDoor4=2}] run playsound entity.evoker.cast_spell master @a 961 107 1992 0.2 1.3 0
execute if entity @e[scores={UpperDoor4=2}] run setblock 960 108 1992 air
execute if entity @e[scores={UpperDoor4=3}] run setblock 961 108 1992 air
execute if entity @e[scores={UpperDoor4=4}] run setblock 962 108 1992 air
execute if entity @e[scores={UpperDoor4=5}] run setblock 962 107 1992 air
execute if entity @e[scores={UpperDoor4=6}] run setblock 961 107 1992 air
execute if entity @e[scores={UpperDoor4=7}] run setblock 960 107 1992 air
execute if entity @e[scores={UpperDoor4=8}] run setblock 960 106 1992 air
execute if entity @e[scores={UpperDoor4=9}] run setblock 961 106 1992 air
execute if entity @e[scores={UpperDoor4=10}] run setblock 962 106 1992 air
execute if entity @e[scores={UpperDoor4=11..}] run fill 962 106 1992 960 108 1992 air replace white_stained_glass

execute if entity @e[scores={UpperDoor4=-9}] run setblock 960 108 1992 white_stained_glass
execute if entity @e[scores={UpperDoor4=-8}] run setblock 961 108 1992 white_stained_glass
execute if entity @e[scores={UpperDoor4=-7}] run setblock 962 108 1992 white_stained_glass
execute if entity @e[scores={UpperDoor4=-6}] run setblock 962 107 1992 white_stained_glass
execute if entity @e[scores={UpperDoor4=-5}] run setblock 961 107 1992 white_stained_glass
execute if entity @e[scores={UpperDoor4=-4}] run setblock 960 107 1992 white_stained_glass
execute if entity @e[scores={UpperDoor4=-3}] run setblock 960 106 1992 white_stained_glass
execute if entity @e[scores={UpperDoor4=-2}] run setblock 961 106 1992 white_stained_glass
execute if entity @e[scores={UpperDoor4=-1}] run setblock 962 106 1992 white_stained_glass

execute if entity @e[scores={UpperDoor4=..-10}] run scoreboard objectives remove UpperDoor4



# ASTROSUIT -> ORANGE
execute align x align y align z if entity @e[x=1025,y=106,z=1998,dx=2,dy=4,dz=4,tag=DoorLevel3] run scoreboard objectives add UpperDoor5 dummy
execute align x align y align z if entity @e[x=1025,y=106,z=1998,dx=2,dy=4,dz=4,tag=DoorLevel3] run scoreboard players add @e[tag=MainAdventureAEC] UpperDoor5 0
execute align x align y align z if entity @e[x=1025,y=106,z=1998,dx=2,dy=4,dz=4,tag=DoorLevel3] run scoreboard players add @e[scores={UpperDoor5=..10}] UpperDoor5 1
execute align x align y align z unless entity @e[x=1025,y=106,z=1998,dx=2,dy=4,dz=4,tag=DoorLevel3] run scoreboard players remove @e[scores={UpperDoor5=-10..}] UpperDoor5 1

execute if entity @e[scores={UpperDoor5=2}] run playsound entity.generic.burn master @a 1026 107 2000 0.2 1.5 0
execute if entity @e[scores={UpperDoor5=2}] run playsound entity.evoker.cast_spell master @a 1026 107 2000 0.2 1.3 0
execute if entity @e[scores={UpperDoor5=2}] run setblock 1026 108 1999 air
execute if entity @e[scores={UpperDoor5=3}] run setblock 1026 108 2000 air
execute if entity @e[scores={UpperDoor5=4}] run setblock 1026 108 2001 air
execute if entity @e[scores={UpperDoor5=5}] run setblock 1026 107 2001 air
execute if entity @e[scores={UpperDoor5=6}] run setblock 1026 107 2000 air
execute if entity @e[scores={UpperDoor5=7}] run setblock 1026 107 1999 air
execute if entity @e[scores={UpperDoor5=8}] run setblock 1026 106 1999 air
execute if entity @e[scores={UpperDoor5=9}] run setblock 1026 106 2000 air
execute if entity @e[scores={UpperDoor5=10}] run setblock 1026 106 2001 air
execute if entity @e[scores={UpperDoor5=11..}] run fill 1026 106 2001 1026 108 1999 air replace white_stained_glass

execute if entity @e[scores={UpperDoor5=-9}] run setblock 1026 108 1999 white_stained_glass
execute if entity @e[scores={UpperDoor5=-8}] run setblock 1026 108 2000 white_stained_glass
execute if entity @e[scores={UpperDoor5=-7}] run setblock 1026 108 2001 white_stained_glass
execute if entity @e[scores={UpperDoor5=-6}] run setblock 1026 107 2001 white_stained_glass
execute if entity @e[scores={UpperDoor5=-5}] run setblock 1026 107 2000 white_stained_glass
execute if entity @e[scores={UpperDoor5=-4}] run setblock 1026 107 1999 white_stained_glass
execute if entity @e[scores={UpperDoor5=-3}] run setblock 1026 106 1999 white_stained_glass
execute if entity @e[scores={UpperDoor5=-2}] run setblock 1026 106 2000 white_stained_glass
execute if entity @e[scores={UpperDoor5=-1}] run setblock 1026 106 2001 white_stained_glass

execute if entity @e[scores={UpperDoor5=..-10}] run scoreboard objectives remove UpperDoor5

