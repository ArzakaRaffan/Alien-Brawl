extends Node2D
@onready var bullet: Area2D = $bullet

func _ready() -> void:
	bullet.launch(Vector2(0.9,-0.8)*850)

func _on_resetbutton_pressed() -> void:
	get_tree().reload_current_scene()
