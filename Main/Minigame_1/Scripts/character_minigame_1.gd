extends CharacterBody2D

var SPEED = 250.0
var fly:bool = false
const JUMP_VELOCITY = -400.0

var start: bool = false
@onready var right: RayCast2D = $Right
@onready var left: RayCast2D = $Left
const BULLET = preload("res://Main/Minigame_1/Scenes/bullet.tscn")
@onready var alienpink: CharacterBody2D = $"../enemy_minigame1"
@onready var darah_ijo: ProgressBar = $"../DarahIjo"
var can_shoot: bool = true
@onready var timer: Timer = $Timer
var health: int = 100
var is_win: bool = false
var is_throwing: bool = false
var is_dead: bool = false
@onready var label: Label = $"../Label"
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var transition: ColorRect = $"../CanvasLayer/Transition"


func _physics_process(delta: float) -> void:
	if alienpink.health == 0 and not is_win:
		is_win = true
		$AnimatedSprite2D.play("win")

	if health == 0 and not is_dead:
		is_dead = true
		$AnimatedSprite2D.play("dead")
		await $AnimatedSprite2D.animation_finished
		await get_tree().create_timer(2).timeout
		label.type("PLAYER 2\nWINS")
		label.add_theme_color_override("font_color", Color.from_rgba8(181, 219, 116, 1))
		label.show()
		animation_player.play("win_scene")
		await animation_player.animation_finished
		await get_tree().create_timer(1).timeout
		transition.get_child(0).play("fade_out")
		await get_tree().create_timer(1.5).timeout
		get_tree().change_scene_to_file("res://Main/Lobby/minigame_select_multi.tscn")
	
	if is_dead or is_win:
		return

	if not is_on_floor() and !fly:
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_right") and can_shoot and start:
		shoot()
		timer.start()

	if not is_throwing and start:
		velocity.x = SPEED

		if SPEED > 0:
			$AnimatedSprite2D.play("run")
		elif SPEED < 0:
			$AnimatedSprite2D.play_backwards("run")

	if Input.is_action_just_pressed("ui_left") and start:
		SPEED *= -1

	#if right.is_colliding():
		#SPEED = -300
#
	#if left.is_colliding():
		#SPEED = 300

	move_and_slide()

func shoot() -> void:
	can_shoot = false
	is_throwing = true
	$AnimatedSprite2D.play("throw")
	await $AnimatedSprite2D.animation_finished
	is_throwing = false
	var bullet_instance = BULLET.instantiate()
	bullet_instance.position = $marker.global_position
	bullet_instance.launch(Vector2(-0.65,-0.9)*900)
	get_parent().add_child(bullet_instance)

func _on_timer_timeout() -> void:
	can_shoot = true

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.name == "bullet_hitbox" and not is_dead:
		health -= 20
		darah_ijo.health = health
		
