extends Node

var current_level := 1

const LEVEL_SETTINGS = [
    {
        "player_speed": 500.0,
        "player_attack_range": 200.0,
        "lantern_range": 4.0,
    },
    {
        "player_speed": 200.0,
        "player_attack_range": 200.0,
        "lantern_range": 3.5,
    }
]

func get_settings_for_current_level() -> Dictionary:
    return LEVEL_SETTINGS[current_level - 1]
