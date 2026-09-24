class_name LogicNetwork
extends RefCounted

static func evaluate(kind: String, inputs: Array[bool]) -> bool:
	match kind:
		"and":
			for value in inputs:
				if not value:
					return false
			return not inputs.is_empty()
		"or":
			for value in inputs:
				if value:
					return true
			return false
		"not":
			return not inputs[0] if not inputs.is_empty() else true
		_:
			return inputs[0] if not inputs.is_empty() else false
