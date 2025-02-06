extends Control

var initial_scale = 0  # Store initial scale

func _on_button_a_button_down():
	initial_scale = $CanvasLayer/ButtonA.scale  # Store initial scale
	var scale_increase = 0.1  # Adjust this value for the resize amount
	var button_center_global = $CanvasLayer/ButtonA.global_position + $CanvasLayer/ButtonA.size / 2
	var button_parent = $CanvasLayer/ButtonA.get_parent()

	$CanvasLayer/ButtonA.modulate.a = 230.0 / 255.0
	$CanvasLayer/ButtonA.scale = initial_scale * (1.0 + scale_increase) # Scale up

	Input.action_press("a")
	await get_tree().create_timer(0.1).timeout
	Input.action_release("a")


func _on_button_a_button_up():
	$CanvasLayer/ButtonA.modulate.a = 185.0 / 255.0
	$CanvasLayer/ButtonA.scale = initial_scale  # Revert to original scale
	$CanvasLayer/ButtonA.pivot_offset = Vector2(0,0) # Reset pivot offset


func _on_button_d_button_down():
	initial_scale = $CanvasLayer/ButtonD.scale  # Store initial scale
	var scale_increase = 0.1  # Adjust this value for the resize amount
	var button_center_global = $CanvasLayer/ButtonD.global_position + $CanvasLayer/ButtonD.size / 2
	var button_parent = $CanvasLayer/ButtonD.get_parent()

	$CanvasLayer/ButtonD.modulate.a = 230.0 / 255.0
	$CanvasLayer/ButtonD.scale = initial_scale * (1.0 + scale_increase) # Scale up

	Input.action_press("d")
	await get_tree().create_timer(0.1).timeout
	Input.action_release("d")


func _on_button_d_button_up():
	$CanvasLayer/ButtonD.modulate.a = 185.0 / 255.0
	$CanvasLayer/ButtonD.scale = initial_scale  # Revert to original scale
	$CanvasLayer/ButtonD.pivot_offset = Vector2(0,0) # Reset pivot offset

func _on_button_right_button_down():
	initial_scale = $CanvasLayer/ButtonRight.scale  # Store initial scale
	var scale_increase = 0.1  # Adjust this value for the resize amount
	var button_center_global = $CanvasLayer/ButtonRight.global_position + $CanvasLayer/ButtonRight.size / 2
	var button_parent = $CanvasLayer/ButtonRight.get_parent()

	$CanvasLayer/ButtonRight.modulate.a = 230.0 / 255.0
	$CanvasLayer/ButtonRight.scale = initial_scale * (1.0 + scale_increase) # Scale up

	Input.action_press("ui_right")
	await get_tree().create_timer(0.1).timeout
	Input.action_release("ui_right")


func _on_button_right_button_up():
	$CanvasLayer/ButtonRight.modulate.a = 185.0 / 255.0
	$CanvasLayer/ButtonRight.scale = initial_scale  # Revert to original scale
	$CanvasLayer/ButtonRight.pivot_offset = Vector2(0,0) # Reset pivot offset


func _on_button_left_button_down():
	initial_scale = $CanvasLayer/ButtonLeft.scale  # Store initial scale
	var scale_increase = 0.1  # Adjust this value for the resize amount
	var button_center_global = $CanvasLayer/ButtonLeft.global_position + $CanvasLayer/ButtonLeft.size / 2
	var button_parent = $CanvasLayer/ButtonLeft.get_parent()

	$CanvasLayer/ButtonLeft.modulate.a = 230.0 / 255.0
	$CanvasLayer/ButtonLeft.scale = initial_scale * (1.0 + scale_increase) # Scale up

	Input.action_press("ui_left")
	await get_tree().create_timer(0.1).timeout
	Input.action_release("ui_left")


func _on_button_left_button_up():
	$CanvasLayer/ButtonLeft.modulate.a = 185.0 / 255.0
	$CanvasLayer/ButtonLeft.scale = initial_scale  # Revert to original scale
	$CanvasLayer/ButtonLeft.pivot_offset = Vector2(0,0) # Reset pivot offset
