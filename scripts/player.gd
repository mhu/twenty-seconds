extends CharacterBody2D

@onready var enemies := $"../Enemies"

@export var speed := 500.0
@export var attack_range := 200.0


func _ready() -> void:
    pass


func _process(_delta: float) -> void:
    if position.x > get_global_mouse_position().x:
        $AnimatedSprite2D.flip_h = false
    elif position.x < get_global_mouse_position().x:
        $AnimatedSprite2D.flip_h = true

    var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
    velocity = direction * speed
    move_and_slide()

    var enemy := get_closest_enemy_in_range()
    if enemy == null:
        return


func get_closest_enemy_in_range() -> CharacterBody2D:
    if enemies == null:
        return

    var closest_enemy: CharacterBody2D = null
    var closest_enemy_range: float = INF

    for enemy in enemies.get_children():
        if position.distance_to(enemy.position) < attack_range and position.distance_to(enemy.position) < closest_enemy_range:
            closest_enemy = enemy
            closest_enemy_range = position.distance_to(enemy.position)

    return closest_enemy
