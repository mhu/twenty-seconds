extends Label


func _ready() -> void:
    pass


func _process(_delta: float) -> void:
    text = str(int(LevelSingleton.get_remaining_level_time()))
