class_name FluidCell
extends RefCounted

const MAX_LEVEL := 8

static func next_steps(level: int, below_open: bool, side_levels: Array[int]) -> Dictionary:
	level = clampi(level, 0, MAX_LEVEL)
	if level == 0:
		return {"down": 0, "sides": []}
	if below_open:
		return {"down": level, "sides": []}
	var out: Array[int] = []
	var remaining := level
	for neighbor_level in side_levels:
		var transferable := maxi(0, int(floor((remaining - neighbor_level) / 2.0)))
		var moved := mini(transferable, remaining)
		out.append(moved)
		remaining -= moved
	return {"down": 0, "sides": out}
