class_name PerformanceBudget
extends RefCounted

const TARGET_FPS := 60
const TARGET_FRAME_MS := 1000.0 / TARGET_FPS
const DEFAULT_RENDER_DISTANCE := 6
const MAX_RENDER_DISTANCE := 16
const MAX_CHUNK_REBUILDS_PER_FRAME := 2
const MAX_NETWORK_BLOCK_DELTAS_PER_PACKET := 128

static func over_frame_budget(frame_ms: float) -> bool:
	return frame_ms > TARGET_FRAME_MS
