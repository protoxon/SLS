####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# DECEMBER 26 2018 / SEPTEMBER 18 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

#scoreboard objectives setdisplay sidebar ArenaRound
#scoreboard objectives setdisplay sidebar ArenaTimer
#scoreboard objectives setdisplay sidebar RoundSquid

execute if entity @e[scores={ArenaRound=0}] unless entity @a[team=Arena] run team add Arena
team modify Arena color white
execute if entity @a[team=!Arena] run team join Arena @a[team=!Arena]
team modify Arena friendlyFire false

execute if entity @a if entity @e[scores={ArenaRound=0}] unless entity @e[team=ArenaMob] run team add ArenaMob
team modify ArenaMob friendlyFire false
execute if entity @e[type=turtle] run team modify ArenaMob collisionRule never
execute unless entity @e[type=turtle] run team modify ArenaMob collisionRule always

execute if entity @e[scores={ArenaRound=0}] run team add ArenaBoss
team modify ArenaBoss friendlyFire false
team modify ArenaBoss collisionRule never


# BRING STRAGGLERS
execute if block 1 4 2 yellow_wool run gamemode adventure @a[tag=!InArenaBranch,tag=!D3Admin]
execute if block 1 4 2 yellow_wool run spawnpoint @a[tag=!InArenaBranch] -8 51 1944
execute if block 1 4 2 yellow_wool run teleport @a[tag=!InArenaBranch] -8 50.6 1944 0 0
execute if block 1 4 2 yellow_wool run clear @a[tag=!InArenaBranch]
execute if block 1 4 2 yellow_wool run tag @a add InArenaBranch


# SAVE SWORDS FOR COLDFUSION
execute if entity @e[scores={ArenaRound=1}] if entity @a[nbt={SelectedItem:{id:"minecraft:wooden_sword"}}] run replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:wooden_sword",tag:{Damage:59}}}] weapon.mainhand wooden_sword{Damage:56}
execute if entity @e[scores={ArenaRound=1}] if entity @a[nbt={SelectedItem:{id:"minecraft:wooden_sword"}}] run replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:wooden_sword",tag:{Damage:58}}}] weapon.mainhand wooden_sword{Damage:56}
execute if entity @e[scores={ArenaRound=1}] if entity @a[nbt={SelectedItem:{id:"minecraft:wooden_sword"}}] run replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:wooden_sword",tag:{Damage:57}}}] weapon.mainhand wooden_sword{Damage:56}

# FIX BLOCKS
function d3:arena/fix_blocks

# PLAYER GATE MECHANIC
function d3:arena/arena_gate

# MOB GATE MECHANIC
scoreboard players add @e[tag=MainArenaAEC] GatesDown 0
execute if entity @e[scores={GatesDown=0..}] run function d3:arena/gates_down

scoreboard players add @e[tag=MainArenaAEC] GatesUp 0
execute if entity @e[scores={GatesUp=0..}] run function d3:arena/gates_up

# BANK MECHANIC
function d3:arena/currency_conversion

# VILLAGER TRADERS
execute if entity @a run function d3:arena/traders

# SPECIAL ITEMS
function d3:arena/special_items

# OBJECTIVES
function d3:arena/arena_objectives

# MOB STATUES
execute if entity @a run function d3:arena/mob_statues

# KILL EGGS
##execute if entity @e[type=item,nbt={Item:{id:"minecraft:egg"}}] run kill @e[type=item,nbt={Item:{id:"minecraft:egg"}}]

# HEALTH SYSTEM
function d3:arena/health_system

# PICK UP SHOT ARROWS
execute at @a as @e[type=arrow,nbt={inGround:1b},distance=..0.3] run give @p arrow
execute at @a as @e[type=arrow,nbt={inGround:1b},distance=..0.3] run kill @s

# TOWNPEOPLE
execute unless entity @e[tag=RedDead] run function d3:arena/villagers
execute if entity @a[x=-22,y=48,z=1888,distance=..4] if block -22 48 1888 barrier run setblock -22 48 1888 air
execute unless entity @a[x=-22,y=48,z=1888,distance=..4] if block -22 48 1888 air run setblock -22 48 1888 barrier


# LOAD ADAM
execute unless entity @e[tag=ArenaAdam] run summon armor_stand 0 72.6 2024 {Invulnerable:1b,NoGravity:1b,Rotation:[180.0f,0.0f],CustomName:"{\"text\":\"AdamDJM\",\"color\":\"yellow\"}",CustomNameVisible:0b,ShowArms:1b,NoBasePlate:1b,ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:6695696}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:6447714}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:11162434}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"30365a82-8bf5-484e-946d-6cb9458301ae",Properties:{textures:[{Signature:"QGeDo+FLG89uZuawKtr6/7OpW2pQEAgeGVk5HdXX5xufdpYZTDJhlshKS1vLHdNZe2MG6mvZyNZ8g92VxkWhCn7LbpyiDnIphrbl2BhW8LVaY2z3T/zilSto0PQ852/TSyECeUc8XiLa/xWwqVQ9xqSVYCR0PoSD/OFmkpAuvFMiGPUMBqMLZfjGPPk3l1RyYot7U8ObTrRxqBrLKMP0lh3i2BMh6C3UaPezFZnz0QDTs3XqlbRPyGA49mXWvDl3feGtlH14JeP0Cv7Z20veo67sq8E/97pUNIneEFd6+SVw7CyuDgL8z3rzjA50uD+hnLTVrIV0L8KTx5N/yTskDIfonOWd5aaEMDG0TqRaV0l86DepwSXtvAjEoviDuMWBuSL0iPIBWKXdmN19YDWZI5bdcWDfnMMMvambZLpuDplZddhMpm5LV3oXvO4XzQSd2y3vL1v5WDv/qwXg/+qbrBAyBFa1e1XUl8f912wOl/3lsdbimmtDHQXgvdfIA53mkkwp1BQ5Wd/4x6lS6oTkjg1l3OBNS6l9dhWn8mv/voCua3JBSa7VaWuG6ck1lenS0yi2tyhPxYLUdVF52Xa91TkJ9jAoJd1Souw//zbiJIagiVvpHePYyeQCuRyHYh2NjV8+UHAii4jUZ3dkJV2GeQjImfW8zf34c2uNztWxDOg=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTgwNzI5MzUsInByb2ZpbGVJZCI6IjMwMzY1YTgyOGJmNTQ4NGU5NDZkNmNiOTQ1ODMwMWFlIiwicHJvZmlsZU5hbWUiOiJBZGFtREpNIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS9kNTY2YTZlY2FjNDQ0ZmNkZWIyYzJlYjI0ZjZmNmJjZWQ3YjNhOWQwYjFiOTI0N2UwNmUwMzBmNDM3ODcwZmQifX19"}]},Name:"AdamDJM"}},Count:1b}],DisabledSlots:2039583,Pose:{Head:[5f,0f,0f],LeftLeg:[280f,350f,0f],RightLeg:[280f,10f,0f],LeftArm:[340f,0f,270f],RightArm:[340f,0f,90f]},Tags:["ArenaAdam"]}

# DANDELION OF DEATH
replaceitem entity @a[nbt={SelectedItem:{id:"minecraft:dandelion"}},nbt=!{SelectedItem:{id:"minecraft:dandelion",tag:{display:{Name:"{\"text\":\"Dandelion of Death\",\"italic\":\"false\",\"color\":\"yellow\"}"}}}}] weapon.mainhand dandelion{display:{Name:"{\"text\":\"Dandelion of Death\",\"italic\":\"false\",\"color\":\"yellow\"}"}}

#execute if block 2 65 1975 flower_pot if entity @a[nbt={Inventory:[{id:"minecraft:dandelion",tag:{display:{Name:"{\"text\":\"Dandelion of Death\",\"italic\":\"false\",\"color\":\"yellow\"}"}}}]}] run say yes
effect give @a[nbt={Inventory:[{id:"minecraft:dandelion",tag:{display:{Name:"{\"text\":\"Dandelion of Death\",\"italic\":\"false\",\"color\":\"yellow\"}"}}}]}] wither 1 4


# CHAMPION ARMOR STANDS
execute unless entity @e[tag=ChampionStand1] run summon armor_stand 5 48.5 1913 {Invulnerable:1b,NoGravity:1b,NoBasePlate:1b,ShowArms:1b,Rotation:[90f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3355443}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:3355443}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"03b07a62-98e6-4fc4-8187-fb276d5a317c",Properties:{textures:[{Signature:"eZPaYFQFacyzZzkvXDJ4XoQjyH8UGHIonh+xJH/xgYgTbiAbhbWAASoQcAGx6X5Fa8Z2819pnxmTHZhXVcbevWGFk8Ha78rZ3XM8BEWTBnGJkDu85CrycKLGZpPIiKKbGRKpOVFglF16Z6zk/TcgmxfvYn8MpWBmIYdPdABAoa8BpfDdeIIEEmGf/gg/imQEZcCf4eA+LoOD2ZmaH59KazcMWuTVlWW+VTNLFClVYpvX+hHqZb928xw74+15Bx9R+wNETu20XCqbohPfB3Xi3qNWXuzWWv+H2fB61Ghm3Tz+iFzeq9VfSLygud2UcQJ6cGRN8tbbgS/5YxrTZnY4qlPsvQ4SW9eXUENejspD1dkH8tn+K2rExprYT+x9uI0k1deaXOgl8MVSyWAVsjHjpan7lhN6+HRH+3oQAJNNTSRiYnY04+4DGjHcXKWmF+s0Wa/xjCNpNzbtVDj9YrRxp1X96ZKRtV2H8ejFghUSwc+fGk4GQYLfPX56uGBqkE0Nc9iMh280iF7U6m02+UmkXPidQziJ/nVbkiHRivcQQFg1AVThhTiXhg5cXiGJiv0U8FSjC/h0s9iHXuDqpxtPGs8ttBHG40tw75xtnrwXp4ifmSL80/zBs3vz3gWnL9bQ7F6Egv3qfmQyrQ8KOh0t1nMTwWUqk3zf330GNWqRItE=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTc2NjMzMDEsInByb2ZpbGVJZCI6IjAzYjA3YTYyOThlNjRmYzQ4MTg3ZmIyNzZkNWEzMTdjIiwicHJvZmlsZU5hbWUiOiJxd2VydHl1aW9wdGhlcGllIiwic2lnbmF0dXJlUmVxdWlyZWQiOnRydWUsInRleHR1cmVzIjp7IlNLSU4iOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS81NzEyODM3Njg3YzljODUxMGEyYjMyZmY4NjJmMTRhNDU4ZjczMDI5YTdkNzczOWY1NDAxMzNmY2FlNTY0MzZiIn0sIkNBUEUiOnsidXJsIjoiaHR0cDovL3RleHR1cmVzLm1pbmVjcmFmdC5uZXQvdGV4dHVyZS8xNzkxMjc5MGZmMTY0YjkzMTk2ZjA4YmE3MWQwZTYyMTI5MzA0Nzc2ZDBmMzQ3MzM0ZjhhNmVhZTUwOWY4YTU2In19fQ=="}]},Name:"qwertyuiopthepie"}},Count:1b}],HandItems:[{id:"minecraft:bow",Count:1b},{id:"minecraft:arrow",Count:1b}],Pose:{Head:[330f,60f,0f],RightArm:[330f,75f,90f],LeftArm:[0f,0f,340f],RightLeg:[0f,30f,3f],LeftLeg:[0f,0f,350f],Body:[0f,20f,0f]},DisabledSlots:2039583,Tags:["ArenaStand","ChampionStand1"]}

execute unless entity @e[tag=ChampionStand2] run summon armor_stand -5 48.5 1913 {Invulnerable:1b,NoGravity:1b,NoBasePlate:1b,ShowArms:1b,Rotation:[270f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:4008727}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:4011567}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:4863005}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"1ca31321-dbd1-4c83-93b8-f58311600709",Properties:{textures:[{Signature:"DxW02OCzQ93IXxCBge2bMSTq5geoiiBcJIZcVQj72gDJq/xGJ2BL0hUeP6llceMr3DKTpd2QY/FAyfmuSjCK7IHvP6umtwhm18G16AkD1NgG8iycNvtR/Nm09PHgQh10xmsGzD5uLsZHXkjEGOTUjWYrU3WAH1ExJ4UZomJ9F2rW856wgwoOy3yaASkpxUOkEsOhL7bdzzAomfBWPiTVGnKZMYInjoZNXXSJCAQ7lRjIkBtSO64QagFBVvnzpyYaTFDoXFBDIBh18OkLa4I4Mu5boWBLqDOK6wBFVKncAKubepmfIhv3jXCQZz+mYKmshj+QJ+4g7YiTfBLbshJTCkPxGws1LtLBNYUi/ptoZJCHdePbTuy9doaMVFiR1WcLNp+USrD7qAbUapw0fqMJVW3/s2AipZMJzFJYGhzWuYE5tGirCGL9vpiTGcpGLE6caPUvAHpOSBZmCm9ZEW8VDYsPI5Seex5sCGzQAD/ARsWFJBhyfz6YA4mBLHgJlJX9G6DtTyB5KLt+mHqbwUkjym3/pWcRdC9eXbIJynzE5pL3a0Vm2Ytj3u+nWdPm04EudUEQAzs1vgPwB4twbitOPowrFkgnLiYjoe8wzCDyZFc6EfiWF4A+FYTXTancolOjMc8WCdwONdiRXmZ5Q2zkcLNCTEI4vCUFLY7LLsa3At0=",Value:"eyJ0aW1lc3RhbXAiOjE1MzYwOTkwNTc4MzksInByb2ZpbGVJZCI6IjFjYTMxMzIxZGJkMTRjODM5M2I4ZjU4MzExNjAwNzA5IiwicHJvZmlsZU5hbWUiOiJkZW1lbnRlZGRvb2QiLCJzaWduYXR1cmVSZXF1aXJlZCI6dHJ1ZSwidGV4dHVyZXMiOnsiU0tJTiI6eyJ1cmwiOiJodHRwOi8vdGV4dHVyZXMubWluZWNyYWZ0Lm5ldC90ZXh0dXJlL2E1NmY2YzMzOTY1MTZjNjM0YTg2OWVkN2IwMzgxNTUwODljNzg3OTliOTA0ODEwZWVhNzQ4M2VjNGQ2MzQ2YWEifX19"}]},Name:"dementeddood"}},Count:1b}],HandItems:[{id:"minecraft:stone_sword",Count:1b},{id:"minecraft:stone_sword",Count:1b}],Pose:{Head:[320f,0f,0f],RightArm:[225f,45f,10f],LeftArm:[25f,15f,345f],RightLeg:[0f,20f,5f],LeftLeg:[0f,340f,355f],Body:[0f,0f,0f]},DisabledSlots:2039583,Tags:["ArenaStand","ChampionStand2"]}



#execute unless entity @e[tag=ChampionStand1] run summon armor_stand 5 48.5 1913 {Invulnerable:1b,NoGravity:1b,NoBasePlate:1b,ShowArms:1b,Rotation:[90f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:1710618}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:16711782}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"c9b54008-fd80-4742-8b23-8787b5f2401c",Properties:{textures:[{Signature:"i/tgHRgBNjxlIZM3VckCAsuftv/FSWc67NglXSfkv1tUZSWHaZht0BH/UMnJiF6HVTnDmTbbXEyHUFtyuUKxACJOR78UnsTTYAMuZ/Zw0Zygo84DFceY+jbEF5PFTNsMtWkgGmFCeuFGlQS8h9tZUBtHNU7NNizCaWRDb+h366mQsOHWI+gQiEnVJOVVE5v8NU/VsfjtWWfcsVNqaaPPOGuqPXkLw2g08lx7UFIS2pIaJwmmnG6eniay/NjGFmq3HpqaX1AD+G4+LNF6bciz9lfd4by574w+mWhBVTuhEX5h9qi+e3uE5CbCH9JXRc1BbZQ04rDUVcriA5F6jyN8NsnSZXc36faKngQz8wibo3H3n8URmekOAodTo3oay0K2VA4+/k7X5Ciho9wfGvnUehmpKy4iZomoqDyajjV84yrf00HotkhPwAFSir477w1eDtbNrMII8mSy3tTrzxZxPekF0coAiy88XosUMdE1CjoVas5fVs7DrqSuXz57Ms7zNUQxBsHUQCpEVV0zciLsXhtn0BVTmNvm5Rujce0WMN0Cu2bpLyvfiyirIcyAsmxI2xW5v0nsNn7oQnbG6IoFDO6miBIQtJdKu6y4AsNm9jRvkMVkaZ/jlUDIwu3maJ/x0EgCdOXRt/n+vj/F8OLsrfrSuzD2j6O1TdovZDII0Lg=",Value:"eyJ0aW1lc3RhbXAiOjE1NDY1NzM2Nzc1NjksInByb2ZpbGVJZCI6ImM5YjU0MDA4ZmQ4MDQ3NDI4YjIzODc4N2I1ZjI0MDFjIiwicHJvZmlsZU5hbWUiOiJNaW5lY3JhZnRDaGljayIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvZDgyZTBmMDcyMmI4MDY4OTU2ODgyODRjMzE2NjU4NWY3YmI5YmZmYzcxOGU2ZjdmNGJkY2M3M2MyYjIzYWZlMCIsIm1ldGFkYXRhIjp7Im1vZGVsIjoic2xpbSJ9fX19"}]},Name:"MinecraftChick"}},Count:1b}],HandItems:[{id:"minecraft:bow",Count:1b},{id:"minecraft:arrow",Count:1b}],Pose:{Head:[330f,60f,0f],RightArm:[330f,75f,90f],LeftArm:[0f,0f,340f],RightLeg:[0f,30f,3f],LeftLeg:[0f,0f,350f],Body:[0f,20f,0f]},DisabledSlots:2039583,Tags:["ArenaStand","ChampionStand1"]}

#execute unless entity @e[tag=ChampionStand2] run summon armor_stand -5 48.5 1913 {Invulnerable:1b,NoGravity:1b,NoBasePlate:1b,ShowArms:1b,Rotation:[270f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3617625}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:3158064}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"d7155343-ffae-4c8b-b654-aaecfaa29ed2",Properties:{textures:[{Signature:"UuEKowxLFCkGZjYH+8QryJ+TrBQyKUePzmfmvoPIN6Dbgt14SC9vhMQ2+a5ujD9wXc532fRz25dpwhNZjN+Af+tkmJnJOqP5NKP11OOeuCeKXABmxuQzleUgQjzEtgw2xlePlRCpAd8K6lsIS7me+Hh4FeTF79CLbb6tWbtxbyr54zYLMnqacHEDfiEvhw6w9tM8/CIILwEZ7GYKA1IwPZyv1ZB6Ix0LtedVgJhLyZpx7NnFsCnqPIZJFnWnEsQ0aS3L6c4mQqOVHViTOvxca/x4fRokaCR7gwDnozvIKN6u3hkCUJu2ftGzeXnpxFL0Y1rkYSVEX9bEeNlDNbFI2/ub+1SbeXKwjSIaYwhCdi25YTDPBmPugsxlU1KZCzajTr/D1aqyP/lcon8qSvJhfB6idxDKzdjhiCRdoNHqPP4/pCI27OCL3AKgIoFetVECSGor+NGuApRgjgqIRbQyF4s7z+ObRw5rDCL9uw12kFcrqyR/VcpZl3pVlN3n220hx2W+eOzj2yV+x1znARRPtfd2XyX0YF6Gpz58mme7CmxeQboF6V7HTxkAyfBL4BOccuNg0In9lWhwuZZUQ1ffNs2l3xljKKhZZwhMbDWjBZmHJ7hzN+HO/sv2SUugd9Fn4aLrMo1UtBySxo+CKsQ8MkeMkBckxMcXGmLAY8qTrig=",Value:"eyJ0aW1lc3RhbXAiOjE1NDY1NzM2ODUzMjIsInByb2ZpbGVJZCI6ImQ3MTU1MzQzZmZhZTRjOGJiNjU0YWFlY2ZhYTI5ZWQyIiwicHJvZmlsZU5hbWUiOiJ2dWJ1aSIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMWI3MTJiYTJhNGIxZTU0MjQyMmQ4MTI0OGM4NmQ5OWU2Yjg4YTQ5Y2JmNDM2ZGE1ZDE5ZWRkZDVjOTk4ZWFhMiJ9fX0="}]},Name:"vubui"}},Count:1b}],HandItems:[{id:"minecraft:stone_sword",Count:1b},{id:"minecraft:stone_sword",Count:1b}],Pose:{Head:[320f,0f,0f],RightArm:[225f,45f,10f],LeftArm:[25f,15f,345f],RightLeg:[0f,20f,5f],LeftLeg:[0f,340f,355f],Body:[0f,0f,0f]},DisabledSlots:2039583,Tags:["ArenaStand","ChampionStand2"]}

#execute unless entity @e[tag=ChampionStand2] run summon armor_stand -5 48.5 1913 {Invulnerable:1b,NoGravity:1b,NoBasePlate:1b,ShowArms:1b,Rotation:[270f,0f],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{display:{color:0}}},{id:"minecraft:leather_leggings",Count:1b,tag:{display:{color:3617625}}},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:3158064}}},{id:"minecraft:player_head",tag:{SkullOwner:{Id:"d7155343-ffae-4c8b-b654-aaecfaa29ed2",Properties:{textures:[{Signature:"UuEKowxLFCkGZjYH+8QryJ+TrBQyKUePzmfmvoPIN6Dbgt14SC9vhMQ2+a5ujD9wXc532fRz25dpwhNZjN+Af+tkmJnJOqP5NKP11OOeuCeKXABmxuQzleUgQjzEtgw2xlePlRCpAd8K6lsIS7me+Hh4FeTF79CLbb6tWbtxbyr54zYLMnqacHEDfiEvhw6w9tM8/CIILwEZ7GYKA1IwPZyv1ZB6Ix0LtedVgJhLyZpx7NnFsCnqPIZJFnWnEsQ0aS3L6c4mQqOVHViTOvxca/x4fRokaCR7gwDnozvIKN6u3hkCUJu2ftGzeXnpxFL0Y1rkYSVEX9bEeNlDNbFI2/ub+1SbeXKwjSIaYwhCdi25YTDPBmPugsxlU1KZCzajTr/D1aqyP/lcon8qSvJhfB6idxDKzdjhiCRdoNHqPP4/pCI27OCL3AKgIoFetVECSGor+NGuApRgjgqIRbQyF4s7z+ObRw5rDCL9uw12kFcrqyR/VcpZl3pVlN3n220hx2W+eOzj2yV+x1znARRPtfd2XyX0YF6Gpz58mme7CmxeQboF6V7HTxkAyfBL4BOccuNg0In9lWhwuZZUQ1ffNs2l3xljKKhZZwhMbDWjBZmHJ7hzN+HO/sv2SUugd9Fn4aLrMo1UtBySxo+CKsQ8MkeMkBckxMcXGmLAY8qTrig=",Value:"eyJ0aW1lc3RhbXAiOjE1NDY1NzM2ODUzMjIsInByb2ZpbGVJZCI6ImQ3MTU1MzQzZmZhZTRjOGJiNjU0YWFlY2ZhYTI5ZWQyIiwicHJvZmlsZU5hbWUiOiJ2dWJ1aSIsInNpZ25hdHVyZVJlcXVpcmVkIjp0cnVlLCJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvMWI3MTJiYTJhNGIxZTU0MjQyMmQ4MTI0OGM4NmQ5OWU2Yjg4YTQ5Y2JmNDM2ZGE1ZDE5ZWRkZDVjOTk4ZWFhMiJ9fX0="}]},Name:"vubui"}},Count:1b}],HandItems:[{id:"minecraft:stone_sword",Count:1b},{id:"minecraft:stone_sword",Count:1b}],Pose:{Head:[320f,0f,0f],RightArm:[225f,45f,10f],LeftArm:[225f,315f,350f],RightLeg:[0f,20f,5f],LeftLeg:[0f,340f,355f],Body:[0f,0f,0f]},DisabledSlots:2039583,Tags:["ArenaStand","ChampionStand2"]}


execute if entity @e[type=turtle] run team add ArenaMine
execute unless entity @e[type=turtle] run team remove ArenaMine
team modify ArenaMine collisionRule never

# SPAWNPOINT
execute if entity @e[scores={ArenaRound=0..}] run spawnpoint @a -8 51 1944


# SETS CA$H ON DISPLAY
execute align x align y align z if entity @a[x=-2,y=50,z=1945,dx=4,dy=7,dz=0] run scoreboard objectives add ArenaCash totalKillCount {"text":"Kill Ca$h","color":"yellow","bold":"true","underlined":"true"}
execute align x align y align z if entity @a[x=-2,y=50,z=1945,dx=4,dy=7,dz=0] run scoreboard players add @a ArenaCash 0
execute unless entity @e[scores={ArenaRound=3,ArenaTimer=3380..}] align x align y align z if entity @a[x=-2,y=50,z=1945,dx=4,dy=7,dz=0] run scoreboard objectives setdisplay sidebar ArenaCash
execute unless entity @e[scores={ArenaRound=3,ArenaTimer=3380..}] align x align y align z if entity @a[x=-1,y=50,z=1962,dx=2,dy=7,dz=2] run scoreboard objectives setdisplay sidebar ArenaCash
execute if entity @e[scores={ArenaRound=0}] run difficulty easy
execute if entity @e[scores={ArenaRound=3}] run difficulty normal


# ENDING DISPLAY STATS
scoreboard objectives add PlayerKillCount totalKillCount {"text":"Arena Kills","color":"yellow","bold":"true","underlined":"true"}
execute if entity @e[scores={ArenaRound=3,ArenaTimer=3380..}] run function d3:arena/display_stats


# ROUND MECHANIC
execute align x align y align z if entity @a[x=-2,y=50,z=1945,dx=4,dy=7,dz=0] run scoreboard objectives add ArenaRound dummy
scoreboard players add @e[tag=MainArenaAEC] ArenaRound 0
execute align x align y align z if entity @a[x=-1,y=64,z=1981,dx=3,dy=3,dz=3] run scoreboard players set @e[scores={ArenaRound=0}] ArenaRound 1
execute if entity @e[scores={ArenaRound=1}] run scoreboard objectives add ArenaTimer dummy
scoreboard players add @e[tag=MainArenaAEC] ArenaTimer 0

execute if entity @e[scores={ArenaRound=1,ArenaTimer=3502..}] align x align y align z if entity @a[x=-1,y=64,z=1981,dx=3,dy=3,dz=3] run scoreboard players set @e[scores={ArenaRound=1}] ArenaRound 100
scoreboard players set @e[scores={ArenaRound=100}] ArenaTimer 0
scoreboard players set @e[scores={ArenaRound=100}] ArenaRound 2

execute if entity @e[scores={ArenaRound=2,ArenaTimer=3502..}] align x align y align z if entity @a[x=-1,y=64,z=1981,dx=3,dy=3,dz=3] run scoreboard players set @e[scores={ArenaRound=2}] ArenaRound 200
scoreboard players set @e[scores={ArenaRound=200}] ArenaTimer 0
scoreboard players set @e[scores={ArenaRound=200}] ArenaRound 3


# SQUID BEGINS ROUND
execute if entity @e[tag=RoundSquid] as @e[tag=ArenaAdam] at @s run teleport @s ^ ^ ^ facing entity @e[tag=RoundSquid,limit=1]
execute if entity @e[tag=RoundSquid] run scoreboard objectives add RoundSquid dummy
tag @e[tag=RoundSquid,nbt={OnGround:1b}] add SquidTarget
execute as @e[tag=RoundSquid] at @s if block ~ ~ ~ water run tag @s add SquidTarget
execute if entity @e[tag=SquidTarget] run scoreboard players add @e[tag=MainArenaAEC] RoundSquid 1
execute if entity @e[scores={RoundSquid=1..}] as @e[tag=SquidTarget] run data merge entity @s {Invulnerable:false}
execute if entity @e[scores={ArenaRound=1,RoundSquid=1}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Ah ha! The ","color":"none","bold":false,"underlined":false},{"text":"Ceremonial Squid","color":"yellow","bold":false,"underlined":false},{"text":" has fallen. The round will begin upon its death. Good luck, Warrior!","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=2,RoundSquid=1}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Once again, the ","color":"none","bold":false,"underlined":false},{"text":"Ceremonial Squid","color":"yellow","bold":false,"underlined":false},{"text":" has fallen. The round will begin when it dies.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={ArenaRound=3,RoundSquid=1}] run tellraw @a ["",{"text":"<AdamDJM> ","color":"yellow","bold":false},{"text":"Ah! There's the ","color":"none","bold":false,"underlined":false},{"text":"Ceremonial Squid","color":"yellow","bold":false,"underlined":false},{"text":"! You know what to do.","color":"none","bold":false,"underlined":false}]

execute if entity @e[scores={RoundSquid=1..}] unless entity @e[tag=SquidTarget] run scoreboard players set @e[scores={ArenaRound=1,ArenaTimer=..999}] ArenaTimer 1000
execute if entity @e[scores={RoundSquid=1..}] unless entity @e[tag=SquidTarget] run scoreboard players set @e[scores={ArenaRound=2,ArenaTimer=..999}] ArenaTimer 1000
execute if entity @e[scores={RoundSquid=1..}] unless entity @e[tag=SquidTarget] run scoreboard players set @e[scores={ArenaRound=3,ArenaTimer=..999}] ArenaTimer 1000

execute unless entity @e[tag=RoundSquid] run scoreboard objectives remove RoundSquid


# ROUNDS
execute if entity @e[tag=ArenaCrystal] unless entity @e[tag=ArenaBoss3] run kill @e[tag=ArenaCrystal]
execute if entity @e[scores={ArenaRound=0}] run function d3:arena/arena_heads_113
execute if entity @e[scores={ArenaRound=0}] run function d3:arena/round_setup
execute if entity @e[scores={ArenaRound=0}] run function d3:arena/gates_closed
execute if entity @e[scores={ArenaRound=1}] run function d3:arena/round_1
execute if entity @e[scores={ArenaRound=2}] run function d3:arena/round_2
execute if entity @e[scores={ArenaRound=3}] run function d3:arena/round_3


# CHECKS FOR PLAYERS IN ARENA
tag @a remove ArenaZone
tag @a[x=-58,y=56,z=1963,dx=116,dy=30,dz=95] add ArenaZone


# TAG PLAYERS INSIDE ALCOVE
tag @a remove InAlcove
execute align x align y align z run tag @a[x=35,y=66,z=1987,dx=4,dy=3,dz=9] add InAlcove
execute align x align y align z run tag @a[x=27,y=64,z=1986,dx=7,dy=5,dz=5] add InAlcove
execute align x align y align z run tag @a[x=35,y=66,z=2004,dx=4,dy=3,dz=9] add InAlcove
execute align x align y align z run tag @a[x=27,y=64,z=2009,dx=7,dy=5,dz=5] add InAlcove

execute align x align y align z run tag @a[x=-35,y=66,z=1987,dx=-4,dy=3,dz=9] add InAlcove
execute align x align y align z run tag @a[x=-27,y=64,z=1986,dx=-7,dy=5,dz=5] add InAlcove
execute align x align y align z run tag @a[x=-35,y=66,z=2004,dx=-4,dy=3,dz=9] add InAlcove
execute align x align y align z run tag @a[x=-27,y=64,z=2009,dx=-7,dy=5,dz=5] add InAlcove



# TAG ENTITIES ON ALCOVE PLATFORMS
tag @e remove OnPlatform1A
execute align x align y align z run tag @e[x=39,y=66,z=1987,dx=-5,dy=3,dz=2.4] add OnPlatform1A
tag @e remove OnPlatform1B
execute align x align y align z run tag @e[x=39,y=66,z=1996,dx=-4,dy=3,dz=-5.2] add OnPlatform1B
execute if block 33 64 1988 air as @a[tag=OnPlatform1A,gamemode=adventure] at @s run teleport @s ~-0.4 ~ ~
execute if block 33 64 1988 air as @a[tag=OnPlatform1B,gamemode=adventure] at @s run teleport @s ~ ~ ~-0.4
execute if block 33 64 1988 air as @e[tag=OnPlatform1A,tag=ArenaMob] run data merge entity @s {Motion:[-0.1d,0.0d,0.0d]}
execute if block 33 64 1988 air as @e[tag=OnPlatform1B,tag=ArenaMob] run data merge entity @s {Motion:[0.0d,0.0d,-0.1d]}


tag @e remove OnPlatform2A
execute align x align y align z run tag @e[x=39,y=66,z=2013,dx=-5,dy=3,dz=-2.4] add OnPlatform2A
tag @e remove OnPlatform2B
execute align x align y align z run tag @e[x=39,y=66,z=2004,dx=-4,dy=3,dz=5.2] add OnPlatform2B
execute if block 33 64 2012 air as @a[tag=OnPlatform2A,gamemode=adventure] at @s run teleport @s ~-0.4 ~ ~
execute if block 33 64 2012 air as @a[tag=OnPlatform2B,gamemode=adventure] at @s run teleport @s ~ ~ ~0.4
execute if block 33 64 2012 air as @e[tag=OnPlatform2A,tag=ArenaMob] run data merge entity @s {Motion:[-0.1d,0.0d,0.0d]}
execute if block 33 64 2012 air as @e[tag=OnPlatform2B,tag=ArenaMob] run data merge entity @s {Motion:[0.0d,0.0d,0.1d]}


tag @e remove OnPlatform3A
execute align x align y align z run tag @e[x=-39,y=66,z=2013,dx=5,dy=3,dz=-2.4] add OnPlatform3A
tag @e remove OnPlatform3B
execute align x align y align z run tag @e[x=-39,y=66,z=2004,dx=4,dy=3,dz=5.2] add OnPlatform3B
execute if block -33 64 2012 air as @a[tag=OnPlatform3A,gamemode=adventure] at @s run teleport @s ~0.4 ~ ~
execute if block -33 64 2012 air as @a[tag=OnPlatform3B,gamemode=adventure] at @s run teleport @s ~ ~ ~0.4
execute if block -33 64 2012 air as @e[tag=OnPlatform3A,tag=ArenaMob] run data merge entity @s {Motion:[0.1d,0.0d,0.0d]}
execute if block -33 64 2012 air as @e[tag=OnPlatform3B,tag=ArenaMob] run data merge entity @s {Motion:[0.0d,0.0d,0.1d]}


tag @e remove OnPlatform4A
execute align x align y align z run tag @e[x=-39,y=66,z=1987,dx=5,dy=3,dz=2.4] add OnPlatform4A
tag @e remove OnPlatform4B
execute align x align y align z run tag @e[x=-39,y=66,z=1996,dx=4,dy=3,dz=-5.2] add OnPlatform4B
execute if block -33 64 1988 air as @a[tag=OnPlatform4A,gamemode=adventure] at @s run teleport @s ~0.4 ~ ~
execute if block -33 64 1988 air as @a[tag=OnPlatform4B,gamemode=adventure] at @s run teleport @s ~ ~ ~-0.4
execute if block -33 64 1988 air as @e[tag=OnPlatform4A,tag=ArenaMob] run data merge entity @s {Motion:[0.1d,0.0d,0.0d]}
execute if block -33 64 1988 air as @e[tag=OnPlatform4B,tag=ArenaMob] run data merge entity @s {Motion:[0.0d,0.0d,-0.1d]}


# PREVENT FALLING INTO GATES
tag @e remove CaughtInGate
execute align x align y align z run tag @e[x=-1,y=60,z=1971,dx=2,dy=3,dz=0] add CaughtInGate
execute align x align y align z run tag @e[x=-1,y=60,z=1979,dx=2,dy=3,dz=0] add CaughtInGate
execute align x align y align z run tag @e[x=27,y=60,z=1988,dx=1,dy=3,dz=3] add CaughtInGate
execute align x align y align z run tag @e[x=27,y=60,z=2010,dx=1,dy=3,dz=3] add CaughtInGate
execute align x align y align z run tag @e[x=-28,y=60,z=1988,dx=1,dy=3,dz=3] add CaughtInGate
execute align x align y align z run tag @e[x=-28,y=60,z=2010,dx=1,dy=3,dz=3] add CaughtInGate
execute align x align y align z run tag @e[x=-2,y=60,z=2021,dx=4,dy=3,dz=0] add CaughtInGate

execute as @e[tag=CaughtInGate,type=item] run data merge entity @s {NoGravity:true,Motion:[0d,0d,0d]}
execute as @e[tag=CaughtInGate] at @s run teleport @s ~ 64.0 ~


# BUTCHER ADVANCEMENT
scoreboard objectives add MasterKillCount dummy
scoreboard objectives add PlayerKill totalKillCount
execute as @a[scores={PlayerKill=1..}] run scoreboard players add @e[tag=MainArenaAEC] MasterKillCount 1
execute if entity @e[scores={MasterKillCount=1001..}] run advancement grant @a only d3:folder_b/butcher
scoreboard players reset @a[scores={PlayerKill=1..}] PlayerKill
advancement grant @a[scores={PlayerKillCount=1001..}] only d3:folder_b/butcher



# ALL TOKENS ADVANCEMENT
execute if entity @e[nbt={Inventory:[{id:"minecraft:green_concrete_powder",tag:{HideFlags:1}}]}] unless block 8 5 78 green_concrete run setblock 8 5 78 green_concrete
execute if entity @e[nbt={Inventory:[{id:"minecraft:light_blue_concrete_powder",tag:{HideFlags:1}}]}] unless block 7 5 78 light_blue_concrete run setblock 7 5 78 light_blue_concrete
execute if entity @e[nbt={Inventory:[{id:"minecraft:brown_concrete_powder",tag:{HideFlags:1}}]}] unless block 6 5 78 brown_concrete run setblock 6 5 78 brown_concrete

execute if entity @e[nbt={Inventory:[{id:"minecraft:cyan_concrete_powder",tag:{HideFlags:1}}]}] unless block 8 5 78 cyan_concrete run setblock 8 3 78 cyan_concrete
execute if entity @e[nbt={Inventory:[{id:"minecraft:red_concrete_powder",tag:{HideFlags:1}}]}] unless block 7 5 78 red_concrete run setblock 7 3 78 red_concrete
execute if entity @e[nbt={Inventory:[{id:"minecraft:white_concrete_powder",tag:{HideFlags:1}}]}] unless block 6 5 78 white_concrete run setblock 6 3 78 white_concrete

execute if entity @e[nbt={Inventory:[{id:"minecraft:black_concrete_powder",tag:{HideFlags:1}}]}] unless block 8 5 78 black_concrete run setblock 8 1 78 black_concrete
execute if entity @e[nbt={Inventory:[{id:"minecraft:light_gray_concrete_powder",tag:{HideFlags:1}}]}] unless block 7 5 78 light_gray_concrete run setblock 7 1 78 light_gray_concrete
execute if entity @e[nbt={Inventory:[{id:"minecraft:orange_concrete_powder",tag:{HideFlags:1}}]}] unless block 6 5 78 orange_concrete run setblock 6 1 78 orange_concrete

execute if block 8 5 78 green_concrete if block 7 5 78 light_blue_concrete if block 6 5 78 brown_concrete if block 8 3 78 cyan_concrete if block 7 3 78 red_concrete if block 6 3 78 white_concrete if block 8 1 78 black_concrete if block 7 1 78 light_gray_concrete if block 6 1 78 orange_concrete run advancement grant @a only d3:folder_b/big_spender


# LIFE BRANCH
execute unless block 4 1 78 cracked_stone_bricks unless block 0 32 1886 gold_block run setblock 0 32 1886 gold_block
execute unless block 3 1 78 cracked_stone_bricks unless block 0 32 1886 gold_block run setblock 0 32 1886 gold_block
execute unless block 2 1 78 cracked_stone_bricks unless block 0 32 1886 gold_block run setblock 0 32 1886 gold_block
execute unless block 1 1 78 cracked_stone_bricks unless block 0 32 1886 gold_block run setblock 0 32 1886 gold_block

execute if block 4 1 78 cracked_stone_bricks if block 3 1 78 cracked_stone_bricks if block 2 1 78 cracked_stone_bricks if block 1 1 78 cracked_stone_bricks unless block 0 32 1886 horn_coral_block run kill @e[type=item,nbt={Item:{tag:{ArenaSecret:1b}}}]
execute if block 4 1 78 cracked_stone_bricks if block 3 1 78 cracked_stone_bricks if block 2 1 78 cracked_stone_bricks if block 1 1 78 cracked_stone_bricks unless block 0 32 1886 horn_coral_block run summon item 0 33 1886 {Item:{id:"minecraft:horn_coral",Count:1b,Age:-32768,tag:{HideFlags:1,display:{Name:"{\"text\":\"Branch of Life\",\"italic\":\"false\",\"color\":\"yellow\",\"bold\":\"true\"}",Lore:['{"text":"Placed in the inventory, this","italic":"true","color":"yellow"}','{"text":"item grants its owner extra life,","italic":"true","color":"yellow"}','{"text":"extra strength and regenerates","italic":"true","color":"yellow"}','{"text":"hearts twice as quickly","italic":"true","color":"yellow"}']},Enchantments:[{id:"minecraft:knockback",lvl:10s}],ArenaSecret:1b}}}
execute if block 4 1 78 cracked_stone_bricks if block 3 1 78 cracked_stone_bricks if block 2 1 78 cracked_stone_bricks if block 1 1 78 cracked_stone_bricks unless block 0 32 1886 horn_coral_block run setblock 0 32 1886 horn_coral_block


# ROUND GIFTS
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3220..}] if block 0 48 1952 clay run summon item 0 50 1952 {Count:1b,Item:{id:"minecraft:written_book",Count:1b,tag:{pages:["{\"text\":\"Congrats on your first win. I've left a gift for you back in your quarters...\\n\\n- Mystery X\"}"],author:" ",title:"Congratulations"}},Age:-32768}
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3220..}] if block 0 48 1952 clay run setblock 0 48 1952 gold_block

execute if entity @e[scores={ArenaRound=2,ArenaTimer=3220..}] if block 0 47 1952 clay run summon item 0 50 1952 {Count:1b,Item:{id:"minecraft:written_book",Count:1b,tag:{pages:["{\"text\":\"Check your training room for a special gift. Good luck with the next one...\\n\\n- Mystery X\"}"],author:" ",title:"Another Win"}},Age:-32768}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3220..}] if block 0 47 1952 clay run setblock 0 47 1952 gold_block

execute unless entity @e[scores={ArenaRound=1..}] if block -7 48 1882 chest run setblock -7 48 1882 air
execute if entity @e[scores={ArenaRound=1,ArenaTimer=3220..}] if block -7 48 1882 air run setblock -7 48 1882 chest[facing=south]{Items:[{Slot:11b,id:"minecraft:diamond_axe",Count:1b,tag:{Unbreakable:1b}},{Slot:15b,id:"minecraft:crossbow",Count:1b,tag:{Unbreakable:1b,Enchantments:[{id:"minecraft:multishot",lvl:1s},{id:"minecraft:piercing",lvl:1s}]}}]}
execute if entity @e[scores={ArenaRound=2..}] if block -7 48 1882 air run setblock -7 48 1882 chest[facing=south]{Items:[{Slot:11b,id:"minecraft:diamond_axe",Count:1b,tag:{Unbreakable:1b}},{Slot:15b,id:"minecraft:crossbow",Count:1b,tag:{Unbreakable:1b,Enchantments:[{id:"minecraft:multishot",lvl:1s},{id:"minecraft:piercing",lvl:1s}]}}]}


execute unless entity @e[scores={ArenaRound=1..}] if entity @e[tag=ArenaGiftAS] run kill @e[tag=ArenaGiftAS]
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3220..}] unless entity @e[tag=ArenaGiftAS1] run summon armor_stand -13 53 1886 {Invulnerable:1b,NoGravity:1b,ShowArms:1b,ArmorItems:[{id:"minecraft:diamond_boots",Count:1b,tag:{Unbreakable:0b}},{id:"minecraft:diamond_leggings",Count:1b,tag:{Unbreakable:0b}},{id:"minecraft:diamond_chestplate",Count:1b,tag:{Unbreakable:0b}},{id:"minecraft:diamond_helmet",Count:1b,tag:{Unbreakable:0b}}],Rotation:[90f,0f],Tags:["ArenaGiftAS1","ArenaGiftAS"]}
execute if entity @e[scores={ArenaRound=2,ArenaTimer=3220..}] unless entity @e[tag=ArenaGiftAS2] run summon armor_stand -17 53 1883 {Invulnerable:1b,NoGravity:1b,ShowArms:1b,ArmorItems:[{id:"minecraft:diamond_boots",Count:1b,tag:{Unbreakable:0b}},{id:"minecraft:diamond_leggings",Count:1b,tag:{Unbreakable:0b}},{id:"minecraft:diamond_chestplate",Count:1b,tag:{Unbreakable:0b}},{id:"minecraft:diamond_helmet",Count:1b,tag:{Unbreakable:0b}}],Rotation:[0f,0f],Tags:["ArenaGiftAS2","ArenaGiftAS"]}
execute if entity @e[scores={ArenaRound=3..}] unless entity @e[tag=ArenaGiftAS1] run summon armor_stand -13 53 1886 {Invulnerable:1b,NoGravity:1b,ShowArms:1b,ArmorItems:[{id:"minecraft:diamond_boots",Count:1b,tag:{Unbreakable:0b}},{id:"minecraft:diamond_leggings",Count:1b,tag:{Unbreakable:0b}},{id:"minecraft:diamond_chestplate",Count:1b,tag:{Unbreakable:0b}},{id:"minecraft:diamond_helmet",Count:1b,tag:{Unbreakable:0b}}],Rotation:[90f,0f],Tags:["ArenaGiftAS1","ArenaGiftAS"]}
execute if entity @e[scores={ArenaRound=3..}] unless entity @e[tag=ArenaGiftAS2] run summon armor_stand -17 53 1883 {Invulnerable:1b,NoGravity:1b,ShowArms:1b,ArmorItems:[{id:"minecraft:diamond_boots",Count:1b,tag:{Unbreakable:0b}},{id:"minecraft:diamond_leggings",Count:1b,tag:{Unbreakable:0b}},{id:"minecraft:diamond_chestplate",Count:1b,tag:{Unbreakable:0b}},{id:"minecraft:diamond_helmet",Count:1b,tag:{Unbreakable:0b}}],Rotation:[0f,0f],Tags:["ArenaGiftAS2","ArenaGiftAS"]}


# REMOVE SMALL SLIMES
execute if entity @e[type=slime,nbt={Size:0}] as @e[type=slime,nbt={Size:0}] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={ArenaRound=1}] run tag @e[type=slime,tag=!ArenaMob,tag=!ArenaStatue] add ArenaMob
execute if entity @e[scores={ArenaRound=1}] run tag @e[type=slime,tag=!ArenaSlime,tag=!ArenaStatue] add ArenaSlime
execute if entity @e[scores={ArenaRound=1}] run tag @e[type=slime,tag=!ArenaAlcoveMob,tag=!ArenaStatue] add ArenaAlcoveMob
execute if entity @e[scores={ArenaRound=1}] run tag @e[type=slime,tag=!ArenaAlcove1Mob,tag=!ArenaStatue] add ArenaAlcove1Mob

execute if entity @e[type=magma_cube,nbt={Size:0}] as @e[type=magma_cube,nbt={Size:0}] at @s run teleport @s ~ ~-100 ~
execute if entity @e[scores={ArenaRound=2}] run tag @e[type=magma_cube,tag=!ArenaMob,tag=!ArenaStatue] add ArenaMob
execute if entity @e[scores={ArenaRound=2}] run tag @e[type=magma_cube,tag=!ArenaMagmaCube,tag=!ArenaStatue] add ArenaMagmaCube
execute if entity @e[scores={ArenaRound=2}] run tag @e[type=magma_cube,tag=!ArenaAlcoveMob,tag=!ArenaStatue] add ArenaAlcoveMob
execute if entity @e[scores={ArenaRound=2}] run tag @e[type=magma_cube,tag=!ArenaAlcove1Mob,tag=!ArenaStatue] add ArenaAlcove1Mob


# TAG VEXES
execute if entity @e[scores={ArenaRound=2..3}] run tag @e[type=vex,tag=!ArenaMob,tag=!ArenaStatue] add ArenaMob
execute if entity @e[scores={ArenaRound=2..3}] run tag @e[type=vex,tag=!ArenaAlcoveMob,tag=!ArenaStatue] add ArenaAlcoveMob
execute if entity @e[scores={ArenaRound=2..3}] run tag @e[type=vex,tag=!ArenaAlcove3Mob,tag=!ArenaStatue] add ArenaAlcove3Mob




# KILL PASSENGERS AND VEHICLES
execute if entity @e[tag=ArenaZombieHorse,tag=!Passive,nbt=!{Passengers:[{id:"minecraft:zombie_villager"}]}] run kill @e[tag=ArenaZombieHorse,tag=!Passive,nbt=!{Passengers:[{id:"minecraft:zombie_villager"}]}]
execute if entity @e[tag=ArenaBabyZombie,tag=!Passive,type=zombie_villager,nbt={OnGround:1b}] run kill @e[tag=ArenaBabyZombie,tag=!Passive,type=zombie_villager,nbt={OnGround:1b}]
execute as @e[tag=ArenaBabyZombie,tag=!Passive] at @s unless entity @e[tag=ArenaZombieHorse,distance=..2] run kill @s
execute as @e[tag=ArenaZombieHorse,tag=!Passive] at @s unless entity @e[tag=ArenaBabyZombie,distance=..2] run kill @s

execute if entity @e[tag=ArenaStray,tag=!Passive,nbt=!{Passengers:[{id:"minecraft:cave_spider"}]}] run kill @e[tag=ArenaStray,tag=!Passive,nbt=!{Passengers:[{id:"minecraft:cave_spider"}]}]
execute if entity @e[tag=ArenaCaveSpider,tag=!Passive,nbt={OnGround:1b}] run kill @e[tag=ArenaCaveSpider,tag=!Passive,nbt={OnGround:1b}]
execute as @e[tag=ArenaStray,tag=!Passive] at @s unless entity @e[tag=ArenaCaveSpider,distance=..2] run kill @s

# STOP WITHER SKELETONS FROM DERPING? - CAN'T FIX
#execute if entity @e[scores={ArenaRound=3}] align x align y align z as @e[tag=ArenaAlcove4Mob,x=-28,y=64,z=1988,dx=1,dy=0,dz=2,nbt={OnGround:1b}] run data merge entity @s {Motion:[0.3d,0.0d,0.0d]}


# KILL SPIDERS TOO HIGH
#execute as @e[tag=ArenaAlcoveMob,type=spider] at @s run kill @s[y=70,dy=10]
execute as @e[tag=ArenaAlcoveMob,type=cave_spider] at @s run kill @s[y=70,dy=10]

#execute as @e[type=spider] at @s run kill @s[y=70,dy=10]
execute as @e[type=cave_spider] at @s run kill @s[y=70,dy=10]

# ALCOVE MOBS BELOW ARENA
execute align x align y align z as @e[tag=ArenaAlcoveMob,x=-32,y=0,z=1969,dx=64,dy=54,dz=64] run kill @s