extends Node2D

@onready var lobby_char: MC = $Lobby_Char
var bool_multi:bool
var bool_single:bool
var countdown_single:int
var countdown_multi:int
@onready var single: Sprite2D = $Single_Ufo/Single
@onready var single_ufo: AnimationPlayer = $Single_Ufo/AnimationPlayer
@onready var multi: Sprite2D = $Multi_Ufo/Multi
@onready var multi_ufo: AnimationPlayer = $Multi_Ufo/AnimationPlayer
@onready var transition: ColorRect = $CanvasLayer/Transition

func _ready() -> void:
	transition.show()
	transition.get_child(0).play("fade_in")
	lobby_char.start()
	bool_multi = false
	bool_single = false

func _process(delta: float) -> void:
	pass

func _on_area_sing_body_entered(body: Node2D) -> void:
	if body is MC :
		lobby_char.stop("single")
		await get_tree().create_timer(0.25).timeout
		
		var tween = get_tree().create_tween()
		tween.tween_property(single, "position", Vector2(485,528.095), 0.5)
		await tween.finished
		single_ufo.play("go")
		await single_ufo.animation_finished
		transition.get_child(0).play("fade_out")
		await transition.get_child(0).animation_finished
		get_tree().change_scene_to_file("res://Main/Lobby/minigame_select_single.tscn")

func _on_area_mult_body_entered(body: Node2D) -> void:
	if body is MC :
		lobby_char.stop("multi")
		await get_tree().create_timer(0.25).timeout
		
		var tween = get_tree().create_tween()
		tween.tween_property(multi, "position", Vector2(1119,543), 0.5)
		await tween.finished
		multi_ufo.play("go")
		await multi_ufo.animation_finished
		transition.get_child(0).play("fade_out")
		await transition.get_child(0).animation_finished
		get_tree().change_scene_to_file("res://Main/Lobby/minigame_select_multi.tscn")

func _on_credit_body_entered(body: Node2D) -> void:
	if body is MC :
		$Credit/Group25.show()

func _on_credit_body_exited(body: Node2D) -> void:
	if body is MC:
		$Credit/Group25.hide()

func _on_exit_body_entered(body: Node2D) -> void:
	if body is MC:
		transition.get_child(0).play("fade_out")
		await transition.get_child(0).animation_finished
		get_tree().quit()
