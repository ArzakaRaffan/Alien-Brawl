extends Node2D

var skor_ijo: int = 0
var skor_pink: int = 0
var gawang_abler: bool = true

func _process(delta: float) -> void:
	$skorijo.text = str(skor_ijo)
	$skorpink.text = str(skor_pink)
	
	if skor_ijo == 3 or skor_pink == 3:
		await get_tree().create_timer(1).timeout
		get_tree().quit()

	
func _on_gawang_ijo_body_entered(body: Node2D) -> void:
	if body.name == "Ball" and gawang_abler == true:
		skor_pink += 1
		gawang_abler = false
		$Timer.start()

func _on_gawang_pink_body_entered(body: Node2D) -> void:
	if body.name == "Ball" and gawang_abler == true:
		skor_ijo += 1
		gawang_abler = false
		$Timer.start()

func reset() -> void:
	$AlienIjo.position = Vector2(1322, 685)
	$AlienPink.position = Vector2(268, 685)
	$Ball.global_transform.origin = Vector2(790, 370)
	gawang_abler = true
	
func _on_timer_timeout() -> void:
	reset()
