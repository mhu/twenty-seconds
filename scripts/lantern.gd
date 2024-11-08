extends PointLight2D


func _ready() -> void:
    var tween = get_tree().create_tween().set_loops()
    tween.tween_property(self, "scale", Vector2(3.0, 3.0), 3.0)
    tween.tween_property(self, "scale", Vector2(4.0, 4.0), 3.0)
