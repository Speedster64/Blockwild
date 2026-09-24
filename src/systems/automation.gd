class_name Automation
extends RefCounted

static func route_item(item: Dictionary, outputs: Array[Dictionary]) -> int:
	for i in outputs.size():
		var filter: Array = outputs[i].get("filter", [])
		if filter.is_empty() or str(item.get("id", "")) in filter:
			if int(outputs[i].get("free", 0)) > 0:
				return i
	return -1
