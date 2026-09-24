class_name Survival
extends RefCounted

const MAX_HEALTH := 100.0
const MAX_HUNGER := 100.0
const MAX_STAMINA := 100.0

var health := MAX_HEALTH
var hunger := MAX_HUNGER
var stamina := MAX_STAMINA
var _recent_damage := 0.0

func tick(delta: float, sprinting: bool) -> void:
	_recent_damage = maxf(0.0, _recent_damage - delta)
	hunger = maxf(0.0, hunger - delta * 0.035)
	var stamina_delta := -18.0 if sprinting else 14.0
	stamina = clampf(stamina + stamina_delta * delta, 0.0, MAX_STAMINA)
	if hunger > 65.0 and _recent_damage <= 0.0:
		health = minf(MAX_HEALTH, health + delta * 1.0)
	elif hunger <= 0.0:
		health = maxf(0.0, health - delta * 0.5)

func damage(amount: float) -> void:
	health = maxf(0.0, health - maxf(0.0, amount))
	_recent_damage = 8.0

func consume(nutrition: float) -> void:
	hunger = minf(MAX_HUNGER, hunger + maxf(0.0, nutrition))
