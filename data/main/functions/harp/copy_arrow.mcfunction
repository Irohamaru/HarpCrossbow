#nbtをマージ
execute if score #IsFirework Number matches 0 run summon minecraft:arrow ~ ~ ~ {Tags:[CopiedHarpArrow]}
execute if score #IsFirework Number matches 1 run summon minecraft:firework_rocket ~ ~ ~ {Tags:[CopiedHarpArrow]}
data modify entity @e[tag=CopiedHarpArrow,limit=1,distance=..2] {} merge from storage arrow Arrow
#ベクトル計算して代入
#Crossbowの矢の速度が3.15 = 3150 / 1000
tp @s ^ ^ ^1
execute store result score #X1 Number run data get entity @s Pos[0] 3150
execute store result score #Y1 Number run data get entity @s Pos[1] 3150
execute store result score #Z1 Number run data get entity @s Pos[2] 3150

tp @s ^ ^ ^
execute store result score #X0 Number run data get entity @s Pos[0] 3150
execute store result score #Y0 Number run data get entity @s Pos[1] 3150
execute store result score #Z0 Number run data get entity @s Pos[2] 3150

scoreboard players operation #X1 Number -= #X0 Number
scoreboard players operation #Y1 Number -= #Y0 Number
scoreboard players operation #Z1 Number -= #Z0 Number

execute store result entity @e[tag=CopiedHarpArrow,limit=1,distance=..2] Motion[0] double 0.001 run scoreboard players get #X1 Number
execute store result entity @e[tag=CopiedHarpArrow,limit=1,distance=..2] Motion[1] double 0.001 run scoreboard players get #Y1 Number
execute store result entity @e[tag=CopiedHarpArrow,limit=1,distance=..2] Motion[2] double 0.001 run scoreboard players get #Z1 Number

tag @e[tag=CopiedHarpArrow,distance=..2] remove CopiedHarpArrow
