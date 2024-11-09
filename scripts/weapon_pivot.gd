extends Marker2D

@onready var wand: Sprite2D = $Wand


func _ready() -> void:
    pass


func _process(_delta: float) -> void:
    position = (get_global_mouse_position() - $"..".global_position).normalized() * 15

    if position.x < 0.0:
        wand.flip_v = true
    elif position.x > 0.0:
        wand.flip_v = false

    look_at(get_global_mouse_position())
