# Minetest Mod - Floating Factories Magic Staffs

Version 1.0.0  
Requires Minetest 0.4.16 or higher  
(It may work on older Minetest versions, but they're not a priority.)  

## Description
A mod for Minetest that is mostly meant for a sub game I'm working on, Floating Factories, but was segmented to allow easier use outside of the sub game. Doing this will hopefully encourage more people to use it, report bugs, and help fix code.

There are 5 main staff types.
1. Staff of Structure - Similar to the Builder's Wand mod in Minecraft.
2. Staff of Earth - Turns default:dirt to default:dirt_with_grass, grows default:grass_1 on default:dirt_with_grass blocks, and duplicates any node that is part of the "flora" group.
3. Staff of Ice - Turns default:water_source into default:ice.
4. Staff of Magma - Turns default:cobble into default:lava_source.
5. Staff of Lightning - Casts a powerful lightning bolt. Don't stand too close where you click!

## Installation
After downloading, rename the folder to ff_magic_staffs.

## Licensing
All code and textures are created by isaiah658.  
The code is licensed as WTFPL or MIT. You may choose either license that fits best when adapting code into your project.  
The textures are licensed as Creative Commons Zero (CC0). 

## Crafting Recipes 

The red, blue, green, and yellow gems are rare drops when digging default:desert_sand.  

Stone Staff of Structure  

| ---------------- | **default:cobble** | **default:cobble** |
| ---------------- | ------------------ | ------------------ |
| ---------------- | **group:stick** | **default:cobble**  |
| **group:stick**  | --------------- | ------------------- |


Steel Staff of Structure

| ---------------- | **default:steel_ingot** | **default:steel_ingot** |
| ---------------- | ------------------ | ------------------ |
| ---------------- | **group:stick** | **default:steel_ingot**  |
| **group:stick**  | --------------- | ------------------- |


Mese Staff of Structure

| ---------------- | **default:mese_crystal_fragment** | **default:mese_crystal_fragment** |
| ---------------- | ------------------ | ------------------ |
| ---------------- | **group:stick** | **default:mese_crystal_fragment**  |
| **group:stick**  | --------------- | ------------------- |


Kovar Staff of Structure (Only if the floating_factories mod is installed)

| ---------------- | **default:mese_crystal_fragment** | **default:mese_crystal_fragment** |
| ---------------- | ------------------ | ------------------ |
| ---------------- | **group:stick** | **default:mese_crystal_fragment**  |
| **group:stick**  | --------------- | ------------------- |


Staff of Earth (group:stick is floating_factories:invar_rod if floating_factories is installed)

| ---------------- | ------------------ | **ff_magic_staffs:green_gem** |
| ---------------- | ------------------ | ------------------ |
| ---------------- | **group:stick** | --------------------  |
| **group:stick**  | --------------- | ------------------- |


Staff of Ice (group:stick is floating_factories:invar_rod if floating_factories is installed)

| ---------------- | ------------------ | **ff_magic_staffs:blue_gem** |
| ---------------- | ------------------ | ------------------ |
| ---------------- | **group:stick** | --------------------  |
| **group:stick**  | --------------- | ------------------- |


Staff of Red (group:stick is floating_factories:invar_rod if floating_factories is installed)

| ---------------- | ------------------ | **ff_magic_staffs:red_gem** |
| ---------------- | ------------------ | ------------------ |
| ---------------- | **group:stick** | --------------------  |
| **group:stick**  | --------------- | ------------------- |


Staff of Yellow (group:stick is floating_factories:invar_rod if floating_factories is installed)  
(only available if lightning mod is installed)

| ---------------- | ------------------ | **ff_magic_staffs:yellow_gem** |
| ---------------- | ------------------ | ------------------ |
| ---------------- | **group:stick** | --------------------  |
| **group:stick**  | --------------- | ------------------- |
