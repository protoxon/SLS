####################################################################
# THIS FUNCTION WAS MADE QMAGNET
# JANUARY 29 2019 / FEBRUARY 2 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar FinaleChurchDoor

scoreboard players add @e[scores={FinaleChurchDoor=0..}] FinaleChurchDoor 1
scoreboard players add @e[scores={FinaleChurchDoor=10}] FinaleChurchDoor 20

fill 6 43 106 6 48 106 spruce_stairs[facing=west,half=bottom,shape=outer_right] replace spruce_stairs[facing=west,half=bottom,shape=straight]
fill 10 43 106 10 48 106 spruce_stairs[facing=east,half=top,shape=outer_left] replace spruce_stairs[facing=east,half=top,shape=straight]
execute if block -40 190 4850 air if block -41 190 4850 tripwire_hook run setblock -41 190 4850 air

execute if entity @e[scores={FinaleChurchDoor=2}] run stopsound @a

execute if entity @e[scores={FinaleChurchDoor=2}] run setblock -41 190 4850 air
execute if entity @e[scores={FinaleChurchDoor=2}] run setblock -31 190 4850 air
execute if entity @e[scores={FinaleChurchDoor=2}] run fill -40 188 4848 -32 193 4851 air replace oak_planks
execute if entity @e[scores={FinaleChurchDoor=2}] run fill -40 188 4848 -32 193 4851 air replace spruce_stairs
execute if entity @e[scores={FinaleChurchDoor=2}] run clone 4 10 102 12 16 106 -40 188 4847 masked


execute if entity @e[scores={FinaleChurchDoor=50}] run playsound entity.skeleton_horse.ambient block @a -36 188 4847 0.5 1 0
execute if entity @e[scores={FinaleChurchDoor=50}] run playsound entity.zombie_horse.ambient block @a -36 188 4847 0.5 0.5 0

execute if entity @e[scores={FinaleChurchDoor=50}] run clone 4 21 102 12 26 106 -40 188 4847 masked
execute if entity @e[scores={FinaleChurchDoor=50}] run fill -37 190 4848 -35 190 4848 air
execute if entity @e[scores={FinaleChurchDoor=50}] run fill -38 188 4847 -34 192 4847 air
execute if entity @e[scores={FinaleChurchDoor=50}] run fill -37 193 4847 -35 193 4847 air


execute if entity @e[scores={FinaleChurchDoor=55}] run fill -37 190 4850 -35 190 4850 air replace tripwire_hook
execute if entity @e[scores={FinaleChurchDoor=55}] run clone 4 32 102 12 37 106 -40 188 4847 masked
execute if entity @e[scores={FinaleChurchDoor=55}] run fill -39 188 4847 -33 191 4847 air replace oak_planks
execute if entity @e[scores={FinaleChurchDoor=55}] run fill -38 188 4848 -34 192 4848 air replace oak_planks
execute if entity @e[scores={FinaleChurchDoor=55}] run fill -37 188 4849 -35 193 4849 air replace oak_planks
execute if entity @e[scores={FinaleChurchDoor=55}] run fill -36 188 4850 -36 193 4850 air


execute if entity @e[scores={FinaleChurchDoor=60}] run fill -39 190 4850 -33 190 4850 air replace tripwire_hook
execute if entity @e[scores={FinaleChurchDoor=60}] run clone 4 43 102 12 48 106 -40 188 4847 masked
execute if entity @e[scores={FinaleChurchDoor=60}] run fill -39 188 4849 -33 192 4849 air replace oak_planks
execute if entity @e[scores={FinaleChurchDoor=60}] run fill -38 188 4850 -34 193 4850 air replace oak_planks
execute if entity @e[scores={FinaleChurchDoor=60}] run fill -37 188 4851 -35 193 4851 air replace spruce_stairs


execute if entity @e[scores={FinaleChurchDoor=65}] run clone 4 54 102 12 59 106 -40 188 4847 masked
execute if entity @e[scores={FinaleChurchDoor=65}] run fill -39 188 4850 -33 193 4850 air replace oak_planks
execute if entity @e[scores={FinaleChurchDoor=65}] run fill -38 188 4851 -34 193 4851 air replace spruce_stairs
execute if entity @e[scores={FinaleChurchDoor=65}] run setblock -41 190 4850 tripwire_hook[facing=west]
execute if entity @e[scores={FinaleChurchDoor=65}] run setblock -31 190 4850 tripwire_hook[facing=east]

execute if entity @e[scores={FinaleChurchDoor=100}] run playsound minecraft:music.menu master @a -36 190 4793 5 1 1
execute if entity @e[scores={FinaleChurchDoor=101..}] run scoreboard objectives remove FinaleChurchDoor

scoreboard objectives remove FinishD3