extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var transition: ColorRect = $CanvasLayer/Transition

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func goto_lobby():
	transition.show()
	transition.get_child(0).play("fade_out")
	await transition.get_child(0).animation_finished
	get_tree().change_scene_to_file("res://Main/Lobby/lobby.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
