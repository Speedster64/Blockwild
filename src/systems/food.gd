class_name Food
extends RefCounted

const FOODS := {
	"berries": {"nutrition": 8.0, "buff": ""},
	"cooked_meat": {"nutrition": 24.0, "buff": ""},
	"hunter_stew": {"nutrition": 35.0, "buff": "max_stamina"},
	"mountain_soup": {"nutrition": 30.0, "buff": "cold_resistance"},
	"miner_meal": {"nutrition": 32.0, "buff": "mining_speed"},
}

static func data(item_id: String) -> Dictionary:
	return FOODS.get(item_id, {})
