####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 27 2018 / JULY 13 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


# SLIME
execute unless entity @e[scores={SlimeTotal=1..}] unless block -21 46 1958 air run setblock -21 46 1958 air
execute if entity @e[scores={SlimeTotal=1..}] unless block -21 46 1958 oak_wall_sign run setblock -21 46 1958 oak_wall_sign[facing=east]
execute if block -21 46 1958 oak_wall_sign run data merge block -21 46 1958 {Text1:"{\"text\":\"Total Slain\",\"color\":\"black\",\"bold\":true}",Text2:"{\"text\":\"---------------\",\"color\":\"black\"}",Text3:"{\"text\":\"\",\"color\":\"black\",\"extra\":[{\"score\":{\"name\":\"@e[tag=MainArenaAEC]\",\"objective\":\"SlimeTotal\"},\"color\":\"black\",\"bold\":false}]}",Text4:"{\"text\":\"---------------\",\"color\":\"black\"}"}


# ZOMBIE
execute unless entity @e[scores={ZombieTotal=1..}] unless block -21 46 1954 air run setblock -21 46 1954 air
execute if entity @e[scores={ZombieTotal=1..}] unless block -21 46 1954 oak_wall_sign run setblock -21 46 1954 oak_wall_sign[facing=east]
execute if block -21 46 1954 oak_wall_sign run data merge block -21 46 1954 {Text1:"{\"text\":\"Total Slain\",\"color\":\"black\",\"bold\":true}",Text2:"{\"text\":\"---------------\",\"color\":\"black\"}",Text3:"{\"text\":\"\",\"color\":\"black\",\"extra\":[{\"score\":{\"name\":\"@e[tag=MainArenaAEC]\",\"objective\":\"ZombieTotal\"},\"color\":\"black\",\"bold\":false}]}",Text4:"{\"text\":\"---------------\",\"color\":\"black\"}"}


# SKELETON
execute unless entity @e[scores={SkeletonTotal=1..}] unless block -21 46 1950 air run setblock -21 46 1950 air
execute if entity @e[scores={SkeletonTotal=1..}] unless block -21 46 1950 oak_wall_sign run setblock -21 46 1950 oak_wall_sign[facing=east]
execute if block -21 46 1950 oak_wall_sign run data merge block -21 46 1950 {Text1:"{\"text\":\"Total Slain\",\"color\":\"black\",\"bold\":true}",Text2:"{\"text\":\"---------------\",\"color\":\"black\"}",Text3:"{\"text\":\"\",\"color\":\"black\",\"extra\":[{\"score\":{\"name\":\"@e[tag=MainArenaAEC]\",\"objective\":\"SkeletonTotal\"},\"color\":\"black\",\"bold\":false}]}",Text4:"{\"text\":\"---------------\",\"color\":\"black\"}"}


# CREEPER
execute unless entity @e[scores={CreeperTotal=1..}] unless block -21 46 1946 air run setblock -21 46 1946 air
execute if entity @e[scores={CreeperTotal=1..}] unless block -21 46 1946 oak_wall_sign run setblock -21 46 1946 oak_wall_sign[facing=east]
execute if block -21 46 1946 oak_wall_sign run data merge block -21 46 1946 {Text1:"{\"text\":\"Total Slain\",\"color\":\"black\",\"bold\":true}",Text2:"{\"text\":\"---------------\",\"color\":\"black\"}",Text3:"{\"text\":\"\",\"color\":\"black\",\"extra\":[{\"score\":{\"name\":\"@e[tag=MainArenaAEC]\",\"objective\":\"CreeperTotal\"},\"color\":\"black\",\"bold\":false}]}",Text4:"{\"text\":\"---------------\",\"color\":\"black\"}"}


# MAGMA CUBE
execute unless entity @e[scores={MagmaCubeTotal=1..}] unless block -25 46 1958 air run setblock -25 46 1958 air
execute if entity @e[scores={MagmaCubeTotal=1..}] unless block -25 46 1958 oak_wall_sign run setblock -25 46 1958 oak_wall_sign[facing=east]
execute if block -25 46 1958 oak_wall_sign run data merge block -25 46 1958 {Text1:"{\"text\":\"Total Slain\",\"color\":\"black\",\"bold\":true}",Text2:"{\"text\":\"---------------\",\"color\":\"black\"}",Text3:"{\"text\":\"\",\"color\":\"black\",\"extra\":[{\"score\":{\"name\":\"@e[tag=MainArenaAEC]\",\"objective\":\"MagmaCubeTotal\"},\"color\":\"black\",\"bold\":false}]}",Text4:"{\"text\":\"---------------\",\"color\":\"black\"}"}


# WITCH
execute unless entity @e[scores={WitchTotal=1..}] unless block -25 46 1954 air run setblock -25 46 1954 air
execute if entity @e[scores={WitchTotal=1..}] unless block -25 46 1954 oak_wall_sign run setblock -25 46 1954 oak_wall_sign[facing=east]
execute if block -25 46 1954 oak_wall_sign run data merge block -25 46 1954 {Text1:"{\"text\":\"Total Slain\",\"color\":\"black\",\"bold\":true}",Text2:"{\"text\":\"---------------\",\"color\":\"black\"}",Text3:"{\"text\":\"\",\"color\":\"black\",\"extra\":[{\"score\":{\"name\":\"@e[tag=MainArenaAEC]\",\"objective\":\"WitchTotal\"},\"color\":\"black\",\"bold\":false}]}",Text4:"{\"text\":\"---------------\",\"color\":\"black\"}"}

# SPIDER / STRAY
execute unless entity @e[scores={StrayTotal=1..}] unless block -25 46 1950 air run setblock -25 46 1950 air
execute if entity @e[scores={StrayTotal=1..}] unless block -25 46 1950 oak_wall_sign run setblock -25 46 1950 oak_wall_sign[facing=east]
execute if block -25 46 1950 oak_wall_sign run data merge block -25 46 1950 {Text1:"{\"text\":\"Total Slain\",\"color\":\"black\",\"bold\":true}",Text2:"{\"text\":\"---------------\",\"color\":\"black\"}",Text3:"{\"text\":\"\",\"color\":\"black\",\"extra\":[{\"score\":{\"name\":\"@e[tag=MainArenaAEC]\",\"objective\":\"StrayTotal\"},\"color\":\"black\",\"bold\":false}]}",Text4:"{\"text\":\"---------------\",\"color\":\"black\"}"}

# CHICKEN JOCKEY
execute unless entity @e[scores={BabyZombieTotal=1..}] unless block -25 46 1946 air run setblock -25 46 1946 air
execute if entity @e[scores={BabyZombieTotal=1..}] unless block -25 46 1946 oak_wall_sign run setblock -25 46 1946 oak_wall_sign[facing=east]
execute if block -25 46 1946 oak_wall_sign run data merge block -25 46 1946 {Text1:"{\"text\":\"Total Slain\",\"color\":\"black\",\"bold\":true}",Text2:"{\"text\":\"---------------\",\"color\":\"black\"}",Text3:"{\"text\":\"\",\"color\":\"black\",\"extra\":[{\"score\":{\"name\":\"@e[tag=MainArenaAEC]\",\"objective\":\"BabyZombieTotal\"},\"color\":\"black\",\"bold\":false}]}",Text4:"{\"text\":\"---------------\",\"color\":\"black\"}"}


# CAVE SPIDER
#execute unless entity @e[scores={CaveSpiderTotal=1..}] unless block -21 46 1946 air run setblock -21 46 1946 air
#execute if entity @e[scores={CaveSpiderTotal=1..}] unless block -21 46 1946 oak_wall_sign run setblock -21 46 1946 oak_wall_sign[facing=east]
#execute if block -21 46 1946 oak_wall_sign run data merge block -21 46 1946 {Text1:"{\"text\":\"Total Slain\",\"color\":\"black\",\"bold\":true}",Text2:"{\"text\":\"---------------\",\"color\":\"black\"}",Text3:"{\"text\":\"\",\"color\":\"black\",\"extra\":[{\"score\":{\"name\":\"@e[tag=MainArenaAEC]\",\"objective\":\"CaveSpiderTotal\"},\"color\":\"black\",\"bold\":false}]}",Text4:"{\"text\":\"---------------\",\"color\":\"black\"}"}


# PILLAGER
execute unless entity @e[scores={PillagerTotal=1..}] unless block -29 46 1958 air run setblock -29 46 1958 air
execute if entity @e[scores={PillagerTotal=1..}] unless block -29 46 1958 oak_wall_sign run setblock -29 46 1958 oak_wall_sign[facing=east]
execute if block -29 46 1958 oak_wall_sign run data merge block -29 46 1958 {Text1:"{\"text\":\"Total Slain\",\"color\":\"black\",\"bold\":true}",Text2:"{\"text\":\"---------------\",\"color\":\"black\"}",Text3:"{\"text\":\"\",\"color\":\"black\",\"extra\":[{\"score\":{\"name\":\"@e[tag=MainArenaAEC]\",\"objective\":\"PillagerTotal\"},\"color\":\"black\",\"bold\":false}]}",Text4:"{\"text\":\"---------------\",\"color\":\"black\"}"}


# VINDICATOR
execute unless entity @e[scores={VindicatorTotal=1..}] unless block -29 46 1954 air run setblock -29 46 1954 air
execute if entity @e[scores={VindicatorTotal=1..}] unless block -29 46 1954 oak_wall_sign run setblock -29 46 1954 oak_wall_sign[facing=east]
execute if block -29 46 1954 oak_wall_sign run data merge block -29 46 1954 {Text1:"{\"text\":\"Total Slain\",\"color\":\"black\",\"bold\":true}",Text2:"{\"text\":\"---------------\",\"color\":\"black\"}",Text3:"{\"text\":\"\",\"color\":\"black\",\"extra\":[{\"score\":{\"name\":\"@e[tag=MainArenaAEC]\",\"objective\":\"VindicatorTotal\"},\"color\":\"black\",\"bold\":false}]}",Text4:"{\"text\":\"---------------\",\"color\":\"black\"}"}


# EVOKER
execute unless entity @e[scores={EvokerTotal=1..}] unless block -29 46 1950 air run setblock -29 46 1950 air
execute if entity @e[scores={EvokerTotal=1..}] unless block -29 46 1950 oak_wall_sign run setblock -29 46 1950 oak_wall_sign[facing=east]
execute if block -29 46 1950 oak_wall_sign run data merge block -29 46 1950 {Text1:"{\"text\":\"Total Slain\",\"color\":\"black\",\"bold\":true}",Text2:"{\"text\":\"---------------\",\"color\":\"black\"}",Text3:"{\"text\":\"\",\"color\":\"black\",\"extra\":[{\"score\":{\"name\":\"@e[tag=MainArenaAEC]\",\"objective\":\"EvokerTotal\"},\"color\":\"black\",\"bold\":false}]}",Text4:"{\"text\":\"---------------\",\"color\":\"black\"}"}


# WITHER SKELETON
execute unless entity @e[scores={WSkeletonTotal=1..}] unless block -29 46 1946 air run setblock -29 46 1946 air
execute if entity @e[scores={WSkeletonTotal=1..}] unless block -29 46 1946 oak_wall_sign run setblock -29 46 1946 oak_wall_sign[facing=east]
execute if block -29 46 1946 oak_wall_sign run data merge block -29 46 1946 {Text1:"{\"text\":\"Total Slain\",\"color\":\"black\",\"bold\":true}",Text2:"{\"text\":\"---------------\",\"color\":\"black\"}",Text3:"{\"text\":\"\",\"color\":\"black\",\"extra\":[{\"score\":{\"name\":\"@e[tag=MainArenaAEC]\",\"objective\":\"WSkeletonTotal\"},\"color\":\"black\",\"bold\":false}]}",Text4:"{\"text\":\"---------------\",\"color\":\"black\"}"}

