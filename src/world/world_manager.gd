class_name WorldManager
extends Node3D

@export var world_seed := 1337
@export_range(1, 8) var render_radius := 2

var _generator: TerrainGenerator
var _chunks: Dictionary = {}

func _ready() -> void:
	_generator = TerrainGenerator.new(world_seed)
	_ensure_chunks(Vector2i.ZERO)

func _process(_delta: float) -> void:
	var player := get_tree().get_first_node_in_group("player")
	if player == null:
		return
	var center := Vector2i(
		floori(player.global_position.x / VoxelChunk.SIZE_X),
		floori(player.global_position.z / VoxelChunk.SIZE_Z)
	)
	_ensure_chunks(center)

func _ensure_chunks(center: Vector2i) -> void:
	var needed := {}
	for z in range(center.y - render_radius, center.y + render_radius + 1):
		for x in range(center.x - render_radius, center.x + render_radius + 1):
			var coord := Vector2i(x, z)
			needed[coord] = true
			if not _chunks.has(coord):
				_create_chunk(coord)
	for coord in _chunks.keys():
		if not needed.has(coord):
			_chunks[coord].queue_free()
			_chunks.erase(coord)

func _create_chunk(coord: Vector2i) -> void:
	var chunk := VoxelChunk.new()
	chunk.chunk_coord = coord
	chunk.position = Vector3(coord.x * VoxelChunk.SIZE_X, 0, coord.y * VoxelChunk.SIZE_Z)
	chunk.fill_from(_generator)
	chunk.rebuild_mesh()
	add_child(chunk)
	_chunks[coord] = chunk

func get_chunk(coord: Vector2i) -> VoxelChunk:
	return _chunks.get(coord)

func set_world_block(world_pos: Vector3i, block_id: int) -> void:
	var cx := floori(float(world_pos.x) / VoxelChunk.SIZE_X)
	var cz := floori(float(world_pos.z) / VoxelChunk.SIZE_Z)
	var coord := Vector2i(cx, cz)
	var chunk := get_chunk(coord)
	if chunk == null:
		return
	var lx := posmod(world_pos.x, VoxelChunk.SIZE_X)
	var lz := posmod(world_pos.z, VoxelChunk.SIZE_Z)
	chunk.set_block(lx, world_pos.y, lz, block_id)
	chunk.rebuild_mesh()
