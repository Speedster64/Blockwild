class_name AudioDirector
extends RefCounted

const MUSIC_TRIGGERS := {
	"sunrise": "dawn_theme",
	"biome_discovery": "discovery_theme",
	"ruin_entry": "ruin_theme",
	"elite_combat": "elite_theme",
	"deep_underground": "depth_theme",
}

const AMBIENCE := ["wind", "birds", "insects", "cave_echoes", "distant_creatures", "water", "weather"]

static func music_for(event: String) -> String:
	return str(MUSIC_TRIGGERS.get(event, ""))
