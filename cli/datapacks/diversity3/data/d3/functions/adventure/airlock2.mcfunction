####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# NOVEMBER 4 2018 / NOVEMBER 17 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar AL2EasttoWest
#scoreboard objectives setdisplay sidebar AL2WesttoEast
#scoreboard objectives setdisplay sidebar AL2Depressurize
#scoreboard objectives setdisplay sidebar AL2WDoorOpens
#scoreboard objectives setdisplay sidebar AL2WDoorCloses
#scoreboard objectives setdisplay sidebar AL2EDoorOpens
#scoreboard objectives setdisplay sidebar AL2EDoorCloses


execute unless entity @a[tag=Airlock2] run tag @a remove AL2Favour
execute align x align y align z run tag @a[x=947,y=144,z=2109,dx=6,dy=4,dz=6] remove AL2Favour
execute align x align y align z run tag @a[x=958,y=144,z=2111,dx=3,dy=4,dz=2] remove AL2Favour
execute align x align y align z run tag @a[x=942,y=144,z=2111,dx=3,dy=4,dz=2] remove AL2Favour

execute unless entity @a[tag=AL2Favour] align x align y align z run tag @a[x=953,y=144,z=2109,dx=4,dy=4,dz=6] add AL2Favour
execute unless entity @a[tag=AL2Favour] align x align y align z run tag @a[x=943,y=144,z=2109,dx=4,dy=4,dz=6] add AL2Favour

execute unless entity @a[tag=Airlock2East] run scoreboard objectives remove AL2EasttoWest
execute unless entity @a[tag=Airlock2West] run scoreboard objectives remove AL2WesttoEast


execute if entity @a[tag=Airlock2,tag=!HasSuit] run scoreboard players set @e[scores={AL2EasttoWest=60..99}] AL2EasttoWest -50
execute if entity @a[tag=Airlock2,tag=!HasSuit] run scoreboard players set @e[scores={AL2EasttoWest=229..248}] AL2EasttoWest -50

# EAST TO WEST
execute align x align y align z run tag @a[x=958,y=144,z=2111,dx=3,dy=4,dz=2] remove Airlock2East
execute align x align y align z run tag @a[x=942,y=144,z=2110,dx=3,dy=4,dz=4] remove Airlock2East

execute align x align y align z run tag @a[x=953,y=144,z=2109,dx=4,dy=4,dz=6] add Airlock2East
execute if entity @a[tag=Airlock2East,tag=AL2Favour] unless entity @e[scores={AL2WesttoEast=..1000}] run scoreboard objectives add AL2EasttoWest dummy
scoreboard players add @e[tag=MainAdventureAEC] AL2EasttoWest 0

scoreboard players add @e[scores={AL2EasttoWest=..49}] AL2EasttoWest 1
execute if entity @e[scores={AL2EasttoWest=1}] if block 947 144 2112 air run scoreboard players set @e[scores={AL2EasttoWest=1}] AL2EasttoWest -51
execute if entity @e[scores={AL2EasttoWest=-50}] run scoreboard objectives add AL2WDoorCloses dummy
execute if entity @e[scores={AL2EasttoWest=20}] run scoreboard objectives add AL2EDoorOpens dummy

execute if entity @a[tag=Airlock2East,x=948,y=144,z=2109,dx=4,dy=4,dz=6] unless entity @a[x=953,y=144,z=2109,dx=4,dy=4,dz=6] run scoreboard players add @e[scores={AL2EasttoWest=50..60}] AL2EasttoWest 1
scoreboard players add @e[scores={AL2EasttoWest=61..249}] AL2EasttoWest 1
execute if entity @e[scores={AL2EasttoWest=62}] run scoreboard objectives add AL2EDoorCloses dummy
execute if entity @e[scores={AL2EasttoWest=100}] run scoreboard objectives add AL2Depressurize dummy
 
execute if entity @e[scores={AL2EasttoWest=230}] run playsound block.note_block.chime master @a 950 146 2112 1.5 0.89 0
execute if entity @e[scores={AL2EasttoWest=249}] run scoreboard objectives add AL2WDoorOpens dummy
execute if entity @e[scores={AL2EasttoWest=250}] align x align y align z unless entity @a[x=947,y=144,z=2109,dx=6,dy=4,dz=6] unless entity @a[tag=Airlock2West] if block 947 144 2112 air run scoreboard objectives add AL2WDoorCloses dummy
execute if entity @e[scores={AL2EasttoWest=250}] align x align y align z unless entity @a[x=947,y=144,z=2109,dx=6,dy=4,dz=6] run scoreboard objectives remove AL2EasttoWest


# WEST TO EAST
execute align x align y align z run tag @a[x=942,y=144,z=2111,dx=2,dy=4,dz=3] remove Airlock2West
execute align x align y align z run tag @a[x=955,y=144,z=2110,dx=3,dy=4,dz=4] remove Airlock2West

execute align x align y align z run tag @a[x=943,y=144,z=2109,dx=4,dy=4,dz=6] add Airlock2West
execute if entity @a[tag=Airlock2West,tag=AL2Favour] unless entity @e[scores={AL2EasttoWest=..1000}] run scoreboard objectives add AL2WesttoEast dummy
scoreboard players add @e[tag=MainAdventureAEC] AL2WesttoEast 0

scoreboard players add @e[scores={AL2WesttoEast=..49}] AL2WesttoEast 1
execute if entity @e[scores={AL2WesttoEast=1}] if block 953 144 2112 air run scoreboard players set @e[scores={AL2WesttoEast=1}] AL2WesttoEast -51
execute if entity @e[scores={AL2WesttoEast=-50}] run scoreboard objectives add AL2EDoorCloses dummy
execute if entity @e[scores={AL2WesttoEast=20}] run scoreboard objectives add AL2WDoorOpens dummy

execute if entity @a[tag=Airlock2West,x=948,y=144,z=2109,dx=4,dy=4,dz=6] unless entity @a[x=943,y=144,z=2109,dx=4,dy=4,dz=6] run scoreboard players add @e[scores={AL2WesttoEast=50..60}] AL2WesttoEast 1
scoreboard players add @e[scores={AL2WesttoEast=61..249}] AL2WesttoEast 1
execute if entity @e[scores={AL2WesttoEast=62}] run scoreboard objectives add AL2WDoorCloses dummy
execute if entity @e[scores={AL2WesttoEast=100}] run scoreboard objectives add AL2Depressurize dummy

execute if entity @e[scores={AL2WesttoEast=230}] run playsound block.note_block.chime master @a 950 146 2112 1.5 0.89 0
execute if entity @e[scores={AL2WesttoEast=249}] run scoreboard objectives add AL2EDoorOpens dummy
execute if entity @e[scores={AL2WesttoEast=250}] align x align y align z unless entity @a[x=947,y=144,z=2109,dx=6,dy=4,dz=6] unless entity @a[tag=Airlock2East] if block 953 144 2112 air run scoreboard objectives add AL2EDoorCloses dummy
execute if entity @e[scores={AL2WesttoEast=250}] align x align y align z unless entity @a[x=947,y=144,z=2109,dx=6,dy=4,dz=6] run scoreboard objectives remove AL2WesttoEast




# DEPRESSURIZE
#scoreboard objectives add AL2Depressurize dummy
scoreboard players add @e[tag=MainAdventureAEC] AL2Depressurize 1
execute if entity @e[scores={AL2Depressurize=1}] run stopsound @a[scores={SuitOff=1..}]
execute if entity @e[scores={AL2Depressurize=1}] run playsound entity.generic.burn master @a 950 146 2109 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=5}] run playsound entity.generic.burn master @a 950 146 2109 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=10}] run playsound entity.generic.burn master @a 950 146 2109 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=15}] run playsound entity.generic.burn master @a 950 146 2109 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=20}] run playsound entity.generic.burn master @a 950 146 2109 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=25}] run playsound entity.generic.burn master @a 950 146 2109 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=30}] run playsound entity.generic.burn master @a 950 146 2109 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=35}] run playsound entity.generic.burn master @a 950 146 2109 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=40}] run playsound entity.generic.burn master @a 950 146 2109 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=45}] run playsound entity.generic.burn master @a 950 146 2109 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=50}] run playsound entity.generic.burn master @a 950 146 2109 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=55}] run playsound entity.generic.burn master @a 950 146 2109 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=60}] run playsound entity.generic.burn master @a 950 146 2109 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=65}] run playsound entity.generic.burn master @a 950 146 2109 0.2 0.5 0

execute if entity @e[scores={AL2Depressurize=1}] run playsound entity.generic.burn master @a 950 146 2114 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=5}] run playsound entity.generic.burn master @a 950 146 2114 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=10}] run playsound entity.generic.burn master @a 950 146 2114 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=15}] run playsound entity.generic.burn master @a 950 146 2114 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=20}] run playsound entity.generic.burn master @a 950 146 2114 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=25}] run playsound entity.generic.burn master @a 950 146 2114 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=30}] run playsound entity.generic.burn master @a 950 146 2114 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=35}] run playsound entity.generic.burn master @a 950 146 2114 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=40}] run playsound entity.generic.burn master @a 950 146 2114 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=45}] run playsound entity.generic.burn master @a 950 146 2114 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=50}] run playsound entity.generic.burn master @a 950 146 2114 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=55}] run playsound entity.generic.burn master @a 950 146 2114 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=60}] run playsound entity.generic.burn master @a 950 146 2114 0.2 0.5 0
execute if entity @e[scores={AL2Depressurize=65}] run playsound entity.generic.burn master @a 950 146 2114 0.2 0.5 0

execute if entity @e[scores={AL2Depressurize=3..}] run particle cloud 950.5 145.5 2110.0 0.2 0.2 0.4 0 4 force
execute if entity @e[scores={AL2Depressurize=3..}] run particle cloud 950.5 148.5 2110.0 0.2 0.2 0.4 0 4 force
execute if entity @e[scores={AL2Depressurize=5..}] run particle cloud 950.5 146.5 2111.0 0.2 0.2 0.4 0 2 force
execute if entity @e[scores={AL2Depressurize=5..}] run particle cloud 950.5 147.5 2111.0 0.2 0.2 0.4 0 2 force
execute if entity @e[scores={AL2Depressurize=9..}] run particle cloud 950.5 147.0 2112.0 0.2 1.2 0.4 0 5 force

execute if entity @e[scores={AL2Depressurize=3..}] run particle cloud 950.5 145.5 2114.0 0.2 0.2 0.4 0 4 force
execute if entity @e[scores={AL2Depressurize=3..}] run particle cloud 950.5 148.5 2114.0 0.2 0.2 0.4 0 4 force
execute if entity @e[scores={AL2Depressurize=5..}] run particle cloud 950.5 146.5 2113.0 0.2 0.2 0.4 0 2 force
execute if entity @e[scores={AL2Depressurize=5..}] run particle cloud 950.5 146.5 2113.0 0.2 0.2 0.4 0 2 force
execute if entity @e[scores={AL2Depressurize=9..}] run particle cloud 950.5 147.0 2112.0 0.2 1.2 0.4 0 5 force
execute if entity @e[scores={AL2Depressurize=65..}] run scoreboard objectives remove AL2Depressurize



# WEST DOOR OPENS
#scoreboard objectives add AL2WDoorOpens dummy
scoreboard players add @e[tag=MainAdventureAEC] AL2WDoorOpens 1
execute if entity @e[scores={AL2WDoorOpens=1}] unless block 947 144 2112 air run playsound entity.generic.burn master @a 947 144 2112 0.2 1.5 0
execute if entity @e[scores={AL2WDoorOpens=1}] unless block 947 144 2112 air run playsound entity.evoker.cast_spell master @a 947 144 2112 0.2 1.3 0

execute if entity @e[scores={AL2WDoorOpens=1}] run fill 947 144 2113 947 149 2111 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL2WDoorOpens=1}] run fill 947 144 2112 947 149 2112 air

execute if entity @e[scores={AL2WDoorOpens=2}] run fill 947 144 2114 947 149 2110 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL2WDoorOpens=2}] run fill 947 144 2113 947 149 2111 air

execute if entity @e[scores={AL2WDoorOpens=3}] run fill 947 144 2115 947 149 2109 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL2WDoorOpens=3}] run fill 947 144 2114 947 149 2110 air
execute if entity @e[scores={AL2WDoorOpens=3..}] run scoreboard objectives remove AL2WDoorOpens


# WEST DOOR CLOSES
#scoreboard objectives add AL2WDoorCloses dummy
scoreboard players add @e[tag=MainAdventureAEC] AL2WDoorCloses 1
execute if entity @e[scores={AL2WDoorCloses=1}] if block 947 144 2112 air run playsound entity.generic.burn master @a 947 144 2112 0.2 1.5 0
execute if entity @e[scores={AL2WDoorCloses=1}] if block 947 144 2112 air run playsound entity.evoker.cast_spell master @a 947 144 2112 0.2 1.3 0

execute if entity @e[scores={AL2WDoorCloses=1}] run fill 947 144 2115 947 149 2115 white_stained_glass
execute if entity @e[scores={AL2WDoorCloses=1}] run fill 947 144 2109 947 149 2109 white_stained_glass
execute if entity @e[scores={AL2WDoorCloses=1}] run fill 947 144 2114 947 149 2114 orange_stained_glass
execute if entity @e[scores={AL2WDoorCloses=1}] run fill 947 144 2110 947 149 2110 orange_stained_glass

execute if entity @e[scores={AL2WDoorCloses=2}] run fill 947 144 2114 947 149 2114 white_stained_glass
execute if entity @e[scores={AL2WDoorCloses=2}] run fill 947 144 2110 947 149 2110 white_stained_glass
execute if entity @e[scores={AL2WDoorCloses=2}] run fill 947 144 2113 947 149 2113 orange_stained_glass
execute if entity @e[scores={AL2WDoorCloses=2}] run fill 947 144 2111 947 149 2111 orange_stained_glass

execute if entity @e[scores={AL2WDoorCloses=3}] run fill 947 144 2113 947 149 2113 white_stained_glass
execute if entity @e[scores={AL2WDoorCloses=3}] run fill 947 144 2111 947 149 2111 white_stained_glass
execute if entity @e[scores={AL2WDoorCloses=3}] run fill 947 144 2112 947 149 2112 orange_stained_glass
execute if entity @e[scores={AL2WDoorCloses=3..}] run scoreboard objectives remove AL2WDoorCloses


# EAST DOOR OPENS
#scoreboard objectives add AL2EDoorOpens dummy
scoreboard players add @e[tag=MainAdventureAEC] AL2EDoorOpens 1
execute if entity @e[scores={AL2EDoorOpens=1}] unless block 953 144 2112 air run playsound entity.generic.burn master @a 953 144 2112 0.2 1.5 0
execute if entity @e[scores={AL2EDoorOpens=1}] unless block 953 144 2112 air run playsound entity.evoker.cast_spell master @a 953 144 2112 0.2 1.3 0

execute if entity @e[scores={AL2EDoorOpens=1}] run fill 953 144 2113 953 149 2111 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL2EDoorOpens=1}] run fill 953 144 2112 953 149 2112 air

execute if entity @e[scores={AL2EDoorOpens=2}] run fill 953 144 2114 953 149 2110 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL2EDoorOpens=2}] run fill 953 144 2113 953 149 2111 air

execute if entity @e[scores={AL2EDoorOpens=3}] run fill 953 144 2115 953 149 2109 orange_stained_glass replace white_stained_glass
execute if entity @e[scores={AL2EDoorOpens=3}] run fill 953 144 2114 953 149 2110 air
execute if entity @e[scores={AL2EDoorOpens=3..}] run scoreboard objectives remove AL2EDoorOpens


# EAST DOOR CLOSES
#scoreboard objectives add AL2EDoorCloses dummy
scoreboard players add @e[tag=MainAdventureAEC] AL2EDoorCloses 1
execute if entity @e[scores={AL2EDoorCloses=1}] if block 953 144 2112 air run playsound entity.generic.burn master @a 953 144 2112 0.2 1.5 0
execute if entity @e[scores={AL2EDoorCloses=1}] if block 953 144 2112 air run playsound entity.evoker.cast_spell master @a 953 144 2112 0.2 1.3 0

execute if entity @e[scores={AL2EDoorCloses=1}] run fill 953 144 2115 953 149 2115 white_stained_glass
execute if entity @e[scores={AL2EDoorCloses=1}] run fill 953 144 2109 953 149 2109 white_stained_glass
execute if entity @e[scores={AL2EDoorCloses=1}] run fill 953 144 2114 953 149 2114 orange_stained_glass
execute if entity @e[scores={AL2EDoorCloses=1}] run fill 953 144 2110 953 149 2110 orange_stained_glass

execute if entity @e[scores={AL2EDoorCloses=2}] run fill 953 144 2114 953 149 2114 white_stained_glass
execute if entity @e[scores={AL2EDoorCloses=2}] run fill 953 144 2110 953 149 2110 white_stained_glass
execute if entity @e[scores={AL2EDoorCloses=2}] run fill 953 144 2113 953 149 2113 orange_stained_glass
execute if entity @e[scores={AL2EDoorCloses=2}] run fill 953 144 2111 953 149 2111 orange_stained_glass

execute if entity @e[scores={AL2EDoorCloses=3}] run fill 953 144 2113 953 149 2113 white_stained_glass
execute if entity @e[scores={AL2EDoorCloses=3}] run fill 953 144 2111 953 149 2111 white_stained_glass
execute if entity @e[scores={AL2EDoorCloses=3}] run fill 953 144 2112 953 149 2112 orange_stained_glass
execute if entity @e[scores={AL2EDoorCloses=3..}] run scoreboard objectives remove AL2EDoorCloses