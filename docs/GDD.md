# Blockwild Game Design Document

## High concept

Blockwild is an original voxel survival sandbox about exploring procedurally generated worlds, gathering resources, crafting tools, building freely, surviving environmental threats, discovering ruins, and cooperating with friends.

## Core loop

**Explore -> Gather -> Craft -> Build -> Survive -> Discover -> Upgrade -> Explore farther**

## Design pillars

### Freedom
Players choose their own objectives: building, exploration, farming, combat, automation, collection, or cooperation.

### Discovery
Terrain, caves, ruins, ecosystems, and environmental events should continually create reasons to travel.

### Creation
Building is a primary mechanic. Placement must be fast, predictable, grid-aligned, and expressive through full blocks, slabs, stairs, doors, beams, fences, windows, and decorative connections.

### Survival without busywork
Health, food, equipment, darkness, weather, and hostile creatures matter, but maintenance should not overwhelm exploration and construction.

### Emergent stories
Weather, fire, creatures, terrain, ruins, and multiplayer systems should interact in ways that produce unscripted memorable events.

## World

Worlds are deterministic from a seed and streamed in chunks. The initial biome set grows to include Greenlands, Pinewild, Sunscar Desert, Mire, Frostlands, and Ember Wastes. Terrain supports mountains, valleys, rivers, cliffs, waterfalls, islands, canyons, caves, underground lakes, crystal chambers, and ruins.

## Blocks and resources

Blocks describe hardness, preferred tools, transparency, light, flammability, drops, and physical behavior. Progression moves through primitive, copper/iron, advanced metal/crystal, and ancient/exotic technology. Higher tiers unlock capabilities, not only bigger numbers.

## Crafting and progression

Hand crafting covers essentials; stations unlock advanced recipes. Recipe knowledge comes from gathering, inspection, ruins, schematics, and experimentation. Character levels are avoided; progression comes from knowledge, tools, infrastructure, resources, and exploration.

## Survival

The player manages health and hunger. Food primarily restores hunger and prepared meals grant useful buffs. Farming supports crops, water-assisted growth, and later irrigation. A full day targets roughly 24 real-world minutes. Weather includes clear skies, rain, storms, snow, fog, and sandstorms.

## Creatures and combat

Creatures can wander, feed, sleep, hunt, flee, defend territory, and travel in groups. Combat supports melee, ranged attacks, blocking, charged attacks, and dodging. Passive, hostile, and elite creature families occupy different ecosystems.

## Exploration

Procedural ruins include towers, mines, temples, underground settlements, laboratories, bridges, and statues. Ruins combine enemies, traps, puzzles, resources, schematics, and environmental storytelling. Ancient technology eventually unlocks teleportation, item transport, scanners, energy, and advanced crafting.

## Simulation

Water flows downhill and supports irrigation and machinery. Fire spreads through flammable blocks and can be caused by players, lava, lightning, and creatures. Fire spread remains configurable to protect builder-focused worlds.

## Automation and logic

Late-game construction supports funnels, conveyors, filters, pumps, automatic crafting, switches, buttons, pressure plates, timers, sensors, and simple logic gates.

## Multiplayer

The initial goal is 1-8 players. World owners control PvP, building permissions, container access, explosions, fire spread, creature damage, and cheats. Multiplayer should support cooperative building, exploration, combat, storage, trading, and map pings.

## Modes

- Survival
- Creative
- Peaceful
- Custom

## Presentation

The art direction is stylized voxel art with original materials, silhouettes, vegetation, atmosphere, creatures, UI, audio, and lore. Blockwild must never reproduce Minecraft assets or presentation.

## Accessibility

The game supports control remapping, controller input, UI scaling, FOV adjustment, reduced camera shake/flashing, subtitles, audio sliders, and toggle/hold movement options. Color is never the sole carrier of critical information.

## Technical target

- Godot 4.4.1
- GDScript-first implementation
- 60 FPS at 1080p on recommended PC hardware
- Deterministic chunk generation
- Streamed world data
- Save deltas rather than full procedural terrain where practical
- Source-only GitHub releases

## Scope rule

Every proposed feature must materially improve **exploration, creation, survival, or social play**. Otherwise it is deferred.
