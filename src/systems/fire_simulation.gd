class_name FireSimulation
extends RefCounted

var spread_enabled := true
var burning: Dictionary = {}

func ignite(position: Vector3i, lifetime := 12.0) -> void:
	burning[position] = maxf(float(burning.get(position, 0.0)), lifetime)

func extinguish(position: Vector3i) -> void:
	burning.erase(position)

func tick(delta: float, flammable_neighbors: Callable) -> Array[Vector3i]:
	var ignitions: Array[Vector3i] = []
	for p in burning.keys():
		burning[p] = float(burning[p]) - delta
		if burning[p] <= 0.0:
			burning.erase(p)
			continue
		if not spread_enabled:
			continue
		for n in flammable_neighbors.call(p):
			if not burning.has(n):
				ignitions.append(n)
	for p in ignitions:
		ignite(p)
	return ignitions
