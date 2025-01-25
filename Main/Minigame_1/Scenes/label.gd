extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func type(_words) -> void:
	text = _words
	add_theme_color_override("font_color", Color.from_rgba8(181, 219, 116, 1))
