class_name Transport
extends RefCounted

const METHODS := {
	"walk": {"tier": 0, "infrastructure": false},
	"swim": {"tier": 0, "infrastructure": false},
	"boat": {"tier": 1, "infrastructure": false},
	"minecart": {"tier": 2, "infrastructure": true},
	"mount": {"tier": 2, "infrastructure": false},
	"glider": {"tier": 3, "infrastructure": false},
	"teleport_anchor": {"tier": 4, "infrastructure": true},
}
