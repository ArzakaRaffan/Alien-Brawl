extends ParallaxBackground

func _process(delta: float) -> void:
	$ParallaxLayer.motion_offset.y += $ParallaxLayer.motion_scale.y * 100 * delta
