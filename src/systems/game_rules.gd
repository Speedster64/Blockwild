class_name GameRules
extends RefCounted

enum Mode { SURVIVAL, CREATIVE, PEACEFUL, CUSTOM }

var mode := Mode.SURVIVAL
var hunger_enabled := true
var hostile_creatures := true
var damage_enabled := true
var unlimited_blocks := false
var flight_enabled := false
var keep_inventory := false

func apply_mode(next_mode: Mode) -> void:
	mode = next_mode
	match mode:
		Mode.CREATIVE:
			hunger_enabled = false
			hostile_creatures = false
			damage_enabled = false
			unlimited_blocks = true
			flight_enabled = true
			keep_inventory = true
		Mode.PEACEFUL:
			hunger_enabled = true
			hostile_creatures = false
			damage_enabled = true
			unlimited_blocks = false
			flight_enabled = false
		Mode.SURVIVAL:
			hunger_enabled = true
			hostile_creatures = true
			damage_enabled = true
			unlimited_blocks = false
			flight_enabled = false
		Mode.CUSTOM:
			pass
