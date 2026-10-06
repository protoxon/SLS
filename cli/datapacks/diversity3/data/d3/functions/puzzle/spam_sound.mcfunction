####################################################################
# THIS FUNCTION WAS MADE BY QMAGNET
# AUGUST 28 2017 / APRIL 1 2019
# GIVE MAP MAKERS THE CREDIT THEY DESERVE
# YOUTUBERS, TELL YOUR VIEWERS ABOUT OUR CHANNELS
# YouTube -> https://youtube.com/theqmagnet
# Twitter -> https://twitter.com/theqmagnet
####################################################################

execute if entity @a[tag=SoundSpamOff] at @e[tag=RecordStalSoundAEC,scores={FillSoundRoom=350..}] run data merge block ~ ~-1 ~ {Items:[{id:"minecraft:music_disc_stal",Count:1b}]}
execute if entity @a[tag=SoundSpamOff] at @e[tag=RecordCatSoundAEC,scores={FillSoundRoom=360..}] run data merge block ~ ~-1 ~ {Items:[{id:"minecraft:music_disc_cat",Count:1b}]}
execute if entity @a[tag=SoundSpamOff] at @e[tag=RecordMellohiSoundAEC,scores={FillSoundRoom=370..}] run data merge block ~ ~-1 ~ {Items:[{id:"minecraft:music_disc_mellohi",Count:1b}]}
execute if entity @a[tag=SoundSpamOff] at @e[tag=GlassSoundAEC,scores={FillSoundRoom=380..}] run data merge block ~ ~-1 ~ {Items:[{id:"minecraft:glass",Count:1b}]}
execute if entity @a[tag=SoundSpamOff] at @e[tag=GrassSoundAEC,scores={FillSoundRoom=390..}] run data merge block ~ ~-1 ~ {Items:[{id:"minecraft:grass_block",Count:1b}]}

# Player teleports
execute unless entity @a[tag=SoundSpamOff] run playsound item.chorus_fruit.teleport master @a ~ ~ ~ 0 1 0

# Portal whooshes
execute unless entity @a[tag=SoundSpamOff] run playsound block.portal.ambient master @a ~ ~ ~ 0 1 0

# Experience gained
execute unless entity @a[tag=SoundSpamOff] run playsound entity.experience_orb.pickup master @a ~ ~ ~ 0 1 0

# Player dies
execute unless entity @a[tag=SoundSpamOff] run playsound entity.player.death master @a ~ ~ ~ 0 1 0

# Dying
execute unless entity @a[tag=SoundSpamOff] run playsound entity.generic.death master @a ~ ~ ~ 0 1 0

# Thorns prick
execute unless entity @a[tag=SoundSpamOff] run playsound enchant.thorns.hit master @a ~ ~ ~ 0 1 0

# Something fell
execute unless entity @a[tag=SoundSpamOff] run playsound entity.generic.big_fall master @a ~ ~ ~ 0 1 0

# Something tripped
execute unless entity @a[tag=SoundSpamOff] run playsound entity.generic.small_fall master @a ~ ~ ~ 0 1 0

# Something hurts
execute unless entity @a[tag=SoundSpamOff] run playsound entity.generic.hurt master @a ~ ~ ~ 0 1 0

# Player dings
execute unless entity @a[tag=SoundSpamOff] run playsound entity.player.levelup master @a ~ ~ ~ 0 1 0

# Arrow hits
execute unless entity @a[tag=SoundSpamOff] run playsound entity.arrow.hit master @a ~ ~ ~ 0 1 0

# Arrow fired
execute unless entity @a[tag=SoundSpamOff] run playsound entity.arrow.shoot master @a ~ ~ ~ 0 1 0

# Burning
execute unless entity @a[tag=SoundSpamOff] run playsound entity.generic.burn master @a ~ ~ ~ 0 1 0

# Player hurts
execute unless entity @a[tag=SoundSpamOff] run playsound entity.player.hurt master @a ~ ~ ~ 0 1 0

# Player hit
execute unless entity @a[tag=SoundSpamOff] run playsound entity.arrow.hit_player master @a ~ ~ ~ 0 1 0

# Explosion
execute unless entity @a[tag=SoundSpamOff] run playsound block.end_gateway.spawn master @a ~ ~ ~ 0 1 0

# Lightning strikes
execute unless entity @a[tag=SoundSpamOff] run playsound entity.lightning.impact master @a ~ ~ ~ 0 1 0

# Thunder roars
execute unless entity @a[tag=SoundSpamOff] run playsound entity.lightning.thunder master @a ~ ~ ~ 0 1 0

# Footsteps
execute unless entity @a[tag=SoundSpamOff] run playsound block.gravel.step master @a ~ ~ ~ 0 1 0

# Eerie noise
execute unless entity @a[tag=SoundSpamOff] run playsound ambient.cave master @a ~ ~ ~ 0 1 0

# Water flows
execute unless entity @a[tag=SoundSpamOff] run playsound block.water.ambient master @a ~ ~ ~ 0 1 0

# Rain falls
execute unless entity @a[tag=SoundSpamOff] run playsound weather.rain master @a ~ ~ ~ 0 1 0

# Splashing
execute unless entity @a[tag=SoundSpamOff] run playsound entity.generic.splash master @a ~ ~ ~ 0 1 0

# Swimming
execute unless entity @a[tag=SoundSpamOff] run playsound entity.generic.swim master @a ~ ~ ~ 0 1 0

# Burp
execute unless entity @a[tag=SoundSpamOff] run playsound entity.player.burp master @a ~ ~ ~ 0 1 0

# Eating
execute unless entity @a[tag=SoundSpamOff] run playsound entity.generic.eat master @a ~ ~ ~ 0 1 0

# Sipping
execute unless entity @a[tag=SoundSpamOff] run playsound entity.generic.drink master @a ~ ~ ~ 0 1 0


# Note Block plays
execute unless entity @a[tag=SoundSpamOff] run playsound block.note.xylophone master @a ~ ~ ~ 0 1 0

# Trapdoor closes
execute unless entity @a[tag=SoundSpamOff] run playsound block.iron_trapdoor.close master @a ~ ~ ~ 0 1 0

# Trapdoor opens
execute unless entity @a[tag=SoundSpamOff] run playsound block.iron_trapdoor.open master @a ~ ~ ~ 0 1 0

# Trapdoor creaks
execute unless entity @a[tag=SoundSpamOff] run playsound block.wooden_trapdoor.open master @a ~ ~ ~ 0 1 0

# Door creaks
execute unless entity @a[tag=SoundSpamOff] run playsound block.iron_door.open master @a ~ ~ ~ 0 1 0

# Fence gate creaks
execute unless entity @a[tag=SoundSpamOff] run playsound block.fence_gate.close master @a ~ ~ ~ 0 1 0

# Painting breaks
execute unless entity @a[tag=SoundSpamOff] run playsound entity.painting.place master @a ~ ~ ~ 0 1 0

# Painting placed
execute unless entity @a[tag=SoundSpamOff] run playsound entity.painting.place master @a ~ ~ ~ 0 1 0

# Item frame breaks
execute unless entity @a[tag=SoundSpamOff] run playsound entity.itemframe.break master @a ~ ~ ~ 0 1 0

# Item frame clicks
execute unless entity @a[tag=SoundSpamOff] run playsound entity.itemframe.rotate_item master @a ~ ~ ~ 0 1 0

# Item frame empties
execute unless entity @a[tag=SoundSpamOff] run playsound entity.itemframe.remove_item master @a ~ ~ ~ 0 1 0

# Item frame fills
execute unless entity @a[tag=SoundSpamOff] run playsound entity.itemframe.add_item master @a ~ ~ ~ 0 1 0

# Item frame placed
execute unless entity @a[tag=SoundSpamOff] run playsound entity.itemframe.place master @a ~ ~ ~ 0 1 0



# Item breaks
execute unless entity @a[tag=SoundSpamOff] run playsound item.shield.break master @a ~ ~ ~ 0 1 0

# Item plops
execute unless entity @a[tag=SoundSpamOff] run playsound entity.item.pickup master @a ~ ~ ~ 0 1 0

# Shield blocks
execute unless entity @a[tag=SoundSpamOff] run playsound item.shield.block master @a ~ ~ ~ 0 1 0


#Diamond armor clangs
execute unless entity @a[tag=SoundSpamOff] run playsound item.armor.equip_diamond master @a ~ ~ ~ 0 1 0

#Iron armor armor clanks
execute unless entity @a[tag=SoundSpamOff] run playsound item.armor.equip_iron master @a ~ ~ ~ 0 1 0

# Gold armor clinks
execute unless entity @a[tag=SoundSpamOff] run playsound item.armor.equip_gold master @a ~ ~ ~ 0 1 0

# Chain armor jingles
execute unless entity @a[tag=SoundSpamOff] run playsound item.armor.equip_chain master @a ~ ~ ~ 0 1 0

# Leather armor rustles
execute unless entity @a[tag=SoundSpamOff] run playsound item.armor.equip_leather master @a ~ ~ ~ 0 1 0

#Gear equipped
execute unless entity @a[tag=SoundSpamOff] run playsound item.armor.equip_generic master @a ~ ~ ~ 0 1 0


# Eye of ender shoots
execute unless entity @a[tag=SoundSpamOff] run playsound entity.endereye.launch master @a ~ ~ ~ 0 1 0

# Firework  blasts
execute unless entity @a[tag=SoundSpamOff] run playsound entity.firework.blast master @a ~ ~ ~ 0 1 0

# Firework twinkles
execute unless entity @a[tag=SoundSpamOff] run playsound entity.firework.twinkle master @a ~ ~ ~ 0 1 0

# Firework launches
execute unless entity @a[tag=SoundSpamOff] run playsound entity.firework.launch master @a ~ ~ ~ 0 1 0

#Lava pops
execute unless entity @a[tag=SoundSpamOff] run playsound block.lava.ambient master @a ~ ~ ~ 0 1 0

# Lava hisses
execute unless entity @a[tag=SoundSpamOff] run playsound block.lava.extinguish master @a ~ ~ ~ 0 1 0

# Fire extinguished
execute unless entity @a[tag=SoundSpamOff] run playsound block.fire.extinguish master @a ~ ~ ~ 0 1 0

# Fire crackles
execute unless entity @a[tag=SoundSpamOff] run playsound block.fire.ambient master @a ~ ~ ~ 0 1 0

# Ender pearl flies
execute unless entity @a[tag=SoundSpamOff] run playsound entity.enderpearl.throw master @a ~ ~ ~ 0 1 0

# Snowball flies
execute unless entity @a[tag=SoundSpamOff] run playsound entity.snowball.throw master @a ~ ~ ~ 0 1 0

# Egg flies
execute unless entity @a[tag=SoundSpamOff] run playsound entity.egg.throw master @a ~ ~ ~ 0 1 0

# Chest locked
execute unless entity @a[tag=SoundSpamOff] run playsound block.chest.locked master @a ~ ~ ~ 0 1 0

# Chest closed
execute unless entity @a[tag=SoundSpamOff] run playsound block.chest.close master @a ~ ~ ~ 0 1 0

# Chest opened
execute unless entity @a[tag=SoundSpamOff] run playsound block.chest.open master @a ~ ~ ~ 0 1 0

# Brewing stand bubbles
execute unless entity @a[tag=SoundSpamOff] run playsound block.brewing_stand.brew master @a ~ ~ ~ 0 1 0

# Flint and steel clicks
execute unless entity @a[tag=SoundSpamOff] run playsound item.flintandsteel.use master @a ~ ~ ~ 0 1 0

# Fishing hook splashes
execute unless entity @a[tag=SoundSpamOff] run playsound entity.bobber.splash master @a ~ ~ ~ 0 1 0

# Shovel flattens
execute unless entity @a[tag=SoundSpamOff] run playsound item.shovel.flatten master @a ~ ~ ~ 0 1 0

# Bobber thrown
execute unless entity @a[tag=SoundSpamOff] run playsound entity.bobber.throw master @a ~ ~ ~ 0 1 0

# Bucket empties
execute unless entity @a[tag=SoundSpamOff] run playsound item.bucket.empty master @a ~ ~ ~ 0 1 0

# Bucket fills
execute unless entity @a[tag=SoundSpamOff] run playsound item.bucket.fill master @a ~ ~ ~ 0 1 0

# Bottle smashes
execute unless entity @a[tag=SoundSpamOff] run playsound entity.splash_potion.break master @a ~ ~ ~ 0 1 0

# Bottle thrown
execute unless entity @a[tag=SoundSpamOff] run playsound entity.experience_bottle.throw master @a ~ ~ ~ 0 1 0

# Bottle fills
execute unless entity @a[tag=SoundSpamOff] run playsound item.bottle.fill master @a ~ ~ ~ 0 1 0

# Hoe tills
execute unless entity @a[tag=SoundSpamOff] run playsound item.hoe.till master @a ~ ~ ~ 0 1 0


# Fireball whooshes
execute unless entity @a[tag=SoundSpamOff] run playsound item.firecharge.use master @a ~ ~ ~ 0 1 0

# Leashknot tied
execute unless entity @a[tag=SoundSpamOff] run playsound entity.leashknot.place master @a ~ ~ ~ 0 1 0

# Shulker box closed
execute unless entity @a[tag=SoundSpamOff] run playsound block.shulker_box.close master @a ~ ~ ~ 0 1 0

# Shulker box opened
execute unless entity @a[tag=SoundSpamOff] run playsound block.shulker_box.open master @a ~ ~ ~ 0 1 0

# Furnace crackles
execute unless entity @a[tag=SoundSpamOff] run playsound block.furnace.fire_crackle master @a ~ ~ ~ 0 1 0

# Anvil destroyed
execute unless entity @a[tag=SoundSpamOff] run playsound block.anvil.destroy master @a ~ ~ ~ 0 1 0

# Anvil used
execute unless entity @a[tag=SoundSpamOff] run playsound block.anvil.use master @a ~ ~ ~ 0 1 0

# Anvil landed
execute unless entity @a[tag=SoundSpamOff] run playsound block.anvil.land master @a ~ ~ ~ 0 1 0

# Block broken
execute unless entity @a[tag=SoundSpamOff] run playsound block.glass.break master @a ~ ~ ~ 0 1 0

# Block breaking
execute unless entity @a[tag=SoundSpamOff] run playsound entity.armorstand.hit master @a ~ ~ ~ 0 1 0

# Block placed
execute unless entity @a[tag=SoundSpamOff] run playsound block.glass.place master @a ~ ~ ~ 0 1 0