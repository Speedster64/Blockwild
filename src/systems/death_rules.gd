class_name DeathRules
extends RefCounted

enum InventoryLoss { KEEP, PARTIAL, DROP_ALL }

var inventory_loss := InventoryLoss.DROP_ALL

func split_inventory(slots: Array[Dictionary]) -> Dictionary:
	match inventory_loss:
		InventoryLoss.KEEP:
			return {"kept": slots.duplicate(true), "dropped": []}
		InventoryLoss.PARTIAL:
			var kept: Array[Dictionary] = []
			var dropped: Array[Dictionary] = []
			for i in slots.size():
				(kept if i % 2 == 0 else dropped).append(slots[i].duplicate(true))
			return {"kept": kept, "dropped": dropped}
		_:
			return {"kept": [], "dropped": slots.duplicate(true)}
