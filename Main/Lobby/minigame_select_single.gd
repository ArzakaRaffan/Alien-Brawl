extends Node2D
@onready var alien_ijo: MC = $AlienIjo
@onready var transition: ColorRect = $CanvasLayer/Transition


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	alien_ijo.start()
	transition.get_child(0).play("fade_in")
	await transition.get_child(0).animation_finished


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
