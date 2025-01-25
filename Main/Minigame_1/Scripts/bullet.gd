extends Area2D

@export var mass: float = 0.5

var launched = false
var velocity = Vector2(0,0)
var angular_velocity: float = 10.0 # Adjust this value for rotation speed

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if launched:
		velocity += Vector2(0, 9.8) * mass * 3

		position += velocity * delta

		rotation += angular_velocity * delta

func launch(initial_velocity: Vector2):
	launched = true
	velocity = initial_velocity

func _on_bullet_hitbox_body_entered(body: Node2D) -> void:
	queue_free()
