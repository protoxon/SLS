####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 27 2018 / SEPTEMEBER 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################


#scoreboard objectives setdisplay sidebar MasterKillCount
#scoreboard objectives setdisplay sidebar PlayerKillCount
#scoreboard objectives setdisplay sidebar PlayerKill
#scoreboard objectives setdisplay sidebar ArenaCash

# TEMPORARILY USED TO ADD TO TEAM KILL COUNT
#scoreboard objectives setdisplay sidebar SlimeKill
#scoreboard objectives setdisplay sidebar ZombieKill
#scoreboard objectives setdisplay sidebar SkeletonKill
#scoreboard objectives setdisplay sidebar CaveSpiderKill
#scoreboard objectives setdisplay sidebar MagmaCubeKill
#scoreboard objectives setdisplay sidebar WitchKill
#scoreboard objectives setdisplay sidebar CreeperKill
#scoreboard objectives setdisplay sidebar BabyZombieKill
#scoreboard objectives setdisplay sidebar StrayKill
#scoreboard objectives setdisplay sidebar VindicatorKill
#scoreboard objectives setdisplay sidebar EvokerKill
#scoreboard objectives setdisplay sidebar WSkeletonKill
#scoreboard objectives setdisplay sidebar PillagerKill

# KILL COUNT OF ALL PLAYERS
#scoreboard objectives setdisplay sidebar SlimeTotal
#scoreboard objectives setdisplay sidebar ZombieTotal
#scoreboard objectives setdisplay sidebar SkeletonTotal
#scoreboard objectives setdisplay sidebar CaveSpiderTotal
#scoreboard objectives setdisplay sidebar MagmaCubeTotal
#scoreboard objectives setdisplay sidebar WitchTotal
#scoreboard objectives setdisplay sidebar CreeperTotal
#scoreboard objectives setdisplay sidebar BabyZombieTotal
#scoreboard objectives setdisplay sidebar StrayTotal
#scoreboard objectives setdisplay sidebar VindicatorTotal
#scoreboard objectives setdisplay sidebar EvokerTotal
#scoreboard objectives setdisplay sidebar WSkeletonTotal
#scoreboard objectives setdisplay sidebar PillagerTotal

# TRACKED BY EACH PLAYER
#scoreboard objectives setdisplay sidebar SlimeKills
#scoreboard objectives setdisplay sidebar ZombieKills
#scoreboard objectives setdisplay sidebar SkeletonKills
#scoreboard objectives setdisplay sidebar CaveSpiderKills
#scoreboard objectives setdisplay sidebar MagmaCubeKills
#scoreboard objectives setdisplay sidebar WitchKills
#scoreboard objectives setdisplay sidebar CreeperKills
#scoreboard objectives setdisplay sidebar BabyZombieKills
#scoreboard objectives setdisplay sidebar StrayKills
#scoreboard objectives setdisplay sidebar VindicatorKills
#scoreboard objectives setdisplay sidebar EvokerKills
#scoreboard objectives setdisplay sidebar WSkeletonKills
#scoreboard objectives setdisplay sidebar PillagerKills


# SINGLE KILLS -> IMMEDIATELY RESETS
scoreboard objectives add SlimeKill minecraft.killed:minecraft.slime
scoreboard objectives add ZombieKill minecraft.killed:minecraft.zombie
scoreboard objectives add SkeletonKill minecraft.killed:minecraft.skeleton
scoreboard objectives add CaveSpiderKill minecraft.killed:minecraft.cave_spider
scoreboard objectives add MagmaCubeKill minecraft.killed:minecraft.magma_cube
scoreboard objectives add WitchKill minecraft.killed:minecraft.witch
scoreboard objectives add CreeperKill minecraft.killed:minecraft.creeper
scoreboard objectives add BabyZombieKill minecraft.killed:minecraft.zombie_villager
scoreboard objectives add ZombieHorseKill minecraft.killed:minecraft.zombie_horse
scoreboard objectives add StrayKill minecraft.killed:minecraft.stray
scoreboard objectives add SpiderKill minecraft.killed:minecraft.spider
scoreboard objectives add VindicatorKill minecraft.killed:minecraft.vindicator
scoreboard objectives add EvokerKill minecraft.killed:minecraft.evoker
scoreboard objectives add WSkeletonKill minecraft.killed:minecraft.wither_skeleton
scoreboard objectives add PillagerKill minecraft.killed:minecraft.pillager


# TOTAL KILLS -> OF ALL PLAYERS ADDED
scoreboard objectives add SlimeTotal dummy
scoreboard objectives add ZombieTotal dummy
scoreboard objectives add SkeletonTotal dummy
scoreboard objectives add CreeperTotal dummy
#scoreboard objectives add CaveSpiderTotal dummy
scoreboard objectives add MagmaCubeTotal dummy
scoreboard objectives add WitchTotal dummy
scoreboard objectives add StrayTotal dummy
scoreboard objectives add BabyZombieTotal dummy
scoreboard objectives add PillagerTotal dummy
scoreboard objectives add VindicatorTotal dummy
scoreboard objectives add EvokerTotal dummy
scoreboard objectives add WSkeletonTotal dummy


execute as @a[scores={SlimeKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] SlimeTotal 1
scoreboard players reset @a[scores={SlimeKill=1..}] SlimeKill
execute as @a[scores={ZombieKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] ZombieTotal 1
scoreboard players reset @a[scores={ZombieKill=1..}] ZombieKill
execute as @a[scores={SkeletonKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] SkeletonTotal 1
scoreboard players reset @a[scores={SkeletonKill=1..}] SkeletonKill
#execute as @a[scores={CaveSpiderKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] CaveSpiderTotal 1
#scoreboard players reset @a[scores={CaveSpiderKill=1..}] CaveSpiderKill
execute as @a[scores={MagmaCubeKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] MagmaCubeTotal 1
scoreboard players reset @a[scores={MagmaCubeKill=1..}] MagmaCubeKill
execute as @a[scores={WitchKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] WitchTotal 1
scoreboard players reset @a[scores={WitchKill=1..}] WitchKill
execute as @a[scores={CreeperKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] CreeperTotal 1
scoreboard players reset @a[scores={CreeperKill=1..}] CreeperKill


execute as @a[scores={BabyZombieKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] BabyZombieTotal 1
scoreboard players reset @a[scores={BabyZombieKill=1..}] BabyZombieKill
# AUTO-KILL FOR PASSENGER/VEHICLES IN ARENA FUNCTION

execute as @a[scores={ZombieHorseKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] BabyZombieTotal 1
scoreboard players reset @a[scores={ZombieHorseKill=1..}] ZombieHorseKill
# AUTO-KILL FOR PASSENGER/VEHICLES IN ARENA FUNCTION

execute as @a[scores={StrayKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] StrayTotal 1
scoreboard players reset @a[scores={StrayKill=1..}] StrayKill
# AUTO-KILL FOR PASSENGER/VEHICLES IN ARENA FUNCTION

execute as @a[scores={CaveSpiderKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] StrayTotal 1
scoreboard players reset @a[scores={CaveSpiderKill=1..}] CaveSpiderKill

#execute as @a[scores={SpiderKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] StrayTotal 1
#scoreboard players reset @a[scores={SpiderKill=1..}] SpiderKill
# AUTO-KILL FOR PASSENGER/VEHICLES IN ARENA FUNCTION



execute as @a[scores={PillagerKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] PillagerTotal 1
scoreboard players reset @a[scores={PillagerKill=1..}] PillagerKill
execute as @a[scores={VindicatorKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] VindicatorTotal 1
scoreboard players reset @a[scores={VindicatorKill=1..}] VindicatorKill
execute as @a[scores={EvokerKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] EvokerTotal 1
scoreboard players reset @a[scores={EvokerKill=1..}] EvokerKill
execute as @a[scores={WSkeletonKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] WSkeletonTotal 1
scoreboard players reset @a[scores={WSkeletonKill=1..}] WSkeletonKill




# ROUND 1 -> PLAYER KILLS
scoreboard objectives add SlimeKills minecraft.killed:minecraft.slime
scoreboard objectives add ZombieKills minecraft.killed:minecraft.zombie
scoreboard objectives add SkeletonKills minecraft.killed:minecraft.skeleton
scoreboard objectives add CreeperKills minecraft.killed:minecraft.creeper


# ROUND 2 -> PLAYER KILLS
scoreboard objectives add MagmaCubeKills minecraft.killed:minecraft.magma_cube
scoreboard objectives add WitchKills minecraft.killed:minecraft.witch
scoreboard objectives add BabyZombieKills minecraft.killed:minecraft.zombie_villager

scoreboard objectives add CaveSpiderKills minecraft.killed:minecraft.cave_spider
scoreboard objectives add StrayKills minecraft.killed:minecraft.stray
#scoreboard objectives add SpiderKills minecraft.killed:minecraft.spider
#execute if entity @a[scores={SpiderKills=1}] run scoreboard players add @e[tag=MainArenaAEC] StrayKills 1
execute if entity @a[scores={CaveSpiderKills=1}] run scoreboard players add @e[tag=MainArenaAEC] StrayKills 1
scoreboard players reset @a[scores={CaveSpiderKills=1..}] CaveSpiderKills
#scoreboard players reset @a[scores={SpiderKills=1..}] SpiderKills

scoreboard objectives add ZombieHorseKills minecraft.killed:minecraft.zombie_horse
execute if entity @a[scores={ZombieHorseKills=1}] run scoreboard players add @e[tag=MainArenaAEC] BabyZombieKills 1
scoreboard players reset @a[scores={ZombieHorseKills=1..}] ZombieHorseKills


# ROUND 3 -> PLAYER KILLS
scoreboard objectives add PillagerKills minecraft.killed:minecraft.pillager
scoreboard objectives add VindicatorKills minecraft.killed:minecraft.vindicator
scoreboard objectives add EvokerKills minecraft.killed:minecraft.evoker
scoreboard objectives add WSkeletonKills minecraft.killed:minecraft.wither_skeleton



# PASSIVIER
#parrot - slime
#sheep - zombie
#chicken - skeleton
#pig - creeper

#cow - magma cube
#llama - witch
#fox - strays
#donkey - jockey

#panda - pillager
#wolf - vindicator
#polar bear - evoker
#bat - vex
#rabbit - wither skeleton

execute if entity @e[scores={Passivier=0..}] run scoreboard objectives add ParrotKill minecraft.killed:minecraft.parrot
execute if entity @e[scores={Passivier=0..}] run scoreboard objectives add SheepKill minecraft.killed:minecraft.sheep
execute if entity @e[scores={Passivier=0..}] run scoreboard objectives add ChickenKill minecraft.killed:minecraft.chicken
execute if entity @e[scores={Passivier=0..}] run scoreboard objectives add PigKill minecraft.killed:minecraft.pig

execute if entity @e[scores={Passivier=0..}] run scoreboard objectives add CowKill minecraft.killed:minecraft.cow
execute if entity @e[scores={Passivier=0..}] run scoreboard objectives add LlamaKill minecraft.killed:minecraft.llama
execute if entity @e[scores={Passivier=0..}] run scoreboard objectives add FoxKill minecraft.killed:minecraft.fox
execute if entity @e[scores={Passivier=0..}] run scoreboard objectives add DonkeyKill minecraft.killed:minecraft.donkey

execute if entity @e[scores={Passivier=0..}] run scoreboard objectives add PandaKill minecraft.killed:minecraft.panda
execute if entity @e[scores={Passivier=0..}] run scoreboard objectives add WolfKill minecraft.killed:minecraft.wolf
execute if entity @e[scores={Passivier=0..}] run scoreboard objectives add PolarBearKill minecraft.killed:minecraft.polar_bear
execute if entity @e[scores={Passivier=0..}] run scoreboard objectives add RabbitKill minecraft.killed:minecraft.rabbit


execute unless entity @e[scores={Passivier=0..}] run scoreboard objectives remove SheepKill
execute unless entity @e[scores={Passivier=0..}] run scoreboard objectives remove CowKill
execute unless entity @e[scores={Passivier=0..}] run scoreboard objectives remove PigKill
execute unless entity @e[scores={Passivier=0..}] run scoreboard objectives remove DonkeyKill

execute if entity @e[scores={Passivier=0..,ArenaRound=1}] if entity @a[scores={ParrotKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] SlimeTotal 1
execute if entity @e[scores={Passivier=0..,ArenaRound=1}] if entity @a[scores={SheepKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] ZombieTotal 1
execute if entity @e[scores={Passivier=0..,ArenaRound=1}] if entity @a[scores={ChickenKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] SkeletonTotal 1
execute if entity @e[scores={Passivier=0..,ArenaRound=1}] if entity @a[scores={PigKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] CreeperTotal 1

execute if entity @e[scores={Passivier=0..,ArenaRound=2}] if entity @a[scores={CowKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] MagmaCubeTotal 1
execute if entity @e[scores={Passivier=0..,ArenaRound=2}] if entity @a[scores={LlamaKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] WitchTotal 1
execute if entity @e[scores={Passivier=0..,ArenaRound=2}] if entity @a[scores={FoxKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] StrayTotal 1
execute if entity @e[scores={Passivier=0..,ArenaRound=2}] if entity @a[scores={DonkeyKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] BabyZombieTotal 1

execute if entity @e[scores={Passivier=0..,ArenaRound=3}] if entity @a[scores={PandaKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] PillagerTotal 1
execute if entity @e[scores={Passivier=0..,ArenaRound=3}] if entity @a[scores={WolfKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] VindicatorTotal 1
execute if entity @e[scores={Passivier=0..,ArenaRound=3}] if entity @a[scores={PolarBearKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] EvokerTotal 1
execute if entity @e[scores={Passivier=0..,ArenaRound=3}] if entity @a[scores={RabbitKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] WSkeletonTotal 1

scoreboard players reset @a[scores={ParrotKill=1..}] ParrotKill
scoreboard players reset @a[scores={SheepKill=1..}] SheepKill
scoreboard players reset @a[scores={ChickenKill=1..}] ChickenKill
scoreboard players reset @a[scores={PigKill=1..}] PigKill

scoreboard players reset @a[scores={CowKill=1..}] CowKill
scoreboard players reset @a[scores={LlamaKill=1..}] LlamaKill
scoreboard players reset @a[scores={FoxKill=1..}] FoxKill
scoreboard players reset @a[scores={DonkeyKill=1..}] DonkeyKill

scoreboard players reset @a[scores={PandaKill=1..}] PandaKill
scoreboard players reset @a[scores={WolfKill=1..}] WolfKill
scoreboard players reset @a[scores={PolarBearKill=1..}] PolarBearKill
scoreboard players reset @a[scores={RabbitKill=1..}] RabbitKill
