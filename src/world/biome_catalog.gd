class_name BiomeCatalog
extends RefCounted

const BIOMES := {
	"greenlands": {"threat": 1, "temperature": 0.6, "rainfall": 0.6, "resources": ["wood", "berries", "copper"]},
	"pinewild": {"threat": 2, "temperature": 0.35, "rainfall": 0.7, "resources": ["dense_wood", "resin", "mushroom"]},
	"sunscar_desert": {"threat": 2, "temperature": 0.95, "rainfall": 0.05, "resources": ["sand", "salt", "cactus_fiber", "ancient_fragment"]},
	"mire": {"threat": 3, "temperature": 0.65, "rainfall": 0.95, "resources": ["reed", "clay", "herb", "toxic_fungus"]},
	"frostlands": {"threat": 3, "temperature": 0.05, "rainfall": 0.45, "resources": ["ice_crystal", "silver", "fur"]},
	"ember_wastes": {"threat": 5, "temperature": 1.0, "rainfall": 0.0, "resources": ["obsidian", "emberstone", "ancient_alloy"]},
}

static func data(id: String) -> Dictionary:
	return BIOMES.get(id, BIOMES["greenlands"])
