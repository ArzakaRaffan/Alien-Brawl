extends Node2D

var skor_ijo: int = 0
var skor_pink: int = 0
var gawang_abler: bool = true
@onready var alien_ijo: CharacterBody2D = $AlienIjo
@onready var alien_pink: CharacterBody2D = $AlienPink
var done: bool = false

func _ready() -> void:
	$Goal.hide()
	$countdown.hide()
	

func _process(delta: float) -> void:
	$skorijo.text = str(skor_ijo)
	$skorpink.text = str(skor_pink)
	
	if $HtpMg3.visible && Input.is_action_just_pressed("d"):
		$HtpMg3.hide()
		await get_tree().create_timer(0.5).timeout
		$AnimationPlayer2.play("countdown")
		await $AnimationPlayer2.animation_finished
		alien_ijo.start = true
		alien_pink.start = true
		
	
	if skor_ijo == 3 and not done:
		done = true
		await get_tree().create_timer(1.5).timeout
		alien_ijo.is_win = true
		alien_pink.is_lose = true
		await get_tree().create_timer(1.5).timeout
		$Label.type("PLAYER 1\nWINS")
		$AnimationPlayer2.play("win_scene")
		await $AnimationPlayer2.animation_finished
		return
		
	elif skor_pink == 3 and not done:
		done = true
		await get_tree().create_timer(1.5).timeout
		alien_pink.is_win = true
		alien_ijo.is_lose = true
		await get_tree().create_timer(1.5).timeout
		$Label.type("PLAYER 2\nWINS")
		$AnimationPlayer2.play("win_scene")
		await $AnimationPlayer2.animation_finished
		return

func _on_gawang_ijo_body_entered(body: Node2D) -> void:
	if body.name == "Ball" and gawang_abler == true:
		skor_pink += 1
		gawang_abler = false
		$AnimationPlayer.play("goal")
		$Timer.start()

func _on_gawang_pink_body_entered(body: Node2D) -> void:
	if body.name == "Ball" and gawang_abler == true:
		skor_ijo += 1
		gawang_abler = false
		$AnimationPlayer.play("goal")
		$Timer.start()

func reset() -> void:
	$AlienIjo.position = Vector2(1322, 685)
	$AlienPink.position = Vector2(268, 685)
	$Ball.global_transform.origin = Vector2(790, 370)
	gawang_abler = true
	
func _on_timer_timeout() -> void:
	if not done:
		reset()
