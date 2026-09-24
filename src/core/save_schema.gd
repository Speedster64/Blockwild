class_name SaveSchema
extends RefCounted

const CURRENT_SCHEMA := 3

static func migrate(data: Dictionary) -> Dictionary:
	var version := int(data.get("schema", 1))
	var result := data.duplicate(true)
	if version < 2:
		result["world_rules"] = result.get("world_rules", {})
		version = 2
	if version < 3:
		result["discovered_recipes"] = result.get("discovered_recipes", [])
		version = 3
	result["schema"] = CURRENT_SCHEMA
	return result
