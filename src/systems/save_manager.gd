class_name SaveManager
extends RefCounted

const SAVE_DIR := "user://worlds"

static func save_world_metadata(world_name: String, world_seed: int, version: String) -> Error:
	DirAccess.make_dir_recursive_absolute(SAVE_DIR)
	var path := "%s/%s.json" % [SAVE_DIR, world_name.validate_filename()]
	var file := FileAccess.open(path, FileAccess.WRITE)
	if file == null:
		return FileAccess.get_open_error()
	file.store_string(JSON.stringify({
		"name": world_name,
		"seed": world_seed,
		"version": version,
		"saved_unix": Time.get_unix_time_from_system(),
	}, "\t"))
	return OK

static func load_world_metadata(world_name: String) -> Dictionary:
	var path := "%s/%s.json" % [SAVE_DIR, world_name.validate_filename()]
	if not FileAccess.file_exists(path):
		return {}
	var file := FileAccess.open(path, FileAccess.READ)
	if file == null:
		return {}
	var parsed := JSON.parse_string(file.get_as_text())
	return parsed if parsed is Dictionary else {}
