extends Control

var initial_scale = 0  # Store initial scale

func simulate_action_event(action: String, pressed: bool) -> void:
	var event := InputEventAction.new()
	event.action = action
	event.pressed = pressed
	Input.parse_input_event(event)


func _on_button_a_button_down() -> void:
	initial_scale = $CanvasLayer/ButtonA.scale  # Store initial scale
	var scale_increase = 0.1  # Adjust this value for the rescale amount
	var button_center_global = $CanvasLayer/ButtonA.global_position + $CanvasLayer/ButtonA.scale / 2
	var button_parent = $CanvasLayer/ButtonA.get_parent()

	$CanvasLayer/ButtonA.modulate.a = 185.0 / 255.0
	$CanvasLayer/ButtonA.scale = initial_scale * (1.0 + scale_increase) # Scale up

	# Simulate an "a" key press event:
	simulate_action_event("a", true)
	await get_tree().create_timer(0.1).timeout
	simulate_action_event("a", false)

func _on_button_a_button_up() -> void:
	$CanvasLayer/ButtonA.modulate.a = 150.0 / 255.0
	$CanvasLayer/ButtonA.scale = initial_scale  # Revert to original scale



func _on_button_d_button_down():
	initial_scale = $CanvasLayer/ButtonD.scale  # Store initial scale
	var scale_increase = 0.1  # Adjust this value for the rescale amount
	var button_center_global = $CanvasLayer/ButtonD.global_position + $CanvasLayer/ButtonD.scale / 2
	var button_parent = $CanvasLayer/ButtonD.get_parent()

	$CanvasLayer/ButtonD.modulate.a = 185.0 / 255.0
	$CanvasLayer/ButtonD.scale = initial_scale * (1.0 + scale_increase) # Scale up

	# Simulate an "a" key press event:
	simulate_action_event("d", true)
	await get_tree().create_timer(0.1).timeout
	simulate_action_event("d", false)


func _on_button_d_button_up():
	$CanvasLayer/ButtonD.modulate.a = 150.0 / 255.0
	$CanvasLayer/ButtonD.scale = initial_scale  # Revert to original scale

func _on_button_right_button_down():
	initial_scale = $CanvasLayer/ButtonRight.scale  # Store initial scale
	var scale_increase = 0.1  # Adjust this value for the rescale amount
	var button_center_global = $CanvasLayer/ButtonRight.global_position + $CanvasLayer/ButtonRight.scale / 2
	var button_parent = $CanvasLayer/ButtonRight.get_parent()

	$CanvasLayer/ButtonRight.modulate.a = 185.0 / 255.0
	$CanvasLayer/ButtonRight.scale = initial_scale * (1.0 + scale_increase) # Scale up

	# Simulate an "a" key press event:
	simulate_action_event("ui_right", true)
	await get_tree().create_timer(0.1).timeout
	simulate_action_event("ui_right", false)


func _on_button_right_button_up():
	$CanvasLayer/ButtonRight.modulate.a = 150.0 / 255.0
	$CanvasLayer/ButtonRight.scale = initial_scale  # Revert to original scale


func _on_button_left_button_down():
	initial_scale = $CanvasLayer/ButtonLeft.scale  # Store initial scale
	var scale_increase = 0.1  # Adjust this value for the rescale amount
	var button_center_global = $CanvasLayer/ButtonLeft.global_position + $CanvasLayer/ButtonLeft.scale / 2
	var button_parent = $CanvasLayer/ButtonLeft.get_parent()

	$CanvasLayer/ButtonLeft.modulate.a = 185.0 / 255.0
	$CanvasLayer/ButtonLeft.scale = initial_scale * (1.0 + scale_increase) # Scale up

	simulate_action_event("ui_left", true)
	await get_tree().create_timer(0.1).timeout
	simulate_action_event("ui_left", false)


func _on_button_left_button_up():
	$CanvasLayer/ButtonLeft.modulate.a = 150.0 / 255.0
	$CanvasLayer/ButtonLeft.scale = initial_scale  # Revert to original scale


func _on_button_rl_button_down():
	initial_scale = $CanvasLayer/ButtonRL.scale  # Store initial scale
	var scale_increase = 0.1  # Adjust this value for the rescale amount
	var button_center_global = $CanvasLayer/ButtonRL.global_position + $CanvasLayer/ButtonRL.scale / 2
	var button_parent = $CanvasLayer/ButtonRL.get_parent()

	$CanvasLayer/ButtonRL.modulate.a = 185.0 / 255.0
	$CanvasLayer/ButtonRL.scale = initial_scale * (1.0 + scale_increase) # Scale up
	
	simulate_action_event("ui_left", true)
	simulate_action_event("ui_right", true)
	await get_tree().create_timer(0.1).timeout
	simulate_action_event("ui_left", false)
	simulate_action_event("ui_right", false)


func _on_button_rl_button_up():
	$CanvasLayer/ButtonRL.modulate.a = 150.0 / 255.0
	$CanvasLayer/ButtonRL.scale = initial_scale  # Revert to original scale


func _on_button_ad_button_down():
	initial_scale = $CanvasLayer/ButtonAD.scale  # Store initial scale
	var scale_increase = 0.1  # Adjust this value for the rescale amount
	var button_center_global = $CanvasLayer/ButtonAD.global_position + $CanvasLayer/ButtonAD.scale / 2
	var button_parent = $CanvasLayer/ButtonAD.get_parent()

	$CanvasLayer/ButtonAD.modulate.a = 185.0 / 255.0
	$CanvasLayer/ButtonAD.scale = initial_scale * (1.0 + scale_increase) # Scale up
	
	simulate_action_event("a", true)
	simulate_action_event("d", true)
	await get_tree().create_timer(0.1).timeout
	simulate_action_event("a", false)
	simulate_action_event("d", false)


func _on_button_ad_button_up():
	$CanvasLayer/ButtonAD.modulate.a = 150.0 / 255.0
	$CanvasLayer/ButtonAD.scale = initial_scale  # Revert to original scale
