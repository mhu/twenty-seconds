extends RayCast2D

@onready var enemies: Node = $"/root/Main/Enemies"

func _ready() -> void:
    pass


func _process(_delta: float) -> void:
    if not Input.is_action_just_pressed("fire"):
        return

    var collider = get_collider()

    if not collider:
        return

    if collider in enemies.get_children():
        collider.queue_free()
