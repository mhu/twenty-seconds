extends Node

@onready var loaded_enemy: Resource
@onready var player := $Player
@onready var enemies := $Enemies
var spawn_distance_to_player: float = 300.0


func _init() -> void:
    LevelSingleton.current_level = 1


func _ready() -> void:
    var timer := Timer.new()
    add_child(timer)
    timer.wait_time = 1.0
    timer.timeout.connect(_spawn_enemy)
    timer.start()

    loaded_enemy = preload("res://scenes/enemy.tscn")


func _process(_delta: float) -> void:
    pass


func _spawn_enemy() -> void:
    var enemy: CharacterBody2D = loaded_enemy.instantiate()
    var enemy_position_x := [
        player.position.x - spawn_distance_to_player,
        player.position.x + spawn_distance_to_player,
    ]
    var enemy_position_y := [
        player.position.y - spawn_distance_to_player,
        player.position.y + spawn_distance_to_player,
    ]
    enemy.position = Vector2(
        enemy_position_x.pick_random(),
        enemy_position_y.pick_random(),
    )
    enemies.add_child(enemy)
