class_name AccessibilitySettings
extends RefCounted

var ui_scale := 1.0
var field_of_view := 75.0
var camera_shake := 1.0
var reduced_flashing := false
var subtitles := true
var sprint_toggle := false
var crouch_toggle := false

func sanitize() -> void:
	ui_scale = clampf(ui_scale, 0.75, 2.0)
	field_of_view = clampf(field_of_view, 60.0, 110.0)
	camera_shake = clampf(camera_shake, 0.0, 1.0)
