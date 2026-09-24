class_name EnvironmentalEvents
extends RefCounted

const EVENTS := ["meteor", "migration", "rare_storm", "strange_night"]
var _rng := RandomNumberGenerator.new()
var cooldown := 900.0

func _init(seed_value: int) -> void:
	_rng.seed = seed_value ^ 0x5A17

func tick(delta: float) -> String:
	cooldown -= delta
	if cooldown > 0.0:
		return ""
	cooldown = _rng.randf_range(720.0, 1500.0)
	return EVENTS[_rng.randi_range(0, EVENTS.size() - 1)]
