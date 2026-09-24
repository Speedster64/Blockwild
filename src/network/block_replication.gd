class_name BlockReplication
extends RefCounted

static func encode_delta(position: Vector3i, block_id: int) -> PackedInt32Array:
	return PackedInt32Array([position.x, position.y, position.z, block_id])

static func decode_delta(data: PackedInt32Array) -> Dictionary:
	if data.size() != 4:
		return {}
	return {
		"position": Vector3i(data[0], data[1], data[2]),
		"block_id": data[3],
	}
