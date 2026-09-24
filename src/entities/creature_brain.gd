class_name CreatureBrain
extends RefCounted

enum State { WANDER, EAT, SLEEP, HUNT, FLEE, DEFEND, GROUP }

var state := State.WANDER

func choose(context: Dictionary) -> State:
	if bool(context.get("threatened", false)) and float(context.get("health_ratio", 1.0)) < 0.35:
		state = State.FLEE
	elif bool(context.get("territory_intrusion", false)):
		state = State.DEFEND
	elif bool(context.get("prey_visible", false)):
		state = State.HUNT
	elif float(context.get("hunger", 0.0)) > 0.7:
		state = State.EAT
	elif bool(context.get("night", false)) and bool(context.get("sleeps_at_night", true)):
		state = State.SLEEP
	elif int(context.get("nearby_allies", 0)) >= 2:
		state = State.GROUP
	else:
		state = State.WANDER
	return state
