####################################################################
# THIS FUNCTION WAS MADE BY JIGARBOV AND QMAGNET
# NOVEMBER 29 2018 / DECEMBER 1 2018
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
# Website -> https://jigarbov.net
####################################################################


scoreboard players add @e[scores={EatPork=0..74}] EatPork 1

execute if entity @e[scores={EatPork=0..}] run gamerule doTileDrops false

execute if entity @e[scores={EatPork=1}] run playsound entity.generic.eat master @a -1026 79 -949 4 1 0.2
execute if entity @e[scores={EatPork=1}] run fill -1028 71 -956 -1021 71 -956 air destroy

execute if entity @e[scores={EatPork=11}] run playsound entity.generic.eat master @a -1026 79 -949 4 1 0.2
execute if entity @e[scores={EatPork=11}] run fill -1028 70 -956 -1021 71 -956 air destroy
execute unless entity @e[scores={BossLevel=120}] if entity @e[scores={EatPork=16}] run clone -1003 57 -1011 -999 57 -1011 -1026 58 -956 masked
execute if entity @e[scores={BossLevel=120}] if entity @e[scores={EatPork=16}] run clone -1003 66 -1011 -999 66 -1011 -1026 58 -956 masked

execute if entity @e[scores={EatPork=21}] run playsound entity.generic.eat master @a -1026 79 -949 4 1 0.2
execute if entity @e[scores={EatPork=21}] run fill -1028 69 -956 -1021 71 -956 air destroy
execute unless entity @e[scores={BossLevel=120}] if entity @e[scores={EatPork=26}] run clone -1003 58 -1011 -999 58 -1011 -1026 59 -956 masked
execute if entity @e[scores={BossLevel=120}] if entity @e[scores={EatPork=26}] run clone -1003 67 -1011 -999 67 -1011 -1026 59 -956 masked

execute if entity @e[scores={EatPork=31}] run playsound entity.generic.eat master @a -1026 79 -949 4 1 0.2
execute if entity @e[scores={EatPork=31}] run fill -1028 68 -956 -1021 71 -956 air destroy
execute unless entity @e[scores={BossLevel=120}] if entity @e[scores={EatPork=36}] run clone -1003 59 -1011 -999 59 -1011 -1026 60 -956 masked
execute if entity @e[scores={BossLevel=120}] if entity @e[scores={EatPork=36}] run clone -1003 68 -1011 -999 68 -1011 -1026 60 -956 masked

execute if entity @e[scores={EatPork=41}] run playsound entity.generic.eat master @a -1026 79 -949 4 1 0.2
execute if entity @e[scores={EatPork=41}] run fill -1028 67 -956 -1021 71 -956 air destroy
execute unless entity @e[scores={BossLevel=120}] if entity @e[scores={EatPork=46}] run clone -1003 60 -1011 -999 60 -1011 -1026 61 -956 masked
execute if entity @e[scores={BossLevel=120}] if entity @e[scores={EatPork=46}] run clone -1003 69 -1011 -999 69 -1011 -1026 61 -956 masked

execute if entity @e[scores={EatPork=51}] run playsound entity.generic.eat master @a -1026 79 -949 4 1 0.2
execute if entity @e[scores={EatPork=51}] run fill -1028 66 -956 -1021 71 -956 air destroy
execute unless entity @e[scores={BossLevel=120}] if entity @e[scores={EatPork=56}] run clone -1003 61 -1011 -999 61 -1011 -1026 62 -956 masked
execute if entity @e[scores={BossLevel=120}] if entity @e[scores={EatPork=56}] run clone -1003 70 -1011 -999 70 -1011 -1026 62 -956 masked

execute if entity @e[scores={EatPork=61}] run playsound entity.generic.eat master @a -1026 79 -949 4 1 0.2
execute if entity @e[scores={EatPork=61}] run fill -1028 65 -956 -1021 71 -956 air destroy
#execute if entity @e[scores={EatPork=66}] run clone -1003 62 -1011 -999 62 -1011 -1026 63 -956 masked

execute if entity @e[scores={EatPork=71}] run playsound entity.player.burp master @a -1026 79 -949 4 1 0.2
execute unless entity @e[scores={BossLevel=120}] if entity @e[scores={EatPork=71}] run clone -1006 54 -1011 -998 62 -1011 -1029 55 -956 masked
execute if entity @e[scores={BossLevel=120}] if entity @e[scores={EatPork=71}] run clone -1006 63 -1011 -998 71 -1011 -1029 55 -956 masked



execute if entity @e[scores={EatPork=75}] run scoreboard players set @e[scores={BossLevel=60}] BossTimer 0
execute if entity @e[scores={EatPork=75}] run scoreboard players set @e[scores={BossLevel=60}] BossLevel 61

execute if entity @e[scores={EatPork=75}] run scoreboard players set @e[scores={BossLevel=120}] BossTimer 0
execute if entity @e[scores={EatPork=75}] run scoreboard players set @e[scores={BossLevel=120}] BossLevel 125

execute if entity @e[scores={EatPork=75}] run gamerule doTileDrops true
execute if entity @e[scores={EatPork=75..}] run scoreboard objectives remove EatPork