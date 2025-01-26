extends Node2D

var list_button:Array[String] = ["<",">","O"]
var list_up:Array[String]
var list_down:Array[String]
var button_up:String
var button_down:String
var p1cant_press:bool = false
var p2cant_press:bool = false
var flag_up:bool = false
var flag_down:bool = false
var flag_win:bool = false
var flag_p1win:bool = false
var flag_p2win:bool = false
var a_time = null
var b_time = null
var c_time = null
var d_time = null
var max_milliseconds = 100
var def_cam_pos:Vector2
@onready var transition: ColorRect = $CanvasLayer/Transition
@onready var jump_1: AudioStreamPlayer = $Player1/Jump1
@onready var jump_2: AudioStreamPlayer = $Player2/Jump2
@onready var hit_hurt_1: AudioStreamPlayer = $Player1/HitHurt1
@onready var hit_hurt_2: AudioStreamPlayer = $Player2/HitHurt2
@onready var player_1: AnimatedSprite2D = $Player1
@onready var shadow_1: AnimatedSprite2D = $Player1/Shadow1
@onready var player_2: AnimatedSprite2D = $Player2
@onready var shadow_2: AnimatedSprite2D = $Player2/Shadow2
@onready var player_1_stone: Node = $Player1Stone
@onready var player_2_stone: Node = $Player2Stone
@onready var temp_stone: Node = $TempStone
@onready var camera_2d: Camera2D = $Camera2D
@onready var stone_a: AnimatedSprite2D = $"Stone Template/stone_A"
@onready var stone_d: AnimatedSprite2D = $"Stone Template/stone_D"
@onready var stone_right: AnimatedSprite2D = $"Stone Template/stone_>"
@onready var stone_left: AnimatedSprite2D = $"Stone Template/stone_<"
@onready var stone_lr: AnimatedSprite2D = $"Stone Template/stone_<>"
@onready var stone_ad: AnimatedSprite2D = $"Stone Template/stone_AD"
@onready var rock_bottom_up: Sprite2D = $"Player1/rock bottom_up"
@onready var rock_bottom_down: Sprite2D = $"Player2/rock bottom_down"
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var label: Label = $Label
var count = 0
var cor_x = 512
var cor_y1 = 392
var cor_y2 = 726
var p1:int
var p2:int

var button_to_press:Array[String]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	transition.show()
	transition.get_child(0).play("fade_in")
	p1cant_press=true
	p2cant_press=true
	def_cam_pos = camera_2d.position
	for i in range(6) :
		button_to_press.append(list_button.pick_random())
	list_down.append_array(button_to_press)
	button_down = list_down.pop_front()
	list_up.append_array(button_to_press)
	button_up = list_up.pop_front()
	for button in button_to_press:
		await get_tree().create_timer(0.5).timeout
		if button == "<":
			var stone_up = stone_a.duplicate()
			stone_up.modulate = Color(1,1,1)
			stone_up.position.x = cor_x
			stone_up.position.y = cor_y1
			var stone_down = stone_left.duplicate()
			stone_down.modulate = Color(1,1,1)
			stone_down.position.x = cor_x
			stone_down.position.y = cor_y2
			player_1_stone.add_child(stone_up)
			player_2_stone.add_child(stone_down)
			stone_up.get_child(0).play("start")
			stone_down.get_child(0).play("start")
			cor_x+=240
		elif button == ">":
			var stone_up = stone_d.duplicate()
			stone_up.modulate = Color(1,1,1)
			stone_up.position.x = cor_x
			stone_up.position.y = cor_y1
			var stone_down = stone_right.duplicate()
			stone_down.modulate = Color(1,1,1)
			stone_down.position.x = cor_x
			stone_down.position.y = cor_y2
			player_1_stone.add_child(stone_up)
			player_2_stone.add_child(stone_down)
			stone_up.get_child(0).play("start")
			stone_down.get_child(0).play("start")
			cor_x+=240
		else:
			var stone_up = stone_ad.duplicate()
			stone_up.modulate = Color(1,1,1)
			stone_up.position.x = cor_x
			stone_up.position.y = cor_y1
			var stone_down = stone_lr.duplicate()
			stone_down.modulate = Color(1,1,1)
			stone_down.position.x = cor_x
			stone_down.position.y = cor_y2
			player_1_stone.add_child(stone_up)
			player_2_stone.add_child(stone_down)
			stone_up.get_child(0).play("start")
			stone_down.get_child(0).play("start")
			cor_x+=240
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $HtpMg1.visible and Input.is_action_just_pressed("d"):
		$HtpMg1.hide()
		await get_tree().create_timer(1).timeout
		$AnimationPlayer.play("countdown")
		await $AnimationPlayer.animation_finished
		p1cant_press=false
		p2cant_press=false
	
func swipe_camera() :
	def_cam_pos+= Vector2(240,0)
	var tween = get_tree().create_tween()
	tween.tween_property(camera_2d, "position", def_cam_pos, 0.2)
	#await tween.finished
	#tween.kill()

func add_stone() :
	if flag_win:
		return
	var next_button = list_button.pick_random()
	list_down.append(next_button)
	list_up.append(next_button)
	if next_button == "<":
		var stone_up = stone_a.duplicate()
		stone_up.set_z_index(-1)
		stone_up.modulate = Color(1,1,1)
		stone_up.position.x = cor_x
		stone_up.position.y = cor_y1
		var stone_down = stone_left.duplicate()
		stone_down.modulate = Color(1,1,1)
		stone_down.position.x = cor_x
		stone_down.position.y = cor_y2
		player_1_stone.add_child(stone_up)
		player_2_stone.add_child(stone_down)
		stone_up.get_child(0).play("start")
		stone_down.get_child(0).play("start")
		cor_x+=240
	elif next_button == ">":
		var stone_up = stone_d.duplicate()
		stone_up.set_z_index(-1)
		stone_up.modulate = Color(1,1,1)
		stone_up.position.x = cor_x
		stone_up.position.y = cor_y1
		var stone_down = stone_right.duplicate()
		stone_down.modulate = Color(1,1,1)
		stone_down.position.x = cor_x
		stone_down.position.y = cor_y2
		player_1_stone.add_child(stone_up)
		player_2_stone.add_child(stone_down)
		stone_up.get_child(0).play("start")
		stone_down.get_child(0).play("start")
		cor_x+=240
	else:
		var stone_up = stone_ad.duplicate()
		stone_up.set_z_index(-1)
		stone_up.modulate = Color(1,1,1)
		stone_up.position.x = cor_x
		stone_up.position.y = cor_y1
		var stone_down = stone_lr.duplicate()
		stone_down.modulate = Color(1,1,1)
		stone_down.position.x = cor_x
		stone_down.position.y = cor_y2
		player_1_stone.add_child(stone_up)
		player_2_stone.add_child(stone_down)
		stone_up.get_child(0).play("start")
		stone_down.get_child(0).play("start")
		cor_x+=240
	swipe_camera()

func go_down():
	jump_2.play()
	if flag_win:return
	player_2.play("jump_end")
	shadow_2.play("jump_end")
	
	#if p2-1 == p1:
		#add_stone()
	button_down = list_down.pop_front()
	if list_down.size() == 0:
		add_stone()

	if !flag_down :
		flag_down = true
		player_2.position.x += 325
	else :
		player_2.position.x += 240
		var node:AnimatedSprite2D = player_2_stone.get_child(0)
		var temp_node = node.duplicate()
		temp_node.set_z_index(-1)
		temp_stone.add_child(temp_node)
		node.queue_free()
		var another_node:AnimationPlayer = temp_node.get_child(0)
		temp_node.play_backwards("default")
		another_node.play("new_animation")
	
		
	print(list_up)
	print(list_down)
	p1 = list_up.size()
	p2 = list_down.size()
	if (p1==6 && p2==5) :
		add_stone()
	print(p1,p2)
	if p1<=p2 and p1!=6 and p2!=6:
		if p1==p2 and p1==5:
			return
		add_stone()
		
	p1 = list_up.size()
	p2 = list_down.size()
	if (p1-p2 == 6) && !flag_win:
		flag_win=true
		print("p1 win")
		p1_win()
	elif (p2-p1 == 6) && !flag_win :
		flag_win = true
		print("p2 win")
		p2_win()

func go_up():
	if flag_win:return
	jump_1.play()
	player_1.play("jump_end")
	shadow_1.play("jump_end")
	#if p1-1 == p2:
		#add_stone()
	button_up = list_up.pop_front()
	if list_up.size() == 0:
		add_stone()

	if !flag_up :
		flag_up = true
		player_1.position.x += 325
	else :
		player_1.position.x += 240
		var node:AnimatedSprite2D = player_1_stone.get_child(0)
		var temp_node = node.duplicate()
		temp_node.set_z_index(-1)
		temp_stone.add_child(temp_node)
		node.queue_free()
		var another_node:AnimationPlayer = temp_node.get_child(0)
		temp_node.play_backwards("default")
		another_node.play("new_animation")
		
		
	print(list_up)
	print(list_down)
	p1 = list_up.size()
	p2 = list_down.size()
	print(p1,p2)
	if p1>=p2 and p1!=6 and p2!=6:
		if p1==p2 and p1==5:
			return
		add_stone()
	
	p1 = list_up.size()
	p2 = list_down.size()
	if (p1-p2 == 6) && !flag_win:
		flag_win=true
		print("p1 win")
		p1_win()
	elif (p2-p1 == 6) && !flag_win :
		flag_win = true
		print("p2 win")
		p2_win()
		
	
func _input(event):
	var now = Time.get_ticks_msec()
	if flag_win:return
	if event.is_action_pressed("ui_right") and !p2cant_press:
		if b_time != null:
			if now - b_time < max_milliseconds:
				print("both together")
				if (button_down == "O") :
					go_down()
			else:
				print("kiri then kanan")
		else:
			print("kanan!")
			if (button_down == ">") :
				go_down()
			elif button_down == "<":
				p2_failed()
				
			
		a_time = now
		
	if event.is_action_released("ui_right"):
		a_time = null
		
	if event.is_action_pressed("ui_left") and !p2cant_press:
		if a_time != null:
			if now - a_time < max_milliseconds:
				print("both together")
				if (button_down == "O") :
					go_down()
			else:
				print("kanan then kiri")
		else:
			print("kiri!")
			if (button_down == "<") :
				go_down()
			elif button_down == ">":
				p2_failed()
			
		b_time = now
		
	if event.is_action_released("ui_left"):
		b_time = null
	
	if event.is_action_pressed("a") and !p1cant_press:
		if d_time != null:
			if now - d_time < max_milliseconds:
				print("both together")
				if button_up == "O" :
					go_up()
			else:
				print("d then a")
		else:
			print("a!")
			if button_up == "<" :
				go_up()
			elif button_up == ">":
				p1_failed()
			
		c_time = now
		
	if event.is_action_released("a"):
		c_time = null
		
	if event.is_action_pressed("d") and !p1cant_press:
		if c_time != null:
			if now - c_time < max_milliseconds:
				print("both together")
				if button_up == "O" :
					go_up()
			else:
				print("a then d")
		else:
			print("d!")
			if button_up == ">" :
				go_up()
			elif button_up == "<":
				p1_failed()
			
		d_time = now
		
	if event.is_action_released("d"):
		d_time = null
	
func p1_failed():
	hit_hurt_1.play()
	p1cant_press = true
	player_1.play("failed")
	shadow_1.play("failed")
	player_1.get_child(0).play("oof")
	await get_tree().create_timer(1).timeout
	p1cant_press = false
	
func p2_failed():
	hit_hurt_2.play()
	p2cant_press = true
	player_2.play("failed")
	shadow_2.play("failed")
	player_2.get_child(0).play("oof")
	await get_tree().create_timer(1).timeout
	p2cant_press = false

func _on_player_1_animation_finished() -> void:
	shadow_1.play("default")
	player_1.play("default")

func _on_player_2_animation_finished() -> void:
	player_2.play("default")
	shadow_2.play("default")

func p1_win():
	$"Pixel-fight-8-bit-arcade-music-background-music-for-video-208775".stop()
	$"Win-brass-fanfare-reverberated-146263".play()
	$"Cute-character-wee-1-188162".play()
	label.type("PLAYER 1\nWINS")
	label.position = camera_2d.position-Vector2(550,225)
	animation_player.play("win_scene")
	p1cant_press = true
	p2cant_press = true
	flag_p2win = true
	rock_bottom_up.show()
	var tween = get_tree().create_tween()
	player_1.position.x -= 240
	tween.tween_property(player_1, "position", player_1.position+Vector2(240*10,0), 15)
	player_2.play("win")
	shadow_2.play("win")
	player_1.play("lose")
	shadow_1.play("lose")
	for i in range (player_1_stone.get_child_count()) :
		var node:AnimatedSprite2D = player_1_stone.get_child(0)
		var another_node:AnimationPlayer = node.get_child(0)
		node.play_backwards("default")
		another_node.play("new_animation")
		await get_tree().create_timer(1.05).timeout

func p2_win():
	$"Pixel-fight-8-bit-arcade-music-background-music-for-video-208775".stop()
	$"Win-brass-fanfare-reverberated-146263".play()
	$"Cute-character-wee-2-188161".play()
	label.type("PLAYER 2\nWINS")
	label.position = camera_2d.position-Vector2(550,225)
	animation_player.play("win_scene")
	p1cant_press = true
	p2cant_press = true
	rock_bottom_down.show()
	player_2.position.y -= 20
	flag_p1win = true
	var tween = get_tree().create_tween()
	player_2.position.x -= 240
	tween.tween_property(player_2, "position", player_2.position+Vector2(240*10,0), 15)
	player_1.play("win")
	shadow_1.play("win")
	player_2.play("lose")
	shadow_2.play("lose")
	for i in range (player_2_stone.get_child_count()) :
		var node:AnimatedSprite2D = player_2_stone.get_child(0)
		var another_node:AnimationPlayer = node.get_child(0)
		node.play_backwards("default")
		another_node.play("new_animation")
		await get_tree().create_timer(1.05).timeout

func quit_lobby() :
	transition.show()
	transition.get_child(0).play("fade_out")
	await transition.get_child(0).animation_finished
	get_tree().change_scene_to_file("res://Main/Lobby/minigame_select_multi.tscn")
