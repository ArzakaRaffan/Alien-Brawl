extends CharacterBody2D
class_name MC

var SPEED = 300.0
var fly:bool = false
const JUMP_VELOCITY = -400.0
@onready var right: RayCast2D = $Right
@onready var left: RayCast2D = $Left
@onready var anim: AnimatedSprite2D = $anim

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and !fly:
		velocity += get_gravity() * delta
		if velocity.y >0 :
			anim.set_animation("jumpend")
		
	if fly :
		velocity -= get_gravity() * delta/100000
		rotation+= delta
		if scale>Vector2(0,0) :
			scale -= Vector2(0.01,0.01)
		else :
			queue_free()

	# Handle jump.
	if Input.is_action_just_pressed("ui_right") and is_on_floor():
		anim.play("jumpwhile")
		velocity.y = JUMP_VELOCITY*1.1
	elif is_on_floor():
		anim.play("run")
	velocity.x = SPEED
	
	if Input.is_action_just_pressed("ui_left"):
		SPEED*=-1
		anim.flip_h = !anim.flip_h
		
	if right.is_colliding():
		SPEED=-300
		anim.flip_h = true
	
	if left.is_colliding():
		SPEED=300
		anim.flip_h = false

	move_and_slide()

	
func stop() :
	SPEED = 0
	fly = true
	
	
