# Blockwild Architecture

Blockwild is a Godot 4.4.1 project organized around independent modules.

## Runtime layers

1. **Core** — bootstrapping, game state, settings, event coordination.
2. **World** — block registry, chunk storage, terrain, caves, biomes, structures, fluids, fire, lighting.
3. **Player** — movement, camera, interaction, inventory, equipment.
4. **Systems** — crafting, survival, farming, map, automation, logic, saves, accessibility, tutorials.
5. **Entities** — passive, hostile, and elite creatures.
6. **Networking** — host-authoritative synchronization and world permissions.
7. **UI** — HUD and menus.

## Voxel conventions

- Chunk horizontal size: **32 x 32** blocks.
- Initial vertical simulation span: **128** blocks per chunk.
- Block IDs are integers resolved through a central registry.
- Procedural terrain is deterministic from the world seed.
- Only changed voxel data is intended to be persisted long-term.
- Chunk meshes omit hidden faces and are rebuilt only when dirty.
- Expensive work is structured so it can later be moved off the main thread without changing gameplay APIs.

## Compatibility

The repository targets **Godot 4.4.1 stable**. Engine upgrades are deliberate migrations rather than automatic version drift.
