extends Node

var current_level := 1
var timer: Timer

const GAME_SETTINGS = {
    "level_time_seconds": 20,
}

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


func start_level_timer() -> void:
    timer = Timer.new()
    timer.wait_time = GAME_SETTINGS.level_time_seconds
    timer.set_one_shot(true)
    timer.autostart = true
    timer.timeout.connect(_on_level_timer_timeout)
    add_child(timer)


func get_remaining_level_time() -> float:
    return timer.time_left


func _on_level_timer_timeout() -> void:
    print("TIME OUT")


func get_settings_for_current_level() -> Dictionary:
    return LEVEL_SETTINGS[current_level - 1]
