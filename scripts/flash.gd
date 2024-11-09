extends PointLight2D

var timer: Timer


func _ready() -> void:
    timer = Timer.new()
    timer.wait_time = 0.05
    timer.timeout.connect(_set_visible_false)
    timer.one_shot = true
    add_child(timer)


func _process(_delta: float) -> void:
    if Input.is_action_just_pressed("fire") and timer.is_stopped():
        visible = true
        timer.start()


func _set_visible_false() -> void:
    visible = false
