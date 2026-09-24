class_name WorldPermissions
extends RefCounted

var pvp := false
var allow_building := true
var allow_container_access := true
var allow_explosions := true
var allow_fire_spread := true
var creature_damage := true
var cheats := false

func to_dict() -> Dictionary:
	return {
		"pvp": pvp,
		"allow_building": allow_building,
		"allow_container_access": allow_container_access,
		"allow_explosions": allow_explosions,
		"allow_fire_spread": allow_fire_spread,
		"creature_damage": creature_damage,
		"cheats": cheats,
	}
