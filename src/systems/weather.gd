class_name WeatherSystem
extends RefCounted

enum Weather { CLEAR, RAIN, HEAVY_RAIN, THUNDERSTORM, SNOW, FOG, SANDSTORM }

var current := Weather.CLEAR
var remaining := 180.0
var _rng := RandomNumberGenerator.new()

func _init(seed_value: int) -> void:
	_rng.seed = seed_value

func tick(delta: float, biome: String) -> bool:
	remaining -= delta
	if remaining > 0.0:
		return false
	current = _choose_weather(biome)
	remaining = _rng.randf_range(120.0, 420.0)
	return true

func _choose_weather(biome: String) -> Weather:
	var roll := _rng.randf()
	if biome == "frostlands":
		return Weather.SNOW if roll < 0.65 else Weather.FOG
	if biome == "sunscar_desert":
		return Weather.SANDSTORM if roll < 0.2 else Weather.CLEAR
	if roll < 0.08:
		return Weather.THUNDERSTORM
	if roll < 0.28:
		return Weather.RAIN
	if roll < 0.38:
		return Weather.FOG
	return Weather.CLEAR
