extends PointLight2D

var light_range: float


func _ready() -> void:
    apply_settings()

    var tween := get_tree().create_tween().set_loops()
    tween.tween_property(self, "scale", Vector2(light_range, light_range), 2.0)
    tween.tween_property(self, "scale", Vector2(light_range - 1.0, light_range - 1.0), 2.0)


func apply_settings() -> void:
    var settings := LevelSingleton.get_settings_for_current_level()
    light_range = settings.lantern_range
