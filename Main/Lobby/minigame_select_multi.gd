extends Node2D

@onready var alien_ijo: MC = $AlienIjo
@onready var alien_pink: MC_Pink = $AlienPink
@onready var animation_player: AnimationPlayer = $Multi_Ufo/AnimationPlayer
@onready var area_mult: Area2D = $Multi_Ufo/AreaMult
@onready var multi: Sprite2D = $Multi_Ufo/Multi
@onready var multi_ufo: AnimationPlayer = $Multi_Ufo/AnimationPlayer
@onready var transition: ColorRect = $CanvasLayer/Transition
@onready var marker_single: Marker2D = $"Marker Single"
var pulled = false


func _ready() -> void:
	transition.show()
	transition.get_child(0).play("fade_in")
	await animation_player.animation_finished
	var tween = get_tree().create_tween()
	tween.tween_property(multi, "position", Vector2(1119,534.7), 0.5)
	await tween.finished
	animation_player.play("Hovering")
	alien_ijo.show()
	alien_ijo.start()
	await get_tree().create_timer(4).timeout
	area_mult.position = Vector2(1539,700)
	
func _physics_process(delta: float) -> void:
	pass

func _on_area_mult_body_entered(body: Node2D) -> void:
	if body is MC :
		alien_ijo.stop("multi")
		await get_tree().create_timer(0.25).timeout
		
		var tween = get_tree().create_tween()
		tween.tween_property(multi, "position", Vector2(1119,543), 0.5)
		await tween.finished
		multi_ufo.play_backwards("go")
		await multi_ufo.animation_finished
		transition.get_child(0).play("fade_out")
		await transition.get_child(0).animation_finished
		get_tree().change_scene_to_file("res://Main/Lobby/lobby.tscn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
