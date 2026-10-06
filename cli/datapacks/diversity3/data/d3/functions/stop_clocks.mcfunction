####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# APRIL 27 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

gamerule announceAdvancements false
gamerule doWeatherCycle false
gamerule doDaylightCycle false
gamerule doFireTick false
gamerule doTileDrops false
gamerule doEntityDrops false
gamerule doMobLoot false
gamerule doMobSpawning false
gamerule keepInventory true
gamerule mobGriefing false
gamerule naturalRegeneration true
gamerule randomTickSpeed 0
gamemode adventure @a[tag=!D3Admin]
experience set @a 0 levels
experience set @a 0
effect clear @a
effect give @a saturation 1 255 true
effect give @a regeneration 1 255 true
effect give @a resistance 1 255 true
effect give @a blindness 2 255 true
weather clear
time set 5000
difficulty easy


tag @a remove IntroChests
tag @a remove OutroChests
tag @a remove ResetPistons
tag @a remove ResetPowder
tag @a remove ResetBookshelfHint

# MAIN PLAYER CHECK CLOCK -> ALWAYS ON
setblock 14 2 14 clay
setblock 14 2 14 redstone_block


# REMOVE SURVIVAL OBJECTIVES #

fill 2 2 -18 14 6 -18 clay replace redstone_block
setblock 14 2 -24 clay
setblock 7 2 -27 clay


scoreboard objectives remove MushNPCExists
scoreboard objectives remove MesaNPCExists
scoreboard objectives remove SnowNPCExists
scoreboard objectives remove JungleNPCExists
scoreboard objectives remove DesertNPCExists
scoreboard objectives remove QExists

scoreboard objectives remove MushTimer
scoreboard objectives remove MesaTimer
scoreboard objectives remove SnowTimer
scoreboard objectives remove JungleTimer
scoreboard objectives remove DesertTimer
scoreboard objectives remove QTimer

scoreboard objectives remove MetMushNPC
scoreboard objectives remove MetMesaNPC
scoreboard objectives remove MetSnowNPC
scoreboard objectives remove MetJungleNPC
scoreboard objectives remove MetDesertNPC
scoreboard objectives remove MetQ

scoreboard objectives remove CactusPresent
scoreboard objectives remove DesertDrown

scoreboard objectives remove MaxPigmen
scoreboard objectives remove MaxCreepers
scoreboard objectives remove MaxZombies
scoreboard objectives remove MaxSkeletons
scoreboard objectives remove MaxSpiders
scoreboard objectives remove MaxStrays
scoreboard objectives remove MaxHusks

scoreboard objectives remove VisitNether
scoreboard objectives remove RiseHerobrine
scoreboard objectives remove NetherBell

scoreboard objectives remove NetherTimer
scoreboard objectives remove NetherJunk
#scoreboard objectives remove Survivor

scoreboard objectives remove HelpedQ
scoreboard objectives remove HelpedMush
scoreboard objectives remove HelpedMesa
scoreboard objectives remove HelpedSnow
scoreboard objectives remove HelpedJungle
scoreboard objectives remove HelpedDesert

scoreboard objectives remove QBook
scoreboard objectives remove MushBook
scoreboard objectives remove MesaBook
scoreboard objectives remove SnowBook
scoreboard objectives remove JungleBook
scoreboard objectives remove DesertBook

scoreboard objectives remove PortalTimer
scoreboard objectives remove PortalAECExists
scoreboard objectives remove SurvivalDeaths
scoreboard objectives remove SpawnerBroke

tag @a remove MushChat
tag @a remove MesaChat
tag @a remove SnowChat
tag @a remove JungleChat
tag @a remove DesertChat
tag @a remove NetherChat
tag @a remove InNether

kill @e[tag=MainSurvivalAEC]


# REMOVE PUZZLE OBJECTIVES #

setblock 46 2 8 clay
scoreboard objectives remove PuzzleSetup

setblock 33 2 14 clay
scoreboard objectives remove PuzzleComplete
scoreboard objectives remove YellowFrame
scoreboard objectives remove OrangeFrame
scoreboard objectives remove PurpleFrame
scoreboard objectives remove BrownFrame
scoreboard objectives remove WhiteFrame
scoreboard objectives remove GreenFrame
scoreboard objectives remove BlackFrame
scoreboard objectives remove LimeFrame
scoreboard objectives remove LightBlueFrame
scoreboard objectives remove LoveButton
scoreboard objectives remove LoveQ
scoreboard objectives remove RenewCart

setblock 46 2 14 clay
scoreboard objectives remove SimonLevel
scoreboard objectives remove SimonCounter
scoreboard objectives remove SimonButton
scoreboard objectives remove SimonFail
scoreboard objectives remove SimonWin

setblock 44 2 14 clay
scoreboard objectives remove SetupFloor
scoreboard objectives remove MatchFloorWin
scoreboard objectives remove HasStar
scoreboard objectives remove FloorBlock
scoreboard objectives remove KillFloor1
scoreboard objectives remove KillFloor2
scoreboard objectives remove KillFloor3
scoreboard objectives remove KillFloor4
scoreboard objectives remove MatchHint
tag @a remove EndRod

setblock 37 2 14 clay
scoreboard objectives remove MemoryButton
scoreboard objectives remove MemorySetup
scoreboard objectives remove AECButton
scoreboard objectives remove MemoryMatch
scoreboard objectives remove GoodMemory
scoreboard objectives remove BadMemory
scoreboard objectives remove BlueStand
scoreboard objectives remove OrangeStand
scoreboard objectives remove BluePortal
scoreboard objectives remove OrangePortal
team remove Memory

setblock 43 2 14 clay
scoreboard objectives remove PistonRange
scoreboard objectives remove PistonWin
scoreboard objectives remove PistonHint

setblock 36 2 14 clay
scoreboard objectives remove FillSoundRoom
scoreboard objectives remove SoundHint
scoreboard objectives remove SoundHintTimer
scoreboard objectives remove SoundCheck
scoreboard objectives remove SoundWin

setblock 35 2 14 clay
scoreboard objectives remove PathfinderRound
scoreboard objectives remove PathfinderButton
scoreboard objectives remove VillagerExists
scoreboard objectives remove PathLoser
scoreboard objectives remove PathfinderWin
team remove PathVillagers
team remove PathZombies
tag @a remove Pathfinder

setblock 39 2 14 clay
scoreboard objectives remove ShulkerExists
scoreboard objectives remove BulletExists
scoreboard objectives remove BulletDirection
scoreboard objectives remove BulletInRange
scoreboard objectives remove BulletMotion
scoreboard objectives remove BulletWarmup
scoreboard objectives remove BannerLamp
scoreboard objectives remove BannerWin

setblock 39 5 14 clay
team remove FreeTheSquid

setblock 42 2 14 clay
scoreboard objectives remove HopperButton
scoreboard objectives remove HopperSetup
scoreboard objectives remove HopperCorrect
scoreboard objectives remove HopperRound
scoreboard objectives remove HopperWin

team remove SeeCreeper
team remove SeeVillager
team remove SeeZombie
team remove SeeSkeleton
team remove SeeWither

setblock 40 2 14 clay
scoreboard objectives remove HangmanSetup
scoreboard objectives remove HangmanRound
scoreboard objectives remove HangmanHint
scoreboard objectives remove SelectedLetter
scoreboard objectives remove LetterTimer
scoreboard objectives remove CorrectLetter
scoreboard objectives remove DeathSFX
scoreboard objectives remove HangmanWin

kill @e[tag=MainPuzzleAEC]
kill @e[tag=LoveQStand]

# REMOVE DROPPER OBJECTIVES #

setblock -18 2 14 clay

scoreboard objectives remove TravelTime
scoreboard objectives remove YellowTravel
scoreboard objectives remove OrangeTravel
scoreboard objectives remove PurpleTravel
scoreboard objectives remove BrownTravel
scoreboard objectives remove WhiteTravel
scoreboard objectives remove GreenTravel
scoreboard objectives remove BlackTravel
scoreboard objectives remove LimeTravel
scoreboard objectives remove LightBlueTravel
scoreboard objectives remove DropSpeech
scoreboard objectives remove DropperCart
scoreboard objectives remove DropDeaths
scoreboard objectives remove DeathLevel
scoreboard objectives remove DropperTicket
scoreboard objectives remove Barrel1
scoreboard objectives remove Barrel2
scoreboard objectives remove Barrel3
scoreboard objectives remove Barrel4
team remove Dropper
tag @a remove PunchingBagRange

kill @e[tag=MainDropperAEC]

# REMOVE PARKOUR OBJECTIVES #

setblock 46 1 -18 clay

scoreboard objectives remove YellowParkour
scoreboard objectives remove OrangeParkour
scoreboard objectives remove PurpleParkour
scoreboard objectives remove BrownParkour
scoreboard objectives remove WhiteParkour
scoreboard objectives remove GreenParkour
scoreboard objectives remove BlackParkour
scoreboard objectives remove LimeParkour
scoreboard objectives remove LightBlueParkour
scoreboard objectives remove ParkourTimer
scoreboard objectives remove TrainChat
scoreboard objectives remove HelicopterChat
scoreboard objectives remove LibertySlime
scoreboard objectives remove LibertyChat
scoreboard objectives remove InRangeTimer
scoreboard objectives remove LetterInRange
scoreboard objectives remove LetterParkWin
scoreboard objectives remove ParkDeaths
scoreboard objectives remove ParkourComplete

kill @e[tag=MainParkourAEC]

# REMOVE ESCAPE OBJECTIVES #

fill -30 2 46 -18 2 46 clay replace redstone_block

scoreboard objectives remove EscapeLevel
scoreboard objectives remove EscapeTimer
scoreboard objectives remove EscapeCart1
scoreboard objectives remove EscapeCart2

scoreboard objectives remove Trial_1
scoreboard objectives remove CreeperLaunch

scoreboard objectives remove Trial_2
scoreboard objectives remove PlateTimer

scoreboard objectives remove Trial_3
scoreboard objectives remove Creeper0
scoreboard objectives remove Creeper1
scoreboard objectives remove Creeper2
scoreboard objectives remove Creeper3
scoreboard objectives remove SheepBypass

scoreboard objectives remove Trial_4

scoreboard objectives remove Trial_5
scoreboard objectives remove BombTimer
scoreboard objectives remove BombSeconds

scoreboard objectives remove Trial_6
scoreboard objectives remove ArrowTimer
scoreboard objectives remove AnvilTimer
scoreboard objectives remove RainbowTimer
scoreboard objectives remove FangTimer
scoreboard objectives remove LavaTimer

scoreboard objectives remove FinalBox
scoreboard objectives remove MusicTimer
scoreboard objectives remove NoEscapeShield
tag @a remove OutsideBox

kill @e[tag=MainEscapeAEC]

# REMOVE TRIVIA OBJECTIVES #

fill 33 7 46 46 34 46 clay replace redstone_block
setblock 46 2 46 clay

scoreboard objectives remove TriviaMobAge
scoreboard objectives remove TriviaTally
scoreboard objectives remove CorrectScore
scoreboard objectives remove IncorrectScore
scoreboard objectives remove Question_0
scoreboard objectives remove Q0_Correct
scoreboard objectives remove Disco
scoreboard objectives remove DiscoTimer
scoreboard objectives remove TriviaShulker
scoreboard objectives remove TriviaShulker
scoreboard objectives remove ThrillRider
scoreboard objectives remove FinalGreen
scoreboard objectives remove FinalRed
scoreboard objectives remove FinalPurple
scoreboard objectives remove FinalLime
team remove CorrectTrivia
team remove IncorrectTrivia

kill @e[tag=MainTriviaAEC]


# REMOVE GOLF OBJECTIVES #

setblock 14 2 46 clay

scoreboard objectives remove curScore
scoreboard objectives remove droppedPearl
scoreboard objectives remove UUID
scoreboard objectives remove Score1
scoreboard objectives remove Score2
scoreboard objectives remove Score3
scoreboard objectives remove Score4
scoreboard objectives remove Score5
scoreboard objectives remove Score6
scoreboard objectives remove Score7
scoreboard objectives remove Score8
scoreboard objectives remove Score9
scoreboard objectives remove Score10
scoreboard objectives remove Score11
scoreboard objectives remove Score12
scoreboard objectives remove Score13
scoreboard objectives remove Score14
scoreboard objectives remove Score15
scoreboard objectives remove Score16
scoreboard objectives remove Score17
scoreboard objectives remove Score18
scoreboard objectives remove ScoreTotal
scoreboard objectives remove currentHole

scoreboard objectives remove ballReturnTimer
scoreboard objectives remove golfClap
scoreboard objectives remove golfFailsafe
scoreboard objectives remove golfGear
scoreboard objectives remove sandTrapTimer
scoreboard objectives remove ScoreTotal2

tag @a remove UUIDed
tag @a remove golfing
tag @a remove startTut
tag @a remove startTut2
tag @a remove FirstPlace
tag @a remove SecondPlace
tag @a remove ThirdPlace
tag @a remove inGolfBranch
tag @a remove needsBall
tag @a remove giveBall

# REMOVE ADVENTURE OBJECTIVES #

setblock 46 2 78 clay

scoreboard objectives remove BeginAdventure
scoreboard objectives remove AdventureLevel
scoreboard objectives remove AdventureTimer
scoreboard objectives remove AdventureDeath
scoreboard objectives remove AdvUpperPower
scoreboard objectives remove AdvLowerPower
scoreboard objectives remove LowerO2Door
scoreboard objectives remove ShulkerVator
scoreboard objectives remove ElevatorDoor
scoreboard objectives remove ElevatorSFX
scoreboard objectives remove LabBedroomOpen
scoreboard objectives remove LabBedroomClose
scoreboard objectives remove HoldUpBook
scoreboard objectives remove SuitUpTimer
scoreboard objectives remove Airlock1FailSafe
scoreboard objectives remove Airlock2FailSafe
scoreboard objectives remove Airlock3FailSafe
scoreboard objectives remove Airlock4FailSafe
scoreboard objectives remove Airlock5FailSafe
scoreboard objectives remove ReceptionTimer
scoreboard objectives remove ZomboTimer
scoreboard objectives remove IntoCavern
scoreboard objectives remove Act3Sleeping
scoreboard objectives remove SelfDestruct
scoreboard objectives remove OckelsThanks

scoreboard objectives remove UpperDoor1
scoreboard objectives remove UpperDoor2
scoreboard objectives remove UpperDoor3
scoreboard objectives remove UpperDoor4
scoreboard objectives remove UpperDoor5

scoreboard objectives remove LowerDoor1
scoreboard objectives remove LowerDoor2
scoreboard objectives remove LowerDoor3
scoreboard objectives remove LowerDoor4
scoreboard objectives remove LowerDoor5
scoreboard objectives remove LowerDoor6

scoreboard objectives remove AL1SouthtoNorth
scoreboard objectives remove AL1NorthtoSouth
scoreboard objectives remove AL1Depressurize
scoreboard objectives remove AL1NDoorOpens
scoreboard objectives remove AL1NDoorCloses
scoreboard objectives remove AL1SDoorOpens
scoreboard objectives remove AL1SDoorCloses

scoreboard objectives remove AL2EasttoWest
scoreboard objectives remove AL2WesttoEast
scoreboard objectives remove AL2Depressurize
scoreboard objectives remove AL2WDoorOpens
scoreboard objectives remove AL2WDoorCloses
scoreboard objectives remove AL2EDoorOpens
scoreboard objectives remove AL2EDoorCloses

scoreboard objectives remove AL3SouthtoNorth
scoreboard objectives remove AL3NorthtoSouth
scoreboard objectives remove AL3Depressurize
scoreboard objectives remove AL3NDoorOpens
scoreboard objectives remove AL3NDoorCloses
scoreboard objectives remove AL3SDoorOpens
scoreboard objectives remove AL3SDoorCloses

scoreboard objectives remove AL4EasttoWest
scoreboard objectives remove AL4WesttoEast
scoreboard objectives remove AL4Depressurize
scoreboard objectives remove AL4WDoorOpens
scoreboard objectives remove AL4WDoorCloses
scoreboard objectives remove AL4EDoorOpens
scoreboard objectives remove AL4EDoorCloses

scoreboard objectives remove AL5SouthtoNorth
scoreboard objectives remove AL5NorthtoSouth
scoreboard objectives remove AL5Depressurize
scoreboard objectives remove AL5NDoorOpens
scoreboard objectives remove AL5NDoorCloses
scoreboard objectives remove AL5SDoorOpens
scoreboard objectives remove AL5SDoorCloses

scoreboard objectives remove ShulkerLiftA
scoreboard objectives remove ShulkerLiftB
scoreboard objectives remove LiftASFX
scoreboard objectives remove LiftBSFX

scoreboard objectives remove PullPlayer
scoreboard objectives remove GravityASAge
scoreboard objectives remove ObjectReturns
scoreboard objectives remove SuitReturns
scoreboard objectives remove LowGravityItem
scoreboard objectives remove SuitOff
scoreboard objectives remove AdventureDeaths
scoreboard objectives remove EndWoolMotion

team remove Adventure
team remove Zombo

tag @a remove AdventureBeginner
tag @a remove DoorLevel1
tag @a remove DoorLevel2
tag @a remove DoorLevel3
tag @a remove DoorLevel4
tag @a remove HasAdvManual
tag @a remove HasSuit
tag @a remove AnitGravity
tag @a remove Airlock1
tag @a remove Airlock2
tag @a remove Airlock3
tag @a remove Airlock4
tag @a remove Airlock5
tag @a remove Airlock1North
tag @a remove Airlock1South
tag @a remove Airlock2East
tag @a remove Airlock2West
tag @a remove Airlock3North
tag @a remove Airlock3South
tag @a remove Airlock4East
tag @a remove Airlock4WEst
tag @a remove Airlock5North
tag @a remove Airlock5South
tag @a remove AL1Favour
tag @a remove AL2Favour
tag @a remove AL3Favour
tag @a remove AL4Favour
tag @a remove AL5Favour
tag @a remove AntiGravity

kill @e[tag=MainAdventureAEC]

# REMOVE BOSS OBJECTIVES #

setblock -18 2 -18 clay

scoreboard objectives remove BossLevel
scoreboard objectives remove BossTimer
scoreboard objectives remove PlayerHealth
scoreboard objectives remove DropPigGrass
scoreboard objectives remove BossPig
scoreboard objectives remove SFASHeight
scoreboard objectives remove DropCowGrass
scoreboard objectives remove BossCow
scoreboard objectives remove BossCowAttack
scoreboard objectives remove RepairCowFight
scoreboard objectives remove CalfExplode
scoreboard objectives remove ManureBomb
scoreboard objectives remove OreAttack
scoreboard objectives remove BlockHeight
scoreboard objectives remove ChickenHeight
scoreboard objectives remove MooshroomDeaths
scoreboard objectives remove BossDeaths
scoreboard objectives remove BossPigFailSafe
scoreboard objectives remove BossCowFailSafe
scoreboard objectives remove MobSuicide
scoreboard objectives remove SwapShears
scoreboard objectives remove ConvertShears

bossbar remove bosspigman
bossbar remove bossmooshroom

team remove PigmanCollision
team remove NoPush

tag @a remove LeaveBoss
tag @a remove GetHealth
tag @a remove FallenOff
tag @a remove StompRange
tag @a remove SwoopZone
tag @a remove CalfTarget1
tag @a remove CalfTarget2
tag @a remove PillarZone

kill @e[tag=MainBossAEC]

# REMOVE ARENA OBJECTIVES #

setblock 14 2 78 clay

scoreboard objectives remove MasterKillCount
scoreboard objectives remove PlayerKillCount
scoreboard objectives remove PlayerKill
scoreboard objectives remove ArenaHealth
scoreboard objectives remove ArenaDeaths
scoreboard objectives remove ActionBarDeaths
scoreboard objectives remove ArenaCash
scoreboard objectives remove ArenaDeathCash
scoreboard objectives remove ArenaTwoValue
scoreboard objectives remove ArenaRound
scoreboard objectives remove ArenaTimer
scoreboard objectives remove MoveGate
scoreboard objectives remove DisplayTimer

scoreboard objectives remove SlimeKill
scoreboard objectives remove ZombieKill
scoreboard objectives remove SkeletonKill
scoreboard objectives remove CaveSpiderKill
scoreboard objectives remove MagmaCubeKill
scoreboard objectives remove WitchKill
scoreboard objectives remove CreeperKill
scoreboard objectives remove BabyZombieKill
scoreboard objectives remove ZombieHorseKill
scoreboard objectives remove StrayKill
scoreboard objectives remove SpiderKill
scoreboard objectives remove VindicatorKill
scoreboard objectives remove EvokerKill
scoreboard objectives remove WSkeletonKill

scoreboard objectives remove SlimeTotal
scoreboard objectives remove ZombieTotal
scoreboard objectives remove SkeletonTotal
scoreboard objectives remove CaveSpiderTotal
scoreboard objectives remove MagmaCubeTotal
scoreboard objectives remove WitchTotal
scoreboard objectives remove CreeperTotal
scoreboard objectives remove BabyZombieTotal
scoreboard objectives remove StrayTotal
scoreboard objectives remove VindicatorTotal
scoreboard objectives remove EvokerTotal
scoreboard objectives remove WSkeletonTotal

scoreboard objectives remove SlimeKills
scoreboard objectives remove ZombieKills
scoreboard objectives remove SkeletonKills
scoreboard objectives remove CaveSpiderKills
scoreboard objectives remove MagmaCubeKills
scoreboard objectives remove WitchKills
scoreboard objectives remove CreeperKills
scoreboard objectives remove BabyZombieKills
scoreboard objectives remove ZombieHorseKills
scoreboard objectives remove StrayKills
scoreboard objectives remove SpiderKills
scoreboard objectives remove VindicatorKills
scoreboard objectives remove EvokerKills
scoreboard objectives remove WSkeletonKills

scoreboard objectives remove SheepKill
scoreboard objectives remove CowKill
scoreboard objectives remove PigKill
scoreboard objectives remove ChickenKill

scoreboard objectives remove SpawnSlime
scoreboard objectives remove SpawnZombie
scoreboard objectives remove SpawnSkeleton
scoreboard objectives remove SpawnCaveSpider

scoreboard objectives remove SpawnMagmaCube
scoreboard objectives remove SpawnWitch
scoreboard objectives remove SpawnCreeper
scoreboard objectives remove SpawnBabyZombie

scoreboard objectives remove SpawnStray
scoreboard objectives remove SpawnVindicator
scoreboard objectives remove SpawnEvoker
scoreboard objectives remove SpawnWSkeleton

scoreboard objectives remove Boss1Attack
scoreboard objectives remove Boss1Health
scoreboard objectives remove ArenaBoss1Regen
scoreboard objectives remove Boss2Attack
scoreboard objectives remove Boss2Health
scoreboard objectives remove Boss2Defense
scoreboard objectives remove ArenaBoss2Regen
scoreboard objectives remove Boss3Attack
scoreboard objectives remove ArenaBoss3Regen

scoreboard objectives remove GreedyKill
scoreboard objectives remove DraculaKill
scoreboard objectives remove FrozenMob
scoreboard objectives remove MagnetTimer
scoreboard objectives remove Passivier
scoreboard objectives remove HealthBoost

bossbar remove arenaboss1
bossbar remove arenaboss2
bossbar remove arenaboss3

team remove Arena
team remove ArenaMob
team remove ArenaBoss
team remove ArenaStatues

tag @a remove GetArenaHealth
tag @a remove Dracula
tag @a remove Greedy
tag @a remove HalfCash
tag @a remove ArenaSecret

kill @e[tag=MainArenaAEC]

# REMOVE ELYTRA OBJECTIVES #

setblock -18 2 78 clay

scoreboard objectives remove RingSFX
scoreboard objectives remove ElytraCow
scoreboard objectives remove ElytraEnd

tag @a remove HasElytra

tag @a remove WhiteRing
tag @a remove YellowRing
tag @a remove OrangeRing
tag @a remove PurpleRing
tag @a remove GreenRing
tag @a remove BlueRing
tag @a remove LimeRing
tag @a remove BlackRing
tag @a remove BrownRing

tag @a remove SafeZone

kill @e[tag=MainElytraAEC]

# REMOVE FINALE OBJECTIVES #

setblock 14 2 110 clay

scoreboard objectives remove FinaleDeaths
scoreboard objectives remove FinishD3
#scoreboard objectives remove OutroTimer
scoreboard objectives remove CreditRoll
scoreboard objectives remove CreditPlayers
scoreboard objectives remove FinalStatTimer
scoreboard objectives remove D3TesterScore

tag @a remove CreditRoll
tag @a remove CreditRoll1
tag @a remove CreditRoll2
tag @a remove CreditRoll3

kill @e[tag=MainFinaleAEC]

scoreboard objectives setdisplay sidebar

scoreboard players reset @a Speedrunner