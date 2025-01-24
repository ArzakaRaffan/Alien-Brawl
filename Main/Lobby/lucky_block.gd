extends StaticBody2D

@export var bounce_y: float = -240.0
@export var gravity:float =  3600.0
@onready var bounce_timer: Timer = $BounceTimer
var orig_y_position

var y_speed:float = 0.0 

func _ready() -> void:
	orig_y_position = position.y

func _process(delta: float) -> void:
	if bounce_timer.is_stopped():
		position.y = orig_y_position
		y_speed = 0
	else: 
		position.y += y_speed * delta
		y_speed += gravity*delta
	
func _bounce() -> void:
	y_speed = bounce_y
	bounce_timer.start()

func _on_area_2d_area_entered(area: Area2D) -> void:
	_bounce()
