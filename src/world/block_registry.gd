class_name BlockRegistry
extends RefCounted

enum BlockId {
	AIR = 0,
	GRASS = 1,
	DIRT = 2,
	STONE = 3,
	SAND = 4,
	WOOD = 5,
	LEAVES = 6,
}

const BLOCKS := {
	BlockId.AIR: {"name": "Air", "solid": false, "hardness": 0.0},
	BlockId.GRASS: {"name": "Grass", "solid": true, "hardness": 0.6},
	BlockId.DIRT: {"name": "Dirt", "solid": true, "hardness": 0.5},
	BlockId.STONE: {"name": "Stone", "solid": true, "hardness": 1.5},
	BlockId.SAND: {"name": "Sand", "solid": true, "hardness": 0.5},
	BlockId.WOOD: {"name": "Wood", "solid": true, "hardness": 1.0},
	BlockId.LEAVES: {"name": "Leaves", "solid": true, "hardness": 0.2},
}

static func is_solid(block_id: int) -> bool:
	return bool(BLOCKS.get(block_id, BLOCKS[BlockId.AIR]).get("solid", false))

static func get_name(block_id: int) -> String:
	return str(BLOCKS.get(block_id, BLOCKS[BlockId.AIR]).get("name", "Unknown"))
