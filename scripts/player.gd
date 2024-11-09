extends CharacterBody2D

var empty_heart_texture: Texture = preload("res://assets/heart_empty.png")
var damage_cooldown_timer: Timer

@onready var heart_nodes := $Health
@onready var enemies := $"../Enemies"

@export var health := 3
@export var speed: float
@export var attack_range: float


func _ready() -> void:
    damage_cooldown_timer = Timer.new()
    damage_cooldown_timer.wait_time = 1.0
    damage_cooldown_timer.one_shot = true
    add_child(damage_cooldown_timer)

    var settings := LevelSingleton.get_settings_for_current_level()
    speed = settings.player_speed
    attack_range = settings.player_attack_range


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


func take_damage() -> void:
    if health == 0:  # TODO: show game over screen
        return

    if not damage_cooldown_timer.is_stopped():
        return

    health -= 1
    heart_nodes.get_children()[health].set_texture(empty_heart_texture)
    damage_cooldown_timer.start()
