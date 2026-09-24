class_name Combat
extends RefCounted

const WEAPONS := {
	"sword": {"damage": 18.0, "speed": 1.0, "reach": 3.0, "stun": 0.0},
	"axe": {"damage": 24.0, "speed": 0.75, "reach": 3.0, "stun": 0.1},
	"spear": {"damage": 16.0, "speed": 0.9, "reach": 4.2, "stun": 0.0},
	"hammer": {"damage": 30.0, "speed": 0.55, "reach": 2.7, "stun": 0.65},
	"bow": {"damage": 15.0, "speed": 0.7, "reach": 32.0, "stun": 0.0},
}

static func profile(weapon_id: String) -> Dictionary:
	return WEAPONS.get(weapon_id, {})
