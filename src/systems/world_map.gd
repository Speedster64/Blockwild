class_name WorldMap
extends RefCounted

var revealed_chunks: Dictionary = {}
var markers: Array[Dictionary] = []

func reveal(chunk: Vector2i) -> void:
	revealed_chunks[chunk] = true

func add_marker(label: String, position: Vector3, kind := "custom") -> void:
	markers.append({"label": label, "position": position, "kind": kind})

func add_death_marker(position: Vector3) -> void:
	for i in range(markers.size() - 1, -1, -1):
		if markers[i].get("kind") == "death":
			markers.remove_at(i)
	add_marker("Last death", position, "death")
