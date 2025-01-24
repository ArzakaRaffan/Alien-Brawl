extends Node2D

func _on_resetbutton_pressed() -> void:
	get_tree().reload_current_scene()
