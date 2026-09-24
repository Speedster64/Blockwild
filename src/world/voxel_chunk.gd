class_name VoxelChunk
extends MeshInstance3D

const SIZE_X := 32
const SIZE_Z := 32
const SIZE_Y := 64

var chunk_coord := Vector2i.ZERO
var _blocks := PackedInt32Array()
var _dirty := true
var _collision_body: StaticBody3D
var _collision_shape: CollisionShape3D

func _init() -> void:
	_blocks.resize(SIZE_X * SIZE_Y * SIZE_Z)
	_blocks.fill(BlockRegistry.BlockId.AIR)

func _ready() -> void:
	_collision_body = StaticBody3D.new()
	_collision_shape = CollisionShape3D.new()
	_collision_body.add_child(_collision_shape)
	add_child(_collision_body)
	_refresh_collision()

func index_of(x: int, y: int, z: int) -> int:
	return x + SIZE_X * (z + SIZE_Z * y)

func is_inside(x: int, y: int, z: int) -> bool:
	return x >= 0 and x < SIZE_X and y >= 0 and y < SIZE_Y and z >= 0 and z < SIZE_Z

func get_block(x: int, y: int, z: int) -> int:
	if not is_inside(x, y, z):
		return BlockRegistry.BlockId.AIR
	return _blocks[index_of(x, y, z)]

func set_block(x: int, y: int, z: int, block_id: int) -> void:
	if not is_inside(x, y, z):
		return
	var idx := index_of(x, y, z)
	if _blocks[idx] == block_id:
		return
	_blocks[idx] = block_id
	_dirty = true

func fill_from(generator: TerrainGenerator) -> void:
	for y in SIZE_Y:
		for z in SIZE_Z:
			for x in SIZE_X:
				var wx := chunk_coord.x * SIZE_X + x
				var wz := chunk_coord.y * SIZE_Z + z
				_blocks[index_of(x, y, z)] = generator.block_at(wx, y, wz)
	_dirty = true

func rebuild_mesh() -> void:
	if not _dirty:
		return
	var st := SurfaceTool.new()
	st.begin(Mesh.PRIMITIVE_TRIANGLES)
	for y in SIZE_Y:
		for z in SIZE_Z:
			for x in SIZE_X:
				var block_id := get_block(x, y, z)
				if not BlockRegistry.is_solid(block_id):
					continue
				_append_visible_faces(st, Vector3i(x, y, z))
	mesh = st.commit()
	_refresh_collision()
	_dirty = false

func _append_visible_faces(st: SurfaceTool, p: Vector3i) -> void:
	var dirs := [
		Vector3i(1, 0, 0), Vector3i(-1, 0, 0),
		Vector3i(0, 1, 0), Vector3i(0, -1, 0),
		Vector3i(0, 0, 1), Vector3i(0, 0, -1)
	]
	for d in dirs:
		var n := p + d
		if is_inside(n.x, n.y, n.z) and BlockRegistry.is_solid(get_block(n.x, n.y, n.z)):
			continue
		_append_face(st, Vector3(p), d)

func _append_face(st: SurfaceTool, p: Vector3, normal_i: Vector3i) -> void:
	var n := Vector3(normal_i)
	var up := Vector3.UP if abs(n.y) < 0.5 else Vector3.FORWARD
	var u := n.cross(up).normalized() * 0.5
	var v := n.cross(u).normalized() * 0.5
	var c := p + Vector3(0.5, 0.5, 0.5) + n * 0.5
	var a := c - u - v
	var b := c + u - v
	var d := c - u + v
	var e := c + u + v
	for vertex in [a, b, e, a, e, d]:
		st.set_normal(n)
		st.add_vertex(vertex)

func _refresh_collision() -> void:
	if _collision_shape == null:
		return
	if mesh == null or mesh.get_surface_count() == 0:
		_collision_shape.shape = null
		return
	_collision_shape.shape = mesh.create_trimesh_shape()
