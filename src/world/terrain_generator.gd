class_name TerrainGenerator
extends RefCounted

var _noise := FastNoiseLite.new()
var _seed := 0

func _init(world_seed: int) -> void:
	_seed = world_seed
	_noise.seed = world_seed
	_noise.noise_type = FastNoiseLite.TYPE_SIMPLEX_SMOOTH
	_noise.frequency = 0.015
	_noise.fractal_type = FastNoiseLite.FRACTAL_FBM
	_noise.fractal_octaves = 4

func surface_height(world_x: int, world_z: int) -> int:
	var broad := _noise.get_noise_2d(float(world_x), float(world_z))
	return 24 + int(round(broad * 10.0))

func block_at(world_x: int, world_y: int, world_z: int) -> int:
	var top := surface_height(world_x, world_z)
	if world_y > top:
		return BlockRegistry.BlockId.AIR
	if world_y == top:
		return BlockRegistry.BlockId.GRASS if top > 20 else BlockRegistry.BlockId.SAND
	if world_y >= top - 3:
		return BlockRegistry.BlockId.DIRT
	return BlockRegistry.BlockId.STONE
