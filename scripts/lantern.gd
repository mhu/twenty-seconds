extends PointLight2D

var range: float


func _ready() -> void:
    apply_settings()

    var tween := get_tree().create_tween().set_loops()
    tween.tween_property(self, "scale", Vector2(range, range), 2.0)
    tween.tween_property(self, "scale", Vector2(range - 1.0, range - 1.0), 2.0)


func apply_settings() -> void:
    var settings = LevelSingleton.get_settings_for_current_level()
    range = settings.lantern_range
