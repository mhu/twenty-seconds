extends CharacterBody2D

@onready var player: CharacterBody2D = get_node("/root/Main/Player")
var speed := 100.0


func _ready() -> void:
    pass


func _process(delta: float) -> void:
    handle_movement(delta)


func handle_movement(delta: float) -> void:
    var direction := (player.global_position - global_position).normalized()
    move_and_collide(direction * speed * delta)
