# QwertyuiopThePie made this one! Help from Suso and FVbico.
# Function is run on each player at 20hz while they are flying.

# Old method, no longer used
# What was new is now old
#scoreboard players operation @s old_pos_x = @s cur_pos_x
#scoreboard players operation @s old_pos_y = @s cur_pos_y
#scoreboard players operation @s old_pos_z = @s cur_pos_z

# Grab the new co-ords
#execute store result score @s cur_pos_x run data get entity @s Pos[0] 10
#execute store result score @s cur_pos_y run data get entity @s Pos[1] 10
#execute store result score @s cur_pos_z run data get entity @s Pos[2] 10

# Subtract!
#scoreboard players operation @s pos_inc_x = @s cur_pos_x
#scoreboard players operation @s pos_inc_y = @s cur_pos_y
#scoreboard players operation @s pos_inc_z = @s cur_pos_z
#scoreboard players operation @s pos_inc_x -= @s old_pos_x
#scoreboard players operation @s pos_inc_y -= @s old_pos_y
#scoreboard players operation @s pos_inc_z -= @s old_pos_z

# Divide!
#scoreboard players operation @s pos_inc_x /= elytra_check_level const
#scoreboard players operation @s pos_inc_y /= elytra_check_level const
#scoreboard players operation @s pos_inc_z /= elytra_check_level const

# Make the tracer
execute if entity @s[nbt={OnGround:0b}] run summon minecraft:area_effect_cloud ~ ~ ~ {Duration:5,Tags:["elytra_trace"]}

# Position the tracer
tag @s[nbt={OnGround:0b}] add tracee
execute store result entity @e[tag=elytra_trace,limit=1] Pos[0] double 0.1 run scoreboard players get @s pos_x
execute store result entity @e[tag=elytra_trace,limit=1] Pos[1] double 0.1 run scoreboard players get @s pos_y
execute store result entity @e[tag=elytra_trace,limit=1] Pos[2] double 0.1 run scoreboard players get @s pos_z
execute as @e[tag=elytra_trace] at @s run teleport @s ^ ^ ^ facing entity @p[tag=tracee] feet

# Start the check loop
execute as @e[tag=elytra_trace,sort=nearest,limit=1] at @s run function d3:elytra/check_step

# Store the new coordinates
execute store result score @s pos_x run data get entity @s Pos[0] 10
execute store result score @s pos_y run data get entity @s Pos[1] 10
execute store result score @s pos_z run data get entity @s Pos[2] 10

# Reset
tag @s remove tracee