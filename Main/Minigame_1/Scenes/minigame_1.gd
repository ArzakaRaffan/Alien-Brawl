extends Node2D
@onready var bullet: Area2D = $bullet

func _ready() -> void:
	bullet.launch(Vector2(0.7,-0.65)*900)

func _on_resetbutton_pressed() -> void:
	get_tree().reload_current_scene()
