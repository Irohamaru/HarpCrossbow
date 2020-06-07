tag @e[type=arrow,distance=..2,tag=] add HarpArrow
execute store success score #IsFirework Number run tag @e[type=firework_rocket,distance=..2,tag=] add HarpArrow
execute as @e[tag=HarpArrow,distance=..2] run data modify entity @s SoundEvent set value "minecraft:block.note_block.harp"
#マージ用データ
data modify storage arrow Arrow set from entity @e[tag=HarpArrow,distance=..2,limit=1] {}
data modify storage arrow Arrow.Tags set value [HarpArrow,CopiedHarpArrow]
data modify storage arrow Arrow.pickup set value 0b
data remove storage arrow Arrow.Pos
#ベクトル計算用AEC
execute positioned as @e[tag=HarpArrow,distance=..2,limit=1] run summon minecraft:area_effect_cloud ~ ~ ~ {Tags:[HarpAEC],Duration:1}

execute unless data entity @s SelectedItem.tag.Enchantments[{id:"minecraft:multishot"}] as @e[tag=HarpAEC,distance=..2,limit=1,sort=nearest] positioned as @s rotated ~10 ~ run function main:harp/copy_arrow
execute unless data entity @s SelectedItem.tag.Enchantments[{id:"minecraft:multishot"}] as @e[tag=HarpAEC,distance=..2,limit=1,sort=nearest] positioned as @s rotated ~-10 ~ run function main:harp/copy_arrow
execute as @e[tag=HarpAEC,distance=..2,limit=1,sort=nearest] positioned as @s rotated ~20 ~ run function main:harp/copy_arrow
execute as @e[tag=HarpAEC,distance=..2,limit=1,sort=nearest] positioned as @s rotated ~-20 ~ run function main:harp/copy_arrow
execute if data entity @s SelectedItem.tag.Enchantments[{id:"minecraft:multishot"}] as @e[tag=HarpAEC,distance=..2,limit=1,sort=nearest] positioned as @s rotated ~30 ~ run function main:harp/copy_arrow
execute if data entity @s SelectedItem.tag.Enchantments[{id:"minecraft:multishot"}] as @e[tag=HarpAEC,distance=..2,limit=1,sort=nearest] positioned as @s rotated ~-30 ~ run function main:harp/copy_arrow

playsound minecraft:block.note_block.harp master @s ~ ~ ~ 1 1
