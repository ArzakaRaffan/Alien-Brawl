extends Node2D

@onready var pink: CharacterBody2D = $enemy_minigame1
@onready var ijo: CharacterBody2D = $CharacterBody2D
@onready var darah_pink: ProgressBar = $DarahPink
@onready var darah_ijo: ProgressBar = $DarahIjo
var pink_health: int
var ijo_health: int

func _ready() -> void:
	$countdown.hide()
	pink_health = pink.health
	ijo_health = ijo.health
	darah_pink.init_health(pink_health)
	darah_ijo.init_health(ijo_health)
	
func _process(delta: float) -> void:
	if $HtpMg1.visible and Input.is_action_just_pressed("d"):
		$HtpMg1.hide()
		await get_tree().create_timer(1).timeout
		$AnimationPlayer.play("countdown")
		await $AnimationPlayer.animation_finished
		pink.start = true
		ijo.start = true
