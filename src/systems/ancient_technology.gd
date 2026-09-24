class_name AncientTechnology
extends RefCounted

const UNLOCKS := {
	"scanner": {"fragments": 3, "requires": []},
	"item_transporter": {"fragments": 8, "requires": ["scanner"]},
	"energy_core": {"fragments": 12, "requires": ["scanner"]},
	"teleport_anchor": {"fragments": 18, "requires": ["energy_core"]},
	"advanced_fabricator": {"fragments": 24, "requires": ["item_transporter", "energy_core"]},
}

static func can_unlock(id: String, fragments: int, unlocked: Dictionary) -> bool:
	var data: Dictionary = UNLOCKS.get(id, {})
	if data.is_empty() or fragments < int(data["fragments"]):
		return false
	for requirement in data["requires"]:
		if not bool(unlocked.get(requirement, false)):
			return false
	return true
