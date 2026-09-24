class_name Tutorial
extends RefCounted

const STEPS := ["gather_wood", "craft_tool", "build_shelter"]
var enabled := true
var completed: Dictionary = {}

func current_step() -> String:
	if not enabled:
		return ""
	for step in STEPS:
		if not bool(completed.get(step, false)):
			return step
	return ""

func complete(step: String) -> void:
	if step in STEPS:
		completed[step] = true
