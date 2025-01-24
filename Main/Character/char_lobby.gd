extends CharacterBody2D
class_name MC

var SPEED = 300.0
var fly:bool = false
const JUMP_VELOCITY = -400.0
@onready var right: RayCast2D = $Right
@onready var left: RayCast2D = $Left

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and !fly:
		velocity += get_gravity() * delta
		
	#if fly :
		#velocity -= get_gravity() * delta/5
		#rotation+= delta
		#if scale>Vector2(0,0) :
			#scale -= Vector2(0.005,0.005)
		#else :
			#queue_free()

	# Handle jump.
	if Input.is_action_just_pressed("ui_right") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	velocity.x = SPEED
	
	if Input.is_action_just_pressed("ui_left"):
		SPEED*=-1
		
	if right.is_colliding():
		SPEED=-300
	
	if left.is_colliding():
		SPEED=300
	

	move_and_slide()
	
func stop() :
	SPEED = 0
	fly = true
	
	
