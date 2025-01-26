extends ParallaxBackground

func _process(delta: float) -> void:
	$ParallaxLayer.motion_offset.y += $ParallaxLayer.motion_scale.y * 150 * delta
	$planet.motion_offset.y += $planet.motion_scale.y * 200 * delta
	$star.motion_offset.y += $star.motion_scale.y * 75 * delta
