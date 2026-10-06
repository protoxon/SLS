####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 4 2018 / NOVEMBER 17 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar AL4EasttoWest
#scoreboard objectives setdisplay sidebar AL4WesttoEast
#scoreboard objectives setdisplay sidebar AL4Depressurize
#scoreboard objectives setdisplay sidebar AL4WDoorOpens
#scoreboard objectives setdisplay sidebar AL4WDoorCloses
#scoreboard objectives setdisplay sidebar AL4EDoorOpens
#scoreboard objectives setdisplay sidebar AL4EDoorCloses


execute unless entity @a[tag=Airlock4] run tag @a remove AL4Favour
execute align x align y align z run tag @a[x=854,y=104,z=2038,dx=6,dy=4,dz=6] remove AL4Favour
execute align x align y align z run tag @a[x=865,y=104,z=2040,dx=3,dy=4,dz=2] remove AL4Favour
execute align x align y align z run tag @a[x=849,y=104,z=2040,dx=3,dy=4,dz=2] remove AL4Favour

execute unless entity @a[tag=AL4Favour] align x align y align z run tag @a[x=860,y=104,z=2038,dx=4,dy=4,dz=6] add AL4Favour
execute unless entity @a[tag=AL4Favour] align x align y align z run tag @a[x=850,y=104,z=2038,dx=4,dy=4,dz=6] add AL4Favour

execute unless entity @a[tag=Airlock4East] run scoreboard objectives remove AL4EasttoWest
execute unless entity @a[tag=Airlock4West] run scoreboard objectives remove AL4WesttoEast


execute if entity @a[tag=Airlock4,tag=!HasSuit] run scoreboard players set @e[scores={AL4WesttoEast=60..99}] AL4WesttoEast -50
execute if entity @a[tag=Airlock4,tag=!HasSuit] run scoreboard players set @e[scores={AL4WesttoEast=229..248}] AL4WesttoEast -50

# EAST TO WEST
execute align x align y align z run tag @a[x=865,y=104,z=2040,dx=3,dy=4,dz=2] remove Airlock4East
execute align x align y align z run tag @a[x=849,y=104,z=2039,dx=3,dy=4,dz=4] remove Airlock4East

execute align x align y align z run tag @a[x=860,y=104,z=2038,dx=4,dy=4,dz=6] add Airlock4East
execute if entity @a[tag=Airlock4East,tag=AL4Favour] unless entity @e[scores={AL4WesttoEast=..1000}] run scoreboard objectives add AL4EasttoWest dummy
scoreboard players add @e[tag=MainAdventureAEC] AL4EasttoWest 0

scoreboard players add @e[scores={AL4EasttoWest=..49}] AL4EasttoWest 1
execute if entity @e[scores={AL4EasttoWest=1}] if block 854 104 2041 air run scoreboard players set @e[scores={AL4EasttoWest=1}] AL4EasttoWest -51
execute if entity @e[scores={AL4EasttoWest=-50}] run scoreboard objectives add AL4WDoorCloses dummy
execute if entity @e[scores={AL4EasttoWest=20}] run scoreboard objectives add AL4EDoorOpens dummy

execute if entity @a[tag=Airlock4East,x=855,y=104,z=2038,dx=4,dy=4,dz=6] unless entity @a[x=860,y=104,z=2038,dx=4,dy=4,dz=6] run scoreboard players add @e[scores={AL4EasttoWest=50..60}] AL4EasttoWest 1
scoreboard players add @e[scores={AL4EasttoWest=61..249}] AL4EasttoWest 1
execute if entity @e[scores={AL4EasttoWest=62}] run scoreboard objectives add AL4EDoorCloses dummy
execute if entity @e[scores={AL4EasttoWest=100}] run scoreboard objectives add AL4Depressurize dummy
 
execute if entity @e[scores={AL4EasttoWest=230}] run playsound block.note_block.chime master @a 857 106 2041 1.5 0.89 0
execute if entity @e[scores={AL4EasttoWest=249}] run scoreboard objectives add AL4WDoorOpens dummy
execute if entity @e[scores={AL4EasttoWest=250}] align x align y align z unless entity @a[x=854,y=104,z=2038,dx=6,dy=4,dz=6] unless entity @a[tag=Airlock4West] if block 854 104 2041 air run scoreboard objectives add AL4WDoorCloses dummy
execute if entity @e[scores={AL4EasttoWest=250}] align x align y align z unless entity @a[x=854,y=104,z=2038,dx=6,dy=4,dz=6] run scoreboard objectives remove AL4EasttoWest


# WEST TO EAST
execute align x align y align z run tag @a[x=849,y=104,z=2040,dx=2,dy=4,dz=3] remove Airlock4West
execute align x align y align z run tag @a[x=862,y=104,z=2039,dx=3,dy=4,dz=4] remove Airlock4West

execute align x align y align z run tag @a[x=850,y=104,z=2038,dx=4,dy=4,dz=6] add Airlock4West
execute if entity @a[tag=Airlock4West,tag=AL4Favour] unless entity @e[scores={AL4EasttoWest=..1000}] run scoreboard objectives add AL4WesttoEast dummy
scoreboard players add @e[tag=MainAdventureAEC] AL4WesttoEast 0

scoreboard players add @e[scores={AL4WesttoEast=..49}] AL4WesttoEast 1
execute if entity @e[scores={AL4WesttoEast=1}] if block 860 104 2041 air run scoreboard players set @e[scores={AL4WesttoEast=1}] AL4WesttoEast -51
execute if entity @e[scores={AL4WesttoEast=-50}] run scoreboard objectives add AL4EDoorCloses dummy
execute if entity @e[scores={AL4WesttoEast=20}] run scoreboard objectives add AL4WDoorOpens dummy

execute if entity @a[tag=Airlock4West,x=855,y=104,z=2038,dx=4,dy=4,dz=6] unless entity @a[x=850,y=104,z=2038,dx=4,dy=4,dz=6] run scoreboard players add @e[scores={AL4WesttoEast=50..60}] AL4WesttoEast 1
scoreboard players add @e[scores={AL4WesttoEast=61..249}] AL4WesttoEast 1
execute if entity @e[scores={AL4WesttoEast=62}] run scoreboard objectives add AL4WDoorCloses dummy
execute if entity @e[scores={AL4WesttoEast=100}] run scoreboard objectives add AL4Depressurize dummy

execute if entity @e[scores={AL4WesttoEast=230}] run playsound block.note_block.chime master @a 857 106 2041 1.5 0.89 0
execute if entity @e[scores={AL4WesttoEast=249}] run scoreboard objectives add AL4EDoorOpens dummy
execute if entity @e[scores={AL4WesttoEast=250}] align x align y align z unless entity @a[x=854,y=104,z=2038,dx=6,dy=4,dz=6] unless entity @a[tag=Airlock4East] if block 860 104 2041 air run scoreboard objectives add AL4EDoorCloses dummy
execute if entity @e[scores={AL4WesttoEast=250}] align x align y align z unless entity @a[x=854,y=104,z=2038,dx=6,dy=4,dz=6] run scoreboard objectives remove AL4WesttoEast




# DEPRESSURIZE
#scoreboard objectives add AL4Depressurize dummy
scoreboard players add @e[tag=MainAdventureAEC] AL4Depressurize 1
execute if entity @e[scores={AL4Depressurize=1}] run stopsound @a[scores={SuitOff=1..}]
execute if entity @e[scores={AL4Depressurize=1}] run playsound entity.generic.burn master @a 857 106 2038 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=5}] run playsound entity.generic.burn master @a 857 106 2038 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=10}] run playsound entity.generic.burn master @a 857 106 2038 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=15}] run playsound entity.generic.burn master @a 857 106 2038 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=20}] run playsound entity.generic.burn master @a 857 106 2038 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=25}] run playsound entity.generic.burn master @a 857 106 2038 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=30}] run playsound entity.generic.burn master @a 857 106 2038 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=35}] run playsound entity.generic.burn master @a 857 106 2038 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=40}] run playsound entity.generic.burn master @a 857 106 2038 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=45}] run playsound entity.generic.burn master @a 857 106 2038 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=50}] run playsound entity.generic.burn master @a 857 106 2038 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=55}] run playsound entity.generic.burn master @a 857 106 2038 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=60}] run playsound entity.generic.burn master @a 857 106 2038 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=65}] run playsound entity.generic.burn master @a 857 106 2038 0.2 0.5 0

execute if entity @e[scores={AL4Depressurize=1}] run playsound entity.generic.burn master @a 857 106 2043 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=5}] run playsound entity.generic.burn master @a 857 106 2043 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=10}] run playsound entity.generic.burn master @a 857 106 2043 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=15}] run playsound entity.generic.burn master @a 857 106 2043 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=20}] run playsound entity.generic.burn master @a 857 106 2043 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=25}] run playsound entity.generic.burn master @a 857 106 2043 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=30}] run playsound entity.generic.burn master @a 857 106 2043 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=35}] run playsound entity.generic.burn master @a 857 106 2043 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=40}] run playsound entity.generic.burn master @a 857 106 2043 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=45}] run playsound entity.generic.burn master @a 857 106 2043 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=50}] run playsound entity.generic.burn master @a 857 106 2043 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=55}] run playsound entity.generic.burn master @a 857 106 2043 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=60}] run playsound entity.generic.burn master @a 857 106 2043 0.2 0.5 0
execute if entity @e[scores={AL4Depressurize=65}] run playsound entity.generic.burn master @a 857 106 2043 0.2 0.5 0

execute if entity @e[scores={AL4Depressurize=3..}] run particle cloud 857.5 105.5 2039.0 0.2 0.2 0.4 0 4 force
execute if entity @e[scores={AL4Depressurize=3..}] run particle cloud 857.5 108.5 2039.0 0.2 0.2 0.4 0 4 force
execute if entity @e[scores={AL4Depressurize=5..}] run particle cloud 857.5 106.5 2040.0 0.2 0.2 0.4 0 2 force
execute if entity @e[scores={AL4Depressurize=5..}] run particle cloud 857.5 107.5 2040.0 0.2 0.2 0.4 0 2 force
execute if entity @e[scores={AL4Depressurize=9..}] run particle cloud 857.5 107.0 2041.0 0.2 1.2 0.4 0 5 force

execute if entity @e[scores={AL4Depressurize=3..}] run particle cloud 857.5 105.5 2043.0 0.2 0.2 0.4 0 4 force
execute if entity @e[scores={AL4Depressurize=3..}] run particle cloud 857.5 108.5 2043.0 0.2 0.2 0.4 0 4 force
execute if entity @e[scores={AL4Depressurize=5..}] run particle cloud 857.5 106.5 2042.0 0.2 0.2 0.4 0 2 force
execute if entity @e[scores={AL4Depressurize=5..}] run particle cloud 857.5 106.5 2042.0 0.2 0.2 0.4 0 2 force
execute if entity @e[scores={AL4Depressurize=9..}] run particle cloud 857.5 107.0 2041.0 0.2 1.2 0.4 0 5 force
execute if entity @e[scores={AL4Depressurize=65..}] run scoreboard objectives remove AL4Depressurize



# WEST DOOR OPENS
#scoreboard objectives add AL4WDoorOpens dummy
scoreboard players add @e[tag=MainAdventureAEC] AL4WDoorOpens 1
execute if entity @e[scores={AL4WDoorOpens=1}] unless block 854 104 2041 air run playsound entity.generic.burn master @a 854 104 2041 0.2 1.5 0
execute if entity @e[scores={AL4WDoorOpens=1}] unless block 854 104 2041 air run playsound entity.evoker.cast_spell master @a 854 104 2041 0.2 1.3 0

execute if entity @e[scores={AL4WDoorOpens=1}] run fill 854 104 2042 854 109 2040 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL4WDoorOpens=1}] run fill 854 104 2041 854 109 2041 air

execute if entity @e[scores={AL4WDoorOpens=2}] run fill 854 104 2043 854 109 2039 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL4WDoorOpens=2}] run fill 854 104 2042 854 109 2040 air

execute if entity @e[scores={AL4WDoorOpens=3}] run fill 854 104 2044 854 109 2038 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL4WDoorOpens=3}] run fill 854 104 2043 854 109 2039 air
execute if entity @e[scores={AL4WDoorOpens=3..}] run scoreboard objectives remove AL4WDoorOpens


# WEST DOOR CLOSES
#scoreboard objectives add AL4WDoorCloses dummy
scoreboard players add @e[tag=MainAdventureAEC] AL4WDoorCloses 1
execute if entity @e[scores={AL4WDoorCloses=1}] if block 854 104 2041 air run playsound entity.generic.burn master @a 854 104 2041 0.2 1.5 0
execute if entity @e[scores={AL4WDoorCloses=1}] if block 854 104 2041 air run playsound entity.evoker.cast_spell master @a 854 104 2041 0.2 1.3 0

execute if entity @e[scores={AL4WDoorCloses=1}] run fill 854 104 2044 854 109 2044 white_stained_glass
execute if entity @e[scores={AL4WDoorCloses=1}] run fill 854 104 2038 854 109 2038 white_stained_glass
execute if entity @e[scores={AL4WDoorCloses=1}] run fill 854 104 2043 854 109 2043 orange_stained_glass
execute if entity @e[scores={AL4WDoorCloses=1}] run fill 854 104 2039 854 109 2039 orange_stained_glass

execute if entity @e[scores={AL4WDoorCloses=2}] run fill 854 104 2043 854 109 2043 white_stained_glass
execute if entity @e[scores={AL4WDoorCloses=2}] run fill 854 104 2039 854 109 2039 white_stained_glass
execute if entity @e[scores={AL4WDoorCloses=2}] run fill 854 104 2042 854 109 2042 orange_stained_glass
execute if entity @e[scores={AL4WDoorCloses=2}] run fill 854 104 2040 854 109 2040 orange_stained_glass

execute if entity @e[scores={AL4WDoorCloses=3}] run fill 854 104 2042 854 109 2042 white_stained_glass
execute if entity @e[scores={AL4WDoorCloses=3}] run fill 854 104 2040 854 109 2040 white_stained_glass
execute if entity @e[scores={AL4WDoorCloses=3}] run fill 854 104 2041 854 109 2041 orange_stained_glass
execute if entity @e[scores={AL4WDoorCloses=3..}] run scoreboard objectives remove AL4WDoorCloses


# EAST DOOR OPENS
#scoreboard objectives add AL4EDoorOpens dummy
scoreboard players add @e[tag=MainAdventureAEC] AL4EDoorOpens 1
execute if entity @e[scores={AL4EDoorOpens=1}] unless block 860 104 2041 air run playsound entity.generic.burn master @a 860 104 2041 0.2 1.5 0
execute if entity @e[scores={AL4EDoorOpens=1}] unless block 860 104 2041 air run playsound entity.evoker.cast_spell master @a 860 104 2041 0.2 1.3 0

execute if entity @e[scores={AL4EDoorOpens=1}] run fill 860 104 2042 860 109 2040 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL4EDoorOpens=1}] run fill 860 104 2041 860 109 2041 air

execute if entity @e[scores={AL4EDoorOpens=2}] run fill 860 104 2043 860 109 2039 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL4EDoorOpens=2}] run fill 860 104 2042 860 109 2040 air

execute if entity @e[scores={AL4EDoorOpens=3}] run fill 860 104 2044 860 109 2038 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL4EDoorOpens=3}] run fill 860 104 2043 860 109 2039 air
execute if entity @e[scores={AL4EDoorOpens=3..}] run scoreboard objectives remove AL4EDoorOpens


# EAST DOOR CLOSES
#scoreboard objectives add AL4EDoorCloses dummy
scoreboard players add @e[tag=MainAdventureAEC] AL4EDoorCloses 1
execute if entity @e[scores={AL4EDoorCloses=1}] if block 860 104 2041 air run playsound entity.generic.burn master @a 860 104 2041 0.2 1.5 0
execute if entity @e[scores={AL4EDoorCloses=1}] if block 860 104 2041 air run playsound entity.evoker.cast_spell master @a 860 104 2041 0.2 1.3 0

execute if entity @e[scores={AL4EDoorCloses=1}] run fill 860 104 2044 860 109 2044 white_stained_glass
execute if entity @e[scores={AL4EDoorCloses=1}] run fill 860 104 2038 860 109 2038 white_stained_glass
execute if entity @e[scores={AL4EDoorCloses=1}] run fill 860 104 2043 860 109 2043 orange_stained_glass
execute if entity @e[scores={AL4EDoorCloses=1}] run fill 860 104 2039 860 109 2039 orange_stained_glass

execute if entity @e[scores={AL4EDoorCloses=2}] run fill 860 104 2043 860 109 2043 white_stained_glass
execute if entity @e[scores={AL4EDoorCloses=2}] run fill 860 104 2039 860 109 2039 white_stained_glass
execute if entity @e[scores={AL4EDoorCloses=2}] run fill 860 104 2042 860 109 2042 orange_stained_glass
execute if entity @e[scores={AL4EDoorCloses=2}] run fill 860 104 2040 860 109 2040 orange_stained_glass

execute if entity @e[scores={AL4EDoorCloses=3}] run fill 860 104 2042 860 109 2042 white_stained_glass
execute if entity @e[scores={AL4EDoorCloses=3}] run fill 860 104 2040 860 109 2040 white_stained_glass
execute if entity @e[scores={AL4EDoorCloses=3}] run fill 860 104 2041 860 109 2041 orange_stained_glass
execute if entity @e[scores={AL4EDoorCloses=3..}] run scoreboard objectives remove AL4EDoorCloses