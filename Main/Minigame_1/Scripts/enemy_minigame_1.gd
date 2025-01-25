extends CharacterBody2D

var SPEED = 250.0
var fly:bool = false
const JUMP_VELOCITY = -400.0
@onready var right: RayCast2D = $Right
@onready var left: RayCast2D = $Left
const BULLET = preload("res://Main/Minigame_1/Scenes/bullet.tscn")
var can_shoot: bool = true
@onready var timer: Timer = $Timer
var health: int = 100
var is_throwing: bool = false

func _physics_process(delta: float) -> void:
	$Label.text = str(health)

	if health == 0:
		print("Player 2 Wins")
		queue_free()

	if not is_on_floor() and !fly:
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("d") and can_shoot:
		shoot()
		timer.start()

	if not is_throwing:
		velocity.x = SPEED

		if SPEED > 0:
			$AnimatedSprite2D.play("run")
		elif SPEED < 0:
			$AnimatedSprite2D.play_backwards("run")

	if Input.is_action_just_pressed("a"):
		SPEED *= -1

	if right.is_colliding():
		SPEED = -300

	if left.is_colliding():
		SPEED = 300

	move_and_slide()

func shoot() -> void:
	can_shoot = false
	is_throwing = true
	$AnimatedSprite2D.play("throw")
	await $AnimatedSprite2D.animation_finished
	is_throwing = false

	var bullet_instance = BULLET.instantiate()
	bullet_instance.position = $marker.global_position
	bullet_instance.launch(Vector2(-0.7,-0.9)*900)
	get_parent().add_child(bullet_instance)

func _on_timer_timeout() -> void:
	can_shoot = true

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.name == "bullet_hitbox":
		health -= 20
