extends StaticBody2D

@export var bounce_y: float = -240.0
@export var gravity:float =  3000.0
var orig_y_position
var y_speed:float = 0.0 
var ready_player_one:bool = false
var ready_player_two:bool = false

func _ready() -> void:
	orig_y_position = position.y
	
func _bounce() -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", position + Vector2(0,-40), .15)
	tween.chain().tween_property(self, "position", position, .15)

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent() is MC:
		_bounce()
