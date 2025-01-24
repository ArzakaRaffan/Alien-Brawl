extends CharacterBody2D

const BULLET = preload("res://Main/Minigame_1/Scenes/bullet.tscn")

const SPEED = 300.0
const JUMP_VELOCITY = -400.0



func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	velocity.x += 1;

	move_and_slide()
