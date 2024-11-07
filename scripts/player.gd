extends CharacterBody2D

@export var speed = 500


func _ready() -> void:
    pass


func _process(_delta: float) -> void:
    var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

    if direction.x > 0:
        $AnimatedSprite2D.flip_h = true
    elif direction.x < 0:
        $AnimatedSprite2D.flip_h = false

    velocity = direction * speed
    move_and_slide()
