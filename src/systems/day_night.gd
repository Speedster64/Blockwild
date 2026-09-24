class_name DayNightClock
extends RefCounted

const DAY_SECONDS := 24.0 * 60.0
var time_seconds := 8.0 * 60.0

func tick(delta: float) -> void:
	time_seconds = fposmod(time_seconds + delta, DAY_SECONDS)

func normalized_time() -> float:
	return time_seconds / DAY_SECONDS

func phase() -> String:
	var minute := normalized_time() * 24.0 * 60.0
	if minute < 6.0 * 60.0:
		return "night"
	if minute < 8.0 * 60.0:
		return "dawn"
	if minute < 22.0 * 60.0:
		return "day"
	return "night"
