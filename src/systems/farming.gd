class_name Farming
extends RefCounted

const CROPS := {
	"grain": {"growth_seconds": 420.0, "yield": 3},
	"root": {"growth_seconds": 360.0, "yield": 2},
	"berry": {"growth_seconds": 540.0, "yield": 4},
	"herb": {"growth_seconds": 300.0, "yield": 2},
	"mushroom": {"growth_seconds": 480.0, "yield": 3},
}

static func advance(plot: Dictionary, delta: float, near_water: bool) -> void:
	var crop_id := str(plot.get("crop", ""))
	if not CROPS.has(crop_id):
		return
	var multiplier := 1.25 if near_water else 1.0
	plot["growth"] = minf(float(CROPS[crop_id]["growth_seconds"]), float(plot.get("growth", 0.0)) + delta * multiplier)

static func is_ready(plot: Dictionary) -> bool:
	var crop_id := str(plot.get("crop", ""))
	return CROPS.has(crop_id) and float(plot.get("growth", 0.0)) >= float(CROPS[crop_id]["growth_seconds"])
