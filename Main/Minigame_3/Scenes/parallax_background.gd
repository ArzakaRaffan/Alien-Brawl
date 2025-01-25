extends ParallaxBackground

func _process(delta: float) -> void:
	$sky.motion_offset.x += $sky.motion_scale.x * 30 * delta
	$wind.motion_offset.x -= $wind.motion_scale.x * 50 * delta
	$cloud.motion_offset.x -= $cloud.motion_scale.x * 30 * delta
	$stars.motion_offset.x -= $stars.motion_scale.x * 10 * delta
