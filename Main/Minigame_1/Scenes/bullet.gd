extends Area2D

@export var mass: float = 0.5

var launched = false
var velocity = Vector2(0,0)

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if launched:
		velocity += Vector2(0, 9.8) * mass * 3
		position += velocity * delta
		rotation = velocity.angle()

func launch(initial_velocity: Vector2):
	launched = true
	velocity = initial_velocity
