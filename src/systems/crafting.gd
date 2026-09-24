class_name Crafting
extends RefCounted

const RECIPES := {
	"torch": {"station": "hand", "inputs": {"wood": 1, "plant_fiber": 1}, "count": 4},
	"stone_pickaxe": {"station": "hand", "inputs": {"wood": 2, "stone": 3}, "count": 1},
	"workbench": {"station": "hand", "inputs": {"wood": 4}, "count": 1},
	"iron_ingot": {"station": "forge", "inputs": {"iron_ore": 1}, "count": 1},
	"glass": {"station": "forge", "inputs": {"sand": 2}, "count": 1},
}

static func can_craft(recipe_id: String, inventory_counts: Dictionary, station: String) -> bool:
	var recipe: Dictionary = RECIPES.get(recipe_id, {})
	if recipe.is_empty() or recipe.get("station", "") != station:
		return false
	for item_id in recipe["inputs"]:
		if int(inventory_counts.get(item_id, 0)) < int(recipe["inputs"][item_id]):
			return false
	return true
