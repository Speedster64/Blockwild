class_name Inventory
extends RefCounted

const SLOT_COUNT := 36
const STACK_LIMIT := 999

var slots: Array[Dictionary] = []

func _init() -> void:
	slots.resize(SLOT_COUNT)
	for i in SLOT_COUNT:
		slots[i] = {"id": "", "count": 0}

func add_item(item_id: String, amount: int) -> int:
	var remaining := amount
	for slot in slots:
		if slot["id"] == item_id and slot["count"] < STACK_LIMIT:
			var moved := min(STACK_LIMIT - int(slot["count"]), remaining)
			slot["count"] += moved
			remaining -= moved
			if remaining <= 0:
				return 0
	for slot in slots:
		if slot["count"] == 0:
			var moved := min(STACK_LIMIT, remaining)
			slot["id"] = item_id
			slot["count"] = moved
			remaining -= moved
			if remaining <= 0:
				return 0
	return remaining
