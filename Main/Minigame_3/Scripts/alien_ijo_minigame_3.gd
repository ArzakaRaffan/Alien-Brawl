extends CharacterBody2D

var start = false
var SPEED = -300.0
var fly:bool = false
const JUMP_VELOCITY = -400.0
@onready var right: RayCast2D = $Right
@onready var left: RayCast2D = $Left
@onready var anim: AnimatedSprite2D = $anim
var is_win: bool = false
var is_lose: bool = false
@onready var kicks: AudioStreamPlayer = $"../kicks"
@onready var wohoo: AudioStreamPlayer = $"../wohoo"


func _physics_process(delta: float) -> void:
	if is_win:
		velocity.x = 0
		anim.play("win")
		wohoo.play()
	
	if is_lose:
		velocity.x = 0
		anim.play("lose")

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
	if Input.is_action_just_pressed("ui_right") and is_on_floor() and not is_win and not is_lose and start:
		anim.play("jumpwhile")
		velocity.y = JUMP_VELOCITY*1.1
	elif is_on_floor() and not is_win and not is_lose and start:
		anim.play("run")
	
	if not is_win and not is_lose and start:
		velocity.x = SPEED
	
	if Input.is_action_just_pressed("ui_left") and not is_win and not is_lose and start:
		SPEED*=-1
		anim.flip_h = !anim.flip_h
		
	if right.is_colliding() and not is_win and not is_lose and start:
		var collider = right.get_collider()
		if collider is RigidBody2D:
			var push_force = Vector2(40, 0)
			collider.apply_central_impulse(push_force)
			kicks.play()
		else:
			SPEED=-300
			anim.flip_h = true
	
	if left.is_colliding() and not is_win and not is_lose and start:
		var collider = left.get_collider()
		if collider is RigidBody2D:
			var push_force = Vector2(-40, 0)
			collider.apply_central_impulse(push_force)
			kicks.play()
		else:
			SPEED=300
			anim.flip_h = false

	move_and_slide()

	
func stop() :
	SPEED = 0
	fly = true
